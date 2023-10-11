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
-- BIN_OP_EQ[uxn_opcodes_h_l1156_c6_1c42]
signal BIN_OP_EQ_uxn_opcodes_h_l1156_c6_1c42_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1156_c6_1c42_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1156_c6_1c42_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1156_c1_4d63]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1156_c1_4d63_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1156_c1_4d63_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1156_c1_4d63_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1156_c1_4d63_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1156_c2_6168]
signal n8_MUX_uxn_opcodes_h_l1156_c2_6168_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1156_c2_6168_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1156_c2_6168_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1156_c2_6168_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1156_c2_6168]
signal t8_MUX_uxn_opcodes_h_l1156_c2_6168_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1156_c2_6168_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1156_c2_6168_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1156_c2_6168_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1156_c2_6168]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1156_c2_6168_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1156_c2_6168_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1156_c2_6168_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1156_c2_6168_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1156_c2_6168]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1156_c2_6168_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1156_c2_6168_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1156_c2_6168_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1156_c2_6168_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1156_c2_6168]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1156_c2_6168_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1156_c2_6168_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1156_c2_6168_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1156_c2_6168_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1156_c2_6168]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1156_c2_6168_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1156_c2_6168_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1156_c2_6168_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1156_c2_6168_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1156_c2_6168]
signal result_stack_value_MUX_uxn_opcodes_h_l1156_c2_6168_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1156_c2_6168_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1156_c2_6168_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1156_c2_6168_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1156_c2_6168]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1156_c2_6168_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1156_c2_6168_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1156_c2_6168_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1156_c2_6168_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l1157_c3_2932[uxn_opcodes_h_l1157_c3_2932]
signal printf_uxn_opcodes_h_l1157_c3_2932_uxn_opcodes_h_l1157_c3_2932_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1161_c11_480f]
signal BIN_OP_EQ_uxn_opcodes_h_l1161_c11_480f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1161_c11_480f_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1161_c11_480f_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1161_c7_43f0]
signal n8_MUX_uxn_opcodes_h_l1161_c7_43f0_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1161_c7_43f0_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1161_c7_43f0_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1161_c7_43f0_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1161_c7_43f0]
signal t8_MUX_uxn_opcodes_h_l1161_c7_43f0_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1161_c7_43f0_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1161_c7_43f0_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1161_c7_43f0_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1161_c7_43f0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_43f0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_43f0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_43f0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_43f0_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1161_c7_43f0]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1161_c7_43f0_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1161_c7_43f0_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1161_c7_43f0_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1161_c7_43f0_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1161_c7_43f0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1161_c7_43f0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1161_c7_43f0_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1161_c7_43f0_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1161_c7_43f0_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1161_c7_43f0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1161_c7_43f0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1161_c7_43f0_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1161_c7_43f0_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1161_c7_43f0_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1161_c7_43f0]
signal result_stack_value_MUX_uxn_opcodes_h_l1161_c7_43f0_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1161_c7_43f0_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1161_c7_43f0_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1161_c7_43f0_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1161_c7_43f0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_43f0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_43f0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_43f0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_43f0_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1164_c11_568c]
signal BIN_OP_EQ_uxn_opcodes_h_l1164_c11_568c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1164_c11_568c_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1164_c11_568c_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1164_c7_1f6f]
signal n8_MUX_uxn_opcodes_h_l1164_c7_1f6f_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1164_c7_1f6f_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1164_c7_1f6f_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1164_c7_1f6f_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1164_c7_1f6f]
signal t8_MUX_uxn_opcodes_h_l1164_c7_1f6f_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1164_c7_1f6f_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1164_c7_1f6f_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1164_c7_1f6f_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1164_c7_1f6f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1164_c7_1f6f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1164_c7_1f6f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1164_c7_1f6f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1164_c7_1f6f_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1164_c7_1f6f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1164_c7_1f6f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1164_c7_1f6f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1164_c7_1f6f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1164_c7_1f6f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1164_c7_1f6f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1164_c7_1f6f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1164_c7_1f6f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1164_c7_1f6f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1164_c7_1f6f_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1164_c7_1f6f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1164_c7_1f6f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1164_c7_1f6f_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1164_c7_1f6f_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1164_c7_1f6f_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1164_c7_1f6f]
signal result_stack_value_MUX_uxn_opcodes_h_l1164_c7_1f6f_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1164_c7_1f6f_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1164_c7_1f6f_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1164_c7_1f6f_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1164_c7_1f6f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1164_c7_1f6f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1164_c7_1f6f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1164_c7_1f6f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1164_c7_1f6f_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1168_c11_48b0]
signal BIN_OP_EQ_uxn_opcodes_h_l1168_c11_48b0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1168_c11_48b0_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1168_c11_48b0_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1168_c7_8254]
signal n8_MUX_uxn_opcodes_h_l1168_c7_8254_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1168_c7_8254_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1168_c7_8254_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1168_c7_8254_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1168_c7_8254]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1168_c7_8254_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1168_c7_8254_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1168_c7_8254_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1168_c7_8254_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1168_c7_8254]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1168_c7_8254_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1168_c7_8254_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1168_c7_8254_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1168_c7_8254_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1168_c7_8254]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1168_c7_8254_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1168_c7_8254_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1168_c7_8254_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1168_c7_8254_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1168_c7_8254]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1168_c7_8254_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1168_c7_8254_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1168_c7_8254_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1168_c7_8254_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1168_c7_8254]
signal result_stack_value_MUX_uxn_opcodes_h_l1168_c7_8254_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1168_c7_8254_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1168_c7_8254_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1168_c7_8254_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1168_c7_8254]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1168_c7_8254_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1168_c7_8254_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1168_c7_8254_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1168_c7_8254_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1171_c11_5fe8]
signal BIN_OP_EQ_uxn_opcodes_h_l1171_c11_5fe8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1171_c11_5fe8_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1171_c11_5fe8_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1171_c7_7333]
signal n8_MUX_uxn_opcodes_h_l1171_c7_7333_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1171_c7_7333_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1171_c7_7333_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1171_c7_7333_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1171_c7_7333]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1171_c7_7333_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1171_c7_7333_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1171_c7_7333_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1171_c7_7333_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1171_c7_7333]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1171_c7_7333_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1171_c7_7333_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1171_c7_7333_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1171_c7_7333_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1171_c7_7333]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1171_c7_7333_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1171_c7_7333_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1171_c7_7333_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1171_c7_7333_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1171_c7_7333]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1171_c7_7333_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1171_c7_7333_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1171_c7_7333_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1171_c7_7333_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1171_c7_7333]
signal result_stack_value_MUX_uxn_opcodes_h_l1171_c7_7333_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1171_c7_7333_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1171_c7_7333_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1171_c7_7333_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1171_c7_7333]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1171_c7_7333_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1171_c7_7333_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1171_c7_7333_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1171_c7_7333_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1174_c32_5ca9]
signal BIN_OP_AND_uxn_opcodes_h_l1174_c32_5ca9_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1174_c32_5ca9_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1174_c32_5ca9_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1174_c32_4948]
signal BIN_OP_GT_uxn_opcodes_h_l1174_c32_4948_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1174_c32_4948_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1174_c32_4948_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1174_c32_d497]
signal MUX_uxn_opcodes_h_l1174_c32_d497_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1174_c32_d497_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1174_c32_d497_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1174_c32_d497_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1176_c11_8222]
signal BIN_OP_EQ_uxn_opcodes_h_l1176_c11_8222_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1176_c11_8222_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1176_c11_8222_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1176_c7_eac1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1176_c7_eac1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1176_c7_eac1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1176_c7_eac1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1176_c7_eac1_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1176_c7_eac1]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1176_c7_eac1_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1176_c7_eac1_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1176_c7_eac1_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1176_c7_eac1_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1176_c7_eac1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1176_c7_eac1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1176_c7_eac1_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1176_c7_eac1_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1176_c7_eac1_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1176_c7_eac1]
signal result_stack_value_MUX_uxn_opcodes_h_l1176_c7_eac1_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1176_c7_eac1_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1176_c7_eac1_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1176_c7_eac1_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1176_c7_eac1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1176_c7_eac1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1176_c7_eac1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1176_c7_eac1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1176_c7_eac1_return_output : unsigned(0 downto 0);

