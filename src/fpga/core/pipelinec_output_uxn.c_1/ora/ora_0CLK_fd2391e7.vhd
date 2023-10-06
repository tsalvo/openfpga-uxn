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
-- BIN_OP_EQ[uxn_opcodes_h_l1133_c6_2c95]
signal BIN_OP_EQ_uxn_opcodes_h_l1133_c6_2c95_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1133_c6_2c95_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1133_c6_2c95_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1133_c1_f6cb]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1133_c1_f6cb_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1133_c1_f6cb_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1133_c1_f6cb_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1133_c1_f6cb_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1133_c2_e980]
signal t8_MUX_uxn_opcodes_h_l1133_c2_e980_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1133_c2_e980_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1133_c2_e980_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1133_c2_e980_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l1133_c2_e980]
signal n8_MUX_uxn_opcodes_h_l1133_c2_e980_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1133_c2_e980_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1133_c2_e980_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1133_c2_e980_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1133_c2_e980]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1133_c2_e980_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1133_c2_e980_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1133_c2_e980_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1133_c2_e980_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1133_c2_e980]
signal result_stack_value_MUX_uxn_opcodes_h_l1133_c2_e980_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1133_c2_e980_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1133_c2_e980_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1133_c2_e980_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1133_c2_e980]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1133_c2_e980_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1133_c2_e980_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1133_c2_e980_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1133_c2_e980_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1133_c2_e980]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1133_c2_e980_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1133_c2_e980_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1133_c2_e980_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1133_c2_e980_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1133_c2_e980]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1133_c2_e980_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1133_c2_e980_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1133_c2_e980_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1133_c2_e980_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1133_c2_e980]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1133_c2_e980_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1133_c2_e980_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1133_c2_e980_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1133_c2_e980_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1133_c2_e980]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1133_c2_e980_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1133_c2_e980_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1133_c2_e980_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1133_c2_e980_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l1134_c3_d8e1[uxn_opcodes_h_l1134_c3_d8e1]
signal printf_uxn_opcodes_h_l1134_c3_d8e1_uxn_opcodes_h_l1134_c3_d8e1_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1139_c11_f5fa]
signal BIN_OP_EQ_uxn_opcodes_h_l1139_c11_f5fa_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1139_c11_f5fa_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1139_c11_f5fa_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1139_c7_1b42]
signal t8_MUX_uxn_opcodes_h_l1139_c7_1b42_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1139_c7_1b42_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1139_c7_1b42_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1139_c7_1b42_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l1139_c7_1b42]
signal n8_MUX_uxn_opcodes_h_l1139_c7_1b42_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1139_c7_1b42_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1139_c7_1b42_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1139_c7_1b42_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1139_c7_1b42]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1139_c7_1b42_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1139_c7_1b42_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1139_c7_1b42_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1139_c7_1b42_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1139_c7_1b42]
signal result_stack_value_MUX_uxn_opcodes_h_l1139_c7_1b42_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1139_c7_1b42_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1139_c7_1b42_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1139_c7_1b42_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1139_c7_1b42]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1139_c7_1b42_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1139_c7_1b42_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1139_c7_1b42_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1139_c7_1b42_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1139_c7_1b42]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1139_c7_1b42_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1139_c7_1b42_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1139_c7_1b42_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1139_c7_1b42_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1139_c7_1b42]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1139_c7_1b42_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1139_c7_1b42_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1139_c7_1b42_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1139_c7_1b42_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1139_c7_1b42]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1139_c7_1b42_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1139_c7_1b42_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1139_c7_1b42_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1139_c7_1b42_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1139_c7_1b42]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1139_c7_1b42_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1139_c7_1b42_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1139_c7_1b42_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1139_c7_1b42_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1142_c11_eeee]
signal BIN_OP_EQ_uxn_opcodes_h_l1142_c11_eeee_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1142_c11_eeee_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1142_c11_eeee_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1142_c7_bc5f]
signal t8_MUX_uxn_opcodes_h_l1142_c7_bc5f_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1142_c7_bc5f_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1142_c7_bc5f_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1142_c7_bc5f_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l1142_c7_bc5f]
signal n8_MUX_uxn_opcodes_h_l1142_c7_bc5f_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1142_c7_bc5f_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1142_c7_bc5f_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1142_c7_bc5f_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1142_c7_bc5f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1142_c7_bc5f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1142_c7_bc5f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1142_c7_bc5f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1142_c7_bc5f_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1142_c7_bc5f]
signal result_stack_value_MUX_uxn_opcodes_h_l1142_c7_bc5f_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1142_c7_bc5f_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1142_c7_bc5f_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1142_c7_bc5f_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1142_c7_bc5f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1142_c7_bc5f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1142_c7_bc5f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1142_c7_bc5f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1142_c7_bc5f_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1142_c7_bc5f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1142_c7_bc5f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1142_c7_bc5f_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1142_c7_bc5f_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1142_c7_bc5f_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1142_c7_bc5f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1142_c7_bc5f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1142_c7_bc5f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1142_c7_bc5f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1142_c7_bc5f_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1142_c7_bc5f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1142_c7_bc5f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1142_c7_bc5f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1142_c7_bc5f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1142_c7_bc5f_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1142_c7_bc5f]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1142_c7_bc5f_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1142_c7_bc5f_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1142_c7_bc5f_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1142_c7_bc5f_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1146_c11_b09a]
signal BIN_OP_EQ_uxn_opcodes_h_l1146_c11_b09a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1146_c11_b09a_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1146_c11_b09a_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1146_c7_ce02]
signal n8_MUX_uxn_opcodes_h_l1146_c7_ce02_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1146_c7_ce02_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1146_c7_ce02_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1146_c7_ce02_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1146_c7_ce02]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c7_ce02_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c7_ce02_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c7_ce02_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c7_ce02_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1146_c7_ce02]
signal result_stack_value_MUX_uxn_opcodes_h_l1146_c7_ce02_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1146_c7_ce02_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1146_c7_ce02_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1146_c7_ce02_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1146_c7_ce02]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1146_c7_ce02_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1146_c7_ce02_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1146_c7_ce02_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1146_c7_ce02_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1146_c7_ce02]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c7_ce02_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c7_ce02_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c7_ce02_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c7_ce02_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1146_c7_ce02]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c7_ce02_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c7_ce02_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c7_ce02_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c7_ce02_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1146_c7_ce02]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1146_c7_ce02_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1146_c7_ce02_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1146_c7_ce02_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1146_c7_ce02_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1146_c7_ce02]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1146_c7_ce02_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1146_c7_ce02_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1146_c7_ce02_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1146_c7_ce02_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1149_c11_e5d7]
signal BIN_OP_EQ_uxn_opcodes_h_l1149_c11_e5d7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1149_c11_e5d7_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1149_c11_e5d7_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1149_c7_cf40]
signal n8_MUX_uxn_opcodes_h_l1149_c7_cf40_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1149_c7_cf40_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1149_c7_cf40_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1149_c7_cf40_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1149_c7_cf40]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1149_c7_cf40_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1149_c7_cf40_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1149_c7_cf40_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1149_c7_cf40_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1149_c7_cf40]
signal result_stack_value_MUX_uxn_opcodes_h_l1149_c7_cf40_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1149_c7_cf40_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1149_c7_cf40_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1149_c7_cf40_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1149_c7_cf40]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1149_c7_cf40_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1149_c7_cf40_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1149_c7_cf40_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1149_c7_cf40_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1149_c7_cf40]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_cf40_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_cf40_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_cf40_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_cf40_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1149_c7_cf40]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_cf40_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_cf40_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_cf40_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_cf40_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1149_c7_cf40]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_cf40_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_cf40_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_cf40_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_cf40_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1149_c7_cf40]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1149_c7_cf40_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1149_c7_cf40_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1149_c7_cf40_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1149_c7_cf40_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1153_c32_45cc]
signal BIN_OP_AND_uxn_opcodes_h_l1153_c32_45cc_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1153_c32_45cc_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1153_c32_45cc_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1153_c32_5600]
signal BIN_OP_GT_uxn_opcodes_h_l1153_c32_5600_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1153_c32_5600_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1153_c32_5600_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1153_c32_c11a]
signal MUX_uxn_opcodes_h_l1153_c32_c11a_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1153_c32_c11a_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1153_c32_c11a_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1153_c32_c11a_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1155_c11_8f70]
signal BIN_OP_EQ_uxn_opcodes_h_l1155_c11_8f70_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1155_c11_8f70_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1155_c11_8f70_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1155_c7_791d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1155_c7_791d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1155_c7_791d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1155_c7_791d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1155_c7_791d_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1155_c7_791d]
signal result_stack_value_MUX_uxn_opcodes_h_l1155_c7_791d_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1155_c7_791d_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1155_c7_791d_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1155_c7_791d_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1155_c7_791d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1155_c7_791d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1155_c7_791d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1155_c7_791d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1155_c7_791d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1155_c7_791d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1155_c7_791d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1155_c7_791d_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1155_c7_791d_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1155_c7_791d_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1155_c7_791d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1155_c7_791d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1155_c7_791d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1155_c7_791d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1155_c7_791d_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1159_c24_e810]
signal BIN_OP_OR_uxn_opcodes_h_l1159_c24_e810_left : unsigned(7 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1159_c24_e810_right : unsigned(7 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1159_c24_e810_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1161_c11_9e98]
signal BIN_OP_EQ_uxn_opcodes_h_l1161_c11_9e98_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1161_c11_9e98_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1161_c11_9e98_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1161_c7_1bd5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_1bd5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_1bd5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_1bd5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_1bd5_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1161_c7_1bd5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_1bd5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_1bd5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_1bd5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_1bd5_return_output : unsigned(0 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_287e( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : signed;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_sp_shift := ref_toks_1;
      base.stack_value := ref_toks_2;
      base.is_stack_write := ref_toks_3;
      base.sp_relative_shift := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.is_opc_done := ref_toks_6;
      base.is_stack_read := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1133_c6_2c95
BIN_OP_EQ_uxn_opcodes_h_l1133_c6_2c95 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1133_c6_2c95_left,
BIN_OP_EQ_uxn_opcodes_h_l1133_c6_2c95_right,
BIN_OP_EQ_uxn_opcodes_h_l1133_c6_2c95_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1133_c1_f6cb
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1133_c1_f6cb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1133_c1_f6cb_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1133_c1_f6cb_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1133_c1_f6cb_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1133_c1_f6cb_return_output);

-- t8_MUX_uxn_opcodes_h_l1133_c2_e980
t8_MUX_uxn_opcodes_h_l1133_c2_e980 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1133_c2_e980_cond,
t8_MUX_uxn_opcodes_h_l1133_c2_e980_iftrue,
t8_MUX_uxn_opcodes_h_l1133_c2_e980_iffalse,
t8_MUX_uxn_opcodes_h_l1133_c2_e980_return_output);

-- n8_MUX_uxn_opcodes_h_l1133_c2_e980
n8_MUX_uxn_opcodes_h_l1133_c2_e980 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1133_c2_e980_cond,
n8_MUX_uxn_opcodes_h_l1133_c2_e980_iftrue,
n8_MUX_uxn_opcodes_h_l1133_c2_e980_iffalse,
n8_MUX_uxn_opcodes_h_l1133_c2_e980_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1133_c2_e980
result_is_sp_shift_MUX_uxn_opcodes_h_l1133_c2_e980 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1133_c2_e980_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1133_c2_e980_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1133_c2_e980_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1133_c2_e980_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1133_c2_e980
result_stack_value_MUX_uxn_opcodes_h_l1133_c2_e980 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1133_c2_e980_cond,
result_stack_value_MUX_uxn_opcodes_h_l1133_c2_e980_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1133_c2_e980_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1133_c2_e980_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1133_c2_e980
result_is_stack_write_MUX_uxn_opcodes_h_l1133_c2_e980 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1133_c2_e980_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1133_c2_e980_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1133_c2_e980_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1133_c2_e980_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1133_c2_e980
result_sp_relative_shift_MUX_uxn_opcodes_h_l1133_c2_e980 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1133_c2_e980_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1133_c2_e980_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1133_c2_e980_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1133_c2_e980_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1133_c2_e980
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1133_c2_e980 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1133_c2_e980_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1133_c2_e980_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1133_c2_e980_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1133_c2_e980_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1133_c2_e980
result_is_opc_done_MUX_uxn_opcodes_h_l1133_c2_e980 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1133_c2_e980_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1133_c2_e980_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1133_c2_e980_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1133_c2_e980_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1133_c2_e980
result_is_stack_read_MUX_uxn_opcodes_h_l1133_c2_e980 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1133_c2_e980_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1133_c2_e980_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1133_c2_e980_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1133_c2_e980_return_output);

