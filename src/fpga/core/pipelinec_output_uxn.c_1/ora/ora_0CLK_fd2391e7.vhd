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
-- Submodules: 64
entity ora_0CLK_fd2391e7 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end ora_0CLK_fd2391e7;
architecture arch of ora_0CLK_fd2391e7 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l890_c6_723b]
signal BIN_OP_EQ_uxn_opcodes_h_l890_c6_723b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l890_c6_723b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l890_c6_723b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l890_c1_4ffa]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l890_c1_4ffa_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l890_c1_4ffa_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l890_c1_4ffa_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l890_c1_4ffa_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l890_c2_68c3]
signal t8_MUX_uxn_opcodes_h_l890_c2_68c3_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l890_c2_68c3_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l890_c2_68c3_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l890_c2_68c3_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l890_c2_68c3]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l890_c2_68c3_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l890_c2_68c3_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l890_c2_68c3_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l890_c2_68c3_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l890_c2_68c3]
signal result_stack_value_MUX_uxn_opcodes_h_l890_c2_68c3_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l890_c2_68c3_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l890_c2_68c3_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l890_c2_68c3_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l890_c2_68c3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c2_68c3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c2_68c3_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c2_68c3_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c2_68c3_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l890_c2_68c3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l890_c2_68c3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l890_c2_68c3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l890_c2_68c3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l890_c2_68c3_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l890_c2_68c3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l890_c2_68c3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l890_c2_68c3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l890_c2_68c3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l890_c2_68c3_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l890_c2_68c3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c2_68c3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c2_68c3_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c2_68c3_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c2_68c3_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l890_c2_68c3]
signal result_is_stack_read_MUX_uxn_opcodes_h_l890_c2_68c3_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l890_c2_68c3_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l890_c2_68c3_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l890_c2_68c3_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l890_c2_68c3]
signal n8_MUX_uxn_opcodes_h_l890_c2_68c3_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l890_c2_68c3_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l890_c2_68c3_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l890_c2_68c3_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l891_c3_7edf[uxn_opcodes_h_l891_c3_7edf]
signal printf_uxn_opcodes_h_l891_c3_7edf_uxn_opcodes_h_l891_c3_7edf_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l896_c11_c26c]
signal BIN_OP_EQ_uxn_opcodes_h_l896_c11_c26c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l896_c11_c26c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l896_c11_c26c_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l896_c7_ec2e]
signal t8_MUX_uxn_opcodes_h_l896_c7_ec2e_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l896_c7_ec2e_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l896_c7_ec2e_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l896_c7_ec2e_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l896_c7_ec2e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l896_c7_ec2e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l896_c7_ec2e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l896_c7_ec2e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l896_c7_ec2e_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l896_c7_ec2e]
signal result_stack_value_MUX_uxn_opcodes_h_l896_c7_ec2e_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l896_c7_ec2e_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l896_c7_ec2e_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l896_c7_ec2e_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l896_c7_ec2e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l896_c7_ec2e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l896_c7_ec2e_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l896_c7_ec2e_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l896_c7_ec2e_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l896_c7_ec2e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l896_c7_ec2e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l896_c7_ec2e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l896_c7_ec2e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l896_c7_ec2e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l896_c7_ec2e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l896_c7_ec2e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l896_c7_ec2e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l896_c7_ec2e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l896_c7_ec2e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l896_c7_ec2e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l896_c7_ec2e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l896_c7_ec2e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l896_c7_ec2e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l896_c7_ec2e_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l896_c7_ec2e]
signal result_is_stack_read_MUX_uxn_opcodes_h_l896_c7_ec2e_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l896_c7_ec2e_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l896_c7_ec2e_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l896_c7_ec2e_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l896_c7_ec2e]
signal n8_MUX_uxn_opcodes_h_l896_c7_ec2e_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l896_c7_ec2e_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l896_c7_ec2e_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l896_c7_ec2e_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l899_c11_9960]
signal BIN_OP_EQ_uxn_opcodes_h_l899_c11_9960_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l899_c11_9960_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l899_c11_9960_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l899_c7_4e40]
signal t8_MUX_uxn_opcodes_h_l899_c7_4e40_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l899_c7_4e40_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l899_c7_4e40_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l899_c7_4e40_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l899_c7_4e40]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l899_c7_4e40_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l899_c7_4e40_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l899_c7_4e40_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l899_c7_4e40_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l899_c7_4e40]
signal result_stack_value_MUX_uxn_opcodes_h_l899_c7_4e40_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l899_c7_4e40_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l899_c7_4e40_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l899_c7_4e40_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l899_c7_4e40]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c7_4e40_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c7_4e40_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c7_4e40_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c7_4e40_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l899_c7_4e40]
signal result_is_stack_write_MUX_uxn_opcodes_h_l899_c7_4e40_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l899_c7_4e40_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l899_c7_4e40_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l899_c7_4e40_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l899_c7_4e40]
signal result_is_opc_done_MUX_uxn_opcodes_h_l899_c7_4e40_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l899_c7_4e40_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l899_c7_4e40_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l899_c7_4e40_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l899_c7_4e40]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c7_4e40_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c7_4e40_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c7_4e40_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c7_4e40_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l899_c7_4e40]
signal result_is_stack_read_MUX_uxn_opcodes_h_l899_c7_4e40_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l899_c7_4e40_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l899_c7_4e40_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l899_c7_4e40_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l899_c7_4e40]
signal n8_MUX_uxn_opcodes_h_l899_c7_4e40_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l899_c7_4e40_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l899_c7_4e40_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l899_c7_4e40_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l903_c11_6bff]
signal BIN_OP_EQ_uxn_opcodes_h_l903_c11_6bff_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l903_c11_6bff_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l903_c11_6bff_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l903_c7_ddcc]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l903_c7_ddcc_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l903_c7_ddcc_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l903_c7_ddcc_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l903_c7_ddcc_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l903_c7_ddcc]
signal result_stack_value_MUX_uxn_opcodes_h_l903_c7_ddcc_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l903_c7_ddcc_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l903_c7_ddcc_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l903_c7_ddcc_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l903_c7_ddcc]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l903_c7_ddcc_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l903_c7_ddcc_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l903_c7_ddcc_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l903_c7_ddcc_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l903_c7_ddcc]
signal result_is_stack_write_MUX_uxn_opcodes_h_l903_c7_ddcc_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l903_c7_ddcc_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l903_c7_ddcc_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l903_c7_ddcc_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l903_c7_ddcc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l903_c7_ddcc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l903_c7_ddcc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l903_c7_ddcc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l903_c7_ddcc_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l903_c7_ddcc]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c7_ddcc_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c7_ddcc_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c7_ddcc_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c7_ddcc_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l903_c7_ddcc]
signal result_is_stack_read_MUX_uxn_opcodes_h_l903_c7_ddcc_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l903_c7_ddcc_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l903_c7_ddcc_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l903_c7_ddcc_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l903_c7_ddcc]
signal n8_MUX_uxn_opcodes_h_l903_c7_ddcc_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l903_c7_ddcc_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l903_c7_ddcc_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l903_c7_ddcc_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l906_c11_ea5c]
signal BIN_OP_EQ_uxn_opcodes_h_l906_c11_ea5c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l906_c11_ea5c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l906_c11_ea5c_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l906_c7_be25]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_be25_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_be25_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_be25_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_be25_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l906_c7_be25]
signal result_stack_value_MUX_uxn_opcodes_h_l906_c7_be25_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l906_c7_be25_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l906_c7_be25_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l906_c7_be25_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l906_c7_be25]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_be25_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_be25_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_be25_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_be25_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l906_c7_be25]
signal result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_be25_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_be25_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_be25_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_be25_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l906_c7_be25]
signal result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_be25_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_be25_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_be25_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_be25_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l906_c7_be25]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_be25_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_be25_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_be25_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_be25_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l906_c7_be25]
signal result_is_stack_read_MUX_uxn_opcodes_h_l906_c7_be25_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l906_c7_be25_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l906_c7_be25_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l906_c7_be25_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l906_c7_be25]
signal n8_MUX_uxn_opcodes_h_l906_c7_be25_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l906_c7_be25_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l906_c7_be25_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l906_c7_be25_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l910_c32_fe3f]
signal BIN_OP_AND_uxn_opcodes_h_l910_c32_fe3f_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l910_c32_fe3f_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l910_c32_fe3f_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l910_c32_84d0]
signal BIN_OP_GT_uxn_opcodes_h_l910_c32_84d0_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l910_c32_84d0_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l910_c32_84d0_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l910_c32_384c]
signal MUX_uxn_opcodes_h_l910_c32_384c_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l910_c32_384c_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l910_c32_384c_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l910_c32_384c_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l912_c11_09ec]
signal BIN_OP_EQ_uxn_opcodes_h_l912_c11_09ec_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l912_c11_09ec_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l912_c11_09ec_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l912_c7_905d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l912_c7_905d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l912_c7_905d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l912_c7_905d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l912_c7_905d_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l912_c7_905d]
signal result_stack_value_MUX_uxn_opcodes_h_l912_c7_905d_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l912_c7_905d_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l912_c7_905d_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l912_c7_905d_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l912_c7_905d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l912_c7_905d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l912_c7_905d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l912_c7_905d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l912_c7_905d_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l912_c7_905d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l912_c7_905d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l912_c7_905d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l912_c7_905d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l912_c7_905d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l912_c7_905d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l912_c7_905d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l912_c7_905d_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l912_c7_905d_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l912_c7_905d_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l916_c24_2c3d]
signal BIN_OP_OR_uxn_opcodes_h_l916_c24_2c3d_left : unsigned(7 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l916_c24_2c3d_right : unsigned(7 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l916_c24_2c3d_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l918_c11_6a4a]
signal BIN_OP_EQ_uxn_opcodes_h_l918_c11_6a4a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l918_c11_6a4a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l918_c11_6a4a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l918_c7_8b20]
signal result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_8b20_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_8b20_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_8b20_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_8b20_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l918_c7_8b20]
signal result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_8b20_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_8b20_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_8b20_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_8b20_return_output : unsigned(0 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l890_c6_723b
BIN_OP_EQ_uxn_opcodes_h_l890_c6_723b : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l890_c6_723b_left,
BIN_OP_EQ_uxn_opcodes_h_l890_c6_723b_right,
BIN_OP_EQ_uxn_opcodes_h_l890_c6_723b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l890_c1_4ffa
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l890_c1_4ffa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l890_c1_4ffa_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l890_c1_4ffa_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l890_c1_4ffa_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l890_c1_4ffa_return_output);