-- BIN_OP_XOR[uxn_opcodes_h_l1180_c24_82d7]
signal BIN_OP_XOR_uxn_opcodes_h_l1180_c24_82d7_left : unsigned(7 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l1180_c24_82d7_right : unsigned(7 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l1180_c24_82d7_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1182_c11_91a3]
signal BIN_OP_EQ_uxn_opcodes_h_l1182_c11_91a3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1182_c11_91a3_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1182_c11_91a3_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1182_c7_2f1c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1182_c7_2f1c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1182_c7_2f1c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1182_c7_2f1c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1182_c7_2f1c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1182_c7_2f1c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1182_c7_2f1c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1182_c7_2f1c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1182_c7_2f1c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1182_c7_2f1c_return_output : unsigned(0 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_09c5( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : signed;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_stack_write := ref_toks_1;
      base.is_sp_shift := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.sp_relative_shift := ref_toks_4;
      base.stack_value := ref_toks_5;
      base.is_opc_done := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1156_c6_1c42
BIN_OP_EQ_uxn_opcodes_h_l1156_c6_1c42 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1156_c6_1c42_left,
BIN_OP_EQ_uxn_opcodes_h_l1156_c6_1c42_right,
BIN_OP_EQ_uxn_opcodes_h_l1156_c6_1c42_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1156_c1_4d63
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1156_c1_4d63 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1156_c1_4d63_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1156_c1_4d63_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1156_c1_4d63_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1156_c1_4d63_return_output);

-- n8_MUX_uxn_opcodes_h_l1156_c2_6168
n8_MUX_uxn_opcodes_h_l1156_c2_6168 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1156_c2_6168_cond,
n8_MUX_uxn_opcodes_h_l1156_c2_6168_iftrue,
n8_MUX_uxn_opcodes_h_l1156_c2_6168_iffalse,
n8_MUX_uxn_opcodes_h_l1156_c2_6168_return_output);

-- t8_MUX_uxn_opcodes_h_l1156_c2_6168
t8_MUX_uxn_opcodes_h_l1156_c2_6168 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1156_c2_6168_cond,
t8_MUX_uxn_opcodes_h_l1156_c2_6168_iftrue,
t8_MUX_uxn_opcodes_h_l1156_c2_6168_iffalse,
t8_MUX_uxn_opcodes_h_l1156_c2_6168_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1156_c2_6168
result_is_stack_write_MUX_uxn_opcodes_h_l1156_c2_6168 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1156_c2_6168_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1156_c2_6168_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1156_c2_6168_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1156_c2_6168_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1156_c2_6168
result_is_sp_shift_MUX_uxn_opcodes_h_l1156_c2_6168 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1156_c2_6168_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1156_c2_6168_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1156_c2_6168_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1156_c2_6168_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1156_c2_6168
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1156_c2_6168 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1156_c2_6168_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1156_c2_6168_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1156_c2_6168_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1156_c2_6168_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1156_c2_6168
result_sp_relative_shift_MUX_uxn_opcodes_h_l1156_c2_6168 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1156_c2_6168_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1156_c2_6168_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1156_c2_6168_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1156_c2_6168_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1156_c2_6168
result_stack_value_MUX_uxn_opcodes_h_l1156_c2_6168 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1156_c2_6168_cond,
result_stack_value_MUX_uxn_opcodes_h_l1156_c2_6168_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1156_c2_6168_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1156_c2_6168_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1156_c2_6168
result_is_opc_done_MUX_uxn_opcodes_h_l1156_c2_6168 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1156_c2_6168_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1156_c2_6168_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1156_c2_6168_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1156_c2_6168_return_output);

-- printf_uxn_opcodes_h_l1157_c3_2932_uxn_opcodes_h_l1157_c3_2932
printf_uxn_opcodes_h_l1157_c3_2932_uxn_opcodes_h_l1157_c3_2932 : entity work.printf_uxn_opcodes_h_l1157_c3_2932_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1157_c3_2932_uxn_opcodes_h_l1157_c3_2932_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1161_c11_480f
BIN_OP_EQ_uxn_opcodes_h_l1161_c11_480f : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1161_c11_480f_left,
BIN_OP_EQ_uxn_opcodes_h_l1161_c11_480f_right,
BIN_OP_EQ_uxn_opcodes_h_l1161_c11_480f_return_output);

-- n8_MUX_uxn_opcodes_h_l1161_c7_43f0
n8_MUX_uxn_opcodes_h_l1161_c7_43f0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1161_c7_43f0_cond,
n8_MUX_uxn_opcodes_h_l1161_c7_43f0_iftrue,
n8_MUX_uxn_opcodes_h_l1161_c7_43f0_iffalse,
n8_MUX_uxn_opcodes_h_l1161_c7_43f0_return_output);

-- t8_MUX_uxn_opcodes_h_l1161_c7_43f0
t8_MUX_uxn_opcodes_h_l1161_c7_43f0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1161_c7_43f0_cond,
t8_MUX_uxn_opcodes_h_l1161_c7_43f0_iftrue,
t8_MUX_uxn_opcodes_h_l1161_c7_43f0_iffalse,
t8_MUX_uxn_opcodes_h_l1161_c7_43f0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_43f0
result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_43f0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_43f0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_43f0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_43f0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_43f0_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1161_c7_43f0
result_is_sp_shift_MUX_uxn_opcodes_h_l1161_c7_43f0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1161_c7_43f0_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1161_c7_43f0_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1161_c7_43f0_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1161_c7_43f0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1161_c7_43f0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1161_c7_43f0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1161_c7_43f0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1161_c7_43f0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1161_c7_43f0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1161_c7_43f0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1161_c7_43f0
result_sp_relative_shift_MUX_uxn_opcodes_h_l1161_c7_43f0 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1161_c7_43f0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1161_c7_43f0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1161_c7_43f0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1161_c7_43f0_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1161_c7_43f0
result_stack_value_MUX_uxn_opcodes_h_l1161_c7_43f0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1161_c7_43f0_cond,
result_stack_value_MUX_uxn_opcodes_h_l1161_c7_43f0_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1161_c7_43f0_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1161_c7_43f0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_43f0
result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_43f0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_43f0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_43f0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_43f0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_43f0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1164_c11_568c
BIN_OP_EQ_uxn_opcodes_h_l1164_c11_568c : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1164_c11_568c_left,
BIN_OP_EQ_uxn_opcodes_h_l1164_c11_568c_right,
BIN_OP_EQ_uxn_opcodes_h_l1164_c11_568c_return_output);

-- n8_MUX_uxn_opcodes_h_l1164_c7_1f6f
n8_MUX_uxn_opcodes_h_l1164_c7_1f6f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1164_c7_1f6f_cond,
n8_MUX_uxn_opcodes_h_l1164_c7_1f6f_iftrue,
n8_MUX_uxn_opcodes_h_l1164_c7_1f6f_iffalse,
n8_MUX_uxn_opcodes_h_l1164_c7_1f6f_return_output);

