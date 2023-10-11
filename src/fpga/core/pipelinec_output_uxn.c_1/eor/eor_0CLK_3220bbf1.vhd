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
-- Submodules: 59
entity eor_0CLK_3220bbf1 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end eor_0CLK_3220bbf1;
architecture arch of eor_0CLK_3220bbf1 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1152_c6_4e12]
signal BIN_OP_EQ_uxn_opcodes_h_l1152_c6_4e12_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1152_c6_4e12_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1152_c6_4e12_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1152_c1_e3da]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1152_c1_e3da_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1152_c1_e3da_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1152_c1_e3da_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1152_c1_e3da_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1152_c2_2a8f]
signal t8_MUX_uxn_opcodes_h_l1152_c2_2a8f_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1152_c2_2a8f_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1152_c2_2a8f_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1152_c2_2a8f_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1152_c2_2a8f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1152_c2_2a8f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1152_c2_2a8f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1152_c2_2a8f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1152_c2_2a8f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1152_c2_2a8f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1152_c2_2a8f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1152_c2_2a8f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1152_c2_2a8f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1152_c2_2a8f_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1152_c2_2a8f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1152_c2_2a8f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1152_c2_2a8f_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1152_c2_2a8f_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1152_c2_2a8f_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1152_c2_2a8f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1152_c2_2a8f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1152_c2_2a8f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1152_c2_2a8f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1152_c2_2a8f_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1152_c2_2a8f]
signal result_stack_value_MUX_uxn_opcodes_h_l1152_c2_2a8f_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1152_c2_2a8f_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1152_c2_2a8f_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1152_c2_2a8f_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1152_c2_2a8f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1152_c2_2a8f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1152_c2_2a8f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1152_c2_2a8f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1152_c2_2a8f_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1152_c2_2a8f]
signal n8_MUX_uxn_opcodes_h_l1152_c2_2a8f_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1152_c2_2a8f_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1152_c2_2a8f_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1152_c2_2a8f_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l1153_c3_72cf[uxn_opcodes_h_l1153_c3_72cf]
signal printf_uxn_opcodes_h_l1153_c3_72cf_uxn_opcodes_h_l1153_c3_72cf_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1157_c11_33bb]
signal BIN_OP_EQ_uxn_opcodes_h_l1157_c11_33bb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1157_c11_33bb_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1157_c11_33bb_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1157_c7_0a83]
signal t8_MUX_uxn_opcodes_h_l1157_c7_0a83_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1157_c7_0a83_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1157_c7_0a83_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1157_c7_0a83_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1157_c7_0a83]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1157_c7_0a83_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1157_c7_0a83_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1157_c7_0a83_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1157_c7_0a83_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1157_c7_0a83]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1157_c7_0a83_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1157_c7_0a83_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1157_c7_0a83_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1157_c7_0a83_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1157_c7_0a83]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1157_c7_0a83_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1157_c7_0a83_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1157_c7_0a83_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1157_c7_0a83_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1157_c7_0a83]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1157_c7_0a83_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1157_c7_0a83_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1157_c7_0a83_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1157_c7_0a83_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1157_c7_0a83]
signal result_stack_value_MUX_uxn_opcodes_h_l1157_c7_0a83_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1157_c7_0a83_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1157_c7_0a83_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1157_c7_0a83_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1157_c7_0a83]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1157_c7_0a83_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1157_c7_0a83_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1157_c7_0a83_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1157_c7_0a83_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1157_c7_0a83]
signal n8_MUX_uxn_opcodes_h_l1157_c7_0a83_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1157_c7_0a83_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1157_c7_0a83_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1157_c7_0a83_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1160_c11_c7fc]
signal BIN_OP_EQ_uxn_opcodes_h_l1160_c11_c7fc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1160_c11_c7fc_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1160_c11_c7fc_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1160_c7_1218]
signal t8_MUX_uxn_opcodes_h_l1160_c7_1218_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1160_c7_1218_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1160_c7_1218_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1160_c7_1218_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1160_c7_1218]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1160_c7_1218_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1160_c7_1218_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1160_c7_1218_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1160_c7_1218_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1160_c7_1218]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1160_c7_1218_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1160_c7_1218_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1160_c7_1218_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1160_c7_1218_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1160_c7_1218]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1160_c7_1218_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1160_c7_1218_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1160_c7_1218_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1160_c7_1218_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1160_c7_1218]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1160_c7_1218_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1160_c7_1218_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1160_c7_1218_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1160_c7_1218_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1160_c7_1218]
signal result_stack_value_MUX_uxn_opcodes_h_l1160_c7_1218_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1160_c7_1218_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1160_c7_1218_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1160_c7_1218_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1160_c7_1218]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1160_c7_1218_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1160_c7_1218_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1160_c7_1218_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1160_c7_1218_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1160_c7_1218]
signal n8_MUX_uxn_opcodes_h_l1160_c7_1218_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1160_c7_1218_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1160_c7_1218_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1160_c7_1218_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1164_c11_b8b8]
signal BIN_OP_EQ_uxn_opcodes_h_l1164_c11_b8b8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1164_c11_b8b8_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1164_c11_b8b8_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1164_c7_8159]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1164_c7_8159_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1164_c7_8159_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1164_c7_8159_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1164_c7_8159_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1164_c7_8159]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1164_c7_8159_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1164_c7_8159_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1164_c7_8159_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1164_c7_8159_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1164_c7_8159]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1164_c7_8159_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1164_c7_8159_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1164_c7_8159_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1164_c7_8159_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1164_c7_8159]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1164_c7_8159_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1164_c7_8159_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1164_c7_8159_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1164_c7_8159_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1164_c7_8159]
signal result_stack_value_MUX_uxn_opcodes_h_l1164_c7_8159_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1164_c7_8159_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1164_c7_8159_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1164_c7_8159_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1164_c7_8159]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1164_c7_8159_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1164_c7_8159_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1164_c7_8159_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1164_c7_8159_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1164_c7_8159]
signal n8_MUX_uxn_opcodes_h_l1164_c7_8159_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1164_c7_8159_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1164_c7_8159_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1164_c7_8159_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1167_c11_0252]
signal BIN_OP_EQ_uxn_opcodes_h_l1167_c11_0252_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1167_c11_0252_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1167_c11_0252_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1167_c7_d368]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_d368_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_d368_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_d368_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_d368_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1167_c7_d368]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1167_c7_d368_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1167_c7_d368_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1167_c7_d368_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1167_c7_d368_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1167_c7_d368]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1167_c7_d368_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1167_c7_d368_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1167_c7_d368_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1167_c7_d368_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1167_c7_d368]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_d368_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_d368_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_d368_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_d368_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1167_c7_d368]
signal result_stack_value_MUX_uxn_opcodes_h_l1167_c7_d368_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1167_c7_d368_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1167_c7_d368_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1167_c7_d368_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1167_c7_d368]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_d368_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_d368_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_d368_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_d368_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1167_c7_d368]
signal n8_MUX_uxn_opcodes_h_l1167_c7_d368_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1167_c7_d368_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1167_c7_d368_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1167_c7_d368_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1170_c32_8b0d]
signal BIN_OP_AND_uxn_opcodes_h_l1170_c32_8b0d_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1170_c32_8b0d_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1170_c32_8b0d_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1170_c32_6a07]
signal BIN_OP_GT_uxn_opcodes_h_l1170_c32_6a07_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1170_c32_6a07_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1170_c32_6a07_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1170_c32_47d5]
signal MUX_uxn_opcodes_h_l1170_c32_47d5_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1170_c32_47d5_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1170_c32_47d5_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1170_c32_47d5_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1172_c11_7845]
signal BIN_OP_EQ_uxn_opcodes_h_l1172_c11_7845_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1172_c11_7845_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1172_c11_7845_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1172_c7_a412]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1172_c7_a412_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1172_c7_a412_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1172_c7_a412_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1172_c7_a412_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1172_c7_a412]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1172_c7_a412_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1172_c7_a412_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1172_c7_a412_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1172_c7_a412_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1172_c7_a412]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1172_c7_a412_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1172_c7_a412_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1172_c7_a412_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1172_c7_a412_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1172_c7_a412]
signal result_stack_value_MUX_uxn_opcodes_h_l1172_c7_a412_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1172_c7_a412_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1172_c7_a412_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1172_c7_a412_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1172_c7_a412]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1172_c7_a412_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1172_c7_a412_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1172_c7_a412_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1172_c7_a412_return_output : unsigned(0 downto 0);