-- t8_MUX_uxn_opcodes_h_l890_c2_68c3
t8_MUX_uxn_opcodes_h_l890_c2_68c3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l890_c2_68c3_cond,
t8_MUX_uxn_opcodes_h_l890_c2_68c3_iftrue,
t8_MUX_uxn_opcodes_h_l890_c2_68c3_iffalse,
t8_MUX_uxn_opcodes_h_l890_c2_68c3_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l890_c2_68c3
result_is_sp_shift_MUX_uxn_opcodes_h_l890_c2_68c3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l890_c2_68c3_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l890_c2_68c3_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l890_c2_68c3_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l890_c2_68c3_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l890_c2_68c3
result_stack_value_MUX_uxn_opcodes_h_l890_c2_68c3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l890_c2_68c3_cond,
result_stack_value_MUX_uxn_opcodes_h_l890_c2_68c3_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l890_c2_68c3_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l890_c2_68c3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c2_68c3
result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c2_68c3 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c2_68c3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c2_68c3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c2_68c3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c2_68c3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l890_c2_68c3
result_is_stack_write_MUX_uxn_opcodes_h_l890_c2_68c3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l890_c2_68c3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l890_c2_68c3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l890_c2_68c3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l890_c2_68c3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l890_c2_68c3
result_is_opc_done_MUX_uxn_opcodes_h_l890_c2_68c3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l890_c2_68c3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l890_c2_68c3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l890_c2_68c3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l890_c2_68c3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c2_68c3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c2_68c3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c2_68c3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c2_68c3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c2_68c3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c2_68c3_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l890_c2_68c3
result_is_stack_read_MUX_uxn_opcodes_h_l890_c2_68c3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l890_c2_68c3_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l890_c2_68c3_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l890_c2_68c3_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l890_c2_68c3_return_output);

-- n8_MUX_uxn_opcodes_h_l890_c2_68c3
n8_MUX_uxn_opcodes_h_l890_c2_68c3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l890_c2_68c3_cond,
n8_MUX_uxn_opcodes_h_l890_c2_68c3_iftrue,
n8_MUX_uxn_opcodes_h_l890_c2_68c3_iffalse,
n8_MUX_uxn_opcodes_h_l890_c2_68c3_return_output);

-- printf_uxn_opcodes_h_l891_c3_7edf_uxn_opcodes_h_l891_c3_7edf
printf_uxn_opcodes_h_l891_c3_7edf_uxn_opcodes_h_l891_c3_7edf : entity work.printf_uxn_opcodes_h_l891_c3_7edf_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l891_c3_7edf_uxn_opcodes_h_l891_c3_7edf_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l896_c11_c26c
BIN_OP_EQ_uxn_opcodes_h_l896_c11_c26c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l896_c11_c26c_left,
BIN_OP_EQ_uxn_opcodes_h_l896_c11_c26c_right,
BIN_OP_EQ_uxn_opcodes_h_l896_c11_c26c_return_output);

-- t8_MUX_uxn_opcodes_h_l896_c7_ec2e
t8_MUX_uxn_opcodes_h_l896_c7_ec2e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l896_c7_ec2e_cond,
t8_MUX_uxn_opcodes_h_l896_c7_ec2e_iftrue,
t8_MUX_uxn_opcodes_h_l896_c7_ec2e_iffalse,
t8_MUX_uxn_opcodes_h_l896_c7_ec2e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l896_c7_ec2e
result_is_sp_shift_MUX_uxn_opcodes_h_l896_c7_ec2e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l896_c7_ec2e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l896_c7_ec2e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l896_c7_ec2e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l896_c7_ec2e_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l896_c7_ec2e
result_stack_value_MUX_uxn_opcodes_h_l896_c7_ec2e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l896_c7_ec2e_cond,
result_stack_value_MUX_uxn_opcodes_h_l896_c7_ec2e_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l896_c7_ec2e_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l896_c7_ec2e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l896_c7_ec2e
result_sp_relative_shift_MUX_uxn_opcodes_h_l896_c7_ec2e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l896_c7_ec2e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l896_c7_ec2e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l896_c7_ec2e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l896_c7_ec2e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l896_c7_ec2e
result_is_stack_write_MUX_uxn_opcodes_h_l896_c7_ec2e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l896_c7_ec2e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l896_c7_ec2e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l896_c7_ec2e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l896_c7_ec2e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l896_c7_ec2e
result_is_opc_done_MUX_uxn_opcodes_h_l896_c7_ec2e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l896_c7_ec2e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l896_c7_ec2e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l896_c7_ec2e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l896_c7_ec2e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l896_c7_ec2e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l896_c7_ec2e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l896_c7_ec2e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l896_c7_ec2e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l896_c7_ec2e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l896_c7_ec2e_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l896_c7_ec2e
result_is_stack_read_MUX_uxn_opcodes_h_l896_c7_ec2e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l896_c7_ec2e_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l896_c7_ec2e_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l896_c7_ec2e_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l896_c7_ec2e_return_output);

-- n8_MUX_uxn_opcodes_h_l896_c7_ec2e
n8_MUX_uxn_opcodes_h_l896_c7_ec2e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l896_c7_ec2e_cond,
n8_MUX_uxn_opcodes_h_l896_c7_ec2e_iftrue,
n8_MUX_uxn_opcodes_h_l896_c7_ec2e_iffalse,
n8_MUX_uxn_opcodes_h_l896_c7_ec2e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l899_c11_9960
BIN_OP_EQ_uxn_opcodes_h_l899_c11_9960 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l899_c11_9960_left,
BIN_OP_EQ_uxn_opcodes_h_l899_c11_9960_right,
BIN_OP_EQ_uxn_opcodes_h_l899_c11_9960_return_output);