-- t8_MUX_uxn_opcodes_h_l1164_c7_1f6f
t8_MUX_uxn_opcodes_h_l1164_c7_1f6f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1164_c7_1f6f_cond,
t8_MUX_uxn_opcodes_h_l1164_c7_1f6f_iftrue,
t8_MUX_uxn_opcodes_h_l1164_c7_1f6f_iffalse,
t8_MUX_uxn_opcodes_h_l1164_c7_1f6f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1164_c7_1f6f
result_is_stack_write_MUX_uxn_opcodes_h_l1164_c7_1f6f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1164_c7_1f6f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1164_c7_1f6f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1164_c7_1f6f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1164_c7_1f6f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1164_c7_1f6f
result_is_sp_shift_MUX_uxn_opcodes_h_l1164_c7_1f6f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1164_c7_1f6f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1164_c7_1f6f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1164_c7_1f6f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1164_c7_1f6f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1164_c7_1f6f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1164_c7_1f6f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1164_c7_1f6f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1164_c7_1f6f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1164_c7_1f6f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1164_c7_1f6f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1164_c7_1f6f
result_sp_relative_shift_MUX_uxn_opcodes_h_l1164_c7_1f6f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1164_c7_1f6f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1164_c7_1f6f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1164_c7_1f6f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1164_c7_1f6f_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1164_c7_1f6f
result_stack_value_MUX_uxn_opcodes_h_l1164_c7_1f6f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1164_c7_1f6f_cond,
result_stack_value_MUX_uxn_opcodes_h_l1164_c7_1f6f_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1164_c7_1f6f_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1164_c7_1f6f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1164_c7_1f6f
result_is_opc_done_MUX_uxn_opcodes_h_l1164_c7_1f6f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1164_c7_1f6f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1164_c7_1f6f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1164_c7_1f6f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1164_c7_1f6f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1168_c11_48b0
BIN_OP_EQ_uxn_opcodes_h_l1168_c11_48b0 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1168_c11_48b0_left,
BIN_OP_EQ_uxn_opcodes_h_l1168_c11_48b0_right,
BIN_OP_EQ_uxn_opcodes_h_l1168_c11_48b0_return_output);

-- n8_MUX_uxn_opcodes_h_l1168_c7_8254
n8_MUX_uxn_opcodes_h_l1168_c7_8254 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1168_c7_8254_cond,
n8_MUX_uxn_opcodes_h_l1168_c7_8254_iftrue,
n8_MUX_uxn_opcodes_h_l1168_c7_8254_iffalse,
n8_MUX_uxn_opcodes_h_l1168_c7_8254_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1168_c7_8254
result_is_stack_write_MUX_uxn_opcodes_h_l1168_c7_8254 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1168_c7_8254_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1168_c7_8254_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1168_c7_8254_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1168_c7_8254_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1168_c7_8254
result_is_sp_shift_MUX_uxn_opcodes_h_l1168_c7_8254 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1168_c7_8254_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1168_c7_8254_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1168_c7_8254_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1168_c7_8254_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1168_c7_8254
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1168_c7_8254 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1168_c7_8254_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1168_c7_8254_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1168_c7_8254_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1168_c7_8254_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1168_c7_8254
result_sp_relative_shift_MUX_uxn_opcodes_h_l1168_c7_8254 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1168_c7_8254_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1168_c7_8254_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1168_c7_8254_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1168_c7_8254_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1168_c7_8254
result_stack_value_MUX_uxn_opcodes_h_l1168_c7_8254 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1168_c7_8254_cond,
result_stack_value_MUX_uxn_opcodes_h_l1168_c7_8254_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1168_c7_8254_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1168_c7_8254_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1168_c7_8254
result_is_opc_done_MUX_uxn_opcodes_h_l1168_c7_8254 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1168_c7_8254_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1168_c7_8254_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1168_c7_8254_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1168_c7_8254_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1171_c11_5fe8
BIN_OP_EQ_uxn_opcodes_h_l1171_c11_5fe8 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1171_c11_5fe8_left,
BIN_OP_EQ_uxn_opcodes_h_l1171_c11_5fe8_right,
BIN_OP_EQ_uxn_opcodes_h_l1171_c11_5fe8_return_output);

-- n8_MUX_uxn_opcodes_h_l1171_c7_7333
n8_MUX_uxn_opcodes_h_l1171_c7_7333 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1171_c7_7333_cond,
n8_MUX_uxn_opcodes_h_l1171_c7_7333_iftrue,
n8_MUX_uxn_opcodes_h_l1171_c7_7333_iffalse,
n8_MUX_uxn_opcodes_h_l1171_c7_7333_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1171_c7_7333
result_is_stack_write_MUX_uxn_opcodes_h_l1171_c7_7333 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1171_c7_7333_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1171_c7_7333_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1171_c7_7333_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1171_c7_7333_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1171_c7_7333
result_is_sp_shift_MUX_uxn_opcodes_h_l1171_c7_7333 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1171_c7_7333_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1171_c7_7333_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1171_c7_7333_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1171_c7_7333_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1171_c7_7333
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1171_c7_7333 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1171_c7_7333_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1171_c7_7333_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1171_c7_7333_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1171_c7_7333_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1171_c7_7333
result_sp_relative_shift_MUX_uxn_opcodes_h_l1171_c7_7333 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1171_c7_7333_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1171_c7_7333_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1171_c7_7333_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1171_c7_7333_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1171_c7_7333
result_stack_value_MUX_uxn_opcodes_h_l1171_c7_7333 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1171_c7_7333_cond,
result_stack_value_MUX_uxn_opcodes_h_l1171_c7_7333_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1171_c7_7333_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1171_c7_7333_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1171_c7_7333
result_is_opc_done_MUX_uxn_opcodes_h_l1171_c7_7333 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1171_c7_7333_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1171_c7_7333_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1171_c7_7333_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1171_c7_7333_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1174_c32_5ca9
BIN_OP_AND_uxn_opcodes_h_l1174_c32_5ca9 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1174_c32_5ca9_left,
BIN_OP_AND_uxn_opcodes_h_l1174_c32_5ca9_right,
BIN_OP_AND_uxn_opcodes_h_l1174_c32_5ca9_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1174_c32_4948
BIN_OP_GT_uxn_opcodes_h_l1174_c32_4948 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1174_c32_4948_left,
BIN_OP_GT_uxn_opcodes_h_l1174_c32_4948_right,
BIN_OP_GT_uxn_opcodes_h_l1174_c32_4948_return_output);

-- MUX_uxn_opcodes_h_l1174_c32_d497
MUX_uxn_opcodes_h_l1174_c32_d497 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1174_c32_d497_cond,
MUX_uxn_opcodes_h_l1174_c32_d497_iftrue,
MUX_uxn_opcodes_h_l1174_c32_d497_iffalse,
MUX_uxn_opcodes_h_l1174_c32_d497_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1176_c11_8222
BIN_OP_EQ_uxn_opcodes_h_l1176_c11_8222 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1176_c11_8222_left,
BIN_OP_EQ_uxn_opcodes_h_l1176_c11_8222_right,
BIN_OP_EQ_uxn_opcodes_h_l1176_c11_8222_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1176_c7_eac1
result_is_stack_write_MUX_uxn_opcodes_h_l1176_c7_eac1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1176_c7_eac1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1176_c7_eac1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1176_c7_eac1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1176_c7_eac1_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1176_c7_eac1
result_is_sp_shift_MUX_uxn_opcodes_h_l1176_c7_eac1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1176_c7_eac1_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1176_c7_eac1_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1176_c7_eac1_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1176_c7_eac1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1176_c7_eac1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1176_c7_eac1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1176_c7_eac1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1176_c7_eac1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1176_c7_eac1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1176_c7_eac1_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1176_c7_eac1
result_stack_value_MUX_uxn_opcodes_h_l1176_c7_eac1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1176_c7_eac1_cond,
result_stack_value_MUX_uxn_opcodes_h_l1176_c7_eac1_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1176_c7_eac1_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1176_c7_eac1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1176_c7_eac1
result_is_opc_done_MUX_uxn_opcodes_h_l1176_c7_eac1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1176_c7_eac1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1176_c7_eac1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1176_c7_eac1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1176_c7_eac1_return_output);