-- printf_uxn_opcodes_h_l1134_c3_d8e1_uxn_opcodes_h_l1134_c3_d8e1
printf_uxn_opcodes_h_l1134_c3_d8e1_uxn_opcodes_h_l1134_c3_d8e1 : entity work.printf_uxn_opcodes_h_l1134_c3_d8e1_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1134_c3_d8e1_uxn_opcodes_h_l1134_c3_d8e1_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1139_c11_f5fa
BIN_OP_EQ_uxn_opcodes_h_l1139_c11_f5fa : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1139_c11_f5fa_left,
BIN_OP_EQ_uxn_opcodes_h_l1139_c11_f5fa_right,
BIN_OP_EQ_uxn_opcodes_h_l1139_c11_f5fa_return_output);

-- t8_MUX_uxn_opcodes_h_l1139_c7_1b42
t8_MUX_uxn_opcodes_h_l1139_c7_1b42 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1139_c7_1b42_cond,
t8_MUX_uxn_opcodes_h_l1139_c7_1b42_iftrue,
t8_MUX_uxn_opcodes_h_l1139_c7_1b42_iffalse,
t8_MUX_uxn_opcodes_h_l1139_c7_1b42_return_output);

-- n8_MUX_uxn_opcodes_h_l1139_c7_1b42
n8_MUX_uxn_opcodes_h_l1139_c7_1b42 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1139_c7_1b42_cond,
n8_MUX_uxn_opcodes_h_l1139_c7_1b42_iftrue,
n8_MUX_uxn_opcodes_h_l1139_c7_1b42_iffalse,
n8_MUX_uxn_opcodes_h_l1139_c7_1b42_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1139_c7_1b42
result_is_sp_shift_MUX_uxn_opcodes_h_l1139_c7_1b42 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1139_c7_1b42_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1139_c7_1b42_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1139_c7_1b42_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1139_c7_1b42_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1139_c7_1b42
result_stack_value_MUX_uxn_opcodes_h_l1139_c7_1b42 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1139_c7_1b42_cond,
result_stack_value_MUX_uxn_opcodes_h_l1139_c7_1b42_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1139_c7_1b42_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1139_c7_1b42_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1139_c7_1b42
result_is_stack_write_MUX_uxn_opcodes_h_l1139_c7_1b42 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1139_c7_1b42_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1139_c7_1b42_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1139_c7_1b42_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1139_c7_1b42_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1139_c7_1b42
result_sp_relative_shift_MUX_uxn_opcodes_h_l1139_c7_1b42 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1139_c7_1b42_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1139_c7_1b42_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1139_c7_1b42_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1139_c7_1b42_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1139_c7_1b42
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1139_c7_1b42 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1139_c7_1b42_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1139_c7_1b42_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1139_c7_1b42_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1139_c7_1b42_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1139_c7_1b42
result_is_opc_done_MUX_uxn_opcodes_h_l1139_c7_1b42 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1139_c7_1b42_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1139_c7_1b42_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1139_c7_1b42_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1139_c7_1b42_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1139_c7_1b42
result_is_stack_read_MUX_uxn_opcodes_h_l1139_c7_1b42 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1139_c7_1b42_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1139_c7_1b42_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1139_c7_1b42_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1139_c7_1b42_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1142_c11_eeee
BIN_OP_EQ_uxn_opcodes_h_l1142_c11_eeee : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1142_c11_eeee_left,
BIN_OP_EQ_uxn_opcodes_h_l1142_c11_eeee_right,
BIN_OP_EQ_uxn_opcodes_h_l1142_c11_eeee_return_output);