-- BIN_OP_XOR[uxn_opcodes_h_l1176_c24_cd18]
signal BIN_OP_XOR_uxn_opcodes_h_l1176_c24_cd18_left : unsigned(7 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l1176_c24_cd18_right : unsigned(7 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l1176_c24_cd18_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1178_c11_5c4f]
signal BIN_OP_EQ_uxn_opcodes_h_l1178_c11_5c4f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1178_c11_5c4f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1178_c11_5c4f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1178_c7_f6a2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1178_c7_f6a2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1178_c7_f6a2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1178_c7_f6a2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1178_c7_f6a2_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1178_c7_f6a2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1178_c7_f6a2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1178_c7_f6a2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1178_c7_f6a2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1178_c7_f6a2_return_output : unsigned(0 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_53ff( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : signed;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_stack_write := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.stack_value := ref_toks_5;
      base.is_sp_shift := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1152_c6_4e12
BIN_OP_EQ_uxn_opcodes_h_l1152_c6_4e12 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1152_c6_4e12_left,
BIN_OP_EQ_uxn_opcodes_h_l1152_c6_4e12_right,
BIN_OP_EQ_uxn_opcodes_h_l1152_c6_4e12_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1152_c1_e3da
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1152_c1_e3da : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1152_c1_e3da_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1152_c1_e3da_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1152_c1_e3da_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1152_c1_e3da_return_output);

-- t8_MUX_uxn_opcodes_h_l1152_c2_2a8f
t8_MUX_uxn_opcodes_h_l1152_c2_2a8f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1152_c2_2a8f_cond,
t8_MUX_uxn_opcodes_h_l1152_c2_2a8f_iftrue,
t8_MUX_uxn_opcodes_h_l1152_c2_2a8f_iffalse,
t8_MUX_uxn_opcodes_h_l1152_c2_2a8f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1152_c2_2a8f
result_is_stack_write_MUX_uxn_opcodes_h_l1152_c2_2a8f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1152_c2_2a8f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1152_c2_2a8f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1152_c2_2a8f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1152_c2_2a8f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1152_c2_2a8f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1152_c2_2a8f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1152_c2_2a8f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1152_c2_2a8f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1152_c2_2a8f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1152_c2_2a8f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1152_c2_2a8f
result_sp_relative_shift_MUX_uxn_opcodes_h_l1152_c2_2a8f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1152_c2_2a8f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1152_c2_2a8f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1152_c2_2a8f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1152_c2_2a8f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1152_c2_2a8f
result_is_opc_done_MUX_uxn_opcodes_h_l1152_c2_2a8f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1152_c2_2a8f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1152_c2_2a8f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1152_c2_2a8f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1152_c2_2a8f_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1152_c2_2a8f
result_stack_value_MUX_uxn_opcodes_h_l1152_c2_2a8f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1152_c2_2a8f_cond,
result_stack_value_MUX_uxn_opcodes_h_l1152_c2_2a8f_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1152_c2_2a8f_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1152_c2_2a8f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1152_c2_2a8f
result_is_sp_shift_MUX_uxn_opcodes_h_l1152_c2_2a8f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1152_c2_2a8f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1152_c2_2a8f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1152_c2_2a8f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1152_c2_2a8f_return_output);

-- n8_MUX_uxn_opcodes_h_l1152_c2_2a8f
n8_MUX_uxn_opcodes_h_l1152_c2_2a8f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1152_c2_2a8f_cond,
n8_MUX_uxn_opcodes_h_l1152_c2_2a8f_iftrue,
n8_MUX_uxn_opcodes_h_l1152_c2_2a8f_iffalse,
n8_MUX_uxn_opcodes_h_l1152_c2_2a8f_return_output);

-- printf_uxn_opcodes_h_l1153_c3_72cf_uxn_opcodes_h_l1153_c3_72cf
printf_uxn_opcodes_h_l1153_c3_72cf_uxn_opcodes_h_l1153_c3_72cf : entity work.printf_uxn_opcodes_h_l1153_c3_72cf_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1153_c3_72cf_uxn_opcodes_h_l1153_c3_72cf_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1157_c11_33bb
BIN_OP_EQ_uxn_opcodes_h_l1157_c11_33bb : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1157_c11_33bb_left,
BIN_OP_EQ_uxn_opcodes_h_l1157_c11_33bb_right,
BIN_OP_EQ_uxn_opcodes_h_l1157_c11_33bb_return_output);

-- t8_MUX_uxn_opcodes_h_l1157_c7_0a83
t8_MUX_uxn_opcodes_h_l1157_c7_0a83 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1157_c7_0a83_cond,
t8_MUX_uxn_opcodes_h_l1157_c7_0a83_iftrue,
t8_MUX_uxn_opcodes_h_l1157_c7_0a83_iffalse,
t8_MUX_uxn_opcodes_h_l1157_c7_0a83_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1157_c7_0a83
result_is_stack_write_MUX_uxn_opcodes_h_l1157_c7_0a83 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1157_c7_0a83_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1157_c7_0a83_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1157_c7_0a83_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1157_c7_0a83_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1157_c7_0a83
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1157_c7_0a83 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1157_c7_0a83_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1157_c7_0a83_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1157_c7_0a83_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1157_c7_0a83_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1157_c7_0a83
result_sp_relative_shift_MUX_uxn_opcodes_h_l1157_c7_0a83 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1157_c7_0a83_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1157_c7_0a83_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1157_c7_0a83_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1157_c7_0a83_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1157_c7_0a83
result_is_opc_done_MUX_uxn_opcodes_h_l1157_c7_0a83 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1157_c7_0a83_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1157_c7_0a83_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1157_c7_0a83_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1157_c7_0a83_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1157_c7_0a83
result_stack_value_MUX_uxn_opcodes_h_l1157_c7_0a83 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1157_c7_0a83_cond,
result_stack_value_MUX_uxn_opcodes_h_l1157_c7_0a83_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1157_c7_0a83_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1157_c7_0a83_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1157_c7_0a83
result_is_sp_shift_MUX_uxn_opcodes_h_l1157_c7_0a83 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1157_c7_0a83_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1157_c7_0a83_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1157_c7_0a83_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1157_c7_0a83_return_output);

-- n8_MUX_uxn_opcodes_h_l1157_c7_0a83
n8_MUX_uxn_opcodes_h_l1157_c7_0a83 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1157_c7_0a83_cond,
n8_MUX_uxn_opcodes_h_l1157_c7_0a83_iftrue,
n8_MUX_uxn_opcodes_h_l1157_c7_0a83_iffalse,
n8_MUX_uxn_opcodes_h_l1157_c7_0a83_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1160_c11_c7fc
BIN_OP_EQ_uxn_opcodes_h_l1160_c11_c7fc : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1160_c11_c7fc_left,
BIN_OP_EQ_uxn_opcodes_h_l1160_c11_c7fc_right,
BIN_OP_EQ_uxn_opcodes_h_l1160_c11_c7fc_return_output);