-- BIN_OP_XOR_uxn_opcodes_h_l1180_c24_82d7
BIN_OP_XOR_uxn_opcodes_h_l1180_c24_82d7 : entity work.BIN_OP_XOR_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_XOR_uxn_opcodes_h_l1180_c24_82d7_left,
BIN_OP_XOR_uxn_opcodes_h_l1180_c24_82d7_right,
BIN_OP_XOR_uxn_opcodes_h_l1180_c24_82d7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1182_c11_91a3
BIN_OP_EQ_uxn_opcodes_h_l1182_c11_91a3 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1182_c11_91a3_left,
BIN_OP_EQ_uxn_opcodes_h_l1182_c11_91a3_right,
BIN_OP_EQ_uxn_opcodes_h_l1182_c11_91a3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1182_c7_2f1c
result_is_stack_write_MUX_uxn_opcodes_h_l1182_c7_2f1c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1182_c7_2f1c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1182_c7_2f1c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1182_c7_2f1c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1182_c7_2f1c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1182_c7_2f1c
result_is_opc_done_MUX_uxn_opcodes_h_l1182_c7_2f1c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1182_c7_2f1c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1182_c7_2f1c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1182_c7_2f1c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1182_c7_2f1c_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1156_c6_1c42_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1156_c1_4d63_return_output,
 n8_MUX_uxn_opcodes_h_l1156_c2_6168_return_output,
 t8_MUX_uxn_opcodes_h_l1156_c2_6168_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1156_c2_6168_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1156_c2_6168_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1156_c2_6168_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1156_c2_6168_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1156_c2_6168_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1156_c2_6168_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1161_c11_480f_return_output,
 n8_MUX_uxn_opcodes_h_l1161_c7_43f0_return_output,
 t8_MUX_uxn_opcodes_h_l1161_c7_43f0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_43f0_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1161_c7_43f0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1161_c7_43f0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1161_c7_43f0_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1161_c7_43f0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_43f0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1164_c11_568c_return_output,
 n8_MUX_uxn_opcodes_h_l1164_c7_1f6f_return_output,
 t8_MUX_uxn_opcodes_h_l1164_c7_1f6f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1164_c7_1f6f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1164_c7_1f6f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1164_c7_1f6f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1164_c7_1f6f_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1164_c7_1f6f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1164_c7_1f6f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1168_c11_48b0_return_output,
 n8_MUX_uxn_opcodes_h_l1168_c7_8254_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1168_c7_8254_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1168_c7_8254_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1168_c7_8254_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1168_c7_8254_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1168_c7_8254_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1168_c7_8254_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1171_c11_5fe8_return_output,
 n8_MUX_uxn_opcodes_h_l1171_c7_7333_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1171_c7_7333_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1171_c7_7333_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1171_c7_7333_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1171_c7_7333_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1171_c7_7333_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1171_c7_7333_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1174_c32_5ca9_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1174_c32_4948_return_output,
 MUX_uxn_opcodes_h_l1174_c32_d497_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1176_c11_8222_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1176_c7_eac1_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1176_c7_eac1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1176_c7_eac1_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1176_c7_eac1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1176_c7_eac1_return_output,
 BIN_OP_XOR_uxn_opcodes_h_l1180_c24_82d7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1182_c11_91a3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1182_c7_2f1c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1182_c7_2f1c_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1156_c6_1c42_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1156_c6_1c42_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1156_c6_1c42_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1156_c1_4d63_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1156_c1_4d63_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1156_c1_4d63_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1156_c1_4d63_iffalse : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1156_c2_6168_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1156_c2_6168_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1161_c7_43f0_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1156_c2_6168_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1156_c2_6168_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1156_c2_6168_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1156_c2_6168_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1161_c7_43f0_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1156_c2_6168_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1156_c2_6168_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1156_c2_6168_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1156_c2_6168_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_43f0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1156_c2_6168_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1156_c2_6168_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1156_c2_6168_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1156_c2_6168_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1161_c7_43f0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1156_c2_6168_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1156_c2_6168_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1156_c2_6168_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1158_c3_cf14 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1156_c2_6168_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1161_c7_43f0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1156_c2_6168_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1156_c2_6168_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1156_c2_6168_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1156_c2_6168_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1161_c7_43f0_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1156_c2_6168_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1156_c2_6168_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1156_c2_6168_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1156_c2_6168_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1161_c7_43f0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1156_c2_6168_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1156_c2_6168_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1156_c2_6168_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1156_c2_6168_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_43f0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1156_c2_6168_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1156_c2_6168_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1157_c3_2932_uxn_opcodes_h_l1157_c3_2932_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1161_c11_480f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1161_c11_480f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1161_c11_480f_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1161_c7_43f0_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1161_c7_43f0_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1164_c7_1f6f_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1161_c7_43f0_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1161_c7_43f0_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1161_c7_43f0_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1164_c7_1f6f_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1161_c7_43f0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_43f0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_43f0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1164_c7_1f6f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_43f0_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1161_c7_43f0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1161_c7_43f0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1164_c7_1f6f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1161_c7_43f0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1161_c7_43f0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1162_c3_aa65 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1161_c7_43f0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1164_c7_1f6f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1161_c7_43f0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1161_c7_43f0_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1161_c7_43f0_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1164_c7_1f6f_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1161_c7_43f0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1161_c7_43f0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1161_c7_43f0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1164_c7_1f6f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1161_c7_43f0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_43f0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_43f0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1164_c7_1f6f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_43f0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1164_c11_568c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1164_c11_568c_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1164_c11_568c_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1164_c7_1f6f_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1164_c7_1f6f_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1168_c7_8254_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1164_c7_1f6f_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1164_c7_1f6f_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1164_c7_1f6f_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1164_c7_1f6f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1164_c7_1f6f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1164_c7_1f6f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1168_c7_8254_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1164_c7_1f6f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1164_c7_1f6f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1164_c7_1f6f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1168_c7_8254_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1164_c7_1f6f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1164_c7_1f6f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1166_c3_aa18 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1164_c7_1f6f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1168_c7_8254_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1164_c7_1f6f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1164_c7_1f6f_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1164_c7_1f6f_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1168_c7_8254_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1164_c7_1f6f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1164_c7_1f6f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1164_c7_1f6f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1168_c7_8254_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1164_c7_1f6f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1164_c7_1f6f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1164_c7_1f6f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1168_c7_8254_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1164_c7_1f6f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1168_c11_48b0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1168_c11_48b0_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1168_c11_48b0_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1168_c7_8254_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1168_c7_8254_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1171_c7_7333_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1168_c7_8254_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1168_c7_8254_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1168_c7_8254_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1171_c7_7333_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1168_c7_8254_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1168_c7_8254_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1168_c7_8254_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1171_c7_7333_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1168_c7_8254_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1168_c7_8254_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1169_c3_f99c : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1168_c7_8254_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1171_c7_7333_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1168_c7_8254_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1168_c7_8254_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1168_c7_8254_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1171_c7_7333_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1168_c7_8254_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1168_c7_8254_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1168_c7_8254_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1171_c7_7333_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1168_c7_8254_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1168_c7_8254_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1168_c7_8254_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1171_c7_7333_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1168_c7_8254_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1171_c11_5fe8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1171_c11_5fe8_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1171_c11_5fe8_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1171_c7_7333_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1171_c7_7333_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1171_c7_7333_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1171_c7_7333_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1171_c7_7333_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1176_c7_eac1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1171_c7_7333_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1171_c7_7333_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1171_c7_7333_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1176_c7_eac1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1171_c7_7333_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1171_c7_7333_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1171_c7_7333_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1176_c7_eac1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1171_c7_7333_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1171_c7_7333_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1171_c7_7333_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1171_c7_7333_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1171_c7_7333_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1171_c7_7333_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1176_c7_eac1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1171_c7_7333_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1171_c7_7333_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1171_c7_7333_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1176_c7_eac1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1171_c7_7333_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1174_c32_d497_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1174_c32_d497_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1174_c32_d497_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1174_c32_5ca9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1174_c32_5ca9_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1174_c32_5ca9_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1174_c32_4948_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1174_c32_4948_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1174_c32_4948_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1174_c32_d497_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1176_c11_8222_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1176_c11_8222_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1176_c11_8222_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1176_c7_eac1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1176_c7_eac1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1182_c7_2f1c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1176_c7_eac1_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1176_c7_eac1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1176_c7_eac1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1176_c7_eac1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1176_c7_eac1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1179_c3_8593 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1176_c7_eac1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1176_c7_eac1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1176_c7_eac1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1176_c7_eac1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1176_c7_eac1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1176_c7_eac1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1176_c7_eac1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1182_c7_2f1c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1176_c7_eac1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l1180_c24_82d7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l1180_c24_82d7_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l1180_c24_82d7_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1182_c11_91a3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1182_c11_91a3_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1182_c11_91a3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1182_c7_2f1c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1182_c7_2f1c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1182_c7_2f1c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1182_c7_2f1c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1182_c7_2f1c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1182_c7_2f1c_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1171_l1168_l1164_l1161_l1156_l1182_DUPLICATE_87d1_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1168_l1164_l1161_l1156_l1176_DUPLICATE_cbd2_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1171_l1168_l1164_l1161_l1156_DUPLICATE_aae9_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1171_l1168_l1164_l1161_l1156_l1176_DUPLICATE_3fcd_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1171_l1168_l1164_l1161_l1182_l1176_DUPLICATE_c4fb_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1171_l1176_DUPLICATE_2c51_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_09c5_uxn_opcodes_h_l1187_l1152_DUPLICATE_6803_return_output : opcode_result_t;
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
     VAR_MUX_uxn_opcodes_h_l1174_c32_d497_iffalse := resize(to_signed(-1, 2), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1162_c3_aa65 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1161_c7_43f0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1162_c3_aa65;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1169_c3_f99c := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1168_c7_8254_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1169_c3_f99c;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1174_c32_5ca9_right := to_unsigned(128, 8);
     VAR_BIN_OP_GT_uxn_opcodes_h_l1174_c32_4948_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1161_c11_480f_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1179_c3_8593 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1176_c7_eac1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1179_c3_8593;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1156_c1_4d63_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1158_c3_cf14 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1156_c2_6168_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1158_c3_cf14;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1168_c11_48b0_right := to_unsigned(3, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1176_c7_eac1_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1164_c11_568c_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1182_c11_91a3_right := to_unsigned(6, 3);
     VAR_MUX_uxn_opcodes_h_l1174_c32_d497_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1176_c11_8222_right := to_unsigned(5, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1156_c2_6168_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1182_c7_2f1c_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1171_c11_5fe8_right := to_unsigned(4, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1171_c7_7333_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1182_c7_2f1c_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1166_c3_aa18 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1164_c7_1f6f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1166_c3_aa18;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1176_c7_eac1_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1156_c6_1c42_right := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1156_c1_4d63_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1174_c32_5ca9_left := VAR_ins;
     VAR_BIN_OP_XOR_uxn_opcodes_h_l1180_c24_82d7_left := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1156_c2_6168_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1161_c7_43f0_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1164_c7_1f6f_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1168_c7_8254_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1171_c7_7333_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1156_c6_1c42_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1161_c11_480f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1164_c11_568c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1168_c11_48b0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1171_c11_5fe8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1176_c11_8222_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1182_c11_91a3_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l1171_c7_7333_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1164_c7_1f6f_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_XOR_uxn_opcodes_h_l1180_c24_82d7_right := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1156_c2_6168_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1161_c7_43f0_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1164_c7_1f6f_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l1171_c11_5fe8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1171_c11_5fe8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1171_c11_5fe8_left;
     BIN_OP_EQ_uxn_opcodes_h_l1171_c11_5fe8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1171_c11_5fe8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1171_c11_5fe8_return_output := BIN_OP_EQ_uxn_opcodes_h_l1171_c11_5fe8_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l1174_c32_5ca9] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1174_c32_5ca9_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1174_c32_5ca9_left;
     BIN_OP_AND_uxn_opcodes_h_l1174_c32_5ca9_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1174_c32_5ca9_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1174_c32_5ca9_return_output := BIN_OP_AND_uxn_opcodes_h_l1174_c32_5ca9_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1171_l1168_l1164_l1161_l1182_l1176_DUPLICATE_c4fb LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1171_l1168_l1164_l1161_l1182_l1176_DUPLICATE_c4fb_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1164_c11_568c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1164_c11_568c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1164_c11_568c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1164_c11_568c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1164_c11_568c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1164_c11_568c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1164_c11_568c_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1171_l1168_l1164_l1161_l1156_l1182_DUPLICATE_87d1 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1171_l1168_l1164_l1161_l1156_l1182_DUPLICATE_87d1_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1168_l1164_l1161_l1156_l1176_DUPLICATE_cbd2 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1168_l1164_l1161_l1156_l1176_DUPLICATE_cbd2_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1171_l1176_DUPLICATE_2c51 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1171_l1176_DUPLICATE_2c51_return_output := result.stack_address_sp_offset;

     -- BIN_OP_XOR[uxn_opcodes_h_l1180_c24_82d7] LATENCY=0
     -- Inputs
     BIN_OP_XOR_uxn_opcodes_h_l1180_c24_82d7_left <= VAR_BIN_OP_XOR_uxn_opcodes_h_l1180_c24_82d7_left;
     BIN_OP_XOR_uxn_opcodes_h_l1180_c24_82d7_right <= VAR_BIN_OP_XOR_uxn_opcodes_h_l1180_c24_82d7_right;
     -- Outputs
     VAR_BIN_OP_XOR_uxn_opcodes_h_l1180_c24_82d7_return_output := BIN_OP_XOR_uxn_opcodes_h_l1180_c24_82d7_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1171_l1168_l1164_l1161_l1156_l1176_DUPLICATE_3fcd LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1171_l1168_l1164_l1161_l1156_l1176_DUPLICATE_3fcd_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1176_c11_8222] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1176_c11_8222_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1176_c11_8222_left;
     BIN_OP_EQ_uxn_opcodes_h_l1176_c11_8222_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1176_c11_8222_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1176_c11_8222_return_output := BIN_OP_EQ_uxn_opcodes_h_l1176_c11_8222_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1161_c11_480f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1161_c11_480f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1161_c11_480f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1161_c11_480f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1161_c11_480f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1161_c11_480f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1161_c11_480f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1182_c11_91a3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1182_c11_91a3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1182_c11_91a3_left;
     BIN_OP_EQ_uxn_opcodes_h_l1182_c11_91a3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1182_c11_91a3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1182_c11_91a3_return_output := BIN_OP_EQ_uxn_opcodes_h_l1182_c11_91a3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1168_c11_48b0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1168_c11_48b0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1168_c11_48b0_left;
     BIN_OP_EQ_uxn_opcodes_h_l1168_c11_48b0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1168_c11_48b0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1168_c11_48b0_return_output := BIN_OP_EQ_uxn_opcodes_h_l1168_c11_48b0_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1171_l1168_l1164_l1161_l1156_DUPLICATE_aae9 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1171_l1168_l1164_l1161_l1156_DUPLICATE_aae9_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1156_c6_1c42] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1156_c6_1c42_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1156_c6_1c42_left;
     BIN_OP_EQ_uxn_opcodes_h_l1156_c6_1c42_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1156_c6_1c42_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1156_c6_1c42_return_output := BIN_OP_EQ_uxn_opcodes_h_l1156_c6_1c42_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1174_c32_4948_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1174_c32_5ca9_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1156_c1_4d63_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1156_c6_1c42_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1156_c2_6168_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1156_c6_1c42_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1156_c2_6168_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1156_c6_1c42_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1156_c2_6168_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1156_c6_1c42_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1156_c2_6168_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1156_c6_1c42_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1156_c2_6168_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1156_c6_1c42_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1156_c2_6168_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1156_c6_1c42_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1156_c2_6168_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1156_c6_1c42_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1156_c2_6168_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1156_c6_1c42_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1161_c7_43f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1161_c11_480f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_43f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1161_c11_480f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1161_c7_43f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1161_c11_480f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_43f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1161_c11_480f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1161_c7_43f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1161_c11_480f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1161_c7_43f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1161_c11_480f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1161_c7_43f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1161_c11_480f_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1161_c7_43f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1161_c11_480f_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1164_c7_1f6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1164_c11_568c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1164_c7_1f6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1164_c11_568c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1164_c7_1f6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1164_c11_568c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1164_c7_1f6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1164_c11_568c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1164_c7_1f6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1164_c11_568c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1164_c7_1f6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1164_c11_568c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1164_c7_1f6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1164_c11_568c_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1164_c7_1f6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1164_c11_568c_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1168_c7_8254_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1168_c11_48b0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1168_c7_8254_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1168_c11_48b0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1168_c7_8254_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1168_c11_48b0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1168_c7_8254_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1168_c11_48b0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1168_c7_8254_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1168_c11_48b0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1168_c7_8254_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1168_c11_48b0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1168_c7_8254_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1168_c11_48b0_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1171_c7_7333_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1171_c11_5fe8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1171_c7_7333_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1171_c11_5fe8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1171_c7_7333_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1171_c11_5fe8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1171_c7_7333_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1171_c11_5fe8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1171_c7_7333_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1171_c11_5fe8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1171_c7_7333_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1171_c11_5fe8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1171_c7_7333_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1171_c11_5fe8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1176_c7_eac1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1176_c11_8222_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1176_c7_eac1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1176_c11_8222_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1176_c7_eac1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1176_c11_8222_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1176_c7_eac1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1176_c11_8222_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1176_c7_eac1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1176_c11_8222_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1182_c7_2f1c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1182_c11_91a3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1182_c7_2f1c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1182_c11_91a3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1176_c7_eac1_iftrue := VAR_BIN_OP_XOR_uxn_opcodes_h_l1180_c24_82d7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1156_c2_6168_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1171_l1168_l1164_l1161_l1156_DUPLICATE_aae9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1161_c7_43f0_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1171_l1168_l1164_l1161_l1156_DUPLICATE_aae9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1164_c7_1f6f_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1171_l1168_l1164_l1161_l1156_DUPLICATE_aae9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1168_c7_8254_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1171_l1168_l1164_l1161_l1156_DUPLICATE_aae9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1171_c7_7333_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1171_l1168_l1164_l1161_l1156_DUPLICATE_aae9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_43f0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1171_l1168_l1164_l1161_l1182_l1176_DUPLICATE_c4fb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1164_c7_1f6f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1171_l1168_l1164_l1161_l1182_l1176_DUPLICATE_c4fb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1168_c7_8254_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1171_l1168_l1164_l1161_l1182_l1176_DUPLICATE_c4fb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1171_c7_7333_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1171_l1168_l1164_l1161_l1182_l1176_DUPLICATE_c4fb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1176_c7_eac1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1171_l1168_l1164_l1161_l1182_l1176_DUPLICATE_c4fb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1182_c7_2f1c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1171_l1168_l1164_l1161_l1182_l1176_DUPLICATE_c4fb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1156_c2_6168_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1168_l1164_l1161_l1156_l1176_DUPLICATE_cbd2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1161_c7_43f0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1168_l1164_l1161_l1156_l1176_DUPLICATE_cbd2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1164_c7_1f6f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1168_l1164_l1161_l1156_l1176_DUPLICATE_cbd2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1168_c7_8254_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1168_l1164_l1161_l1156_l1176_DUPLICATE_cbd2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1176_c7_eac1_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1168_l1164_l1161_l1156_l1176_DUPLICATE_cbd2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1156_c2_6168_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1171_l1168_l1164_l1161_l1156_l1182_DUPLICATE_87d1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_43f0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1171_l1168_l1164_l1161_l1156_l1182_DUPLICATE_87d1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1164_c7_1f6f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1171_l1168_l1164_l1161_l1156_l1182_DUPLICATE_87d1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1168_c7_8254_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1171_l1168_l1164_l1161_l1156_l1182_DUPLICATE_87d1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1171_c7_7333_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1171_l1168_l1164_l1161_l1156_l1182_DUPLICATE_87d1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1182_c7_2f1c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1171_l1168_l1164_l1161_l1156_l1182_DUPLICATE_87d1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1171_c7_7333_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1171_l1176_DUPLICATE_2c51_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1176_c7_eac1_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1171_l1176_DUPLICATE_2c51_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1156_c2_6168_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1171_l1168_l1164_l1161_l1156_l1176_DUPLICATE_3fcd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1161_c7_43f0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1171_l1168_l1164_l1161_l1156_l1176_DUPLICATE_3fcd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1164_c7_1f6f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1171_l1168_l1164_l1161_l1156_l1176_DUPLICATE_3fcd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1168_c7_8254_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1171_l1168_l1164_l1161_l1156_l1176_DUPLICATE_3fcd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1171_c7_7333_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1171_l1168_l1164_l1161_l1156_l1176_DUPLICATE_3fcd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1176_c7_eac1_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1171_l1168_l1164_l1161_l1156_l1176_DUPLICATE_3fcd_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1176_c7_eac1] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1176_c7_eac1_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1176_c7_eac1_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1176_c7_eac1_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1176_c7_eac1_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1176_c7_eac1_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1176_c7_eac1_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1176_c7_eac1_return_output := result_stack_value_MUX_uxn_opcodes_h_l1176_c7_eac1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1176_c7_eac1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1176_c7_eac1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1176_c7_eac1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1176_c7_eac1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1176_c7_eac1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1176_c7_eac1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1176_c7_eac1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1176_c7_eac1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1176_c7_eac1_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1174_c32_4948] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1174_c32_4948_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1174_c32_4948_left;
     BIN_OP_GT_uxn_opcodes_h_l1174_c32_4948_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1174_c32_4948_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1174_c32_4948_return_output := BIN_OP_GT_uxn_opcodes_h_l1174_c32_4948_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1156_c1_4d63] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1156_c1_4d63_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1156_c1_4d63_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1156_c1_4d63_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1156_c1_4d63_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1156_c1_4d63_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1156_c1_4d63_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1156_c1_4d63_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1156_c1_4d63_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1182_c7_2f1c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1182_c7_2f1c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1182_c7_2f1c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1182_c7_2f1c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1182_c7_2f1c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1182_c7_2f1c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1182_c7_2f1c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1182_c7_2f1c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1182_c7_2f1c_return_output;

     -- t8_MUX[uxn_opcodes_h_l1164_c7_1f6f] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1164_c7_1f6f_cond <= VAR_t8_MUX_uxn_opcodes_h_l1164_c7_1f6f_cond;
     t8_MUX_uxn_opcodes_h_l1164_c7_1f6f_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1164_c7_1f6f_iftrue;
     t8_MUX_uxn_opcodes_h_l1164_c7_1f6f_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1164_c7_1f6f_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1164_c7_1f6f_return_output := t8_MUX_uxn_opcodes_h_l1164_c7_1f6f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1176_c7_eac1] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1176_c7_eac1_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1176_c7_eac1_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1176_c7_eac1_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1176_c7_eac1_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1176_c7_eac1_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1176_c7_eac1_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1176_c7_eac1_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1176_c7_eac1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1182_c7_2f1c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1182_c7_2f1c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1182_c7_2f1c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1182_c7_2f1c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1182_c7_2f1c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1182_c7_2f1c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1182_c7_2f1c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1182_c7_2f1c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1182_c7_2f1c_return_output;

     -- n8_MUX[uxn_opcodes_h_l1171_c7_7333] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1171_c7_7333_cond <= VAR_n8_MUX_uxn_opcodes_h_l1171_c7_7333_cond;
     n8_MUX_uxn_opcodes_h_l1171_c7_7333_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1171_c7_7333_iftrue;
     n8_MUX_uxn_opcodes_h_l1171_c7_7333_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1171_c7_7333_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1171_c7_7333_return_output := n8_MUX_uxn_opcodes_h_l1171_c7_7333_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1174_c32_d497_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1174_c32_4948_return_output;
     VAR_printf_uxn_opcodes_h_l1157_c3_2932_uxn_opcodes_h_l1157_c3_2932_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1156_c1_4d63_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1168_c7_8254_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1171_c7_7333_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1176_c7_eac1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1182_c7_2f1c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1171_c7_7333_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1176_c7_eac1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1176_c7_eac1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1182_c7_2f1c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1171_c7_7333_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1176_c7_eac1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1171_c7_7333_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1176_c7_eac1_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1161_c7_43f0_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1164_c7_1f6f_return_output;
     -- printf_uxn_opcodes_h_l1157_c3_2932[uxn_opcodes_h_l1157_c3_2932] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1157_c3_2932_uxn_opcodes_h_l1157_c3_2932_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1157_c3_2932_uxn_opcodes_h_l1157_c3_2932_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_stack_value_MUX[uxn_opcodes_h_l1171_c7_7333] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1171_c7_7333_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1171_c7_7333_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1171_c7_7333_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1171_c7_7333_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1171_c7_7333_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1171_c7_7333_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1171_c7_7333_return_output := result_stack_value_MUX_uxn_opcodes_h_l1171_c7_7333_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1171_c7_7333] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1171_c7_7333_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1171_c7_7333_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1171_c7_7333_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1171_c7_7333_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1171_c7_7333_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1171_c7_7333_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1171_c7_7333_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1171_c7_7333_return_output;

     -- n8_MUX[uxn_opcodes_h_l1168_c7_8254] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1168_c7_8254_cond <= VAR_n8_MUX_uxn_opcodes_h_l1168_c7_8254_cond;
     n8_MUX_uxn_opcodes_h_l1168_c7_8254_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1168_c7_8254_iftrue;
     n8_MUX_uxn_opcodes_h_l1168_c7_8254_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1168_c7_8254_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1168_c7_8254_return_output := n8_MUX_uxn_opcodes_h_l1168_c7_8254_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1176_c7_eac1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1176_c7_eac1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1176_c7_eac1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1176_c7_eac1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1176_c7_eac1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1176_c7_eac1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1176_c7_eac1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1176_c7_eac1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1176_c7_eac1_return_output;

     -- MUX[uxn_opcodes_h_l1174_c32_d497] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1174_c32_d497_cond <= VAR_MUX_uxn_opcodes_h_l1174_c32_d497_cond;
     MUX_uxn_opcodes_h_l1174_c32_d497_iftrue <= VAR_MUX_uxn_opcodes_h_l1174_c32_d497_iftrue;
     MUX_uxn_opcodes_h_l1174_c32_d497_iffalse <= VAR_MUX_uxn_opcodes_h_l1174_c32_d497_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1174_c32_d497_return_output := MUX_uxn_opcodes_h_l1174_c32_d497_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1171_c7_7333] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1171_c7_7333_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1171_c7_7333_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1171_c7_7333_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1171_c7_7333_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1171_c7_7333_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1171_c7_7333_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1171_c7_7333_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1171_c7_7333_return_output;

     -- t8_MUX[uxn_opcodes_h_l1161_c7_43f0] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1161_c7_43f0_cond <= VAR_t8_MUX_uxn_opcodes_h_l1161_c7_43f0_cond;
     t8_MUX_uxn_opcodes_h_l1161_c7_43f0_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1161_c7_43f0_iftrue;
     t8_MUX_uxn_opcodes_h_l1161_c7_43f0_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1161_c7_43f0_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1161_c7_43f0_return_output := t8_MUX_uxn_opcodes_h_l1161_c7_43f0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1176_c7_eac1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1176_c7_eac1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1176_c7_eac1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1176_c7_eac1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1176_c7_eac1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1176_c7_eac1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1176_c7_eac1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1176_c7_eac1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1176_c7_eac1_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1171_c7_7333_iftrue := VAR_MUX_uxn_opcodes_h_l1174_c32_d497_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1164_c7_1f6f_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1168_c7_8254_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1171_c7_7333_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1176_c7_eac1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1168_c7_8254_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1171_c7_7333_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1171_c7_7333_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1176_c7_eac1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1168_c7_8254_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1171_c7_7333_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1168_c7_8254_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1171_c7_7333_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1156_c2_6168_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1161_c7_43f0_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1168_c7_8254] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1168_c7_8254_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1168_c7_8254_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1168_c7_8254_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1168_c7_8254_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1168_c7_8254_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1168_c7_8254_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1168_c7_8254_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1168_c7_8254_return_output;

     -- t8_MUX[uxn_opcodes_h_l1156_c2_6168] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1156_c2_6168_cond <= VAR_t8_MUX_uxn_opcodes_h_l1156_c2_6168_cond;
     t8_MUX_uxn_opcodes_h_l1156_c2_6168_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1156_c2_6168_iftrue;
     t8_MUX_uxn_opcodes_h_l1156_c2_6168_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1156_c2_6168_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1156_c2_6168_return_output := t8_MUX_uxn_opcodes_h_l1156_c2_6168_return_output;

     -- n8_MUX[uxn_opcodes_h_l1164_c7_1f6f] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1164_c7_1f6f_cond <= VAR_n8_MUX_uxn_opcodes_h_l1164_c7_1f6f_cond;
     n8_MUX_uxn_opcodes_h_l1164_c7_1f6f_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1164_c7_1f6f_iftrue;
     n8_MUX_uxn_opcodes_h_l1164_c7_1f6f_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1164_c7_1f6f_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1164_c7_1f6f_return_output := n8_MUX_uxn_opcodes_h_l1164_c7_1f6f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1171_c7_7333] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1171_c7_7333_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1171_c7_7333_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1171_c7_7333_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1171_c7_7333_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1171_c7_7333_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1171_c7_7333_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1171_c7_7333_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1171_c7_7333_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1168_c7_8254] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1168_c7_8254_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1168_c7_8254_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1168_c7_8254_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1168_c7_8254_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1168_c7_8254_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1168_c7_8254_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1168_c7_8254_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1168_c7_8254_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1168_c7_8254] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1168_c7_8254_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1168_c7_8254_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1168_c7_8254_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1168_c7_8254_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1168_c7_8254_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1168_c7_8254_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1168_c7_8254_return_output := result_stack_value_MUX_uxn_opcodes_h_l1168_c7_8254_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1171_c7_7333] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1171_c7_7333_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1171_c7_7333_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1171_c7_7333_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1171_c7_7333_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1171_c7_7333_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1171_c7_7333_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1171_c7_7333_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1171_c7_7333_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1171_c7_7333] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1171_c7_7333_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1171_c7_7333_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1171_c7_7333_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1171_c7_7333_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1171_c7_7333_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1171_c7_7333_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1171_c7_7333_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1171_c7_7333_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l1161_c7_43f0_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1164_c7_1f6f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1168_c7_8254_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1171_c7_7333_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1164_c7_1f6f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1168_c7_8254_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1168_c7_8254_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1171_c7_7333_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1168_c7_8254_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1171_c7_7333_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1164_c7_1f6f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1168_c7_8254_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1164_c7_1f6f_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1168_c7_8254_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1156_c2_6168_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1168_c7_8254] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1168_c7_8254_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1168_c7_8254_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1168_c7_8254_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1168_c7_8254_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1168_c7_8254_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1168_c7_8254_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1168_c7_8254_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1168_c7_8254_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1168_c7_8254] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1168_c7_8254_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1168_c7_8254_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1168_c7_8254_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1168_c7_8254_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1168_c7_8254_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1168_c7_8254_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1168_c7_8254_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1168_c7_8254_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1168_c7_8254] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1168_c7_8254_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1168_c7_8254_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1168_c7_8254_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1168_c7_8254_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1168_c7_8254_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1168_c7_8254_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1168_c7_8254_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1168_c7_8254_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1164_c7_1f6f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1164_c7_1f6f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1164_c7_1f6f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1164_c7_1f6f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1164_c7_1f6f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1164_c7_1f6f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1164_c7_1f6f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1164_c7_1f6f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1164_c7_1f6f_return_output;

     -- n8_MUX[uxn_opcodes_h_l1161_c7_43f0] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1161_c7_43f0_cond <= VAR_n8_MUX_uxn_opcodes_h_l1161_c7_43f0_cond;
     n8_MUX_uxn_opcodes_h_l1161_c7_43f0_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1161_c7_43f0_iftrue;
     n8_MUX_uxn_opcodes_h_l1161_c7_43f0_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1161_c7_43f0_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1161_c7_43f0_return_output := n8_MUX_uxn_opcodes_h_l1161_c7_43f0_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1164_c7_1f6f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1164_c7_1f6f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1164_c7_1f6f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1164_c7_1f6f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1164_c7_1f6f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1164_c7_1f6f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1164_c7_1f6f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1164_c7_1f6f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1164_c7_1f6f_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1164_c7_1f6f] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1164_c7_1f6f_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1164_c7_1f6f_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1164_c7_1f6f_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1164_c7_1f6f_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1164_c7_1f6f_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1164_c7_1f6f_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1164_c7_1f6f_return_output := result_stack_value_MUX_uxn_opcodes_h_l1164_c7_1f6f_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l1156_c2_6168_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1161_c7_43f0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1164_c7_1f6f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1168_c7_8254_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1161_c7_43f0_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1164_c7_1f6f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1164_c7_1f6f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1168_c7_8254_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1164_c7_1f6f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1168_c7_8254_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1161_c7_43f0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1164_c7_1f6f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1161_c7_43f0_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1164_c7_1f6f_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1164_c7_1f6f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1164_c7_1f6f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1164_c7_1f6f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1164_c7_1f6f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1164_c7_1f6f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1164_c7_1f6f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1164_c7_1f6f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1164_c7_1f6f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1164_c7_1f6f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1161_c7_43f0] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1161_c7_43f0_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1161_c7_43f0_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1161_c7_43f0_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1161_c7_43f0_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1161_c7_43f0_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1161_c7_43f0_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1161_c7_43f0_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1161_c7_43f0_return_output;

     -- n8_MUX[uxn_opcodes_h_l1156_c2_6168] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1156_c2_6168_cond <= VAR_n8_MUX_uxn_opcodes_h_l1156_c2_6168_cond;
     n8_MUX_uxn_opcodes_h_l1156_c2_6168_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1156_c2_6168_iftrue;
     n8_MUX_uxn_opcodes_h_l1156_c2_6168_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1156_c2_6168_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1156_c2_6168_return_output := n8_MUX_uxn_opcodes_h_l1156_c2_6168_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1164_c7_1f6f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1164_c7_1f6f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1164_c7_1f6f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1164_c7_1f6f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1164_c7_1f6f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1164_c7_1f6f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1164_c7_1f6f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1164_c7_1f6f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1164_c7_1f6f_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1161_c7_43f0] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1161_c7_43f0_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1161_c7_43f0_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1161_c7_43f0_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1161_c7_43f0_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1161_c7_43f0_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1161_c7_43f0_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1161_c7_43f0_return_output := result_stack_value_MUX_uxn_opcodes_h_l1161_c7_43f0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1161_c7_43f0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1161_c7_43f0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1161_c7_43f0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1161_c7_43f0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1161_c7_43f0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1161_c7_43f0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1161_c7_43f0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1161_c7_43f0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1161_c7_43f0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1164_c7_1f6f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1164_c7_1f6f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1164_c7_1f6f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1164_c7_1f6f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1164_c7_1f6f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1164_c7_1f6f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1164_c7_1f6f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1164_c7_1f6f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1164_c7_1f6f_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l1156_c2_6168_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_43f0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1164_c7_1f6f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1156_c2_6168_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1161_c7_43f0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_43f0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1164_c7_1f6f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1161_c7_43f0_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1164_c7_1f6f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1156_c2_6168_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1161_c7_43f0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1156_c2_6168_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1161_c7_43f0_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1156_c2_6168] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1156_c2_6168_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1156_c2_6168_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1156_c2_6168_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1156_c2_6168_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1156_c2_6168_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1156_c2_6168_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1156_c2_6168_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1156_c2_6168_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1161_c7_43f0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_43f0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_43f0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_43f0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_43f0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_43f0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_43f0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_43f0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_43f0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1156_c2_6168] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1156_c2_6168_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1156_c2_6168_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1156_c2_6168_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1156_c2_6168_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1156_c2_6168_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1156_c2_6168_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1156_c2_6168_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1156_c2_6168_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1161_c7_43f0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1161_c7_43f0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1161_c7_43f0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1161_c7_43f0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1161_c7_43f0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1161_c7_43f0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1161_c7_43f0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1161_c7_43f0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1161_c7_43f0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1161_c7_43f0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_43f0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_43f0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_43f0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_43f0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_43f0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_43f0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_43f0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_43f0_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1156_c2_6168] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1156_c2_6168_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1156_c2_6168_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1156_c2_6168_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1156_c2_6168_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1156_c2_6168_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1156_c2_6168_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1156_c2_6168_return_output := result_stack_value_MUX_uxn_opcodes_h_l1156_c2_6168_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1156_c2_6168_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1161_c7_43f0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1156_c2_6168_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1161_c7_43f0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1156_c2_6168_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1161_c7_43f0_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1156_c2_6168] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1156_c2_6168_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1156_c2_6168_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1156_c2_6168_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1156_c2_6168_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1156_c2_6168_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1156_c2_6168_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1156_c2_6168_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1156_c2_6168_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1156_c2_6168] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1156_c2_6168_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1156_c2_6168_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1156_c2_6168_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1156_c2_6168_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1156_c2_6168_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1156_c2_6168_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1156_c2_6168_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1156_c2_6168_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1156_c2_6168] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1156_c2_6168_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1156_c2_6168_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1156_c2_6168_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1156_c2_6168_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1156_c2_6168_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1156_c2_6168_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1156_c2_6168_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1156_c2_6168_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_09c5_uxn_opcodes_h_l1187_l1152_DUPLICATE_6803 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_09c5_uxn_opcodes_h_l1187_l1152_DUPLICATE_6803_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_09c5(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1156_c2_6168_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1156_c2_6168_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1156_c2_6168_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1156_c2_6168_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1156_c2_6168_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1156_c2_6168_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_09c5_uxn_opcodes_h_l1187_l1152_DUPLICATE_6803_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_09c5_uxn_opcodes_h_l1187_l1152_DUPLICATE_6803_return_output;
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