-- t8_MUX_uxn_opcodes_h_l899_c7_4e40
t8_MUX_uxn_opcodes_h_l899_c7_4e40 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l899_c7_4e40_cond,
t8_MUX_uxn_opcodes_h_l899_c7_4e40_iftrue,
t8_MUX_uxn_opcodes_h_l899_c7_4e40_iffalse,
t8_MUX_uxn_opcodes_h_l899_c7_4e40_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l899_c7_4e40
result_is_sp_shift_MUX_uxn_opcodes_h_l899_c7_4e40 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l899_c7_4e40_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l899_c7_4e40_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l899_c7_4e40_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l899_c7_4e40_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l899_c7_4e40
result_stack_value_MUX_uxn_opcodes_h_l899_c7_4e40 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l899_c7_4e40_cond,
result_stack_value_MUX_uxn_opcodes_h_l899_c7_4e40_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l899_c7_4e40_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l899_c7_4e40_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c7_4e40
result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c7_4e40 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c7_4e40_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c7_4e40_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c7_4e40_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c7_4e40_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l899_c7_4e40
result_is_stack_write_MUX_uxn_opcodes_h_l899_c7_4e40 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l899_c7_4e40_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l899_c7_4e40_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l899_c7_4e40_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l899_c7_4e40_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l899_c7_4e40
result_is_opc_done_MUX_uxn_opcodes_h_l899_c7_4e40 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l899_c7_4e40_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l899_c7_4e40_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l899_c7_4e40_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l899_c7_4e40_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c7_4e40
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c7_4e40 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c7_4e40_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c7_4e40_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c7_4e40_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c7_4e40_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l899_c7_4e40
result_is_stack_read_MUX_uxn_opcodes_h_l899_c7_4e40 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l899_c7_4e40_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l899_c7_4e40_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l899_c7_4e40_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l899_c7_4e40_return_output);

-- n8_MUX_uxn_opcodes_h_l899_c7_4e40
n8_MUX_uxn_opcodes_h_l899_c7_4e40 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l899_c7_4e40_cond,
n8_MUX_uxn_opcodes_h_l899_c7_4e40_iftrue,
n8_MUX_uxn_opcodes_h_l899_c7_4e40_iffalse,
n8_MUX_uxn_opcodes_h_l899_c7_4e40_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l903_c11_6bff
BIN_OP_EQ_uxn_opcodes_h_l903_c11_6bff : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l903_c11_6bff_left,
BIN_OP_EQ_uxn_opcodes_h_l903_c11_6bff_right,
BIN_OP_EQ_uxn_opcodes_h_l903_c11_6bff_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l903_c7_ddcc
result_is_sp_shift_MUX_uxn_opcodes_h_l903_c7_ddcc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l903_c7_ddcc_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l903_c7_ddcc_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l903_c7_ddcc_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l903_c7_ddcc_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l903_c7_ddcc
result_stack_value_MUX_uxn_opcodes_h_l903_c7_ddcc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l903_c7_ddcc_cond,
result_stack_value_MUX_uxn_opcodes_h_l903_c7_ddcc_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l903_c7_ddcc_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l903_c7_ddcc_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l903_c7_ddcc
result_sp_relative_shift_MUX_uxn_opcodes_h_l903_c7_ddcc : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l903_c7_ddcc_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l903_c7_ddcc_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l903_c7_ddcc_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l903_c7_ddcc_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l903_c7_ddcc
result_is_stack_write_MUX_uxn_opcodes_h_l903_c7_ddcc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l903_c7_ddcc_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l903_c7_ddcc_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l903_c7_ddcc_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l903_c7_ddcc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l903_c7_ddcc
result_is_opc_done_MUX_uxn_opcodes_h_l903_c7_ddcc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l903_c7_ddcc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l903_c7_ddcc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l903_c7_ddcc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l903_c7_ddcc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c7_ddcc
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c7_ddcc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c7_ddcc_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c7_ddcc_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c7_ddcc_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c7_ddcc_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l903_c7_ddcc
result_is_stack_read_MUX_uxn_opcodes_h_l903_c7_ddcc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l903_c7_ddcc_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l903_c7_ddcc_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l903_c7_ddcc_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l903_c7_ddcc_return_output);

-- n8_MUX_uxn_opcodes_h_l903_c7_ddcc
n8_MUX_uxn_opcodes_h_l903_c7_ddcc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l903_c7_ddcc_cond,
n8_MUX_uxn_opcodes_h_l903_c7_ddcc_iftrue,
n8_MUX_uxn_opcodes_h_l903_c7_ddcc_iffalse,
n8_MUX_uxn_opcodes_h_l903_c7_ddcc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l906_c11_ea5c
BIN_OP_EQ_uxn_opcodes_h_l906_c11_ea5c : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l906_c11_ea5c_left,
BIN_OP_EQ_uxn_opcodes_h_l906_c11_ea5c_right,
BIN_OP_EQ_uxn_opcodes_h_l906_c11_ea5c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_be25
result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_be25 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_be25_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_be25_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_be25_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_be25_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l906_c7_be25
result_stack_value_MUX_uxn_opcodes_h_l906_c7_be25 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l906_c7_be25_cond,
result_stack_value_MUX_uxn_opcodes_h_l906_c7_be25_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l906_c7_be25_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l906_c7_be25_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_be25
result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_be25 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_be25_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_be25_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_be25_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_be25_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_be25
result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_be25 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_be25_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_be25_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_be25_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_be25_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_be25
result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_be25 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_be25_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_be25_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_be25_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_be25_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_be25
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_be25 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_be25_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_be25_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_be25_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_be25_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l906_c7_be25
result_is_stack_read_MUX_uxn_opcodes_h_l906_c7_be25 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l906_c7_be25_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l906_c7_be25_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l906_c7_be25_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l906_c7_be25_return_output);

-- n8_MUX_uxn_opcodes_h_l906_c7_be25
n8_MUX_uxn_opcodes_h_l906_c7_be25 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l906_c7_be25_cond,
n8_MUX_uxn_opcodes_h_l906_c7_be25_iftrue,
n8_MUX_uxn_opcodes_h_l906_c7_be25_iffalse,
n8_MUX_uxn_opcodes_h_l906_c7_be25_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l910_c32_fe3f
BIN_OP_AND_uxn_opcodes_h_l910_c32_fe3f : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l910_c32_fe3f_left,
BIN_OP_AND_uxn_opcodes_h_l910_c32_fe3f_right,
BIN_OP_AND_uxn_opcodes_h_l910_c32_fe3f_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l910_c32_84d0
BIN_OP_GT_uxn_opcodes_h_l910_c32_84d0 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l910_c32_84d0_left,
BIN_OP_GT_uxn_opcodes_h_l910_c32_84d0_right,
BIN_OP_GT_uxn_opcodes_h_l910_c32_84d0_return_output);