-- t8_MUX_uxn_opcodes_h_l1160_c7_1218
t8_MUX_uxn_opcodes_h_l1160_c7_1218 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1160_c7_1218_cond,
t8_MUX_uxn_opcodes_h_l1160_c7_1218_iftrue,
t8_MUX_uxn_opcodes_h_l1160_c7_1218_iffalse,
t8_MUX_uxn_opcodes_h_l1160_c7_1218_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1160_c7_1218
result_is_stack_write_MUX_uxn_opcodes_h_l1160_c7_1218 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1160_c7_1218_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1160_c7_1218_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1160_c7_1218_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1160_c7_1218_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1160_c7_1218
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1160_c7_1218 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1160_c7_1218_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1160_c7_1218_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1160_c7_1218_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1160_c7_1218_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1160_c7_1218
result_sp_relative_shift_MUX_uxn_opcodes_h_l1160_c7_1218 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1160_c7_1218_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1160_c7_1218_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1160_c7_1218_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1160_c7_1218_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1160_c7_1218
result_is_opc_done_MUX_uxn_opcodes_h_l1160_c7_1218 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1160_c7_1218_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1160_c7_1218_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1160_c7_1218_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1160_c7_1218_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1160_c7_1218
result_stack_value_MUX_uxn_opcodes_h_l1160_c7_1218 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1160_c7_1218_cond,
result_stack_value_MUX_uxn_opcodes_h_l1160_c7_1218_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1160_c7_1218_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1160_c7_1218_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1160_c7_1218
result_is_sp_shift_MUX_uxn_opcodes_h_l1160_c7_1218 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1160_c7_1218_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1160_c7_1218_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1160_c7_1218_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1160_c7_1218_return_output);

-- n8_MUX_uxn_opcodes_h_l1160_c7_1218
n8_MUX_uxn_opcodes_h_l1160_c7_1218 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1160_c7_1218_cond,
n8_MUX_uxn_opcodes_h_l1160_c7_1218_iftrue,
n8_MUX_uxn_opcodes_h_l1160_c7_1218_iffalse,
n8_MUX_uxn_opcodes_h_l1160_c7_1218_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1164_c11_b8b8
BIN_OP_EQ_uxn_opcodes_h_l1164_c11_b8b8 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1164_c11_b8b8_left,
BIN_OP_EQ_uxn_opcodes_h_l1164_c11_b8b8_right,
BIN_OP_EQ_uxn_opcodes_h_l1164_c11_b8b8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1164_c7_8159
result_is_stack_write_MUX_uxn_opcodes_h_l1164_c7_8159 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1164_c7_8159_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1164_c7_8159_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1164_c7_8159_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1164_c7_8159_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1164_c7_8159
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1164_c7_8159 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1164_c7_8159_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1164_c7_8159_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1164_c7_8159_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1164_c7_8159_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1164_c7_8159
result_sp_relative_shift_MUX_uxn_opcodes_h_l1164_c7_8159 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1164_c7_8159_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1164_c7_8159_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1164_c7_8159_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1164_c7_8159_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1164_c7_8159
result_is_opc_done_MUX_uxn_opcodes_h_l1164_c7_8159 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1164_c7_8159_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1164_c7_8159_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1164_c7_8159_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1164_c7_8159_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1164_c7_8159
result_stack_value_MUX_uxn_opcodes_h_l1164_c7_8159 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1164_c7_8159_cond,
result_stack_value_MUX_uxn_opcodes_h_l1164_c7_8159_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1164_c7_8159_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1164_c7_8159_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1164_c7_8159
result_is_sp_shift_MUX_uxn_opcodes_h_l1164_c7_8159 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1164_c7_8159_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1164_c7_8159_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1164_c7_8159_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1164_c7_8159_return_output);

-- n8_MUX_uxn_opcodes_h_l1164_c7_8159
n8_MUX_uxn_opcodes_h_l1164_c7_8159 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1164_c7_8159_cond,
n8_MUX_uxn_opcodes_h_l1164_c7_8159_iftrue,
n8_MUX_uxn_opcodes_h_l1164_c7_8159_iffalse,
n8_MUX_uxn_opcodes_h_l1164_c7_8159_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1167_c11_0252
BIN_OP_EQ_uxn_opcodes_h_l1167_c11_0252 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1167_c11_0252_left,
BIN_OP_EQ_uxn_opcodes_h_l1167_c11_0252_right,
BIN_OP_EQ_uxn_opcodes_h_l1167_c11_0252_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_d368
result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_d368 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_d368_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_d368_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_d368_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_d368_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1167_c7_d368
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1167_c7_d368 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1167_c7_d368_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1167_c7_d368_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1167_c7_d368_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1167_c7_d368_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1167_c7_d368
result_sp_relative_shift_MUX_uxn_opcodes_h_l1167_c7_d368 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1167_c7_d368_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1167_c7_d368_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1167_c7_d368_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1167_c7_d368_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_d368
result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_d368 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_d368_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_d368_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_d368_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_d368_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1167_c7_d368
result_stack_value_MUX_uxn_opcodes_h_l1167_c7_d368 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1167_c7_d368_cond,
result_stack_value_MUX_uxn_opcodes_h_l1167_c7_d368_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1167_c7_d368_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1167_c7_d368_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_d368
result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_d368 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_d368_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_d368_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_d368_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_d368_return_output);

-- n8_MUX_uxn_opcodes_h_l1167_c7_d368
n8_MUX_uxn_opcodes_h_l1167_c7_d368 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1167_c7_d368_cond,
n8_MUX_uxn_opcodes_h_l1167_c7_d368_iftrue,
n8_MUX_uxn_opcodes_h_l1167_c7_d368_iffalse,
n8_MUX_uxn_opcodes_h_l1167_c7_d368_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1170_c32_8b0d
BIN_OP_AND_uxn_opcodes_h_l1170_c32_8b0d : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1170_c32_8b0d_left,
BIN_OP_AND_uxn_opcodes_h_l1170_c32_8b0d_right,
BIN_OP_AND_uxn_opcodes_h_l1170_c32_8b0d_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1170_c32_6a07
BIN_OP_GT_uxn_opcodes_h_l1170_c32_6a07 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1170_c32_6a07_left,
BIN_OP_GT_uxn_opcodes_h_l1170_c32_6a07_right,
BIN_OP_GT_uxn_opcodes_h_l1170_c32_6a07_return_output);

-- MUX_uxn_opcodes_h_l1170_c32_47d5
MUX_uxn_opcodes_h_l1170_c32_47d5 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1170_c32_47d5_cond,
MUX_uxn_opcodes_h_l1170_c32_47d5_iftrue,
MUX_uxn_opcodes_h_l1170_c32_47d5_iffalse,
MUX_uxn_opcodes_h_l1170_c32_47d5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1172_c11_7845
BIN_OP_EQ_uxn_opcodes_h_l1172_c11_7845 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1172_c11_7845_left,
BIN_OP_EQ_uxn_opcodes_h_l1172_c11_7845_right,
BIN_OP_EQ_uxn_opcodes_h_l1172_c11_7845_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1172_c7_a412
result_is_stack_write_MUX_uxn_opcodes_h_l1172_c7_a412 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1172_c7_a412_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1172_c7_a412_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1172_c7_a412_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1172_c7_a412_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1172_c7_a412
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1172_c7_a412 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1172_c7_a412_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1172_c7_a412_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1172_c7_a412_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1172_c7_a412_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1172_c7_a412
result_is_opc_done_MUX_uxn_opcodes_h_l1172_c7_a412 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1172_c7_a412_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1172_c7_a412_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1172_c7_a412_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1172_c7_a412_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1172_c7_a412
result_stack_value_MUX_uxn_opcodes_h_l1172_c7_a412 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1172_c7_a412_cond,
result_stack_value_MUX_uxn_opcodes_h_l1172_c7_a412_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1172_c7_a412_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1172_c7_a412_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1172_c7_a412
result_is_sp_shift_MUX_uxn_opcodes_h_l1172_c7_a412 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1172_c7_a412_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1172_c7_a412_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1172_c7_a412_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1172_c7_a412_return_output);