-- t8_MUX_uxn_opcodes_h_l1142_c7_bc5f
t8_MUX_uxn_opcodes_h_l1142_c7_bc5f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1142_c7_bc5f_cond,
t8_MUX_uxn_opcodes_h_l1142_c7_bc5f_iftrue,
t8_MUX_uxn_opcodes_h_l1142_c7_bc5f_iffalse,
t8_MUX_uxn_opcodes_h_l1142_c7_bc5f_return_output);

-- n8_MUX_uxn_opcodes_h_l1142_c7_bc5f
n8_MUX_uxn_opcodes_h_l1142_c7_bc5f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1142_c7_bc5f_cond,
n8_MUX_uxn_opcodes_h_l1142_c7_bc5f_iftrue,
n8_MUX_uxn_opcodes_h_l1142_c7_bc5f_iffalse,
n8_MUX_uxn_opcodes_h_l1142_c7_bc5f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1142_c7_bc5f
result_is_sp_shift_MUX_uxn_opcodes_h_l1142_c7_bc5f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1142_c7_bc5f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1142_c7_bc5f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1142_c7_bc5f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1142_c7_bc5f_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1142_c7_bc5f
result_stack_value_MUX_uxn_opcodes_h_l1142_c7_bc5f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1142_c7_bc5f_cond,
result_stack_value_MUX_uxn_opcodes_h_l1142_c7_bc5f_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1142_c7_bc5f_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1142_c7_bc5f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1142_c7_bc5f
result_is_stack_write_MUX_uxn_opcodes_h_l1142_c7_bc5f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1142_c7_bc5f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1142_c7_bc5f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1142_c7_bc5f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1142_c7_bc5f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1142_c7_bc5f
result_sp_relative_shift_MUX_uxn_opcodes_h_l1142_c7_bc5f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1142_c7_bc5f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1142_c7_bc5f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1142_c7_bc5f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1142_c7_bc5f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1142_c7_bc5f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1142_c7_bc5f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1142_c7_bc5f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1142_c7_bc5f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1142_c7_bc5f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1142_c7_bc5f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1142_c7_bc5f
result_is_opc_done_MUX_uxn_opcodes_h_l1142_c7_bc5f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1142_c7_bc5f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1142_c7_bc5f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1142_c7_bc5f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1142_c7_bc5f_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1142_c7_bc5f
result_is_stack_read_MUX_uxn_opcodes_h_l1142_c7_bc5f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1142_c7_bc5f_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1142_c7_bc5f_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1142_c7_bc5f_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1142_c7_bc5f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1146_c11_b09a
BIN_OP_EQ_uxn_opcodes_h_l1146_c11_b09a : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1146_c11_b09a_left,
BIN_OP_EQ_uxn_opcodes_h_l1146_c11_b09a_right,
BIN_OP_EQ_uxn_opcodes_h_l1146_c11_b09a_return_output);

-- n8_MUX_uxn_opcodes_h_l1146_c7_ce02
n8_MUX_uxn_opcodes_h_l1146_c7_ce02 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1146_c7_ce02_cond,
n8_MUX_uxn_opcodes_h_l1146_c7_ce02_iftrue,
n8_MUX_uxn_opcodes_h_l1146_c7_ce02_iffalse,
n8_MUX_uxn_opcodes_h_l1146_c7_ce02_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c7_ce02
result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c7_ce02 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c7_ce02_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c7_ce02_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c7_ce02_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c7_ce02_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1146_c7_ce02
result_stack_value_MUX_uxn_opcodes_h_l1146_c7_ce02 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1146_c7_ce02_cond,
result_stack_value_MUX_uxn_opcodes_h_l1146_c7_ce02_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1146_c7_ce02_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1146_c7_ce02_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1146_c7_ce02
result_is_stack_write_MUX_uxn_opcodes_h_l1146_c7_ce02 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1146_c7_ce02_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1146_c7_ce02_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1146_c7_ce02_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1146_c7_ce02_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c7_ce02
result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c7_ce02 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c7_ce02_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c7_ce02_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c7_ce02_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c7_ce02_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c7_ce02
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c7_ce02 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c7_ce02_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c7_ce02_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c7_ce02_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c7_ce02_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1146_c7_ce02
result_is_opc_done_MUX_uxn_opcodes_h_l1146_c7_ce02 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1146_c7_ce02_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1146_c7_ce02_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1146_c7_ce02_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1146_c7_ce02_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1146_c7_ce02
result_is_stack_read_MUX_uxn_opcodes_h_l1146_c7_ce02 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1146_c7_ce02_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1146_c7_ce02_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1146_c7_ce02_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1146_c7_ce02_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1149_c11_e5d7
BIN_OP_EQ_uxn_opcodes_h_l1149_c11_e5d7 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1149_c11_e5d7_left,
BIN_OP_EQ_uxn_opcodes_h_l1149_c11_e5d7_right,
BIN_OP_EQ_uxn_opcodes_h_l1149_c11_e5d7_return_output);

-- n8_MUX_uxn_opcodes_h_l1149_c7_cf40
n8_MUX_uxn_opcodes_h_l1149_c7_cf40 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1149_c7_cf40_cond,
n8_MUX_uxn_opcodes_h_l1149_c7_cf40_iftrue,
n8_MUX_uxn_opcodes_h_l1149_c7_cf40_iffalse,
n8_MUX_uxn_opcodes_h_l1149_c7_cf40_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1149_c7_cf40
result_is_sp_shift_MUX_uxn_opcodes_h_l1149_c7_cf40 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1149_c7_cf40_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1149_c7_cf40_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1149_c7_cf40_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1149_c7_cf40_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1149_c7_cf40
result_stack_value_MUX_uxn_opcodes_h_l1149_c7_cf40 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1149_c7_cf40_cond,
result_stack_value_MUX_uxn_opcodes_h_l1149_c7_cf40_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1149_c7_cf40_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1149_c7_cf40_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1149_c7_cf40
result_is_stack_write_MUX_uxn_opcodes_h_l1149_c7_cf40 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1149_c7_cf40_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1149_c7_cf40_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1149_c7_cf40_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1149_c7_cf40_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_cf40
result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_cf40 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_cf40_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_cf40_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_cf40_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_cf40_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_cf40
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_cf40 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_cf40_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_cf40_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_cf40_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_cf40_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_cf40
result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_cf40 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_cf40_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_cf40_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_cf40_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_cf40_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1149_c7_cf40
result_is_stack_read_MUX_uxn_opcodes_h_l1149_c7_cf40 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1149_c7_cf40_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1149_c7_cf40_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1149_c7_cf40_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1149_c7_cf40_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1153_c32_45cc
BIN_OP_AND_uxn_opcodes_h_l1153_c32_45cc : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1153_c32_45cc_left,
BIN_OP_AND_uxn_opcodes_h_l1153_c32_45cc_right,
BIN_OP_AND_uxn_opcodes_h_l1153_c32_45cc_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1153_c32_5600
BIN_OP_GT_uxn_opcodes_h_l1153_c32_5600 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1153_c32_5600_left,
BIN_OP_GT_uxn_opcodes_h_l1153_c32_5600_right,
BIN_OP_GT_uxn_opcodes_h_l1153_c32_5600_return_output);