-- MUX_uxn_opcodes_h_l910_c32_384c
MUX_uxn_opcodes_h_l910_c32_384c : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l910_c32_384c_cond,
MUX_uxn_opcodes_h_l910_c32_384c_iftrue,
MUX_uxn_opcodes_h_l910_c32_384c_iffalse,
MUX_uxn_opcodes_h_l910_c32_384c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l912_c11_09ec
BIN_OP_EQ_uxn_opcodes_h_l912_c11_09ec : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l912_c11_09ec_left,
BIN_OP_EQ_uxn_opcodes_h_l912_c11_09ec_right,
BIN_OP_EQ_uxn_opcodes_h_l912_c11_09ec_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l912_c7_905d
result_is_sp_shift_MUX_uxn_opcodes_h_l912_c7_905d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l912_c7_905d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l912_c7_905d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l912_c7_905d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l912_c7_905d_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l912_c7_905d
result_stack_value_MUX_uxn_opcodes_h_l912_c7_905d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l912_c7_905d_cond,
result_stack_value_MUX_uxn_opcodes_h_l912_c7_905d_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l912_c7_905d_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l912_c7_905d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l912_c7_905d
result_is_opc_done_MUX_uxn_opcodes_h_l912_c7_905d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l912_c7_905d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l912_c7_905d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l912_c7_905d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l912_c7_905d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l912_c7_905d
result_is_stack_write_MUX_uxn_opcodes_h_l912_c7_905d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l912_c7_905d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l912_c7_905d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l912_c7_905d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l912_c7_905d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l912_c7_905d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l912_c7_905d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l912_c7_905d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l912_c7_905d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l912_c7_905d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l912_c7_905d_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l916_c24_2c3d
BIN_OP_OR_uxn_opcodes_h_l916_c24_2c3d : entity work.BIN_OP_OR_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l916_c24_2c3d_left,
BIN_OP_OR_uxn_opcodes_h_l916_c24_2c3d_right,
BIN_OP_OR_uxn_opcodes_h_l916_c24_2c3d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l918_c11_6a4a
BIN_OP_EQ_uxn_opcodes_h_l918_c11_6a4a : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l918_c11_6a4a_left,
BIN_OP_EQ_uxn_opcodes_h_l918_c11_6a4a_right,
BIN_OP_EQ_uxn_opcodes_h_l918_c11_6a4a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_8b20
result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_8b20 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_8b20_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_8b20_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_8b20_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_8b20_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_8b20
result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_8b20 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_8b20_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_8b20_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_8b20_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_8b20_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l890_c6_723b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l890_c1_4ffa_return_output,
 t8_MUX_uxn_opcodes_h_l890_c2_68c3_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l890_c2_68c3_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l890_c2_68c3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c2_68c3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l890_c2_68c3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l890_c2_68c3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c2_68c3_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l890_c2_68c3_return_output,
 n8_MUX_uxn_opcodes_h_l890_c2_68c3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l896_c11_c26c_return_output,
 t8_MUX_uxn_opcodes_h_l896_c7_ec2e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l896_c7_ec2e_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l896_c7_ec2e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l896_c7_ec2e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l896_c7_ec2e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l896_c7_ec2e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l896_c7_ec2e_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l896_c7_ec2e_return_output,
 n8_MUX_uxn_opcodes_h_l896_c7_ec2e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l899_c11_9960_return_output,
 t8_MUX_uxn_opcodes_h_l899_c7_4e40_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l899_c7_4e40_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l899_c7_4e40_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c7_4e40_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l899_c7_4e40_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l899_c7_4e40_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c7_4e40_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l899_c7_4e40_return_output,
 n8_MUX_uxn_opcodes_h_l899_c7_4e40_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l903_c11_6bff_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l903_c7_ddcc_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l903_c7_ddcc_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l903_c7_ddcc_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l903_c7_ddcc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l903_c7_ddcc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c7_ddcc_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l903_c7_ddcc_return_output,
 n8_MUX_uxn_opcodes_h_l903_c7_ddcc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l906_c11_ea5c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_be25_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l906_c7_be25_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_be25_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_be25_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_be25_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_be25_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l906_c7_be25_return_output,
 n8_MUX_uxn_opcodes_h_l906_c7_be25_return_output,
 BIN_OP_AND_uxn_opcodes_h_l910_c32_fe3f_return_output,
 BIN_OP_GT_uxn_opcodes_h_l910_c32_84d0_return_output,
 MUX_uxn_opcodes_h_l910_c32_384c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l912_c11_09ec_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l912_c7_905d_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l912_c7_905d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l912_c7_905d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l912_c7_905d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l912_c7_905d_return_output,
 BIN_OP_OR_uxn_opcodes_h_l916_c24_2c3d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l918_c11_6a4a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_8b20_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_8b20_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l890_c6_723b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l890_c6_723b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l890_c6_723b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l890_c1_4ffa_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l890_c1_4ffa_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l890_c1_4ffa_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l890_c1_4ffa_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l890_c2_68c3_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l890_c2_68c3_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l896_c7_ec2e_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l890_c2_68c3_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l890_c2_68c3_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l890_c2_68c3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l890_c2_68c3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l896_c7_ec2e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l890_c2_68c3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l890_c2_68c3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l890_c2_68c3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l890_c2_68c3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l896_c7_ec2e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l890_c2_68c3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l890_c2_68c3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c2_68c3_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c2_68c3_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l896_c7_ec2e_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c2_68c3_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c2_68c3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l890_c2_68c3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l890_c2_68c3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l896_c7_ec2e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l890_c2_68c3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l890_c2_68c3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l890_c2_68c3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l890_c2_68c3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l896_c7_ec2e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l890_c2_68c3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l890_c2_68c3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c2_68c3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l893_c3_441b : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c2_68c3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l896_c7_ec2e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c2_68c3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c2_68c3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l890_c2_68c3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l890_c2_68c3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l896_c7_ec2e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l890_c2_68c3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l890_c2_68c3_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l890_c2_68c3_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l890_c2_68c3_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l896_c7_ec2e_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l890_c2_68c3_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l890_c2_68c3_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l891_c3_7edf_uxn_opcodes_h_l891_c3_7edf_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l896_c11_c26c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l896_c11_c26c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l896_c11_c26c_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l896_c7_ec2e_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l896_c7_ec2e_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l899_c7_4e40_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l896_c7_ec2e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l896_c7_ec2e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l896_c7_ec2e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l899_c7_4e40_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l896_c7_ec2e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l896_c7_ec2e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l896_c7_ec2e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l899_c7_4e40_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l896_c7_ec2e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l896_c7_ec2e_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l896_c7_ec2e_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c7_4e40_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l896_c7_ec2e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l896_c7_ec2e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l896_c7_ec2e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l899_c7_4e40_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l896_c7_ec2e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l896_c7_ec2e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l896_c7_ec2e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l899_c7_4e40_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l896_c7_ec2e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l896_c7_ec2e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l897_c3_a144 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l896_c7_ec2e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c7_4e40_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l896_c7_ec2e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l896_c7_ec2e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l896_c7_ec2e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l899_c7_4e40_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l896_c7_ec2e_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l896_c7_ec2e_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l896_c7_ec2e_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l899_c7_4e40_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l896_c7_ec2e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l899_c11_9960_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l899_c11_9960_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l899_c11_9960_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l899_c7_4e40_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l899_c7_4e40_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l899_c7_4e40_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l899_c7_4e40_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l899_c7_4e40_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l903_c7_ddcc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l899_c7_4e40_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l899_c7_4e40_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l899_c7_4e40_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l903_c7_ddcc_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l899_c7_4e40_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c7_4e40_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c7_4e40_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l903_c7_ddcc_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c7_4e40_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l899_c7_4e40_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l899_c7_4e40_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l903_c7_ddcc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l899_c7_4e40_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l899_c7_4e40_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l899_c7_4e40_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l903_c7_ddcc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l899_c7_4e40_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c7_4e40_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l901_c3_6eac : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c7_4e40_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c7_ddcc_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c7_4e40_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l899_c7_4e40_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l899_c7_4e40_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l903_c7_ddcc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l899_c7_4e40_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l899_c7_4e40_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l899_c7_4e40_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l903_c7_ddcc_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l899_c7_4e40_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l903_c11_6bff_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l903_c11_6bff_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l903_c11_6bff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l903_c7_ddcc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l903_c7_ddcc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_be25_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l903_c7_ddcc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l903_c7_ddcc_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l903_c7_ddcc_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l906_c7_be25_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l903_c7_ddcc_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l903_c7_ddcc_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l903_c7_ddcc_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_be25_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l903_c7_ddcc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l903_c7_ddcc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l903_c7_ddcc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_be25_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l903_c7_ddcc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l903_c7_ddcc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l903_c7_ddcc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_be25_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l903_c7_ddcc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c7_ddcc_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l904_c3_bee3 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c7_ddcc_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_be25_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c7_ddcc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l903_c7_ddcc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l903_c7_ddcc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l906_c7_be25_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l903_c7_ddcc_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l903_c7_ddcc_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l903_c7_ddcc_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l906_c7_be25_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l903_c7_ddcc_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l906_c11_ea5c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l906_c11_ea5c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l906_c11_ea5c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_be25_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_be25_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l912_c7_905d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_be25_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l906_c7_be25_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l906_c7_be25_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l912_c7_905d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l906_c7_be25_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_be25_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_be25_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_be25_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_be25_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_be25_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l912_c7_905d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_be25_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_be25_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_be25_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l912_c7_905d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_be25_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_be25_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_be25_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l912_c7_905d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_be25_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l906_c7_be25_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l906_c7_be25_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l906_c7_be25_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l906_c7_be25_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l906_c7_be25_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l906_c7_be25_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l910_c32_384c_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l910_c32_384c_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l910_c32_384c_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l910_c32_fe3f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l910_c32_fe3f_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l910_c32_fe3f_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l910_c32_84d0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l910_c32_84d0_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l910_c32_84d0_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l910_c32_384c_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l912_c11_09ec_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l912_c11_09ec_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l912_c11_09ec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l912_c7_905d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l912_c7_905d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l912_c7_905d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l912_c7_905d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l912_c7_905d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l912_c7_905d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l912_c7_905d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l912_c7_905d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_8b20_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l912_c7_905d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l912_c7_905d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l912_c7_905d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_8b20_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l912_c7_905d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l912_c7_905d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l915_c3_39d7 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l912_c7_905d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l912_c7_905d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l916_c24_2c3d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l916_c24_2c3d_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l916_c24_2c3d_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l918_c11_6a4a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l918_c11_6a4a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l918_c11_6a4a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_8b20_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_8b20_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_8b20_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_8b20_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_8b20_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_8b20_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l890_l912_l896_l899_l903_DUPLICATE_695c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l890_l906_l912_l896_l899_l903_DUPLICATE_db96_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l890_l906_l896_l899_l903_DUPLICATE_3c2a_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l890_l906_l918_l896_l899_l903_DUPLICATE_0fd0_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l906_l912_l918_l896_l899_l903_DUPLICATE_0f96_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l899_l906_l896_l903_DUPLICATE_95e8_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l906_l912_DUPLICATE_b89d_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e56b_uxn_opcodes_h_l923_l886_DUPLICATE_c5f8_return_output : opcode_result_t;
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
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_8b20_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l896_c11_c26c_right := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l890_c2_68c3_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l903_c11_6bff_right := to_unsigned(3, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_8b20_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l915_c3_39d7 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l912_c7_905d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l915_c3_39d7;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l899_c11_9960_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l904_c3_bee3 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c7_ddcc_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l904_c3_bee3;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l912_c7_905d_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l906_c11_ea5c_right := to_unsigned(4, 3);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l906_c7_be25_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_be25_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l912_c11_09ec_right := to_unsigned(5, 3);
     VAR_BIN_OP_AND_uxn_opcodes_h_l910_c32_fe3f_right := to_unsigned(128, 8);
     VAR_BIN_OP_GT_uxn_opcodes_h_l910_c32_84d0_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l901_c3_6eac := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c7_4e40_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l901_c3_6eac;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l890_c2_68c3_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l912_c7_905d_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l890_c1_4ffa_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l918_c11_6a4a_right := to_unsigned(6, 3);
     VAR_MUX_uxn_opcodes_h_l910_c32_384c_iffalse := resize(to_signed(-1, 2), 8);
     VAR_MUX_uxn_opcodes_h_l910_c32_384c_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l897_c3_a144 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l896_c7_ec2e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l897_c3_a144;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l893_c3_441b := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c2_68c3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l893_c3_441b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l890_c6_723b_right := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l890_c1_4ffa_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l910_c32_fe3f_left := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l916_c24_2c3d_left := n8;
     VAR_n8_MUX_uxn_opcodes_h_l890_c2_68c3_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l896_c7_ec2e_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l899_c7_4e40_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l903_c7_ddcc_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l906_c7_be25_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l890_c6_723b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l896_c11_c26c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l899_c11_9960_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l903_c11_6bff_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l906_c11_ea5c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l912_c11_09ec_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l918_c11_6a4a_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l906_c7_be25_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l899_c7_4e40_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_OR_uxn_opcodes_h_l916_c24_2c3d_right := t8;
     VAR_t8_MUX_uxn_opcodes_h_l890_c2_68c3_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l896_c7_ec2e_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l899_c7_4e40_iffalse := t8;
     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l890_l906_l896_l899_l903_DUPLICATE_3c2a LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l890_l906_l896_l899_l903_DUPLICATE_3c2a_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l899_c11_9960] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l899_c11_9960_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l899_c11_9960_left;
     BIN_OP_EQ_uxn_opcodes_h_l899_c11_9960_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l899_c11_9960_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l899_c11_9960_return_output := BIN_OP_EQ_uxn_opcodes_h_l899_c11_9960_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l890_l912_l896_l899_l903_DUPLICATE_695c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l890_l912_l896_l899_l903_DUPLICATE_695c_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l906_l912_l918_l896_l899_l903_DUPLICATE_0f96 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l906_l912_l918_l896_l899_l903_DUPLICATE_0f96_return_output := result.is_opc_done;

     -- BIN_OP_OR[uxn_opcodes_h_l916_c24_2c3d] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l916_c24_2c3d_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l916_c24_2c3d_left;
     BIN_OP_OR_uxn_opcodes_h_l916_c24_2c3d_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l916_c24_2c3d_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l916_c24_2c3d_return_output := BIN_OP_OR_uxn_opcodes_h_l916_c24_2c3d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l903_c11_6bff] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l903_c11_6bff_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l903_c11_6bff_left;
     BIN_OP_EQ_uxn_opcodes_h_l903_c11_6bff_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l903_c11_6bff_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l903_c11_6bff_return_output := BIN_OP_EQ_uxn_opcodes_h_l903_c11_6bff_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l918_c11_6a4a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l918_c11_6a4a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l918_c11_6a4a_left;
     BIN_OP_EQ_uxn_opcodes_h_l918_c11_6a4a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l918_c11_6a4a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l918_c11_6a4a_return_output := BIN_OP_EQ_uxn_opcodes_h_l918_c11_6a4a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l890_c6_723b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l890_c6_723b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l890_c6_723b_left;
     BIN_OP_EQ_uxn_opcodes_h_l890_c6_723b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l890_c6_723b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l890_c6_723b_return_output := BIN_OP_EQ_uxn_opcodes_h_l890_c6_723b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l912_c11_09ec] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l912_c11_09ec_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l912_c11_09ec_left;
     BIN_OP_EQ_uxn_opcodes_h_l912_c11_09ec_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l912_c11_09ec_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l912_c11_09ec_return_output := BIN_OP_EQ_uxn_opcodes_h_l912_c11_09ec_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l910_c32_fe3f] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l910_c32_fe3f_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l910_c32_fe3f_left;
     BIN_OP_AND_uxn_opcodes_h_l910_c32_fe3f_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l910_c32_fe3f_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l910_c32_fe3f_return_output := BIN_OP_AND_uxn_opcodes_h_l910_c32_fe3f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l906_c11_ea5c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l906_c11_ea5c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l906_c11_ea5c_left;
     BIN_OP_EQ_uxn_opcodes_h_l906_c11_ea5c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l906_c11_ea5c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l906_c11_ea5c_return_output := BIN_OP_EQ_uxn_opcodes_h_l906_c11_ea5c_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l906_l912_DUPLICATE_b89d LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l906_l912_DUPLICATE_b89d_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l890_l906_l912_l896_l899_l903_DUPLICATE_db96 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l890_l906_l912_l896_l899_l903_DUPLICATE_db96_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l896_c11_c26c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l896_c11_c26c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l896_c11_c26c_left;
     BIN_OP_EQ_uxn_opcodes_h_l896_c11_c26c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l896_c11_c26c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l896_c11_c26c_return_output := BIN_OP_EQ_uxn_opcodes_h_l896_c11_c26c_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l890_l906_l918_l896_l899_l903_DUPLICATE_0fd0 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l890_l906_l918_l896_l899_l903_DUPLICATE_0fd0_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l899_l906_l896_l903_DUPLICATE_95e8 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l899_l906_l896_l903_DUPLICATE_95e8_return_output := result.is_stack_read;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l910_c32_84d0_left := VAR_BIN_OP_AND_uxn_opcodes_h_l910_c32_fe3f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l890_c1_4ffa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l890_c6_723b_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l890_c2_68c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l890_c6_723b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l890_c2_68c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l890_c6_723b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l890_c2_68c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l890_c6_723b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l890_c2_68c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l890_c6_723b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l890_c2_68c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l890_c6_723b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c2_68c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l890_c6_723b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c2_68c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l890_c6_723b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l890_c2_68c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l890_c6_723b_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l890_c2_68c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l890_c6_723b_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l896_c7_ec2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l896_c11_c26c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l896_c7_ec2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l896_c11_c26c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l896_c7_ec2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l896_c11_c26c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l896_c7_ec2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l896_c11_c26c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l896_c7_ec2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l896_c11_c26c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l896_c7_ec2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l896_c11_c26c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l896_c7_ec2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l896_c11_c26c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l896_c7_ec2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l896_c11_c26c_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l896_c7_ec2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l896_c11_c26c_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l899_c7_4e40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l899_c11_9960_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l899_c7_4e40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l899_c11_9960_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l899_c7_4e40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l899_c11_9960_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l899_c7_4e40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l899_c11_9960_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l899_c7_4e40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l899_c11_9960_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c7_4e40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l899_c11_9960_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c7_4e40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l899_c11_9960_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l899_c7_4e40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l899_c11_9960_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l899_c7_4e40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l899_c11_9960_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l903_c7_ddcc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l903_c11_6bff_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l903_c7_ddcc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l903_c11_6bff_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l903_c7_ddcc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l903_c11_6bff_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l903_c7_ddcc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l903_c11_6bff_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l903_c7_ddcc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l903_c11_6bff_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l903_c7_ddcc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l903_c11_6bff_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c7_ddcc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l903_c11_6bff_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l903_c7_ddcc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l903_c11_6bff_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l906_c7_be25_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l906_c11_ea5c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_be25_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l906_c11_ea5c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_be25_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l906_c11_ea5c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l906_c7_be25_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l906_c11_ea5c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_be25_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l906_c11_ea5c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_be25_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l906_c11_ea5c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_be25_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l906_c11_ea5c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l906_c7_be25_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l906_c11_ea5c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l912_c7_905d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l912_c11_09ec_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l912_c7_905d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l912_c11_09ec_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l912_c7_905d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l912_c11_09ec_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l912_c7_905d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l912_c11_09ec_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l912_c7_905d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l912_c11_09ec_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_8b20_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l918_c11_6a4a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_8b20_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l918_c11_6a4a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l912_c7_905d_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l916_c24_2c3d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c2_68c3_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l890_l906_l896_l899_l903_DUPLICATE_3c2a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l896_c7_ec2e_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l890_l906_l896_l899_l903_DUPLICATE_3c2a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c7_4e40_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l890_l906_l896_l899_l903_DUPLICATE_3c2a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l903_c7_ddcc_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l890_l906_l896_l899_l903_DUPLICATE_3c2a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_be25_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l890_l906_l896_l899_l903_DUPLICATE_3c2a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l896_c7_ec2e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l906_l912_l918_l896_l899_l903_DUPLICATE_0f96_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l899_c7_4e40_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l906_l912_l918_l896_l899_l903_DUPLICATE_0f96_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l903_c7_ddcc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l906_l912_l918_l896_l899_l903_DUPLICATE_0f96_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_be25_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l906_l912_l918_l896_l899_l903_DUPLICATE_0f96_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l912_c7_905d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l906_l912_l918_l896_l899_l903_DUPLICATE_0f96_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_8b20_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l906_l912_l918_l896_l899_l903_DUPLICATE_0f96_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l890_c2_68c3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l890_l912_l896_l899_l903_DUPLICATE_695c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l896_c7_ec2e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l890_l912_l896_l899_l903_DUPLICATE_695c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l899_c7_4e40_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l890_l912_l896_l899_l903_DUPLICATE_695c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l903_c7_ddcc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l890_l912_l896_l899_l903_DUPLICATE_695c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l912_c7_905d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l890_l912_l896_l899_l903_DUPLICATE_695c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l896_c7_ec2e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l899_l906_l896_l903_DUPLICATE_95e8_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l899_c7_4e40_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l899_l906_l896_l903_DUPLICATE_95e8_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l903_c7_ddcc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l899_l906_l896_l903_DUPLICATE_95e8_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l906_c7_be25_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l899_l906_l896_l903_DUPLICATE_95e8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l890_c2_68c3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l890_l906_l918_l896_l899_l903_DUPLICATE_0fd0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l896_c7_ec2e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l890_l906_l918_l896_l899_l903_DUPLICATE_0fd0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l899_c7_4e40_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l890_l906_l918_l896_l899_l903_DUPLICATE_0fd0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l903_c7_ddcc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l890_l906_l918_l896_l899_l903_DUPLICATE_0fd0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_be25_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l890_l906_l918_l896_l899_l903_DUPLICATE_0fd0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_8b20_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l890_l906_l918_l896_l899_l903_DUPLICATE_0fd0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_be25_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l906_l912_DUPLICATE_b89d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l912_c7_905d_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l906_l912_DUPLICATE_b89d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l890_c2_68c3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l890_l906_l912_l896_l899_l903_DUPLICATE_db96_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l896_c7_ec2e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l890_l906_l912_l896_l899_l903_DUPLICATE_db96_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l899_c7_4e40_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l890_l906_l912_l896_l899_l903_DUPLICATE_db96_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l903_c7_ddcc_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l890_l906_l912_l896_l899_l903_DUPLICATE_db96_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l906_c7_be25_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l890_l906_l912_l896_l899_l903_DUPLICATE_db96_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l912_c7_905d_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l890_l906_l912_l896_l899_l903_DUPLICATE_db96_return_output;
     -- BIN_OP_GT[uxn_opcodes_h_l910_c32_84d0] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l910_c32_84d0_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l910_c32_84d0_left;
     BIN_OP_GT_uxn_opcodes_h_l910_c32_84d0_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l910_c32_84d0_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l910_c32_84d0_return_output := BIN_OP_GT_uxn_opcodes_h_l910_c32_84d0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l918_c7_8b20] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_8b20_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_8b20_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_8b20_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_8b20_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_8b20_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_8b20_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_8b20_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_8b20_return_output;

     -- t8_MUX[uxn_opcodes_h_l899_c7_4e40] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l899_c7_4e40_cond <= VAR_t8_MUX_uxn_opcodes_h_l899_c7_4e40_cond;
     t8_MUX_uxn_opcodes_h_l899_c7_4e40_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l899_c7_4e40_iftrue;
     t8_MUX_uxn_opcodes_h_l899_c7_4e40_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l899_c7_4e40_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l899_c7_4e40_return_output := t8_MUX_uxn_opcodes_h_l899_c7_4e40_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l918_c7_8b20] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_8b20_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_8b20_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_8b20_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_8b20_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_8b20_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_8b20_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_8b20_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_8b20_return_output;

     -- n8_MUX[uxn_opcodes_h_l906_c7_be25] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l906_c7_be25_cond <= VAR_n8_MUX_uxn_opcodes_h_l906_c7_be25_cond;
     n8_MUX_uxn_opcodes_h_l906_c7_be25_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l906_c7_be25_iftrue;
     n8_MUX_uxn_opcodes_h_l906_c7_be25_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l906_c7_be25_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l906_c7_be25_return_output := n8_MUX_uxn_opcodes_h_l906_c7_be25_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l890_c1_4ffa] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l890_c1_4ffa_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l890_c1_4ffa_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l890_c1_4ffa_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l890_c1_4ffa_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l890_c1_4ffa_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l890_c1_4ffa_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l890_c1_4ffa_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l890_c1_4ffa_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l912_c7_905d] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l912_c7_905d_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l912_c7_905d_cond;
     result_stack_value_MUX_uxn_opcodes_h_l912_c7_905d_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l912_c7_905d_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l912_c7_905d_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l912_c7_905d_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l912_c7_905d_return_output := result_stack_value_MUX_uxn_opcodes_h_l912_c7_905d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l912_c7_905d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l912_c7_905d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l912_c7_905d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l912_c7_905d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l912_c7_905d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l912_c7_905d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l912_c7_905d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l912_c7_905d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l912_c7_905d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l912_c7_905d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l912_c7_905d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l912_c7_905d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l912_c7_905d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l912_c7_905d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l912_c7_905d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l912_c7_905d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l912_c7_905d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l912_c7_905d_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l906_c7_be25] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l906_c7_be25_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l906_c7_be25_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l906_c7_be25_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l906_c7_be25_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l906_c7_be25_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l906_c7_be25_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l906_c7_be25_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l906_c7_be25_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l910_c32_384c_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l910_c32_84d0_return_output;
     VAR_printf_uxn_opcodes_h_l891_c3_7edf_uxn_opcodes_h_l891_c3_7edf_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l890_c1_4ffa_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l903_c7_ddcc_iffalse := VAR_n8_MUX_uxn_opcodes_h_l906_c7_be25_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l912_c7_905d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l918_c7_8b20_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_be25_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l912_c7_905d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l903_c7_ddcc_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l906_c7_be25_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l912_c7_905d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l918_c7_8b20_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_be25_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l912_c7_905d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l906_c7_be25_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l912_c7_905d_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l896_c7_ec2e_iffalse := VAR_t8_MUX_uxn_opcodes_h_l899_c7_4e40_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l906_c7_be25] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_be25_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_be25_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_be25_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_be25_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_be25_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_be25_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_be25_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_be25_return_output;

     -- t8_MUX[uxn_opcodes_h_l896_c7_ec2e] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l896_c7_ec2e_cond <= VAR_t8_MUX_uxn_opcodes_h_l896_c7_ec2e_cond;
     t8_MUX_uxn_opcodes_h_l896_c7_ec2e_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l896_c7_ec2e_iftrue;
     t8_MUX_uxn_opcodes_h_l896_c7_ec2e_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l896_c7_ec2e_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l896_c7_ec2e_return_output := t8_MUX_uxn_opcodes_h_l896_c7_ec2e_return_output;

     -- printf_uxn_opcodes_h_l891_c3_7edf[uxn_opcodes_h_l891_c3_7edf] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l891_c3_7edf_uxn_opcodes_h_l891_c3_7edf_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l891_c3_7edf_uxn_opcodes_h_l891_c3_7edf_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l906_c7_be25] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_be25_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_be25_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_be25_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_be25_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_be25_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_be25_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_be25_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_be25_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l903_c7_ddcc] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l903_c7_ddcc_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l903_c7_ddcc_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l903_c7_ddcc_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l903_c7_ddcc_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l903_c7_ddcc_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l903_c7_ddcc_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l903_c7_ddcc_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l903_c7_ddcc_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l906_c7_be25] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l906_c7_be25_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l906_c7_be25_cond;
     result_stack_value_MUX_uxn_opcodes_h_l906_c7_be25_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l906_c7_be25_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l906_c7_be25_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l906_c7_be25_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l906_c7_be25_return_output := result_stack_value_MUX_uxn_opcodes_h_l906_c7_be25_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l912_c7_905d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l912_c7_905d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l912_c7_905d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l912_c7_905d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l912_c7_905d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l912_c7_905d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l912_c7_905d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l912_c7_905d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l912_c7_905d_return_output;

     -- MUX[uxn_opcodes_h_l910_c32_384c] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l910_c32_384c_cond <= VAR_MUX_uxn_opcodes_h_l910_c32_384c_cond;
     MUX_uxn_opcodes_h_l910_c32_384c_iftrue <= VAR_MUX_uxn_opcodes_h_l910_c32_384c_iftrue;
     MUX_uxn_opcodes_h_l910_c32_384c_iffalse <= VAR_MUX_uxn_opcodes_h_l910_c32_384c_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l910_c32_384c_return_output := MUX_uxn_opcodes_h_l910_c32_384c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l912_c7_905d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l912_c7_905d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l912_c7_905d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l912_c7_905d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l912_c7_905d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l912_c7_905d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l912_c7_905d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l912_c7_905d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l912_c7_905d_return_output;

     -- n8_MUX[uxn_opcodes_h_l903_c7_ddcc] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l903_c7_ddcc_cond <= VAR_n8_MUX_uxn_opcodes_h_l903_c7_ddcc_cond;
     n8_MUX_uxn_opcodes_h_l903_c7_ddcc_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l903_c7_ddcc_iftrue;
     n8_MUX_uxn_opcodes_h_l903_c7_ddcc_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l903_c7_ddcc_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l903_c7_ddcc_return_output := n8_MUX_uxn_opcodes_h_l903_c7_ddcc_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_be25_iftrue := VAR_MUX_uxn_opcodes_h_l910_c32_384c_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l899_c7_4e40_iffalse := VAR_n8_MUX_uxn_opcodes_h_l903_c7_ddcc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_be25_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l912_c7_905d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l903_c7_ddcc_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l906_c7_be25_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l899_c7_4e40_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l903_c7_ddcc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_be25_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l912_c7_905d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c7_ddcc_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l906_c7_be25_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l903_c7_ddcc_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l906_c7_be25_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l890_c2_68c3_iffalse := VAR_t8_MUX_uxn_opcodes_h_l896_c7_ec2e_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l903_c7_ddcc] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l903_c7_ddcc_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l903_c7_ddcc_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l903_c7_ddcc_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l903_c7_ddcc_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l903_c7_ddcc_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l903_c7_ddcc_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l903_c7_ddcc_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l903_c7_ddcc_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l903_c7_ddcc] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l903_c7_ddcc_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l903_c7_ddcc_cond;
     result_stack_value_MUX_uxn_opcodes_h_l903_c7_ddcc_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l903_c7_ddcc_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l903_c7_ddcc_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l903_c7_ddcc_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l903_c7_ddcc_return_output := result_stack_value_MUX_uxn_opcodes_h_l903_c7_ddcc_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l899_c7_4e40] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l899_c7_4e40_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l899_c7_4e40_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l899_c7_4e40_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l899_c7_4e40_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l899_c7_4e40_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l899_c7_4e40_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l899_c7_4e40_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l899_c7_4e40_return_output;

     -- n8_MUX[uxn_opcodes_h_l899_c7_4e40] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l899_c7_4e40_cond <= VAR_n8_MUX_uxn_opcodes_h_l899_c7_4e40_cond;
     n8_MUX_uxn_opcodes_h_l899_c7_4e40_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l899_c7_4e40_iftrue;
     n8_MUX_uxn_opcodes_h_l899_c7_4e40_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l899_c7_4e40_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l899_c7_4e40_return_output := n8_MUX_uxn_opcodes_h_l899_c7_4e40_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l906_c7_be25] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_be25_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_be25_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_be25_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_be25_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_be25_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_be25_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_be25_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_be25_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l903_c7_ddcc] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c7_ddcc_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c7_ddcc_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c7_ddcc_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c7_ddcc_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c7_ddcc_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c7_ddcc_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c7_ddcc_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c7_ddcc_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l906_c7_be25] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_be25_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_be25_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_be25_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_be25_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_be25_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_be25_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_be25_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_be25_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l906_c7_be25] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_be25_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_be25_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_be25_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_be25_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_be25_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_be25_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_be25_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_be25_return_output;

     -- t8_MUX[uxn_opcodes_h_l890_c2_68c3] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l890_c2_68c3_cond <= VAR_t8_MUX_uxn_opcodes_h_l890_c2_68c3_cond;
     t8_MUX_uxn_opcodes_h_l890_c2_68c3_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l890_c2_68c3_iftrue;
     t8_MUX_uxn_opcodes_h_l890_c2_68c3_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l890_c2_68c3_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l890_c2_68c3_return_output := t8_MUX_uxn_opcodes_h_l890_c2_68c3_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l896_c7_ec2e_iffalse := VAR_n8_MUX_uxn_opcodes_h_l899_c7_4e40_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l903_c7_ddcc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l906_c7_be25_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l899_c7_4e40_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l903_c7_ddcc_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l896_c7_ec2e_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l899_c7_4e40_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l903_c7_ddcc_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l906_c7_be25_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l903_c7_ddcc_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l906_c7_be25_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c7_4e40_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l903_c7_ddcc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l899_c7_4e40_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l903_c7_ddcc_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l890_c2_68c3_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l903_c7_ddcc] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l903_c7_ddcc_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l903_c7_ddcc_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l903_c7_ddcc_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l903_c7_ddcc_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l903_c7_ddcc_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l903_c7_ddcc_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l903_c7_ddcc_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l903_c7_ddcc_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l899_c7_4e40] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l899_c7_4e40_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l899_c7_4e40_cond;
     result_stack_value_MUX_uxn_opcodes_h_l899_c7_4e40_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l899_c7_4e40_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l899_c7_4e40_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l899_c7_4e40_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l899_c7_4e40_return_output := result_stack_value_MUX_uxn_opcodes_h_l899_c7_4e40_return_output;

     -- n8_MUX[uxn_opcodes_h_l896_c7_ec2e] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l896_c7_ec2e_cond <= VAR_n8_MUX_uxn_opcodes_h_l896_c7_ec2e_cond;
     n8_MUX_uxn_opcodes_h_l896_c7_ec2e_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l896_c7_ec2e_iftrue;
     n8_MUX_uxn_opcodes_h_l896_c7_ec2e_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l896_c7_ec2e_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l896_c7_ec2e_return_output := n8_MUX_uxn_opcodes_h_l896_c7_ec2e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l899_c7_4e40] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l899_c7_4e40_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l899_c7_4e40_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l899_c7_4e40_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l899_c7_4e40_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l899_c7_4e40_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l899_c7_4e40_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l899_c7_4e40_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l899_c7_4e40_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l899_c7_4e40] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c7_4e40_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c7_4e40_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c7_4e40_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c7_4e40_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c7_4e40_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c7_4e40_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c7_4e40_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c7_4e40_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l896_c7_ec2e] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l896_c7_ec2e_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l896_c7_ec2e_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l896_c7_ec2e_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l896_c7_ec2e_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l896_c7_ec2e_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l896_c7_ec2e_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l896_c7_ec2e_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l896_c7_ec2e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l903_c7_ddcc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l903_c7_ddcc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l903_c7_ddcc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l903_c7_ddcc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l903_c7_ddcc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l903_c7_ddcc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l903_c7_ddcc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l903_c7_ddcc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l903_c7_ddcc_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l903_c7_ddcc] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l903_c7_ddcc_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l903_c7_ddcc_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l903_c7_ddcc_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l903_c7_ddcc_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l903_c7_ddcc_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l903_c7_ddcc_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l903_c7_ddcc_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l903_c7_ddcc_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l890_c2_68c3_iffalse := VAR_n8_MUX_uxn_opcodes_h_l896_c7_ec2e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l899_c7_4e40_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l903_c7_ddcc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l896_c7_ec2e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l899_c7_4e40_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l890_c2_68c3_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l896_c7_ec2e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l899_c7_4e40_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l903_c7_ddcc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c7_4e40_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l903_c7_ddcc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l896_c7_ec2e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c7_4e40_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l896_c7_ec2e_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l899_c7_4e40_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l890_c2_68c3] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l890_c2_68c3_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l890_c2_68c3_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l890_c2_68c3_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l890_c2_68c3_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l890_c2_68c3_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l890_c2_68c3_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l890_c2_68c3_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l890_c2_68c3_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l896_c7_ec2e] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l896_c7_ec2e_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l896_c7_ec2e_cond;
     result_stack_value_MUX_uxn_opcodes_h_l896_c7_ec2e_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l896_c7_ec2e_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l896_c7_ec2e_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l896_c7_ec2e_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l896_c7_ec2e_return_output := result_stack_value_MUX_uxn_opcodes_h_l896_c7_ec2e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l896_c7_ec2e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l896_c7_ec2e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l896_c7_ec2e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l896_c7_ec2e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l896_c7_ec2e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l896_c7_ec2e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l896_c7_ec2e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l896_c7_ec2e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l896_c7_ec2e_return_output;

     -- n8_MUX[uxn_opcodes_h_l890_c2_68c3] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l890_c2_68c3_cond <= VAR_n8_MUX_uxn_opcodes_h_l890_c2_68c3_cond;
     n8_MUX_uxn_opcodes_h_l890_c2_68c3_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l890_c2_68c3_iftrue;
     n8_MUX_uxn_opcodes_h_l890_c2_68c3_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l890_c2_68c3_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l890_c2_68c3_return_output := n8_MUX_uxn_opcodes_h_l890_c2_68c3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l899_c7_4e40] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l899_c7_4e40_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l899_c7_4e40_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l899_c7_4e40_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l899_c7_4e40_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l899_c7_4e40_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l899_c7_4e40_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l899_c7_4e40_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l899_c7_4e40_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l899_c7_4e40] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l899_c7_4e40_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l899_c7_4e40_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l899_c7_4e40_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l899_c7_4e40_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l899_c7_4e40_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l899_c7_4e40_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l899_c7_4e40_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l899_c7_4e40_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l899_c7_4e40] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c7_4e40_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c7_4e40_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c7_4e40_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c7_4e40_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c7_4e40_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c7_4e40_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c7_4e40_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c7_4e40_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l896_c7_ec2e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l896_c7_ec2e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l896_c7_ec2e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l896_c7_ec2e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l896_c7_ec2e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l896_c7_ec2e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l896_c7_ec2e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l896_c7_ec2e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l896_c7_ec2e_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l890_c2_68c3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l896_c7_ec2e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l899_c7_4e40_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l890_c2_68c3_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l896_c7_ec2e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l896_c7_ec2e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l899_c7_4e40_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l896_c7_ec2e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c7_4e40_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c2_68c3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l896_c7_ec2e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l890_c2_68c3_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l896_c7_ec2e_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l896_c7_ec2e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l896_c7_ec2e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l896_c7_ec2e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l896_c7_ec2e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l896_c7_ec2e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l896_c7_ec2e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l896_c7_ec2e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l896_c7_ec2e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l896_c7_ec2e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l896_c7_ec2e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l896_c7_ec2e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l896_c7_ec2e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l896_c7_ec2e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l896_c7_ec2e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l896_c7_ec2e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l896_c7_ec2e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l896_c7_ec2e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l896_c7_ec2e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l896_c7_ec2e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l896_c7_ec2e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l896_c7_ec2e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l896_c7_ec2e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l896_c7_ec2e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l896_c7_ec2e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l896_c7_ec2e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l896_c7_ec2e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l896_c7_ec2e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l890_c2_68c3] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l890_c2_68c3_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l890_c2_68c3_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l890_c2_68c3_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l890_c2_68c3_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l890_c2_68c3_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l890_c2_68c3_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l890_c2_68c3_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l890_c2_68c3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l890_c2_68c3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c2_68c3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c2_68c3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c2_68c3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c2_68c3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c2_68c3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c2_68c3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c2_68c3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c2_68c3_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l890_c2_68c3] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l890_c2_68c3_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l890_c2_68c3_cond;
     result_stack_value_MUX_uxn_opcodes_h_l890_c2_68c3_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l890_c2_68c3_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l890_c2_68c3_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l890_c2_68c3_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l890_c2_68c3_return_output := result_stack_value_MUX_uxn_opcodes_h_l890_c2_68c3_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l890_c2_68c3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l896_c7_ec2e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l890_c2_68c3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l896_c7_ec2e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c2_68c3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l896_c7_ec2e_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l890_c2_68c3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c2_68c3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c2_68c3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c2_68c3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c2_68c3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c2_68c3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c2_68c3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c2_68c3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c2_68c3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l890_c2_68c3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l890_c2_68c3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l890_c2_68c3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l890_c2_68c3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l890_c2_68c3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l890_c2_68c3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l890_c2_68c3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l890_c2_68c3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l890_c2_68c3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l890_c2_68c3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l890_c2_68c3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l890_c2_68c3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l890_c2_68c3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l890_c2_68c3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l890_c2_68c3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l890_c2_68c3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l890_c2_68c3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l890_c2_68c3_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_e56b_uxn_opcodes_h_l923_l886_DUPLICATE_c5f8 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e56b_uxn_opcodes_h_l923_l886_DUPLICATE_c5f8_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_e56b(
     result,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l890_c2_68c3_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l890_c2_68c3_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c2_68c3_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l890_c2_68c3_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l890_c2_68c3_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c2_68c3_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l890_c2_68c3_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e56b_uxn_opcodes_h_l923_l886_DUPLICATE_c5f8_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e56b_uxn_opcodes_h_l923_l886_DUPLICATE_c5f8_return_output;
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