-- BIN_OP_XOR_uxn_opcodes_h_l1176_c24_cd18
BIN_OP_XOR_uxn_opcodes_h_l1176_c24_cd18 : entity work.BIN_OP_XOR_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_XOR_uxn_opcodes_h_l1176_c24_cd18_left,
BIN_OP_XOR_uxn_opcodes_h_l1176_c24_cd18_right,
BIN_OP_XOR_uxn_opcodes_h_l1176_c24_cd18_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1178_c11_5c4f
BIN_OP_EQ_uxn_opcodes_h_l1178_c11_5c4f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1178_c11_5c4f_left,
BIN_OP_EQ_uxn_opcodes_h_l1178_c11_5c4f_right,
BIN_OP_EQ_uxn_opcodes_h_l1178_c11_5c4f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1178_c7_f6a2
result_is_stack_write_MUX_uxn_opcodes_h_l1178_c7_f6a2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1178_c7_f6a2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1178_c7_f6a2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1178_c7_f6a2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1178_c7_f6a2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1178_c7_f6a2
result_is_opc_done_MUX_uxn_opcodes_h_l1178_c7_f6a2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1178_c7_f6a2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1178_c7_f6a2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1178_c7_f6a2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1178_c7_f6a2_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1152_c6_4e12_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1152_c1_e3da_return_output,
 t8_MUX_uxn_opcodes_h_l1152_c2_2a8f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1152_c2_2a8f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1152_c2_2a8f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1152_c2_2a8f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1152_c2_2a8f_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1152_c2_2a8f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1152_c2_2a8f_return_output,
 n8_MUX_uxn_opcodes_h_l1152_c2_2a8f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1157_c11_33bb_return_output,
 t8_MUX_uxn_opcodes_h_l1157_c7_0a83_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1157_c7_0a83_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1157_c7_0a83_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1157_c7_0a83_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1157_c7_0a83_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1157_c7_0a83_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1157_c7_0a83_return_output,
 n8_MUX_uxn_opcodes_h_l1157_c7_0a83_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1160_c11_c7fc_return_output,
 t8_MUX_uxn_opcodes_h_l1160_c7_1218_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1160_c7_1218_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1160_c7_1218_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1160_c7_1218_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1160_c7_1218_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1160_c7_1218_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1160_c7_1218_return_output,
 n8_MUX_uxn_opcodes_h_l1160_c7_1218_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1164_c11_b8b8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1164_c7_8159_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1164_c7_8159_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1164_c7_8159_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1164_c7_8159_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1164_c7_8159_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1164_c7_8159_return_output,
 n8_MUX_uxn_opcodes_h_l1164_c7_8159_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1167_c11_0252_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_d368_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1167_c7_d368_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1167_c7_d368_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_d368_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1167_c7_d368_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_d368_return_output,
 n8_MUX_uxn_opcodes_h_l1167_c7_d368_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1170_c32_8b0d_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1170_c32_6a07_return_output,
 MUX_uxn_opcodes_h_l1170_c32_47d5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1172_c11_7845_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1172_c7_a412_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1172_c7_a412_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1172_c7_a412_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1172_c7_a412_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1172_c7_a412_return_output,
 BIN_OP_XOR_uxn_opcodes_h_l1176_c24_cd18_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1178_c11_5c4f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1178_c7_f6a2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1178_c7_f6a2_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1152_c6_4e12_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1152_c6_4e12_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1152_c6_4e12_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1152_c1_e3da_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1152_c1_e3da_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1152_c1_e3da_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1152_c1_e3da_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1152_c2_2a8f_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1152_c2_2a8f_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1157_c7_0a83_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1152_c2_2a8f_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1152_c2_2a8f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1152_c2_2a8f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1152_c2_2a8f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1157_c7_0a83_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1152_c2_2a8f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1152_c2_2a8f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1152_c2_2a8f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1154_c3_ad21 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1152_c2_2a8f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1157_c7_0a83_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1152_c2_2a8f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1152_c2_2a8f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1152_c2_2a8f_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1152_c2_2a8f_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1157_c7_0a83_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1152_c2_2a8f_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1152_c2_2a8f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1152_c2_2a8f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1152_c2_2a8f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1157_c7_0a83_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1152_c2_2a8f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1152_c2_2a8f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1152_c2_2a8f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1152_c2_2a8f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1157_c7_0a83_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1152_c2_2a8f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1152_c2_2a8f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1152_c2_2a8f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1152_c2_2a8f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1157_c7_0a83_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1152_c2_2a8f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1152_c2_2a8f_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1152_c2_2a8f_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1152_c2_2a8f_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1157_c7_0a83_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1152_c2_2a8f_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1152_c2_2a8f_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1153_c3_72cf_uxn_opcodes_h_l1153_c3_72cf_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1157_c11_33bb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1157_c11_33bb_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1157_c11_33bb_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1157_c7_0a83_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1157_c7_0a83_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1160_c7_1218_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1157_c7_0a83_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1157_c7_0a83_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1157_c7_0a83_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1160_c7_1218_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1157_c7_0a83_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1157_c7_0a83_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1158_c3_64c2 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1157_c7_0a83_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1160_c7_1218_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1157_c7_0a83_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1157_c7_0a83_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1157_c7_0a83_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1160_c7_1218_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1157_c7_0a83_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1157_c7_0a83_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1157_c7_0a83_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1160_c7_1218_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1157_c7_0a83_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1157_c7_0a83_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1157_c7_0a83_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1160_c7_1218_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1157_c7_0a83_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1157_c7_0a83_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1157_c7_0a83_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1160_c7_1218_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1157_c7_0a83_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1157_c7_0a83_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1157_c7_0a83_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1160_c7_1218_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1157_c7_0a83_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1160_c11_c7fc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1160_c11_c7fc_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1160_c11_c7fc_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1160_c7_1218_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1160_c7_1218_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1160_c7_1218_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1160_c7_1218_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1160_c7_1218_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1164_c7_8159_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1160_c7_1218_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1160_c7_1218_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1162_c3_0cf1 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1160_c7_1218_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1164_c7_8159_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1160_c7_1218_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1160_c7_1218_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1160_c7_1218_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1164_c7_8159_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1160_c7_1218_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1160_c7_1218_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1160_c7_1218_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1164_c7_8159_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1160_c7_1218_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1160_c7_1218_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1160_c7_1218_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1164_c7_8159_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1160_c7_1218_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1160_c7_1218_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1160_c7_1218_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1164_c7_8159_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1160_c7_1218_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1160_c7_1218_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1160_c7_1218_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1164_c7_8159_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1160_c7_1218_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1164_c11_b8b8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1164_c11_b8b8_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1164_c11_b8b8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1164_c7_8159_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1164_c7_8159_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_d368_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1164_c7_8159_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1164_c7_8159_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1165_c3_9e28 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1164_c7_8159_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1167_c7_d368_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1164_c7_8159_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1164_c7_8159_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1164_c7_8159_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1167_c7_d368_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1164_c7_8159_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1164_c7_8159_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1164_c7_8159_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_d368_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1164_c7_8159_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1164_c7_8159_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1164_c7_8159_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1167_c7_d368_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1164_c7_8159_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1164_c7_8159_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1164_c7_8159_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_d368_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1164_c7_8159_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1164_c7_8159_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1164_c7_8159_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1167_c7_d368_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1164_c7_8159_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1167_c11_0252_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1167_c11_0252_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1167_c11_0252_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_d368_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_d368_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1172_c7_a412_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_d368_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1167_c7_d368_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1167_c7_d368_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1172_c7_a412_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1167_c7_d368_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1167_c7_d368_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1167_c7_d368_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1167_c7_d368_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_d368_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_d368_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1172_c7_a412_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_d368_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1167_c7_d368_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1167_c7_d368_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1172_c7_a412_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1167_c7_d368_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_d368_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_d368_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1172_c7_a412_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_d368_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1167_c7_d368_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1167_c7_d368_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1167_c7_d368_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1170_c32_47d5_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1170_c32_47d5_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1170_c32_47d5_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1170_c32_8b0d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1170_c32_8b0d_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1170_c32_8b0d_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1170_c32_6a07_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1170_c32_6a07_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1170_c32_6a07_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1170_c32_47d5_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1172_c11_7845_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1172_c11_7845_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1172_c11_7845_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1172_c7_a412_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1172_c7_a412_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1178_c7_f6a2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1172_c7_a412_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1172_c7_a412_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1175_c3_0074 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1172_c7_a412_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1172_c7_a412_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1172_c7_a412_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1172_c7_a412_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1178_c7_f6a2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1172_c7_a412_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1172_c7_a412_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1172_c7_a412_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1172_c7_a412_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1172_c7_a412_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1172_c7_a412_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1172_c7_a412_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l1176_c24_cd18_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l1176_c24_cd18_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l1176_c24_cd18_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1178_c11_5c4f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1178_c11_5c4f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1178_c11_5c4f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1178_c7_f6a2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1178_c7_f6a2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1178_c7_f6a2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1178_c7_f6a2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1178_c7_f6a2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1178_c7_f6a2_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1167_l1164_l1160_l1157_l1152_l1178_DUPLICATE_b1fa_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1167_l1164_l1160_l1157_l1152_DUPLICATE_a0a6_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1172_l1167_l1164_l1160_l1157_l1152_DUPLICATE_5c85_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1172_l1164_l1160_l1157_l1152_DUPLICATE_9cea_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1172_l1167_l1164_l1160_l1157_l1178_DUPLICATE_07c9_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1167_l1172_DUPLICATE_6a08_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_53ff_uxn_opcodes_h_l1148_l1183_DUPLICATE_f290_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1165_c3_9e28 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1164_c7_8159_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1165_c3_9e28;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1152_c2_2a8f_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1178_c7_f6a2_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1164_c11_b8b8_right := to_unsigned(3, 2);
     VAR_MUX_uxn_opcodes_h_l1170_c32_47d5_iffalse := resize(to_signed(-1, 2), 8);
     VAR_MUX_uxn_opcodes_h_l1170_c32_47d5_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_BIN_OP_GT_uxn_opcodes_h_l1170_c32_6a07_right := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l1170_c32_8b0d_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1160_c11_c7fc_right := to_unsigned(2, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_d368_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1152_c1_e3da_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1178_c11_5c4f_right := to_unsigned(6, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1178_c7_f6a2_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1162_c3_0cf1 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1160_c7_1218_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1162_c3_0cf1;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1172_c11_7845_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1175_c3_0074 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1172_c7_a412_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1175_c3_0074;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1167_c11_0252_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1152_c6_4e12_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1157_c11_33bb_right := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1172_c7_a412_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1172_c7_a412_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1158_c3_64c2 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1157_c7_0a83_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1158_c3_64c2;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1154_c3_ad21 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1152_c2_2a8f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1154_c3_ad21;

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1152_c1_e3da_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1170_c32_8b0d_left := VAR_ins;
     VAR_BIN_OP_XOR_uxn_opcodes_h_l1176_c24_cd18_left := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1152_c2_2a8f_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1157_c7_0a83_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1160_c7_1218_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1164_c7_8159_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1167_c7_d368_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1152_c6_4e12_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1157_c11_33bb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1160_c11_c7fc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1164_c11_b8b8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1167_c11_0252_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1172_c11_7845_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1178_c11_5c4f_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l1167_c7_d368_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1160_c7_1218_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_XOR_uxn_opcodes_h_l1176_c24_cd18_right := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1152_c2_2a8f_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1157_c7_0a83_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1160_c7_1218_iffalse := t8;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1172_l1164_l1160_l1157_l1152_DUPLICATE_9cea LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1172_l1164_l1160_l1157_l1152_DUPLICATE_9cea_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1164_c11_b8b8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1164_c11_b8b8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1164_c11_b8b8_left;
     BIN_OP_EQ_uxn_opcodes_h_l1164_c11_b8b8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1164_c11_b8b8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1164_c11_b8b8_return_output := BIN_OP_EQ_uxn_opcodes_h_l1164_c11_b8b8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1160_c11_c7fc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1160_c11_c7fc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1160_c11_c7fc_left;
     BIN_OP_EQ_uxn_opcodes_h_l1160_c11_c7fc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1160_c11_c7fc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1160_c11_c7fc_return_output := BIN_OP_EQ_uxn_opcodes_h_l1160_c11_c7fc_return_output;

     -- BIN_OP_XOR[uxn_opcodes_h_l1176_c24_cd18] LATENCY=0
     -- Inputs
     BIN_OP_XOR_uxn_opcodes_h_l1176_c24_cd18_left <= VAR_BIN_OP_XOR_uxn_opcodes_h_l1176_c24_cd18_left;
     BIN_OP_XOR_uxn_opcodes_h_l1176_c24_cd18_right <= VAR_BIN_OP_XOR_uxn_opcodes_h_l1176_c24_cd18_right;
     -- Outputs
     VAR_BIN_OP_XOR_uxn_opcodes_h_l1176_c24_cd18_return_output := BIN_OP_XOR_uxn_opcodes_h_l1176_c24_cd18_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1167_l1172_DUPLICATE_6a08 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1167_l1172_DUPLICATE_6a08_return_output := result.stack_address_sp_offset;

     -- BIN_OP_AND[uxn_opcodes_h_l1170_c32_8b0d] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1170_c32_8b0d_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1170_c32_8b0d_left;
     BIN_OP_AND_uxn_opcodes_h_l1170_c32_8b0d_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1170_c32_8b0d_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1170_c32_8b0d_return_output := BIN_OP_AND_uxn_opcodes_h_l1170_c32_8b0d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1157_c11_33bb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1157_c11_33bb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1157_c11_33bb_left;
     BIN_OP_EQ_uxn_opcodes_h_l1157_c11_33bb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1157_c11_33bb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1157_c11_33bb_return_output := BIN_OP_EQ_uxn_opcodes_h_l1157_c11_33bb_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1172_l1167_l1164_l1160_l1157_l1152_DUPLICATE_5c85 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1172_l1167_l1164_l1160_l1157_l1152_DUPLICATE_5c85_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1152_c6_4e12] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1152_c6_4e12_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1152_c6_4e12_left;
     BIN_OP_EQ_uxn_opcodes_h_l1152_c6_4e12_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1152_c6_4e12_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1152_c6_4e12_return_output := BIN_OP_EQ_uxn_opcodes_h_l1152_c6_4e12_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1172_l1167_l1164_l1160_l1157_l1178_DUPLICATE_07c9 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1172_l1167_l1164_l1160_l1157_l1178_DUPLICATE_07c9_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1172_c11_7845] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1172_c11_7845_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1172_c11_7845_left;
     BIN_OP_EQ_uxn_opcodes_h_l1172_c11_7845_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1172_c11_7845_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1172_c11_7845_return_output := BIN_OP_EQ_uxn_opcodes_h_l1172_c11_7845_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1167_l1164_l1160_l1157_l1152_DUPLICATE_a0a6 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1167_l1164_l1160_l1157_l1152_DUPLICATE_a0a6_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1178_c11_5c4f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1178_c11_5c4f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1178_c11_5c4f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1178_c11_5c4f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1178_c11_5c4f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1178_c11_5c4f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1178_c11_5c4f_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1167_l1164_l1160_l1157_l1152_l1178_DUPLICATE_b1fa LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1167_l1164_l1160_l1157_l1152_l1178_DUPLICATE_b1fa_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1167_c11_0252] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1167_c11_0252_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1167_c11_0252_left;
     BIN_OP_EQ_uxn_opcodes_h_l1167_c11_0252_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1167_c11_0252_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1167_c11_0252_return_output := BIN_OP_EQ_uxn_opcodes_h_l1167_c11_0252_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1170_c32_6a07_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1170_c32_8b0d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1152_c1_e3da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1152_c6_4e12_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1152_c2_2a8f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1152_c6_4e12_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1152_c2_2a8f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1152_c6_4e12_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1152_c2_2a8f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1152_c6_4e12_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1152_c2_2a8f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1152_c6_4e12_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1152_c2_2a8f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1152_c6_4e12_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1152_c2_2a8f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1152_c6_4e12_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1152_c2_2a8f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1152_c6_4e12_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1152_c2_2a8f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1152_c6_4e12_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1157_c7_0a83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1157_c11_33bb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1157_c7_0a83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1157_c11_33bb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1157_c7_0a83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1157_c11_33bb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1157_c7_0a83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1157_c11_33bb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1157_c7_0a83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1157_c11_33bb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1157_c7_0a83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1157_c11_33bb_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1157_c7_0a83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1157_c11_33bb_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1157_c7_0a83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1157_c11_33bb_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1160_c7_1218_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1160_c11_c7fc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1160_c7_1218_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1160_c11_c7fc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1160_c7_1218_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1160_c11_c7fc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1160_c7_1218_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1160_c11_c7fc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1160_c7_1218_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1160_c11_c7fc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1160_c7_1218_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1160_c11_c7fc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1160_c7_1218_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1160_c11_c7fc_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1160_c7_1218_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1160_c11_c7fc_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1164_c7_8159_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1164_c11_b8b8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1164_c7_8159_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1164_c11_b8b8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1164_c7_8159_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1164_c11_b8b8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1164_c7_8159_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1164_c11_b8b8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1164_c7_8159_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1164_c11_b8b8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1164_c7_8159_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1164_c11_b8b8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1164_c7_8159_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1164_c11_b8b8_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1167_c7_d368_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1167_c11_0252_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_d368_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1167_c11_0252_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_d368_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1167_c11_0252_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_d368_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1167_c11_0252_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1167_c7_d368_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1167_c11_0252_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1167_c7_d368_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1167_c11_0252_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1167_c7_d368_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1167_c11_0252_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1172_c7_a412_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1172_c11_7845_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1172_c7_a412_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1172_c11_7845_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1172_c7_a412_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1172_c11_7845_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1172_c7_a412_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1172_c11_7845_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1172_c7_a412_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1172_c11_7845_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1178_c7_f6a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1178_c11_5c4f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1178_c7_f6a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1178_c11_5c4f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1172_c7_a412_iftrue := VAR_BIN_OP_XOR_uxn_opcodes_h_l1176_c24_cd18_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1152_c2_2a8f_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1167_l1164_l1160_l1157_l1152_DUPLICATE_a0a6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1157_c7_0a83_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1167_l1164_l1160_l1157_l1152_DUPLICATE_a0a6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1160_c7_1218_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1167_l1164_l1160_l1157_l1152_DUPLICATE_a0a6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1164_c7_8159_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1167_l1164_l1160_l1157_l1152_DUPLICATE_a0a6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1167_c7_d368_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1167_l1164_l1160_l1157_l1152_DUPLICATE_a0a6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1157_c7_0a83_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1172_l1167_l1164_l1160_l1157_l1178_DUPLICATE_07c9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1160_c7_1218_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1172_l1167_l1164_l1160_l1157_l1178_DUPLICATE_07c9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1164_c7_8159_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1172_l1167_l1164_l1160_l1157_l1178_DUPLICATE_07c9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_d368_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1172_l1167_l1164_l1160_l1157_l1178_DUPLICATE_07c9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1172_c7_a412_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1172_l1167_l1164_l1160_l1157_l1178_DUPLICATE_07c9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1178_c7_f6a2_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1172_l1167_l1164_l1160_l1157_l1178_DUPLICATE_07c9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1152_c2_2a8f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1172_l1164_l1160_l1157_l1152_DUPLICATE_9cea_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1157_c7_0a83_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1172_l1164_l1160_l1157_l1152_DUPLICATE_9cea_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1160_c7_1218_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1172_l1164_l1160_l1157_l1152_DUPLICATE_9cea_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1164_c7_8159_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1172_l1164_l1160_l1157_l1152_DUPLICATE_9cea_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1172_c7_a412_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1172_l1164_l1160_l1157_l1152_DUPLICATE_9cea_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1152_c2_2a8f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1167_l1164_l1160_l1157_l1152_l1178_DUPLICATE_b1fa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1157_c7_0a83_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1167_l1164_l1160_l1157_l1152_l1178_DUPLICATE_b1fa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1160_c7_1218_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1167_l1164_l1160_l1157_l1152_l1178_DUPLICATE_b1fa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1164_c7_8159_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1167_l1164_l1160_l1157_l1152_l1178_DUPLICATE_b1fa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_d368_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1167_l1164_l1160_l1157_l1152_l1178_DUPLICATE_b1fa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1178_c7_f6a2_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1167_l1164_l1160_l1157_l1152_l1178_DUPLICATE_b1fa_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1167_c7_d368_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1167_l1172_DUPLICATE_6a08_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1172_c7_a412_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1167_l1172_DUPLICATE_6a08_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1152_c2_2a8f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1172_l1167_l1164_l1160_l1157_l1152_DUPLICATE_5c85_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1157_c7_0a83_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1172_l1167_l1164_l1160_l1157_l1152_DUPLICATE_5c85_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1160_c7_1218_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1172_l1167_l1164_l1160_l1157_l1152_DUPLICATE_5c85_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1164_c7_8159_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1172_l1167_l1164_l1160_l1157_l1152_DUPLICATE_5c85_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1167_c7_d368_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1172_l1167_l1164_l1160_l1157_l1152_DUPLICATE_5c85_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1172_c7_a412_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1172_l1167_l1164_l1160_l1157_l1152_DUPLICATE_5c85_return_output;
     -- t8_MUX[uxn_opcodes_h_l1160_c7_1218] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1160_c7_1218_cond <= VAR_t8_MUX_uxn_opcodes_h_l1160_c7_1218_cond;
     t8_MUX_uxn_opcodes_h_l1160_c7_1218_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1160_c7_1218_iftrue;
     t8_MUX_uxn_opcodes_h_l1160_c7_1218_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1160_c7_1218_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1160_c7_1218_return_output := t8_MUX_uxn_opcodes_h_l1160_c7_1218_return_output;

     -- n8_MUX[uxn_opcodes_h_l1167_c7_d368] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1167_c7_d368_cond <= VAR_n8_MUX_uxn_opcodes_h_l1167_c7_d368_cond;
     n8_MUX_uxn_opcodes_h_l1167_c7_d368_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1167_c7_d368_iftrue;
     n8_MUX_uxn_opcodes_h_l1167_c7_d368_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1167_c7_d368_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1167_c7_d368_return_output := n8_MUX_uxn_opcodes_h_l1167_c7_d368_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1178_c7_f6a2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1178_c7_f6a2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1178_c7_f6a2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1178_c7_f6a2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1178_c7_f6a2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1178_c7_f6a2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1178_c7_f6a2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1178_c7_f6a2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1178_c7_f6a2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1178_c7_f6a2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1178_c7_f6a2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1178_c7_f6a2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1178_c7_f6a2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1178_c7_f6a2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1178_c7_f6a2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1178_c7_f6a2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1178_c7_f6a2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1178_c7_f6a2_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1172_c7_a412] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1172_c7_a412_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1172_c7_a412_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1172_c7_a412_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1172_c7_a412_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1172_c7_a412_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1172_c7_a412_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1172_c7_a412_return_output := result_stack_value_MUX_uxn_opcodes_h_l1172_c7_a412_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1170_c32_6a07] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1170_c32_6a07_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1170_c32_6a07_left;
     BIN_OP_GT_uxn_opcodes_h_l1170_c32_6a07_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1170_c32_6a07_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1170_c32_6a07_return_output := BIN_OP_GT_uxn_opcodes_h_l1170_c32_6a07_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1172_c7_a412] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1172_c7_a412_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1172_c7_a412_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1172_c7_a412_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1172_c7_a412_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1172_c7_a412_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1172_c7_a412_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1172_c7_a412_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1172_c7_a412_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1172_c7_a412] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1172_c7_a412_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1172_c7_a412_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1172_c7_a412_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1172_c7_a412_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1172_c7_a412_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1172_c7_a412_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1172_c7_a412_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1172_c7_a412_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1152_c1_e3da] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1152_c1_e3da_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1152_c1_e3da_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1152_c1_e3da_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1152_c1_e3da_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1152_c1_e3da_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1152_c1_e3da_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1152_c1_e3da_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1152_c1_e3da_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1170_c32_47d5_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1170_c32_6a07_return_output;
     VAR_printf_uxn_opcodes_h_l1153_c3_72cf_uxn_opcodes_h_l1153_c3_72cf_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1152_c1_e3da_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1164_c7_8159_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1167_c7_d368_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1172_c7_a412_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1178_c7_f6a2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_d368_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1172_c7_a412_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1172_c7_a412_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1178_c7_f6a2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1167_c7_d368_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1172_c7_a412_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1167_c7_d368_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1172_c7_a412_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1157_c7_0a83_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1160_c7_1218_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1172_c7_a412] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1172_c7_a412_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1172_c7_a412_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1172_c7_a412_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1172_c7_a412_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1172_c7_a412_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1172_c7_a412_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1172_c7_a412_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1172_c7_a412_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1167_c7_d368] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1167_c7_d368_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1167_c7_d368_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1167_c7_d368_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1167_c7_d368_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1167_c7_d368_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1167_c7_d368_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1167_c7_d368_return_output := result_stack_value_MUX_uxn_opcodes_h_l1167_c7_d368_return_output;

     -- MUX[uxn_opcodes_h_l1170_c32_47d5] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1170_c32_47d5_cond <= VAR_MUX_uxn_opcodes_h_l1170_c32_47d5_cond;
     MUX_uxn_opcodes_h_l1170_c32_47d5_iftrue <= VAR_MUX_uxn_opcodes_h_l1170_c32_47d5_iftrue;
     MUX_uxn_opcodes_h_l1170_c32_47d5_iffalse <= VAR_MUX_uxn_opcodes_h_l1170_c32_47d5_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1170_c32_47d5_return_output := MUX_uxn_opcodes_h_l1170_c32_47d5_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1167_c7_d368] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_d368_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_d368_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_d368_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_d368_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_d368_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_d368_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_d368_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_d368_return_output;

     -- t8_MUX[uxn_opcodes_h_l1157_c7_0a83] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1157_c7_0a83_cond <= VAR_t8_MUX_uxn_opcodes_h_l1157_c7_0a83_cond;
     t8_MUX_uxn_opcodes_h_l1157_c7_0a83_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1157_c7_0a83_iftrue;
     t8_MUX_uxn_opcodes_h_l1157_c7_0a83_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1157_c7_0a83_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1157_c7_0a83_return_output := t8_MUX_uxn_opcodes_h_l1157_c7_0a83_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1167_c7_d368] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1167_c7_d368_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1167_c7_d368_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1167_c7_d368_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1167_c7_d368_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1167_c7_d368_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1167_c7_d368_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1167_c7_d368_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1167_c7_d368_return_output;

     -- n8_MUX[uxn_opcodes_h_l1164_c7_8159] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1164_c7_8159_cond <= VAR_n8_MUX_uxn_opcodes_h_l1164_c7_8159_cond;
     n8_MUX_uxn_opcodes_h_l1164_c7_8159_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1164_c7_8159_iftrue;
     n8_MUX_uxn_opcodes_h_l1164_c7_8159_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1164_c7_8159_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1164_c7_8159_return_output := n8_MUX_uxn_opcodes_h_l1164_c7_8159_return_output;

     -- printf_uxn_opcodes_h_l1153_c3_72cf[uxn_opcodes_h_l1153_c3_72cf] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1153_c3_72cf_uxn_opcodes_h_l1153_c3_72cf_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1153_c3_72cf_uxn_opcodes_h_l1153_c3_72cf_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1172_c7_a412] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1172_c7_a412_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1172_c7_a412_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1172_c7_a412_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1172_c7_a412_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1172_c7_a412_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1172_c7_a412_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1172_c7_a412_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1172_c7_a412_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1167_c7_d368_iftrue := VAR_MUX_uxn_opcodes_h_l1170_c32_47d5_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1160_c7_1218_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1164_c7_8159_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_d368_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1172_c7_a412_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1164_c7_8159_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1167_c7_d368_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_d368_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1172_c7_a412_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1164_c7_8159_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1167_c7_d368_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1164_c7_8159_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1167_c7_d368_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1152_c2_2a8f_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1157_c7_0a83_return_output;
     -- n8_MUX[uxn_opcodes_h_l1160_c7_1218] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1160_c7_1218_cond <= VAR_n8_MUX_uxn_opcodes_h_l1160_c7_1218_cond;
     n8_MUX_uxn_opcodes_h_l1160_c7_1218_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1160_c7_1218_iftrue;
     n8_MUX_uxn_opcodes_h_l1160_c7_1218_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1160_c7_1218_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1160_c7_1218_return_output := n8_MUX_uxn_opcodes_h_l1160_c7_1218_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1164_c7_8159] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1164_c7_8159_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1164_c7_8159_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1164_c7_8159_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1164_c7_8159_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1164_c7_8159_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1164_c7_8159_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1164_c7_8159_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1164_c7_8159_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1167_c7_d368] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1167_c7_d368_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1167_c7_d368_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1167_c7_d368_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1167_c7_d368_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1167_c7_d368_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1167_c7_d368_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1167_c7_d368_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1167_c7_d368_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1164_c7_8159] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1164_c7_8159_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1164_c7_8159_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1164_c7_8159_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1164_c7_8159_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1164_c7_8159_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1164_c7_8159_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1164_c7_8159_return_output := result_stack_value_MUX_uxn_opcodes_h_l1164_c7_8159_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1167_c7_d368] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_d368_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_d368_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_d368_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_d368_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_d368_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_d368_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_d368_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_d368_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1167_c7_d368] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_d368_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_d368_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_d368_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_d368_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_d368_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_d368_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_d368_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_d368_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1164_c7_8159] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1164_c7_8159_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1164_c7_8159_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1164_c7_8159_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1164_c7_8159_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1164_c7_8159_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1164_c7_8159_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1164_c7_8159_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1164_c7_8159_return_output;

     -- t8_MUX[uxn_opcodes_h_l1152_c2_2a8f] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1152_c2_2a8f_cond <= VAR_t8_MUX_uxn_opcodes_h_l1152_c2_2a8f_cond;
     t8_MUX_uxn_opcodes_h_l1152_c2_2a8f_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1152_c2_2a8f_iftrue;
     t8_MUX_uxn_opcodes_h_l1152_c2_2a8f_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1152_c2_2a8f_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1152_c2_2a8f_return_output := t8_MUX_uxn_opcodes_h_l1152_c2_2a8f_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l1157_c7_0a83_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1160_c7_1218_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1164_c7_8159_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1167_c7_d368_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1160_c7_1218_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1164_c7_8159_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1164_c7_8159_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1167_c7_d368_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1164_c7_8159_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1167_c7_d368_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1160_c7_1218_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1164_c7_8159_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1160_c7_1218_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1164_c7_8159_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1152_c2_2a8f_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1164_c7_8159] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1164_c7_8159_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1164_c7_8159_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1164_c7_8159_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1164_c7_8159_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1164_c7_8159_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1164_c7_8159_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1164_c7_8159_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1164_c7_8159_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1160_c7_1218] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1160_c7_1218_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1160_c7_1218_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1160_c7_1218_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1160_c7_1218_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1160_c7_1218_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1160_c7_1218_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1160_c7_1218_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1160_c7_1218_return_output;

     -- n8_MUX[uxn_opcodes_h_l1157_c7_0a83] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1157_c7_0a83_cond <= VAR_n8_MUX_uxn_opcodes_h_l1157_c7_0a83_cond;
     n8_MUX_uxn_opcodes_h_l1157_c7_0a83_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1157_c7_0a83_iftrue;
     n8_MUX_uxn_opcodes_h_l1157_c7_0a83_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1157_c7_0a83_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1157_c7_0a83_return_output := n8_MUX_uxn_opcodes_h_l1157_c7_0a83_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1164_c7_8159] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1164_c7_8159_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1164_c7_8159_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1164_c7_8159_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1164_c7_8159_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1164_c7_8159_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1164_c7_8159_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1164_c7_8159_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1164_c7_8159_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1160_c7_1218] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1160_c7_1218_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1160_c7_1218_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1160_c7_1218_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1160_c7_1218_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1160_c7_1218_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1160_c7_1218_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1160_c7_1218_return_output := result_stack_value_MUX_uxn_opcodes_h_l1160_c7_1218_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1160_c7_1218] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1160_c7_1218_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1160_c7_1218_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1160_c7_1218_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1160_c7_1218_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1160_c7_1218_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1160_c7_1218_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1160_c7_1218_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1160_c7_1218_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1164_c7_8159] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1164_c7_8159_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1164_c7_8159_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1164_c7_8159_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1164_c7_8159_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1164_c7_8159_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1164_c7_8159_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1164_c7_8159_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1164_c7_8159_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l1152_c2_2a8f_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1157_c7_0a83_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1160_c7_1218_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1164_c7_8159_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1157_c7_0a83_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1160_c7_1218_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1160_c7_1218_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1164_c7_8159_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1160_c7_1218_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1164_c7_8159_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1157_c7_0a83_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1160_c7_1218_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1157_c7_0a83_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1160_c7_1218_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1157_c7_0a83] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1157_c7_0a83_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1157_c7_0a83_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1157_c7_0a83_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1157_c7_0a83_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1157_c7_0a83_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1157_c7_0a83_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1157_c7_0a83_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1157_c7_0a83_return_output;

     -- n8_MUX[uxn_opcodes_h_l1152_c2_2a8f] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1152_c2_2a8f_cond <= VAR_n8_MUX_uxn_opcodes_h_l1152_c2_2a8f_cond;
     n8_MUX_uxn_opcodes_h_l1152_c2_2a8f_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1152_c2_2a8f_iftrue;
     n8_MUX_uxn_opcodes_h_l1152_c2_2a8f_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1152_c2_2a8f_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1152_c2_2a8f_return_output := n8_MUX_uxn_opcodes_h_l1152_c2_2a8f_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1157_c7_0a83] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1157_c7_0a83_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1157_c7_0a83_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1157_c7_0a83_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1157_c7_0a83_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1157_c7_0a83_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1157_c7_0a83_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1157_c7_0a83_return_output := result_stack_value_MUX_uxn_opcodes_h_l1157_c7_0a83_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1160_c7_1218] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1160_c7_1218_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1160_c7_1218_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1160_c7_1218_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1160_c7_1218_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1160_c7_1218_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1160_c7_1218_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1160_c7_1218_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1160_c7_1218_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1157_c7_0a83] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1157_c7_0a83_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1157_c7_0a83_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1157_c7_0a83_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1157_c7_0a83_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1157_c7_0a83_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1157_c7_0a83_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1157_c7_0a83_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1157_c7_0a83_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1160_c7_1218] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1160_c7_1218_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1160_c7_1218_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1160_c7_1218_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1160_c7_1218_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1160_c7_1218_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1160_c7_1218_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1160_c7_1218_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1160_c7_1218_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1160_c7_1218] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1160_c7_1218_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1160_c7_1218_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1160_c7_1218_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1160_c7_1218_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1160_c7_1218_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1160_c7_1218_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1160_c7_1218_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1160_c7_1218_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l1152_c2_2a8f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1157_c7_0a83_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1160_c7_1218_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1152_c2_2a8f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1157_c7_0a83_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1157_c7_0a83_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1160_c7_1218_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1157_c7_0a83_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1160_c7_1218_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1152_c2_2a8f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1157_c7_0a83_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1152_c2_2a8f_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1157_c7_0a83_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1152_c2_2a8f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1152_c2_2a8f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1152_c2_2a8f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1152_c2_2a8f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1152_c2_2a8f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1152_c2_2a8f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1152_c2_2a8f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1152_c2_2a8f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1152_c2_2a8f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1152_c2_2a8f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1152_c2_2a8f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1152_c2_2a8f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1152_c2_2a8f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1152_c2_2a8f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1152_c2_2a8f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1152_c2_2a8f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1152_c2_2a8f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1152_c2_2a8f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1157_c7_0a83] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1157_c7_0a83_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1157_c7_0a83_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1157_c7_0a83_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1157_c7_0a83_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1157_c7_0a83_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1157_c7_0a83_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1157_c7_0a83_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1157_c7_0a83_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1152_c2_2a8f] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1152_c2_2a8f_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1152_c2_2a8f_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1152_c2_2a8f_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1152_c2_2a8f_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1152_c2_2a8f_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1152_c2_2a8f_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1152_c2_2a8f_return_output := result_stack_value_MUX_uxn_opcodes_h_l1152_c2_2a8f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1157_c7_0a83] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1157_c7_0a83_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1157_c7_0a83_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1157_c7_0a83_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1157_c7_0a83_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1157_c7_0a83_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1157_c7_0a83_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1157_c7_0a83_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1157_c7_0a83_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1157_c7_0a83] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1157_c7_0a83_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1157_c7_0a83_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1157_c7_0a83_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1157_c7_0a83_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1157_c7_0a83_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1157_c7_0a83_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1157_c7_0a83_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1157_c7_0a83_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1152_c2_2a8f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1157_c7_0a83_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1152_c2_2a8f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1157_c7_0a83_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1152_c2_2a8f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1157_c7_0a83_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1152_c2_2a8f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1152_c2_2a8f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1152_c2_2a8f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1152_c2_2a8f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1152_c2_2a8f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1152_c2_2a8f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1152_c2_2a8f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1152_c2_2a8f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1152_c2_2a8f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1152_c2_2a8f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1152_c2_2a8f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1152_c2_2a8f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1152_c2_2a8f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1152_c2_2a8f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1152_c2_2a8f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1152_c2_2a8f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1152_c2_2a8f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1152_c2_2a8f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1152_c2_2a8f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1152_c2_2a8f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1152_c2_2a8f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1152_c2_2a8f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1152_c2_2a8f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1152_c2_2a8f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1152_c2_2a8f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1152_c2_2a8f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1152_c2_2a8f_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_53ff_uxn_opcodes_h_l1148_l1183_DUPLICATE_f290 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_53ff_uxn_opcodes_h_l1148_l1183_DUPLICATE_f290_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_53ff(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1152_c2_2a8f_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1152_c2_2a8f_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1152_c2_2a8f_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1152_c2_2a8f_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1152_c2_2a8f_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1152_c2_2a8f_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_53ff_uxn_opcodes_h_l1148_l1183_DUPLICATE_f290_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_53ff_uxn_opcodes_h_l1148_l1183_DUPLICATE_f290_return_output;
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