-- MUX_uxn_opcodes_h_l1153_c32_c11a
MUX_uxn_opcodes_h_l1153_c32_c11a : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1153_c32_c11a_cond,
MUX_uxn_opcodes_h_l1153_c32_c11a_iftrue,
MUX_uxn_opcodes_h_l1153_c32_c11a_iffalse,
MUX_uxn_opcodes_h_l1153_c32_c11a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1155_c11_8f70
BIN_OP_EQ_uxn_opcodes_h_l1155_c11_8f70 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1155_c11_8f70_left,
BIN_OP_EQ_uxn_opcodes_h_l1155_c11_8f70_right,
BIN_OP_EQ_uxn_opcodes_h_l1155_c11_8f70_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1155_c7_791d
result_is_sp_shift_MUX_uxn_opcodes_h_l1155_c7_791d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1155_c7_791d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1155_c7_791d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1155_c7_791d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1155_c7_791d_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1155_c7_791d
result_stack_value_MUX_uxn_opcodes_h_l1155_c7_791d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1155_c7_791d_cond,
result_stack_value_MUX_uxn_opcodes_h_l1155_c7_791d_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1155_c7_791d_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1155_c7_791d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1155_c7_791d
result_is_stack_write_MUX_uxn_opcodes_h_l1155_c7_791d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1155_c7_791d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1155_c7_791d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1155_c7_791d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1155_c7_791d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1155_c7_791d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1155_c7_791d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1155_c7_791d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1155_c7_791d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1155_c7_791d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1155_c7_791d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1155_c7_791d
result_is_opc_done_MUX_uxn_opcodes_h_l1155_c7_791d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1155_c7_791d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1155_c7_791d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1155_c7_791d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1155_c7_791d_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1159_c24_e810
BIN_OP_OR_uxn_opcodes_h_l1159_c24_e810 : entity work.BIN_OP_OR_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1159_c24_e810_left,
BIN_OP_OR_uxn_opcodes_h_l1159_c24_e810_right,
BIN_OP_OR_uxn_opcodes_h_l1159_c24_e810_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1161_c11_9e98
BIN_OP_EQ_uxn_opcodes_h_l1161_c11_9e98 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1161_c11_9e98_left,
BIN_OP_EQ_uxn_opcodes_h_l1161_c11_9e98_right,
BIN_OP_EQ_uxn_opcodes_h_l1161_c11_9e98_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_1bd5
result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_1bd5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_1bd5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_1bd5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_1bd5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_1bd5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_1bd5
result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_1bd5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_1bd5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_1bd5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_1bd5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_1bd5_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1133_c6_2c95_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1133_c1_f6cb_return_output,
 t8_MUX_uxn_opcodes_h_l1133_c2_e980_return_output,
 n8_MUX_uxn_opcodes_h_l1133_c2_e980_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1133_c2_e980_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1133_c2_e980_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1133_c2_e980_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1133_c2_e980_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1133_c2_e980_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1133_c2_e980_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1133_c2_e980_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1139_c11_f5fa_return_output,
 t8_MUX_uxn_opcodes_h_l1139_c7_1b42_return_output,
 n8_MUX_uxn_opcodes_h_l1139_c7_1b42_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1139_c7_1b42_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1139_c7_1b42_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1139_c7_1b42_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1139_c7_1b42_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1139_c7_1b42_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1139_c7_1b42_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1139_c7_1b42_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1142_c11_eeee_return_output,
 t8_MUX_uxn_opcodes_h_l1142_c7_bc5f_return_output,
 n8_MUX_uxn_opcodes_h_l1142_c7_bc5f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1142_c7_bc5f_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1142_c7_bc5f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1142_c7_bc5f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1142_c7_bc5f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1142_c7_bc5f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1142_c7_bc5f_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1142_c7_bc5f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1146_c11_b09a_return_output,
 n8_MUX_uxn_opcodes_h_l1146_c7_ce02_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c7_ce02_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1146_c7_ce02_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1146_c7_ce02_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c7_ce02_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c7_ce02_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1146_c7_ce02_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1146_c7_ce02_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1149_c11_e5d7_return_output,
 n8_MUX_uxn_opcodes_h_l1149_c7_cf40_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1149_c7_cf40_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1149_c7_cf40_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1149_c7_cf40_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_cf40_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_cf40_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_cf40_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1149_c7_cf40_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1153_c32_45cc_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1153_c32_5600_return_output,
 MUX_uxn_opcodes_h_l1153_c32_c11a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1155_c11_8f70_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1155_c7_791d_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1155_c7_791d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1155_c7_791d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1155_c7_791d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1155_c7_791d_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1159_c24_e810_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1161_c11_9e98_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_1bd5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_1bd5_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1133_c6_2c95_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1133_c6_2c95_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1133_c6_2c95_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1133_c1_f6cb_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1133_c1_f6cb_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1133_c1_f6cb_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1133_c1_f6cb_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1133_c2_e980_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1133_c2_e980_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1139_c7_1b42_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1133_c2_e980_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1133_c2_e980_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1133_c2_e980_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1133_c2_e980_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1139_c7_1b42_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1133_c2_e980_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1133_c2_e980_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1133_c2_e980_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1133_c2_e980_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1139_c7_1b42_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1133_c2_e980_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1133_c2_e980_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1133_c2_e980_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1133_c2_e980_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1139_c7_1b42_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1133_c2_e980_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1133_c2_e980_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1133_c2_e980_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1133_c2_e980_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1139_c7_1b42_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1133_c2_e980_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1133_c2_e980_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1133_c2_e980_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1133_c2_e980_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1139_c7_1b42_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1133_c2_e980_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1133_c2_e980_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1133_c2_e980_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1136_c3_0d18 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1133_c2_e980_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1139_c7_1b42_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1133_c2_e980_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1133_c2_e980_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1133_c2_e980_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1133_c2_e980_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1139_c7_1b42_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1133_c2_e980_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1133_c2_e980_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1133_c2_e980_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1133_c2_e980_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1139_c7_1b42_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1133_c2_e980_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1133_c2_e980_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1134_c3_d8e1_uxn_opcodes_h_l1134_c3_d8e1_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1139_c11_f5fa_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1139_c11_f5fa_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1139_c11_f5fa_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1139_c7_1b42_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1139_c7_1b42_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1142_c7_bc5f_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1139_c7_1b42_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1139_c7_1b42_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1139_c7_1b42_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1142_c7_bc5f_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1139_c7_1b42_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1139_c7_1b42_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1139_c7_1b42_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1142_c7_bc5f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1139_c7_1b42_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1139_c7_1b42_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1139_c7_1b42_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1142_c7_bc5f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1139_c7_1b42_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1139_c7_1b42_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1139_c7_1b42_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1142_c7_bc5f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1139_c7_1b42_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1139_c7_1b42_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1139_c7_1b42_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1142_c7_bc5f_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1139_c7_1b42_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1139_c7_1b42_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1140_c3_ab33 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1139_c7_1b42_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1142_c7_bc5f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1139_c7_1b42_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1139_c7_1b42_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1139_c7_1b42_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1142_c7_bc5f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1139_c7_1b42_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1139_c7_1b42_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1139_c7_1b42_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1142_c7_bc5f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1139_c7_1b42_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1142_c11_eeee_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1142_c11_eeee_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1142_c11_eeee_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1142_c7_bc5f_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1142_c7_bc5f_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1142_c7_bc5f_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1142_c7_bc5f_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1142_c7_bc5f_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1146_c7_ce02_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1142_c7_bc5f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1142_c7_bc5f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1142_c7_bc5f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c7_ce02_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1142_c7_bc5f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1142_c7_bc5f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1142_c7_bc5f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1146_c7_ce02_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1142_c7_bc5f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1142_c7_bc5f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1142_c7_bc5f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1146_c7_ce02_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1142_c7_bc5f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1142_c7_bc5f_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1142_c7_bc5f_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c7_ce02_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1142_c7_bc5f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1142_c7_bc5f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1144_c3_eeea : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1142_c7_bc5f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c7_ce02_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1142_c7_bc5f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1142_c7_bc5f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1142_c7_bc5f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1146_c7_ce02_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1142_c7_bc5f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1142_c7_bc5f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1142_c7_bc5f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1146_c7_ce02_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1142_c7_bc5f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1146_c11_b09a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1146_c11_b09a_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1146_c11_b09a_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1146_c7_ce02_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1146_c7_ce02_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1149_c7_cf40_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1146_c7_ce02_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c7_ce02_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c7_ce02_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1149_c7_cf40_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c7_ce02_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1146_c7_ce02_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1146_c7_ce02_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1149_c7_cf40_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1146_c7_ce02_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1146_c7_ce02_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1146_c7_ce02_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1149_c7_cf40_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1146_c7_ce02_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c7_ce02_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c7_ce02_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_cf40_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c7_ce02_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c7_ce02_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1147_c3_1fa0 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c7_ce02_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_cf40_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c7_ce02_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1146_c7_ce02_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1146_c7_ce02_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_cf40_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1146_c7_ce02_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1146_c7_ce02_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1146_c7_ce02_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1149_c7_cf40_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1146_c7_ce02_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1149_c11_e5d7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1149_c11_e5d7_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1149_c11_e5d7_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1149_c7_cf40_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1149_c7_cf40_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1149_c7_cf40_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1149_c7_cf40_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1149_c7_cf40_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1155_c7_791d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1149_c7_cf40_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1149_c7_cf40_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1149_c7_cf40_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1155_c7_791d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1149_c7_cf40_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1149_c7_cf40_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1149_c7_cf40_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1155_c7_791d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1149_c7_cf40_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_cf40_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_cf40_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_cf40_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_cf40_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_cf40_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1155_c7_791d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_cf40_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_cf40_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_cf40_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1155_c7_791d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_cf40_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1149_c7_cf40_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1149_c7_cf40_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1149_c7_cf40_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1153_c32_c11a_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1153_c32_c11a_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1153_c32_c11a_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1153_c32_45cc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1153_c32_45cc_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1153_c32_45cc_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1153_c32_5600_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1153_c32_5600_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1153_c32_5600_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1153_c32_c11a_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1155_c11_8f70_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1155_c11_8f70_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1155_c11_8f70_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1155_c7_791d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1155_c7_791d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1155_c7_791d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1155_c7_791d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1155_c7_791d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1155_c7_791d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1155_c7_791d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1155_c7_791d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_1bd5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1155_c7_791d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1155_c7_791d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1158_c3_8a8a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1155_c7_791d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1155_c7_791d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1155_c7_791d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1155_c7_791d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_1bd5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1155_c7_791d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1159_c24_e810_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1159_c24_e810_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1159_c24_e810_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1161_c11_9e98_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1161_c11_9e98_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1161_c11_9e98_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_1bd5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_1bd5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_1bd5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_1bd5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_1bd5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_1bd5_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1139_l1133_l1155_l1146_l1142_DUPLICATE_866c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1139_l1133_l1155_l1149_l1146_l1142_DUPLICATE_f58d_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1139_l1133_l1161_l1149_l1146_l1142_DUPLICATE_392b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1139_l1133_l1149_l1146_l1142_DUPLICATE_6706_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1139_l1161_l1155_l1149_l1146_l1142_DUPLICATE_cf03_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1139_l1149_l1142_l1146_DUPLICATE_19b7_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1149_l1155_DUPLICATE_4ade_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_287e_uxn_opcodes_h_l1129_l1166_DUPLICATE_527b_return_output : opcode_result_t;
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
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1133_c2_e980_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1155_c7_791d_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1139_c11_f5fa_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1136_c3_0d18 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1133_c2_e980_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1136_c3_0d18;
     VAR_MUX_uxn_opcodes_h_l1153_c32_c11a_iffalse := resize(to_signed(-1, 2), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1142_c11_eeee_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1133_c6_2c95_right := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1153_c32_c11a_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1155_c11_8f70_right := to_unsigned(5, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1155_c7_791d_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l1153_c32_5600_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1147_c3_1fa0 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c7_ce02_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1147_c3_1fa0;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1133_c1_f6cb_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1146_c11_b09a_right := to_unsigned(3, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_1bd5_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1140_c3_ab33 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1139_c7_1b42_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1140_c3_ab33;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1149_c7_cf40_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_1bd5_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1158_c3_8a8a := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1155_c7_791d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1158_c3_8a8a;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1149_c7_cf40_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1144_c3_eeea := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1142_c7_bc5f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1144_c3_eeea;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1133_c2_e980_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1149_c11_e5d7_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1161_c11_9e98_right := to_unsigned(6, 3);
     VAR_BIN_OP_AND_uxn_opcodes_h_l1153_c32_45cc_right := to_unsigned(128, 8);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1133_c1_f6cb_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1153_c32_45cc_left := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1159_c24_e810_left := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1133_c2_e980_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1139_c7_1b42_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1142_c7_bc5f_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1146_c7_ce02_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1149_c7_cf40_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1133_c6_2c95_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1139_c11_f5fa_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1142_c11_eeee_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1146_c11_b09a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1149_c11_e5d7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1155_c11_8f70_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1161_c11_9e98_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l1149_c7_cf40_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1142_c7_bc5f_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1159_c24_e810_right := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1133_c2_e980_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1139_c7_1b42_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1142_c7_bc5f_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l1155_c11_8f70] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1155_c11_8f70_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1155_c11_8f70_left;
     BIN_OP_EQ_uxn_opcodes_h_l1155_c11_8f70_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1155_c11_8f70_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1155_c11_8f70_return_output := BIN_OP_EQ_uxn_opcodes_h_l1155_c11_8f70_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1139_l1133_l1155_l1146_l1142_DUPLICATE_866c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1139_l1133_l1155_l1146_l1142_DUPLICATE_866c_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1146_c11_b09a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1146_c11_b09a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1146_c11_b09a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1146_c11_b09a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1146_c11_b09a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1146_c11_b09a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1146_c11_b09a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1133_c6_2c95] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1133_c6_2c95_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1133_c6_2c95_left;
     BIN_OP_EQ_uxn_opcodes_h_l1133_c6_2c95_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1133_c6_2c95_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1133_c6_2c95_return_output := BIN_OP_EQ_uxn_opcodes_h_l1133_c6_2c95_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1159_c24_e810] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1159_c24_e810_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1159_c24_e810_left;
     BIN_OP_OR_uxn_opcodes_h_l1159_c24_e810_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1159_c24_e810_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1159_c24_e810_return_output := BIN_OP_OR_uxn_opcodes_h_l1159_c24_e810_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1149_c11_e5d7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1149_c11_e5d7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1149_c11_e5d7_left;
     BIN_OP_EQ_uxn_opcodes_h_l1149_c11_e5d7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1149_c11_e5d7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1149_c11_e5d7_return_output := BIN_OP_EQ_uxn_opcodes_h_l1149_c11_e5d7_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1139_l1133_l1161_l1149_l1146_l1142_DUPLICATE_392b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1139_l1133_l1161_l1149_l1146_l1142_DUPLICATE_392b_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1139_l1133_l1155_l1149_l1146_l1142_DUPLICATE_f58d LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1139_l1133_l1155_l1149_l1146_l1142_DUPLICATE_f58d_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1142_c11_eeee] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1142_c11_eeee_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1142_c11_eeee_left;
     BIN_OP_EQ_uxn_opcodes_h_l1142_c11_eeee_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1142_c11_eeee_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1142_c11_eeee_return_output := BIN_OP_EQ_uxn_opcodes_h_l1142_c11_eeee_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1161_c11_9e98] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1161_c11_9e98_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1161_c11_9e98_left;
     BIN_OP_EQ_uxn_opcodes_h_l1161_c11_9e98_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1161_c11_9e98_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1161_c11_9e98_return_output := BIN_OP_EQ_uxn_opcodes_h_l1161_c11_9e98_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1149_l1155_DUPLICATE_4ade LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1149_l1155_DUPLICATE_4ade_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1139_l1161_l1155_l1149_l1146_l1142_DUPLICATE_cf03 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1139_l1161_l1155_l1149_l1146_l1142_DUPLICATE_cf03_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1139_l1149_l1142_l1146_DUPLICATE_19b7 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1139_l1149_l1142_l1146_DUPLICATE_19b7_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l1139_c11_f5fa] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1139_c11_f5fa_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1139_c11_f5fa_left;
     BIN_OP_EQ_uxn_opcodes_h_l1139_c11_f5fa_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1139_c11_f5fa_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1139_c11_f5fa_return_output := BIN_OP_EQ_uxn_opcodes_h_l1139_c11_f5fa_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1139_l1133_l1149_l1146_l1142_DUPLICATE_6706 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1139_l1133_l1149_l1146_l1142_DUPLICATE_6706_return_output := result.sp_relative_shift;

     -- BIN_OP_AND[uxn_opcodes_h_l1153_c32_45cc] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1153_c32_45cc_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1153_c32_45cc_left;
     BIN_OP_AND_uxn_opcodes_h_l1153_c32_45cc_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1153_c32_45cc_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1153_c32_45cc_return_output := BIN_OP_AND_uxn_opcodes_h_l1153_c32_45cc_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1153_c32_5600_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1153_c32_45cc_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1133_c1_f6cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1133_c6_2c95_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1133_c2_e980_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1133_c6_2c95_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1133_c2_e980_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1133_c6_2c95_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1133_c2_e980_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1133_c6_2c95_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1133_c2_e980_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1133_c6_2c95_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1133_c2_e980_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1133_c6_2c95_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1133_c2_e980_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1133_c6_2c95_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1133_c2_e980_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1133_c6_2c95_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1133_c2_e980_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1133_c6_2c95_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1133_c2_e980_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1133_c6_2c95_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1139_c7_1b42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1139_c11_f5fa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1139_c7_1b42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1139_c11_f5fa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1139_c7_1b42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1139_c11_f5fa_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1139_c7_1b42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1139_c11_f5fa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1139_c7_1b42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1139_c11_f5fa_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1139_c7_1b42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1139_c11_f5fa_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1139_c7_1b42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1139_c11_f5fa_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1139_c7_1b42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1139_c11_f5fa_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1139_c7_1b42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1139_c11_f5fa_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1142_c7_bc5f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1142_c11_eeee_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1142_c7_bc5f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1142_c11_eeee_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1142_c7_bc5f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1142_c11_eeee_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1142_c7_bc5f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1142_c11_eeee_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1142_c7_bc5f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1142_c11_eeee_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1142_c7_bc5f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1142_c11_eeee_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1142_c7_bc5f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1142_c11_eeee_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1142_c7_bc5f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1142_c11_eeee_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1142_c7_bc5f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1142_c11_eeee_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1146_c7_ce02_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1146_c11_b09a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1146_c7_ce02_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1146_c11_b09a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c7_ce02_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1146_c11_b09a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1146_c7_ce02_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1146_c11_b09a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1146_c7_ce02_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1146_c11_b09a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c7_ce02_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1146_c11_b09a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c7_ce02_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1146_c11_b09a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1146_c7_ce02_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1146_c11_b09a_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1149_c7_cf40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1149_c11_e5d7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_cf40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1149_c11_e5d7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1149_c7_cf40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1149_c11_e5d7_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1149_c7_cf40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1149_c11_e5d7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1149_c7_cf40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1149_c11_e5d7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_cf40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1149_c11_e5d7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_cf40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1149_c11_e5d7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1149_c7_cf40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1149_c11_e5d7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1155_c7_791d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1155_c11_8f70_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1155_c7_791d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1155_c11_8f70_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1155_c7_791d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1155_c11_8f70_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1155_c7_791d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1155_c11_8f70_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1155_c7_791d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1155_c11_8f70_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_1bd5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1161_c11_9e98_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_1bd5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1161_c11_9e98_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1155_c7_791d_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1159_c24_e810_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1133_c2_e980_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1139_l1133_l1149_l1146_l1142_DUPLICATE_6706_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1139_c7_1b42_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1139_l1133_l1149_l1146_l1142_DUPLICATE_6706_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1142_c7_bc5f_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1139_l1133_l1149_l1146_l1142_DUPLICATE_6706_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c7_ce02_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1139_l1133_l1149_l1146_l1142_DUPLICATE_6706_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_cf40_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1139_l1133_l1149_l1146_l1142_DUPLICATE_6706_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1139_c7_1b42_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1139_l1161_l1155_l1149_l1146_l1142_DUPLICATE_cf03_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1142_c7_bc5f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1139_l1161_l1155_l1149_l1146_l1142_DUPLICATE_cf03_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1146_c7_ce02_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1139_l1161_l1155_l1149_l1146_l1142_DUPLICATE_cf03_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_cf40_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1139_l1161_l1155_l1149_l1146_l1142_DUPLICATE_cf03_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1155_c7_791d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1139_l1161_l1155_l1149_l1146_l1142_DUPLICATE_cf03_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_1bd5_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1139_l1161_l1155_l1149_l1146_l1142_DUPLICATE_cf03_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1133_c2_e980_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1139_l1133_l1155_l1146_l1142_DUPLICATE_866c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1139_c7_1b42_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1139_l1133_l1155_l1146_l1142_DUPLICATE_866c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1142_c7_bc5f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1139_l1133_l1155_l1146_l1142_DUPLICATE_866c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c7_ce02_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1139_l1133_l1155_l1146_l1142_DUPLICATE_866c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1155_c7_791d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1139_l1133_l1155_l1146_l1142_DUPLICATE_866c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1139_c7_1b42_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1139_l1149_l1142_l1146_DUPLICATE_19b7_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1142_c7_bc5f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1139_l1149_l1142_l1146_DUPLICATE_19b7_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1146_c7_ce02_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1139_l1149_l1142_l1146_DUPLICATE_19b7_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1149_c7_cf40_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1139_l1149_l1142_l1146_DUPLICATE_19b7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1133_c2_e980_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1139_l1133_l1161_l1149_l1146_l1142_DUPLICATE_392b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1139_c7_1b42_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1139_l1133_l1161_l1149_l1146_l1142_DUPLICATE_392b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1142_c7_bc5f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1139_l1133_l1161_l1149_l1146_l1142_DUPLICATE_392b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1146_c7_ce02_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1139_l1133_l1161_l1149_l1146_l1142_DUPLICATE_392b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1149_c7_cf40_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1139_l1133_l1161_l1149_l1146_l1142_DUPLICATE_392b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_1bd5_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1139_l1133_l1161_l1149_l1146_l1142_DUPLICATE_392b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_cf40_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1149_l1155_DUPLICATE_4ade_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1155_c7_791d_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1149_l1155_DUPLICATE_4ade_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1133_c2_e980_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1139_l1133_l1155_l1149_l1146_l1142_DUPLICATE_f58d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1139_c7_1b42_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1139_l1133_l1155_l1149_l1146_l1142_DUPLICATE_f58d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1142_c7_bc5f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1139_l1133_l1155_l1149_l1146_l1142_DUPLICATE_f58d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1146_c7_ce02_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1139_l1133_l1155_l1149_l1146_l1142_DUPLICATE_f58d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1149_c7_cf40_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1139_l1133_l1155_l1149_l1146_l1142_DUPLICATE_f58d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1155_c7_791d_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1139_l1133_l1155_l1149_l1146_l1142_DUPLICATE_f58d_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l1149_c7_cf40] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1149_c7_cf40_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1149_c7_cf40_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1149_c7_cf40_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1149_c7_cf40_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1149_c7_cf40_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1149_c7_cf40_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1149_c7_cf40_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1149_c7_cf40_return_output;

     -- n8_MUX[uxn_opcodes_h_l1149_c7_cf40] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1149_c7_cf40_cond <= VAR_n8_MUX_uxn_opcodes_h_l1149_c7_cf40_cond;
     n8_MUX_uxn_opcodes_h_l1149_c7_cf40_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1149_c7_cf40_iftrue;
     n8_MUX_uxn_opcodes_h_l1149_c7_cf40_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1149_c7_cf40_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1149_c7_cf40_return_output := n8_MUX_uxn_opcodes_h_l1149_c7_cf40_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1161_c7_1bd5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_1bd5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_1bd5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_1bd5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_1bd5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_1bd5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_1bd5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_1bd5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_1bd5_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1133_c1_f6cb] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1133_c1_f6cb_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1133_c1_f6cb_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1133_c1_f6cb_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1133_c1_f6cb_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1133_c1_f6cb_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1133_c1_f6cb_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1133_c1_f6cb_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1133_c1_f6cb_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1161_c7_1bd5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_1bd5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_1bd5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_1bd5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_1bd5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_1bd5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_1bd5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_1bd5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_1bd5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1155_c7_791d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1155_c7_791d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1155_c7_791d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1155_c7_791d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1155_c7_791d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1155_c7_791d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1155_c7_791d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1155_c7_791d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1155_c7_791d_return_output;

     -- t8_MUX[uxn_opcodes_h_l1142_c7_bc5f] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1142_c7_bc5f_cond <= VAR_t8_MUX_uxn_opcodes_h_l1142_c7_bc5f_cond;
     t8_MUX_uxn_opcodes_h_l1142_c7_bc5f_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1142_c7_bc5f_iftrue;
     t8_MUX_uxn_opcodes_h_l1142_c7_bc5f_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1142_c7_bc5f_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1142_c7_bc5f_return_output := t8_MUX_uxn_opcodes_h_l1142_c7_bc5f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1155_c7_791d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1155_c7_791d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1155_c7_791d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1155_c7_791d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1155_c7_791d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1155_c7_791d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1155_c7_791d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1155_c7_791d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1155_c7_791d_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1153_c32_5600] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1153_c32_5600_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1153_c32_5600_left;
     BIN_OP_GT_uxn_opcodes_h_l1153_c32_5600_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1153_c32_5600_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1153_c32_5600_return_output := BIN_OP_GT_uxn_opcodes_h_l1153_c32_5600_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1155_c7_791d] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1155_c7_791d_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1155_c7_791d_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1155_c7_791d_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1155_c7_791d_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1155_c7_791d_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1155_c7_791d_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1155_c7_791d_return_output := result_stack_value_MUX_uxn_opcodes_h_l1155_c7_791d_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1153_c32_c11a_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1153_c32_5600_return_output;
     VAR_printf_uxn_opcodes_h_l1134_c3_d8e1_uxn_opcodes_h_l1134_c3_d8e1_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1133_c1_f6cb_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1146_c7_ce02_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1149_c7_cf40_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1155_c7_791d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_1bd5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1149_c7_cf40_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1155_c7_791d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1146_c7_ce02_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1149_c7_cf40_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1155_c7_791d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_1bd5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_cf40_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1155_c7_791d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1149_c7_cf40_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1155_c7_791d_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1139_c7_1b42_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1142_c7_bc5f_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1149_c7_cf40] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1149_c7_cf40_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1149_c7_cf40_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1149_c7_cf40_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1149_c7_cf40_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1149_c7_cf40_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1149_c7_cf40_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1149_c7_cf40_return_output := result_stack_value_MUX_uxn_opcodes_h_l1149_c7_cf40_return_output;

     -- t8_MUX[uxn_opcodes_h_l1139_c7_1b42] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1139_c7_1b42_cond <= VAR_t8_MUX_uxn_opcodes_h_l1139_c7_1b42_cond;
     t8_MUX_uxn_opcodes_h_l1139_c7_1b42_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1139_c7_1b42_iftrue;
     t8_MUX_uxn_opcodes_h_l1139_c7_1b42_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1139_c7_1b42_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1139_c7_1b42_return_output := t8_MUX_uxn_opcodes_h_l1139_c7_1b42_return_output;

     -- n8_MUX[uxn_opcodes_h_l1146_c7_ce02] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1146_c7_ce02_cond <= VAR_n8_MUX_uxn_opcodes_h_l1146_c7_ce02_cond;
     n8_MUX_uxn_opcodes_h_l1146_c7_ce02_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1146_c7_ce02_iftrue;
     n8_MUX_uxn_opcodes_h_l1146_c7_ce02_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1146_c7_ce02_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1146_c7_ce02_return_output := n8_MUX_uxn_opcodes_h_l1146_c7_ce02_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1155_c7_791d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1155_c7_791d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1155_c7_791d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1155_c7_791d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1155_c7_791d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1155_c7_791d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1155_c7_791d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1155_c7_791d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1155_c7_791d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1155_c7_791d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1155_c7_791d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1155_c7_791d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1155_c7_791d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1155_c7_791d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1155_c7_791d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1155_c7_791d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1155_c7_791d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1155_c7_791d_return_output;

     -- printf_uxn_opcodes_h_l1134_c3_d8e1[uxn_opcodes_h_l1134_c3_d8e1] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1134_c3_d8e1_uxn_opcodes_h_l1134_c3_d8e1_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1134_c3_d8e1_uxn_opcodes_h_l1134_c3_d8e1_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1149_c7_cf40] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_cf40_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_cf40_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_cf40_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_cf40_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_cf40_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_cf40_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_cf40_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_cf40_return_output;

     -- MUX[uxn_opcodes_h_l1153_c32_c11a] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1153_c32_c11a_cond <= VAR_MUX_uxn_opcodes_h_l1153_c32_c11a_cond;
     MUX_uxn_opcodes_h_l1153_c32_c11a_iftrue <= VAR_MUX_uxn_opcodes_h_l1153_c32_c11a_iftrue;
     MUX_uxn_opcodes_h_l1153_c32_c11a_iffalse <= VAR_MUX_uxn_opcodes_h_l1153_c32_c11a_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1153_c32_c11a_return_output := MUX_uxn_opcodes_h_l1153_c32_c11a_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1146_c7_ce02] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1146_c7_ce02_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1146_c7_ce02_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1146_c7_ce02_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1146_c7_ce02_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1146_c7_ce02_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1146_c7_ce02_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1146_c7_ce02_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1146_c7_ce02_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1149_c7_cf40] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1149_c7_cf40_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1149_c7_cf40_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1149_c7_cf40_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1149_c7_cf40_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1149_c7_cf40_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1149_c7_cf40_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1149_c7_cf40_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1149_c7_cf40_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_cf40_iftrue := VAR_MUX_uxn_opcodes_h_l1153_c32_c11a_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1142_c7_bc5f_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1146_c7_ce02_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_cf40_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1155_c7_791d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c7_ce02_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1149_c7_cf40_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1142_c7_bc5f_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1146_c7_ce02_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1149_c7_cf40_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1155_c7_791d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c7_ce02_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1149_c7_cf40_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1146_c7_ce02_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1149_c7_cf40_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1133_c2_e980_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1139_c7_1b42_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1149_c7_cf40] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1149_c7_cf40_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1149_c7_cf40_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1149_c7_cf40_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1149_c7_cf40_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1149_c7_cf40_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1149_c7_cf40_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1149_c7_cf40_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1149_c7_cf40_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1146_c7_ce02] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1146_c7_ce02_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1146_c7_ce02_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1146_c7_ce02_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1146_c7_ce02_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1146_c7_ce02_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1146_c7_ce02_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1146_c7_ce02_return_output := result_stack_value_MUX_uxn_opcodes_h_l1146_c7_ce02_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1149_c7_cf40] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_cf40_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_cf40_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_cf40_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_cf40_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_cf40_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_cf40_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_cf40_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_cf40_return_output;

     -- n8_MUX[uxn_opcodes_h_l1142_c7_bc5f] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1142_c7_bc5f_cond <= VAR_n8_MUX_uxn_opcodes_h_l1142_c7_bc5f_cond;
     n8_MUX_uxn_opcodes_h_l1142_c7_bc5f_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1142_c7_bc5f_iftrue;
     n8_MUX_uxn_opcodes_h_l1142_c7_bc5f_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1142_c7_bc5f_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1142_c7_bc5f_return_output := n8_MUX_uxn_opcodes_h_l1142_c7_bc5f_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1142_c7_bc5f] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1142_c7_bc5f_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1142_c7_bc5f_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1142_c7_bc5f_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1142_c7_bc5f_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1142_c7_bc5f_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1142_c7_bc5f_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1142_c7_bc5f_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1142_c7_bc5f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1146_c7_ce02] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c7_ce02_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c7_ce02_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c7_ce02_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c7_ce02_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c7_ce02_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c7_ce02_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c7_ce02_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c7_ce02_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1149_c7_cf40] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_cf40_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_cf40_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_cf40_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_cf40_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_cf40_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_cf40_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_cf40_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_cf40_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1146_c7_ce02] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c7_ce02_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c7_ce02_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c7_ce02_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c7_ce02_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c7_ce02_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c7_ce02_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c7_ce02_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c7_ce02_return_output;

     -- t8_MUX[uxn_opcodes_h_l1133_c2_e980] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1133_c2_e980_cond <= VAR_t8_MUX_uxn_opcodes_h_l1133_c2_e980_cond;
     t8_MUX_uxn_opcodes_h_l1133_c2_e980_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1133_c2_e980_iftrue;
     t8_MUX_uxn_opcodes_h_l1133_c2_e980_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1133_c2_e980_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1133_c2_e980_return_output := t8_MUX_uxn_opcodes_h_l1133_c2_e980_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l1139_c7_1b42_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1142_c7_bc5f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1146_c7_ce02_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1149_c7_cf40_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1142_c7_bc5f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1146_c7_ce02_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1139_c7_1b42_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1142_c7_bc5f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1146_c7_ce02_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1149_c7_cf40_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c7_ce02_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1149_c7_cf40_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1142_c7_bc5f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1146_c7_ce02_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1142_c7_bc5f_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1146_c7_ce02_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1133_c2_e980_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1146_c7_ce02] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1146_c7_ce02_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1146_c7_ce02_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1146_c7_ce02_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1146_c7_ce02_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1146_c7_ce02_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1146_c7_ce02_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1146_c7_ce02_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1146_c7_ce02_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1139_c7_1b42] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1139_c7_1b42_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1139_c7_1b42_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1139_c7_1b42_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1139_c7_1b42_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1139_c7_1b42_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1139_c7_1b42_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1139_c7_1b42_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1139_c7_1b42_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1142_c7_bc5f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1142_c7_bc5f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1142_c7_bc5f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1142_c7_bc5f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1142_c7_bc5f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1142_c7_bc5f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1142_c7_bc5f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1142_c7_bc5f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1142_c7_bc5f_return_output;

     -- n8_MUX[uxn_opcodes_h_l1139_c7_1b42] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1139_c7_1b42_cond <= VAR_n8_MUX_uxn_opcodes_h_l1139_c7_1b42_cond;
     n8_MUX_uxn_opcodes_h_l1139_c7_1b42_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1139_c7_1b42_iftrue;
     n8_MUX_uxn_opcodes_h_l1139_c7_1b42_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1139_c7_1b42_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1139_c7_1b42_return_output := n8_MUX_uxn_opcodes_h_l1139_c7_1b42_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1142_c7_bc5f] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1142_c7_bc5f_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1142_c7_bc5f_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1142_c7_bc5f_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1142_c7_bc5f_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1142_c7_bc5f_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1142_c7_bc5f_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1142_c7_bc5f_return_output := result_stack_value_MUX_uxn_opcodes_h_l1142_c7_bc5f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1142_c7_bc5f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1142_c7_bc5f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1142_c7_bc5f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1142_c7_bc5f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1142_c7_bc5f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1142_c7_bc5f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1142_c7_bc5f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1142_c7_bc5f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1142_c7_bc5f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1146_c7_ce02] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c7_ce02_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c7_ce02_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c7_ce02_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c7_ce02_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c7_ce02_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c7_ce02_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c7_ce02_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c7_ce02_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1146_c7_ce02] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1146_c7_ce02_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1146_c7_ce02_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1146_c7_ce02_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1146_c7_ce02_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1146_c7_ce02_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1146_c7_ce02_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1146_c7_ce02_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1146_c7_ce02_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l1133_c2_e980_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1139_c7_1b42_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1142_c7_bc5f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1146_c7_ce02_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1139_c7_1b42_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1142_c7_bc5f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1133_c2_e980_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1139_c7_1b42_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1142_c7_bc5f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1146_c7_ce02_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1142_c7_bc5f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1146_c7_ce02_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1139_c7_1b42_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1142_c7_bc5f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1139_c7_1b42_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1142_c7_bc5f_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1142_c7_bc5f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1142_c7_bc5f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1142_c7_bc5f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1142_c7_bc5f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1142_c7_bc5f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1142_c7_bc5f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1142_c7_bc5f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1142_c7_bc5f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1142_c7_bc5f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1142_c7_bc5f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1142_c7_bc5f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1142_c7_bc5f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1142_c7_bc5f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1142_c7_bc5f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1142_c7_bc5f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1142_c7_bc5f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1142_c7_bc5f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1142_c7_bc5f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1139_c7_1b42] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1139_c7_1b42_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1139_c7_1b42_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1139_c7_1b42_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1139_c7_1b42_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1139_c7_1b42_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1139_c7_1b42_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1139_c7_1b42_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1139_c7_1b42_return_output;

     -- n8_MUX[uxn_opcodes_h_l1133_c2_e980] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1133_c2_e980_cond <= VAR_n8_MUX_uxn_opcodes_h_l1133_c2_e980_cond;
     n8_MUX_uxn_opcodes_h_l1133_c2_e980_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1133_c2_e980_iftrue;
     n8_MUX_uxn_opcodes_h_l1133_c2_e980_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1133_c2_e980_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1133_c2_e980_return_output := n8_MUX_uxn_opcodes_h_l1133_c2_e980_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1133_c2_e980] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1133_c2_e980_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1133_c2_e980_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1133_c2_e980_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1133_c2_e980_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1133_c2_e980_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1133_c2_e980_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1133_c2_e980_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1133_c2_e980_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1142_c7_bc5f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1142_c7_bc5f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1142_c7_bc5f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1142_c7_bc5f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1142_c7_bc5f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1142_c7_bc5f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1142_c7_bc5f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1142_c7_bc5f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1142_c7_bc5f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1139_c7_1b42] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1139_c7_1b42_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1139_c7_1b42_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1139_c7_1b42_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1139_c7_1b42_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1139_c7_1b42_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1139_c7_1b42_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1139_c7_1b42_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1139_c7_1b42_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1139_c7_1b42] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1139_c7_1b42_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1139_c7_1b42_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1139_c7_1b42_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1139_c7_1b42_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1139_c7_1b42_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1139_c7_1b42_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1139_c7_1b42_return_output := result_stack_value_MUX_uxn_opcodes_h_l1139_c7_1b42_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l1133_c2_e980_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1139_c7_1b42_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1142_c7_bc5f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1133_c2_e980_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1139_c7_1b42_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1139_c7_1b42_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1142_c7_bc5f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1139_c7_1b42_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1142_c7_bc5f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1133_c2_e980_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1139_c7_1b42_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1133_c2_e980_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1139_c7_1b42_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1139_c7_1b42] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1139_c7_1b42_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1139_c7_1b42_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1139_c7_1b42_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1139_c7_1b42_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1139_c7_1b42_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1139_c7_1b42_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1139_c7_1b42_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1139_c7_1b42_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1139_c7_1b42] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1139_c7_1b42_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1139_c7_1b42_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1139_c7_1b42_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1139_c7_1b42_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1139_c7_1b42_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1139_c7_1b42_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1139_c7_1b42_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1139_c7_1b42_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1133_c2_e980] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1133_c2_e980_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1133_c2_e980_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1133_c2_e980_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1133_c2_e980_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1133_c2_e980_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1133_c2_e980_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1133_c2_e980_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1133_c2_e980_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1133_c2_e980] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1133_c2_e980_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1133_c2_e980_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1133_c2_e980_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1133_c2_e980_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1133_c2_e980_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1133_c2_e980_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1133_c2_e980_return_output := result_stack_value_MUX_uxn_opcodes_h_l1133_c2_e980_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1133_c2_e980] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1133_c2_e980_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1133_c2_e980_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1133_c2_e980_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1133_c2_e980_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1133_c2_e980_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1133_c2_e980_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1133_c2_e980_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1133_c2_e980_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1139_c7_1b42] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1139_c7_1b42_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1139_c7_1b42_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1139_c7_1b42_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1139_c7_1b42_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1139_c7_1b42_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1139_c7_1b42_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1139_c7_1b42_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1139_c7_1b42_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1133_c2_e980_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1139_c7_1b42_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1133_c2_e980_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1139_c7_1b42_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1133_c2_e980_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1139_c7_1b42_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1133_c2_e980] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1133_c2_e980_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1133_c2_e980_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1133_c2_e980_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1133_c2_e980_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1133_c2_e980_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1133_c2_e980_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1133_c2_e980_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1133_c2_e980_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1133_c2_e980] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1133_c2_e980_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1133_c2_e980_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1133_c2_e980_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1133_c2_e980_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1133_c2_e980_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1133_c2_e980_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1133_c2_e980_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1133_c2_e980_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1133_c2_e980] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1133_c2_e980_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1133_c2_e980_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1133_c2_e980_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1133_c2_e980_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1133_c2_e980_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1133_c2_e980_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1133_c2_e980_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1133_c2_e980_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_287e_uxn_opcodes_h_l1129_l1166_DUPLICATE_527b LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_287e_uxn_opcodes_h_l1129_l1166_DUPLICATE_527b_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_287e(
     result,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1133_c2_e980_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1133_c2_e980_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1133_c2_e980_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1133_c2_e980_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1133_c2_e980_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1133_c2_e980_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1133_c2_e980_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_287e_uxn_opcodes_h_l1129_l1166_DUPLICATE_527b_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_287e_uxn_opcodes_h_l1129_l1166_DUPLICATE_527b_return_output;
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
