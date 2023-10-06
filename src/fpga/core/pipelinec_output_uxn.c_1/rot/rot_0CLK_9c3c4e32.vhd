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
entity rot_0CLK_9c3c4e32 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end rot_0CLK_9c3c4e32;
architecture arch of rot_0CLK_9c3c4e32 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal n8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal l8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_n8 : unsigned(7 downto 0);
signal REG_COMB_l8 : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l3079_c6_3a94]
signal BIN_OP_EQ_uxn_opcodes_h_l3079_c6_3a94_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3079_c6_3a94_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3079_c6_3a94_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3079_c1_4a03]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c1_4a03_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c1_4a03_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c1_4a03_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c1_4a03_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l3079_c2_3d72]
signal t8_MUX_uxn_opcodes_h_l3079_c2_3d72_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l3079_c2_3d72_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l3079_c2_3d72_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l3079_c2_3d72_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l3079_c2_3d72]
signal n8_MUX_uxn_opcodes_h_l3079_c2_3d72_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l3079_c2_3d72_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l3079_c2_3d72_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l3079_c2_3d72_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l3079_c2_3d72]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3079_c2_3d72_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3079_c2_3d72_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3079_c2_3d72_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3079_c2_3d72_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3079_c2_3d72]
signal result_stack_value_MUX_uxn_opcodes_h_l3079_c2_3d72_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3079_c2_3d72_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3079_c2_3d72_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3079_c2_3d72_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3079_c2_3d72]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3079_c2_3d72_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3079_c2_3d72_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3079_c2_3d72_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3079_c2_3d72_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l3079_c2_3d72]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3079_c2_3d72_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3079_c2_3d72_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3079_c2_3d72_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3079_c2_3d72_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3079_c2_3d72]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3079_c2_3d72_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3079_c2_3d72_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3079_c2_3d72_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3079_c2_3d72_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3079_c2_3d72]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3079_c2_3d72_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3079_c2_3d72_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3079_c2_3d72_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3079_c2_3d72_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l3079_c2_3d72]
signal result_is_stack_read_MUX_uxn_opcodes_h_l3079_c2_3d72_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3079_c2_3d72_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3079_c2_3d72_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3079_c2_3d72_return_output : unsigned(0 downto 0);

-- l8_MUX[uxn_opcodes_h_l3079_c2_3d72]
signal l8_MUX_uxn_opcodes_h_l3079_c2_3d72_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l3079_c2_3d72_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l3079_c2_3d72_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l3079_c2_3d72_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l3080_c3_f9a5[uxn_opcodes_h_l3080_c3_f9a5]
signal printf_uxn_opcodes_h_l3080_c3_f9a5_uxn_opcodes_h_l3080_c3_f9a5_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3085_c11_7c68]
signal BIN_OP_EQ_uxn_opcodes_h_l3085_c11_7c68_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3085_c11_7c68_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3085_c11_7c68_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l3085_c7_c2f9]
signal t8_MUX_uxn_opcodes_h_l3085_c7_c2f9_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l3085_c7_c2f9_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l3085_c7_c2f9_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l3085_c7_c2f9_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l3085_c7_c2f9]
signal n8_MUX_uxn_opcodes_h_l3085_c7_c2f9_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l3085_c7_c2f9_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l3085_c7_c2f9_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l3085_c7_c2f9_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l3085_c7_c2f9]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3085_c7_c2f9_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3085_c7_c2f9_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3085_c7_c2f9_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3085_c7_c2f9_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3085_c7_c2f9]
signal result_stack_value_MUX_uxn_opcodes_h_l3085_c7_c2f9_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3085_c7_c2f9_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3085_c7_c2f9_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3085_c7_c2f9_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3085_c7_c2f9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3085_c7_c2f9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3085_c7_c2f9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3085_c7_c2f9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3085_c7_c2f9_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l3085_c7_c2f9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3085_c7_c2f9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3085_c7_c2f9_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3085_c7_c2f9_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3085_c7_c2f9_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3085_c7_c2f9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3085_c7_c2f9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3085_c7_c2f9_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3085_c7_c2f9_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3085_c7_c2f9_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3085_c7_c2f9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3085_c7_c2f9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3085_c7_c2f9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3085_c7_c2f9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3085_c7_c2f9_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l3085_c7_c2f9]
signal result_is_stack_read_MUX_uxn_opcodes_h_l3085_c7_c2f9_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3085_c7_c2f9_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3085_c7_c2f9_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3085_c7_c2f9_return_output : unsigned(0 downto 0);

-- l8_MUX[uxn_opcodes_h_l3085_c7_c2f9]
signal l8_MUX_uxn_opcodes_h_l3085_c7_c2f9_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l3085_c7_c2f9_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l3085_c7_c2f9_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l3085_c7_c2f9_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3088_c11_5e91]
signal BIN_OP_EQ_uxn_opcodes_h_l3088_c11_5e91_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3088_c11_5e91_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3088_c11_5e91_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l3088_c7_707d]
signal t8_MUX_uxn_opcodes_h_l3088_c7_707d_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l3088_c7_707d_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l3088_c7_707d_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l3088_c7_707d_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l3088_c7_707d]
signal n8_MUX_uxn_opcodes_h_l3088_c7_707d_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l3088_c7_707d_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l3088_c7_707d_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l3088_c7_707d_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l3088_c7_707d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3088_c7_707d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3088_c7_707d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3088_c7_707d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3088_c7_707d_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3088_c7_707d]
signal result_stack_value_MUX_uxn_opcodes_h_l3088_c7_707d_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3088_c7_707d_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3088_c7_707d_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3088_c7_707d_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3088_c7_707d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3088_c7_707d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3088_c7_707d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3088_c7_707d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3088_c7_707d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l3088_c7_707d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3088_c7_707d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3088_c7_707d_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3088_c7_707d_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3088_c7_707d_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3088_c7_707d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3088_c7_707d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3088_c7_707d_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3088_c7_707d_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3088_c7_707d_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3088_c7_707d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3088_c7_707d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3088_c7_707d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3088_c7_707d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3088_c7_707d_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l3088_c7_707d]
signal result_is_stack_read_MUX_uxn_opcodes_h_l3088_c7_707d_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3088_c7_707d_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3088_c7_707d_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3088_c7_707d_return_output : unsigned(0 downto 0);

-- l8_MUX[uxn_opcodes_h_l3088_c7_707d]
signal l8_MUX_uxn_opcodes_h_l3088_c7_707d_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l3088_c7_707d_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l3088_c7_707d_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l3088_c7_707d_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3092_c11_ad73]
signal BIN_OP_EQ_uxn_opcodes_h_l3092_c11_ad73_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3092_c11_ad73_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3092_c11_ad73_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l3092_c7_3a11]
signal n8_MUX_uxn_opcodes_h_l3092_c7_3a11_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l3092_c7_3a11_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l3092_c7_3a11_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l3092_c7_3a11_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l3092_c7_3a11]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3092_c7_3a11_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3092_c7_3a11_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3092_c7_3a11_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3092_c7_3a11_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3092_c7_3a11]
signal result_stack_value_MUX_uxn_opcodes_h_l3092_c7_3a11_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3092_c7_3a11_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3092_c7_3a11_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3092_c7_3a11_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3092_c7_3a11]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3092_c7_3a11_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3092_c7_3a11_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3092_c7_3a11_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3092_c7_3a11_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l3092_c7_3a11]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3092_c7_3a11_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3092_c7_3a11_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3092_c7_3a11_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3092_c7_3a11_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3092_c7_3a11]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3092_c7_3a11_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3092_c7_3a11_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3092_c7_3a11_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3092_c7_3a11_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3092_c7_3a11]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3092_c7_3a11_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3092_c7_3a11_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3092_c7_3a11_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3092_c7_3a11_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l3092_c7_3a11]
signal result_is_stack_read_MUX_uxn_opcodes_h_l3092_c7_3a11_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3092_c7_3a11_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3092_c7_3a11_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3092_c7_3a11_return_output : unsigned(0 downto 0);

-- l8_MUX[uxn_opcodes_h_l3092_c7_3a11]
signal l8_MUX_uxn_opcodes_h_l3092_c7_3a11_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l3092_c7_3a11_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l3092_c7_3a11_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l3092_c7_3a11_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3095_c11_767c]
signal BIN_OP_EQ_uxn_opcodes_h_l3095_c11_767c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3095_c11_767c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3095_c11_767c_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l3095_c7_e3cf]
signal n8_MUX_uxn_opcodes_h_l3095_c7_e3cf_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l3095_c7_e3cf_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l3095_c7_e3cf_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l3095_c7_e3cf_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l3095_c7_e3cf]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3095_c7_e3cf_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3095_c7_e3cf_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3095_c7_e3cf_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3095_c7_e3cf_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3095_c7_e3cf]
signal result_stack_value_MUX_uxn_opcodes_h_l3095_c7_e3cf_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3095_c7_e3cf_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3095_c7_e3cf_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3095_c7_e3cf_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3095_c7_e3cf]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3095_c7_e3cf_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3095_c7_e3cf_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3095_c7_e3cf_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3095_c7_e3cf_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l3095_c7_e3cf]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3095_c7_e3cf_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3095_c7_e3cf_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3095_c7_e3cf_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3095_c7_e3cf_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3095_c7_e3cf]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3095_c7_e3cf_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3095_c7_e3cf_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3095_c7_e3cf_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3095_c7_e3cf_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3095_c7_e3cf]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3095_c7_e3cf_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3095_c7_e3cf_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3095_c7_e3cf_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3095_c7_e3cf_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l3095_c7_e3cf]
signal result_is_stack_read_MUX_uxn_opcodes_h_l3095_c7_e3cf_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3095_c7_e3cf_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3095_c7_e3cf_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3095_c7_e3cf_return_output : unsigned(0 downto 0);

-- l8_MUX[uxn_opcodes_h_l3095_c7_e3cf]
signal l8_MUX_uxn_opcodes_h_l3095_c7_e3cf_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l3095_c7_e3cf_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l3095_c7_e3cf_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l3095_c7_e3cf_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3099_c11_cc1c]
signal BIN_OP_EQ_uxn_opcodes_h_l3099_c11_cc1c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3099_c11_cc1c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3099_c11_cc1c_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l3099_c7_b9d5]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3099_c7_b9d5_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3099_c7_b9d5_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3099_c7_b9d5_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3099_c7_b9d5_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3099_c7_b9d5]
signal result_stack_value_MUX_uxn_opcodes_h_l3099_c7_b9d5_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3099_c7_b9d5_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3099_c7_b9d5_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3099_c7_b9d5_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3099_c7_b9d5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3099_c7_b9d5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3099_c7_b9d5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3099_c7_b9d5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3099_c7_b9d5_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l3099_c7_b9d5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3099_c7_b9d5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3099_c7_b9d5_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3099_c7_b9d5_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3099_c7_b9d5_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3099_c7_b9d5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3099_c7_b9d5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3099_c7_b9d5_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3099_c7_b9d5_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3099_c7_b9d5_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3099_c7_b9d5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3099_c7_b9d5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3099_c7_b9d5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3099_c7_b9d5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3099_c7_b9d5_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l3099_c7_b9d5]
signal result_is_stack_read_MUX_uxn_opcodes_h_l3099_c7_b9d5_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3099_c7_b9d5_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3099_c7_b9d5_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3099_c7_b9d5_return_output : unsigned(0 downto 0);

-- l8_MUX[uxn_opcodes_h_l3099_c7_b9d5]
signal l8_MUX_uxn_opcodes_h_l3099_c7_b9d5_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l3099_c7_b9d5_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l3099_c7_b9d5_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l3099_c7_b9d5_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3102_c11_4484]
signal BIN_OP_EQ_uxn_opcodes_h_l3102_c11_4484_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3102_c11_4484_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3102_c11_4484_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l3102_c7_835b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3102_c7_835b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3102_c7_835b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3102_c7_835b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3102_c7_835b_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3102_c7_835b]
signal result_stack_value_MUX_uxn_opcodes_h_l3102_c7_835b_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3102_c7_835b_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3102_c7_835b_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3102_c7_835b_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3102_c7_835b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3102_c7_835b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3102_c7_835b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3102_c7_835b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3102_c7_835b_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l3102_c7_835b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3102_c7_835b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3102_c7_835b_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3102_c7_835b_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3102_c7_835b_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3102_c7_835b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3102_c7_835b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3102_c7_835b_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3102_c7_835b_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3102_c7_835b_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3102_c7_835b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3102_c7_835b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3102_c7_835b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3102_c7_835b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3102_c7_835b_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l3102_c7_835b]
signal result_is_stack_read_MUX_uxn_opcodes_h_l3102_c7_835b_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3102_c7_835b_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3102_c7_835b_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3102_c7_835b_return_output : unsigned(0 downto 0);

-- l8_MUX[uxn_opcodes_h_l3102_c7_835b]
signal l8_MUX_uxn_opcodes_h_l3102_c7_835b_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l3102_c7_835b_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l3102_c7_835b_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l3102_c7_835b_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l3106_c32_4b09]
signal BIN_OP_AND_uxn_opcodes_h_l3106_c32_4b09_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l3106_c32_4b09_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l3106_c32_4b09_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l3106_c32_dd07]
signal BIN_OP_GT_uxn_opcodes_h_l3106_c32_dd07_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l3106_c32_dd07_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l3106_c32_dd07_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l3106_c32_ff84]
signal MUX_uxn_opcodes_h_l3106_c32_ff84_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l3106_c32_ff84_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l3106_c32_ff84_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l3106_c32_ff84_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3108_c11_cdb4]
signal BIN_OP_EQ_uxn_opcodes_h_l3108_c11_cdb4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3108_c11_cdb4_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3108_c11_cdb4_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l3108_c7_72d0]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3108_c7_72d0_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3108_c7_72d0_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3108_c7_72d0_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3108_c7_72d0_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3108_c7_72d0]
signal result_stack_value_MUX_uxn_opcodes_h_l3108_c7_72d0_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3108_c7_72d0_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3108_c7_72d0_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3108_c7_72d0_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3108_c7_72d0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3108_c7_72d0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3108_c7_72d0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3108_c7_72d0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3108_c7_72d0_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3108_c7_72d0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3108_c7_72d0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3108_c7_72d0_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3108_c7_72d0_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3108_c7_72d0_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3108_c7_72d0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3108_c7_72d0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3108_c7_72d0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3108_c7_72d0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3108_c7_72d0_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3114_c11_9ce2]
signal BIN_OP_EQ_uxn_opcodes_h_l3114_c11_9ce2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3114_c11_9ce2_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3114_c11_9ce2_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3114_c7_60b7]
signal result_stack_value_MUX_uxn_opcodes_h_l3114_c7_60b7_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3114_c7_60b7_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3114_c7_60b7_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3114_c7_60b7_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3114_c7_60b7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3114_c7_60b7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3114_c7_60b7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3114_c7_60b7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3114_c7_60b7_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3114_c7_60b7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3114_c7_60b7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3114_c7_60b7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3114_c7_60b7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3114_c7_60b7_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3114_c7_60b7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3114_c7_60b7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3114_c7_60b7_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3114_c7_60b7_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3114_c7_60b7_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3118_c11_8764]
signal BIN_OP_EQ_uxn_opcodes_h_l3118_c11_8764_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3118_c11_8764_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3118_c11_8764_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3118_c7_5824]
signal result_stack_value_MUX_uxn_opcodes_h_l3118_c7_5824_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3118_c7_5824_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3118_c7_5824_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3118_c7_5824_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3118_c7_5824]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3118_c7_5824_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3118_c7_5824_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3118_c7_5824_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3118_c7_5824_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3118_c7_5824]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3118_c7_5824_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3118_c7_5824_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3118_c7_5824_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3118_c7_5824_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3118_c7_5824]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3118_c7_5824_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3118_c7_5824_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3118_c7_5824_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3118_c7_5824_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3122_c11_62d2]
signal BIN_OP_EQ_uxn_opcodes_h_l3122_c11_62d2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3122_c11_62d2_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3122_c11_62d2_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3122_c7_f346]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3122_c7_f346_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3122_c7_f346_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3122_c7_f346_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3122_c7_f346_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3122_c7_f346]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3122_c7_f346_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3122_c7_f346_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3122_c7_f346_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3122_c7_f346_return_output : unsigned(0 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l3079_c6_3a94
BIN_OP_EQ_uxn_opcodes_h_l3079_c6_3a94 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3079_c6_3a94_left,
BIN_OP_EQ_uxn_opcodes_h_l3079_c6_3a94_right,
BIN_OP_EQ_uxn_opcodes_h_l3079_c6_3a94_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c1_4a03
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c1_4a03 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c1_4a03_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c1_4a03_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c1_4a03_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c1_4a03_return_output);

-- t8_MUX_uxn_opcodes_h_l3079_c2_3d72
t8_MUX_uxn_opcodes_h_l3079_c2_3d72 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l3079_c2_3d72_cond,
t8_MUX_uxn_opcodes_h_l3079_c2_3d72_iftrue,
t8_MUX_uxn_opcodes_h_l3079_c2_3d72_iffalse,
t8_MUX_uxn_opcodes_h_l3079_c2_3d72_return_output);

-- n8_MUX_uxn_opcodes_h_l3079_c2_3d72
n8_MUX_uxn_opcodes_h_l3079_c2_3d72 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l3079_c2_3d72_cond,
n8_MUX_uxn_opcodes_h_l3079_c2_3d72_iftrue,
n8_MUX_uxn_opcodes_h_l3079_c2_3d72_iffalse,
n8_MUX_uxn_opcodes_h_l3079_c2_3d72_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l3079_c2_3d72
result_is_sp_shift_MUX_uxn_opcodes_h_l3079_c2_3d72 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l3079_c2_3d72_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l3079_c2_3d72_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l3079_c2_3d72_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l3079_c2_3d72_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3079_c2_3d72
result_stack_value_MUX_uxn_opcodes_h_l3079_c2_3d72 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3079_c2_3d72_cond,
result_stack_value_MUX_uxn_opcodes_h_l3079_c2_3d72_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3079_c2_3d72_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3079_c2_3d72_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3079_c2_3d72
result_is_stack_write_MUX_uxn_opcodes_h_l3079_c2_3d72 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3079_c2_3d72_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3079_c2_3d72_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3079_c2_3d72_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3079_c2_3d72_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l3079_c2_3d72
result_sp_relative_shift_MUX_uxn_opcodes_h_l3079_c2_3d72 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l3079_c2_3d72_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3079_c2_3d72_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3079_c2_3d72_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3079_c2_3d72_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3079_c2_3d72
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3079_c2_3d72 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3079_c2_3d72_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3079_c2_3d72_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3079_c2_3d72_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3079_c2_3d72_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3079_c2_3d72
result_is_opc_done_MUX_uxn_opcodes_h_l3079_c2_3d72 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3079_c2_3d72_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3079_c2_3d72_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3079_c2_3d72_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3079_c2_3d72_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l3079_c2_3d72
result_is_stack_read_MUX_uxn_opcodes_h_l3079_c2_3d72 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l3079_c2_3d72_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l3079_c2_3d72_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l3079_c2_3d72_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l3079_c2_3d72_return_output);

-- l8_MUX_uxn_opcodes_h_l3079_c2_3d72
l8_MUX_uxn_opcodes_h_l3079_c2_3d72 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l3079_c2_3d72_cond,
l8_MUX_uxn_opcodes_h_l3079_c2_3d72_iftrue,
l8_MUX_uxn_opcodes_h_l3079_c2_3d72_iffalse,
l8_MUX_uxn_opcodes_h_l3079_c2_3d72_return_output);

-- printf_uxn_opcodes_h_l3080_c3_f9a5_uxn_opcodes_h_l3080_c3_f9a5
printf_uxn_opcodes_h_l3080_c3_f9a5_uxn_opcodes_h_l3080_c3_f9a5 : entity work.printf_uxn_opcodes_h_l3080_c3_f9a5_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l3080_c3_f9a5_uxn_opcodes_h_l3080_c3_f9a5_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l3085_c11_7c68
BIN_OP_EQ_uxn_opcodes_h_l3085_c11_7c68 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3085_c11_7c68_left,
BIN_OP_EQ_uxn_opcodes_h_l3085_c11_7c68_right,
BIN_OP_EQ_uxn_opcodes_h_l3085_c11_7c68_return_output);

-- t8_MUX_uxn_opcodes_h_l3085_c7_c2f9
t8_MUX_uxn_opcodes_h_l3085_c7_c2f9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l3085_c7_c2f9_cond,
t8_MUX_uxn_opcodes_h_l3085_c7_c2f9_iftrue,
t8_MUX_uxn_opcodes_h_l3085_c7_c2f9_iffalse,
t8_MUX_uxn_opcodes_h_l3085_c7_c2f9_return_output);

-- n8_MUX_uxn_opcodes_h_l3085_c7_c2f9
n8_MUX_uxn_opcodes_h_l3085_c7_c2f9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l3085_c7_c2f9_cond,
n8_MUX_uxn_opcodes_h_l3085_c7_c2f9_iftrue,
n8_MUX_uxn_opcodes_h_l3085_c7_c2f9_iffalse,
n8_MUX_uxn_opcodes_h_l3085_c7_c2f9_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l3085_c7_c2f9
result_is_sp_shift_MUX_uxn_opcodes_h_l3085_c7_c2f9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l3085_c7_c2f9_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l3085_c7_c2f9_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l3085_c7_c2f9_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l3085_c7_c2f9_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3085_c7_c2f9
result_stack_value_MUX_uxn_opcodes_h_l3085_c7_c2f9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3085_c7_c2f9_cond,
result_stack_value_MUX_uxn_opcodes_h_l3085_c7_c2f9_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3085_c7_c2f9_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3085_c7_c2f9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3085_c7_c2f9
result_is_stack_write_MUX_uxn_opcodes_h_l3085_c7_c2f9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3085_c7_c2f9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3085_c7_c2f9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3085_c7_c2f9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3085_c7_c2f9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l3085_c7_c2f9
result_sp_relative_shift_MUX_uxn_opcodes_h_l3085_c7_c2f9 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l3085_c7_c2f9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3085_c7_c2f9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3085_c7_c2f9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3085_c7_c2f9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3085_c7_c2f9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3085_c7_c2f9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3085_c7_c2f9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3085_c7_c2f9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3085_c7_c2f9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3085_c7_c2f9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3085_c7_c2f9
result_is_opc_done_MUX_uxn_opcodes_h_l3085_c7_c2f9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3085_c7_c2f9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3085_c7_c2f9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3085_c7_c2f9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3085_c7_c2f9_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l3085_c7_c2f9
result_is_stack_read_MUX_uxn_opcodes_h_l3085_c7_c2f9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l3085_c7_c2f9_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l3085_c7_c2f9_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l3085_c7_c2f9_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l3085_c7_c2f9_return_output);

-- l8_MUX_uxn_opcodes_h_l3085_c7_c2f9
l8_MUX_uxn_opcodes_h_l3085_c7_c2f9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l3085_c7_c2f9_cond,
l8_MUX_uxn_opcodes_h_l3085_c7_c2f9_iftrue,
l8_MUX_uxn_opcodes_h_l3085_c7_c2f9_iffalse,
l8_MUX_uxn_opcodes_h_l3085_c7_c2f9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3088_c11_5e91
BIN_OP_EQ_uxn_opcodes_h_l3088_c11_5e91 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3088_c11_5e91_left,
BIN_OP_EQ_uxn_opcodes_h_l3088_c11_5e91_right,
BIN_OP_EQ_uxn_opcodes_h_l3088_c11_5e91_return_output);

-- t8_MUX_uxn_opcodes_h_l3088_c7_707d
t8_MUX_uxn_opcodes_h_l3088_c7_707d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l3088_c7_707d_cond,
t8_MUX_uxn_opcodes_h_l3088_c7_707d_iftrue,
t8_MUX_uxn_opcodes_h_l3088_c7_707d_iffalse,
t8_MUX_uxn_opcodes_h_l3088_c7_707d_return_output);

-- n8_MUX_uxn_opcodes_h_l3088_c7_707d
n8_MUX_uxn_opcodes_h_l3088_c7_707d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l3088_c7_707d_cond,
n8_MUX_uxn_opcodes_h_l3088_c7_707d_iftrue,
n8_MUX_uxn_opcodes_h_l3088_c7_707d_iffalse,
n8_MUX_uxn_opcodes_h_l3088_c7_707d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l3088_c7_707d
result_is_sp_shift_MUX_uxn_opcodes_h_l3088_c7_707d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l3088_c7_707d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l3088_c7_707d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l3088_c7_707d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l3088_c7_707d_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3088_c7_707d
result_stack_value_MUX_uxn_opcodes_h_l3088_c7_707d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3088_c7_707d_cond,
result_stack_value_MUX_uxn_opcodes_h_l3088_c7_707d_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3088_c7_707d_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3088_c7_707d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3088_c7_707d
result_is_stack_write_MUX_uxn_opcodes_h_l3088_c7_707d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3088_c7_707d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3088_c7_707d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3088_c7_707d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3088_c7_707d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l3088_c7_707d
result_sp_relative_shift_MUX_uxn_opcodes_h_l3088_c7_707d : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l3088_c7_707d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3088_c7_707d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3088_c7_707d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3088_c7_707d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3088_c7_707d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3088_c7_707d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3088_c7_707d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3088_c7_707d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3088_c7_707d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3088_c7_707d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3088_c7_707d
result_is_opc_done_MUX_uxn_opcodes_h_l3088_c7_707d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3088_c7_707d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3088_c7_707d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3088_c7_707d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3088_c7_707d_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l3088_c7_707d
result_is_stack_read_MUX_uxn_opcodes_h_l3088_c7_707d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l3088_c7_707d_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l3088_c7_707d_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l3088_c7_707d_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l3088_c7_707d_return_output);

-- l8_MUX_uxn_opcodes_h_l3088_c7_707d
l8_MUX_uxn_opcodes_h_l3088_c7_707d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l3088_c7_707d_cond,
l8_MUX_uxn_opcodes_h_l3088_c7_707d_iftrue,
l8_MUX_uxn_opcodes_h_l3088_c7_707d_iffalse,
l8_MUX_uxn_opcodes_h_l3088_c7_707d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3092_c11_ad73
BIN_OP_EQ_uxn_opcodes_h_l3092_c11_ad73 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3092_c11_ad73_left,
BIN_OP_EQ_uxn_opcodes_h_l3092_c11_ad73_right,
BIN_OP_EQ_uxn_opcodes_h_l3092_c11_ad73_return_output);

-- n8_MUX_uxn_opcodes_h_l3092_c7_3a11
n8_MUX_uxn_opcodes_h_l3092_c7_3a11 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l3092_c7_3a11_cond,
n8_MUX_uxn_opcodes_h_l3092_c7_3a11_iftrue,
n8_MUX_uxn_opcodes_h_l3092_c7_3a11_iffalse,
n8_MUX_uxn_opcodes_h_l3092_c7_3a11_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l3092_c7_3a11
result_is_sp_shift_MUX_uxn_opcodes_h_l3092_c7_3a11 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l3092_c7_3a11_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l3092_c7_3a11_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l3092_c7_3a11_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l3092_c7_3a11_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3092_c7_3a11
result_stack_value_MUX_uxn_opcodes_h_l3092_c7_3a11 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3092_c7_3a11_cond,
result_stack_value_MUX_uxn_opcodes_h_l3092_c7_3a11_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3092_c7_3a11_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3092_c7_3a11_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3092_c7_3a11
result_is_stack_write_MUX_uxn_opcodes_h_l3092_c7_3a11 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3092_c7_3a11_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3092_c7_3a11_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3092_c7_3a11_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3092_c7_3a11_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l3092_c7_3a11
result_sp_relative_shift_MUX_uxn_opcodes_h_l3092_c7_3a11 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l3092_c7_3a11_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3092_c7_3a11_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3092_c7_3a11_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3092_c7_3a11_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3092_c7_3a11
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3092_c7_3a11 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3092_c7_3a11_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3092_c7_3a11_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3092_c7_3a11_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3092_c7_3a11_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3092_c7_3a11
result_is_opc_done_MUX_uxn_opcodes_h_l3092_c7_3a11 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3092_c7_3a11_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3092_c7_3a11_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3092_c7_3a11_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3092_c7_3a11_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l3092_c7_3a11
result_is_stack_read_MUX_uxn_opcodes_h_l3092_c7_3a11 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l3092_c7_3a11_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l3092_c7_3a11_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l3092_c7_3a11_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l3092_c7_3a11_return_output);

-- l8_MUX_uxn_opcodes_h_l3092_c7_3a11
l8_MUX_uxn_opcodes_h_l3092_c7_3a11 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l3092_c7_3a11_cond,
l8_MUX_uxn_opcodes_h_l3092_c7_3a11_iftrue,
l8_MUX_uxn_opcodes_h_l3092_c7_3a11_iffalse,
l8_MUX_uxn_opcodes_h_l3092_c7_3a11_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3095_c11_767c
BIN_OP_EQ_uxn_opcodes_h_l3095_c11_767c : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3095_c11_767c_left,
BIN_OP_EQ_uxn_opcodes_h_l3095_c11_767c_right,
BIN_OP_EQ_uxn_opcodes_h_l3095_c11_767c_return_output);

-- n8_MUX_uxn_opcodes_h_l3095_c7_e3cf
n8_MUX_uxn_opcodes_h_l3095_c7_e3cf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l3095_c7_e3cf_cond,
n8_MUX_uxn_opcodes_h_l3095_c7_e3cf_iftrue,
n8_MUX_uxn_opcodes_h_l3095_c7_e3cf_iffalse,
n8_MUX_uxn_opcodes_h_l3095_c7_e3cf_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l3095_c7_e3cf
result_is_sp_shift_MUX_uxn_opcodes_h_l3095_c7_e3cf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l3095_c7_e3cf_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l3095_c7_e3cf_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l3095_c7_e3cf_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l3095_c7_e3cf_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3095_c7_e3cf
result_stack_value_MUX_uxn_opcodes_h_l3095_c7_e3cf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3095_c7_e3cf_cond,
result_stack_value_MUX_uxn_opcodes_h_l3095_c7_e3cf_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3095_c7_e3cf_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3095_c7_e3cf_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3095_c7_e3cf
result_is_stack_write_MUX_uxn_opcodes_h_l3095_c7_e3cf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3095_c7_e3cf_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3095_c7_e3cf_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3095_c7_e3cf_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3095_c7_e3cf_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l3095_c7_e3cf
result_sp_relative_shift_MUX_uxn_opcodes_h_l3095_c7_e3cf : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l3095_c7_e3cf_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3095_c7_e3cf_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3095_c7_e3cf_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3095_c7_e3cf_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3095_c7_e3cf
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3095_c7_e3cf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3095_c7_e3cf_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3095_c7_e3cf_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3095_c7_e3cf_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3095_c7_e3cf_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3095_c7_e3cf
result_is_opc_done_MUX_uxn_opcodes_h_l3095_c7_e3cf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3095_c7_e3cf_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3095_c7_e3cf_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3095_c7_e3cf_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3095_c7_e3cf_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l3095_c7_e3cf
result_is_stack_read_MUX_uxn_opcodes_h_l3095_c7_e3cf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l3095_c7_e3cf_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l3095_c7_e3cf_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l3095_c7_e3cf_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l3095_c7_e3cf_return_output);

-- l8_MUX_uxn_opcodes_h_l3095_c7_e3cf
l8_MUX_uxn_opcodes_h_l3095_c7_e3cf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l3095_c7_e3cf_cond,
l8_MUX_uxn_opcodes_h_l3095_c7_e3cf_iftrue,
l8_MUX_uxn_opcodes_h_l3095_c7_e3cf_iffalse,
l8_MUX_uxn_opcodes_h_l3095_c7_e3cf_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3099_c11_cc1c
BIN_OP_EQ_uxn_opcodes_h_l3099_c11_cc1c : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3099_c11_cc1c_left,
BIN_OP_EQ_uxn_opcodes_h_l3099_c11_cc1c_right,
BIN_OP_EQ_uxn_opcodes_h_l3099_c11_cc1c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l3099_c7_b9d5
result_is_sp_shift_MUX_uxn_opcodes_h_l3099_c7_b9d5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l3099_c7_b9d5_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l3099_c7_b9d5_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l3099_c7_b9d5_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l3099_c7_b9d5_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3099_c7_b9d5
result_stack_value_MUX_uxn_opcodes_h_l3099_c7_b9d5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3099_c7_b9d5_cond,
result_stack_value_MUX_uxn_opcodes_h_l3099_c7_b9d5_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3099_c7_b9d5_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3099_c7_b9d5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3099_c7_b9d5
result_is_stack_write_MUX_uxn_opcodes_h_l3099_c7_b9d5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3099_c7_b9d5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3099_c7_b9d5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3099_c7_b9d5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3099_c7_b9d5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l3099_c7_b9d5
result_sp_relative_shift_MUX_uxn_opcodes_h_l3099_c7_b9d5 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l3099_c7_b9d5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3099_c7_b9d5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3099_c7_b9d5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3099_c7_b9d5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3099_c7_b9d5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3099_c7_b9d5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3099_c7_b9d5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3099_c7_b9d5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3099_c7_b9d5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3099_c7_b9d5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3099_c7_b9d5
result_is_opc_done_MUX_uxn_opcodes_h_l3099_c7_b9d5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3099_c7_b9d5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3099_c7_b9d5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3099_c7_b9d5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3099_c7_b9d5_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l3099_c7_b9d5
result_is_stack_read_MUX_uxn_opcodes_h_l3099_c7_b9d5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l3099_c7_b9d5_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l3099_c7_b9d5_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l3099_c7_b9d5_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l3099_c7_b9d5_return_output);

-- l8_MUX_uxn_opcodes_h_l3099_c7_b9d5
l8_MUX_uxn_opcodes_h_l3099_c7_b9d5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l3099_c7_b9d5_cond,
l8_MUX_uxn_opcodes_h_l3099_c7_b9d5_iftrue,
l8_MUX_uxn_opcodes_h_l3099_c7_b9d5_iffalse,
l8_MUX_uxn_opcodes_h_l3099_c7_b9d5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3102_c11_4484
BIN_OP_EQ_uxn_opcodes_h_l3102_c11_4484 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3102_c11_4484_left,
BIN_OP_EQ_uxn_opcodes_h_l3102_c11_4484_right,
BIN_OP_EQ_uxn_opcodes_h_l3102_c11_4484_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l3102_c7_835b
result_is_sp_shift_MUX_uxn_opcodes_h_l3102_c7_835b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l3102_c7_835b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l3102_c7_835b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l3102_c7_835b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l3102_c7_835b_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3102_c7_835b
result_stack_value_MUX_uxn_opcodes_h_l3102_c7_835b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3102_c7_835b_cond,
result_stack_value_MUX_uxn_opcodes_h_l3102_c7_835b_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3102_c7_835b_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3102_c7_835b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3102_c7_835b
result_is_stack_write_MUX_uxn_opcodes_h_l3102_c7_835b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3102_c7_835b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3102_c7_835b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3102_c7_835b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3102_c7_835b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l3102_c7_835b
result_sp_relative_shift_MUX_uxn_opcodes_h_l3102_c7_835b : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l3102_c7_835b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3102_c7_835b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3102_c7_835b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3102_c7_835b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3102_c7_835b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3102_c7_835b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3102_c7_835b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3102_c7_835b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3102_c7_835b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3102_c7_835b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3102_c7_835b
result_is_opc_done_MUX_uxn_opcodes_h_l3102_c7_835b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3102_c7_835b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3102_c7_835b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3102_c7_835b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3102_c7_835b_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l3102_c7_835b
result_is_stack_read_MUX_uxn_opcodes_h_l3102_c7_835b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l3102_c7_835b_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l3102_c7_835b_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l3102_c7_835b_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l3102_c7_835b_return_output);

-- l8_MUX_uxn_opcodes_h_l3102_c7_835b
l8_MUX_uxn_opcodes_h_l3102_c7_835b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l3102_c7_835b_cond,
l8_MUX_uxn_opcodes_h_l3102_c7_835b_iftrue,
l8_MUX_uxn_opcodes_h_l3102_c7_835b_iffalse,
l8_MUX_uxn_opcodes_h_l3102_c7_835b_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l3106_c32_4b09
BIN_OP_AND_uxn_opcodes_h_l3106_c32_4b09 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l3106_c32_4b09_left,
BIN_OP_AND_uxn_opcodes_h_l3106_c32_4b09_right,
BIN_OP_AND_uxn_opcodes_h_l3106_c32_4b09_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l3106_c32_dd07
BIN_OP_GT_uxn_opcodes_h_l3106_c32_dd07 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l3106_c32_dd07_left,
BIN_OP_GT_uxn_opcodes_h_l3106_c32_dd07_right,
BIN_OP_GT_uxn_opcodes_h_l3106_c32_dd07_return_output);

-- MUX_uxn_opcodes_h_l3106_c32_ff84
MUX_uxn_opcodes_h_l3106_c32_ff84 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l3106_c32_ff84_cond,
MUX_uxn_opcodes_h_l3106_c32_ff84_iftrue,
MUX_uxn_opcodes_h_l3106_c32_ff84_iffalse,
MUX_uxn_opcodes_h_l3106_c32_ff84_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3108_c11_cdb4
BIN_OP_EQ_uxn_opcodes_h_l3108_c11_cdb4 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3108_c11_cdb4_left,
BIN_OP_EQ_uxn_opcodes_h_l3108_c11_cdb4_right,
BIN_OP_EQ_uxn_opcodes_h_l3108_c11_cdb4_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l3108_c7_72d0
result_is_sp_shift_MUX_uxn_opcodes_h_l3108_c7_72d0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l3108_c7_72d0_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l3108_c7_72d0_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l3108_c7_72d0_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l3108_c7_72d0_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3108_c7_72d0
result_stack_value_MUX_uxn_opcodes_h_l3108_c7_72d0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3108_c7_72d0_cond,
result_stack_value_MUX_uxn_opcodes_h_l3108_c7_72d0_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3108_c7_72d0_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3108_c7_72d0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3108_c7_72d0
result_is_stack_write_MUX_uxn_opcodes_h_l3108_c7_72d0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3108_c7_72d0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3108_c7_72d0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3108_c7_72d0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3108_c7_72d0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3108_c7_72d0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3108_c7_72d0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3108_c7_72d0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3108_c7_72d0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3108_c7_72d0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3108_c7_72d0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3108_c7_72d0
result_is_opc_done_MUX_uxn_opcodes_h_l3108_c7_72d0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3108_c7_72d0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3108_c7_72d0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3108_c7_72d0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3108_c7_72d0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3114_c11_9ce2
BIN_OP_EQ_uxn_opcodes_h_l3114_c11_9ce2 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3114_c11_9ce2_left,
BIN_OP_EQ_uxn_opcodes_h_l3114_c11_9ce2_right,
BIN_OP_EQ_uxn_opcodes_h_l3114_c11_9ce2_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3114_c7_60b7
result_stack_value_MUX_uxn_opcodes_h_l3114_c7_60b7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3114_c7_60b7_cond,
result_stack_value_MUX_uxn_opcodes_h_l3114_c7_60b7_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3114_c7_60b7_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3114_c7_60b7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3114_c7_60b7
result_is_opc_done_MUX_uxn_opcodes_h_l3114_c7_60b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3114_c7_60b7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3114_c7_60b7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3114_c7_60b7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3114_c7_60b7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3114_c7_60b7
result_is_stack_write_MUX_uxn_opcodes_h_l3114_c7_60b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3114_c7_60b7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3114_c7_60b7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3114_c7_60b7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3114_c7_60b7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3114_c7_60b7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3114_c7_60b7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3114_c7_60b7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3114_c7_60b7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3114_c7_60b7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3114_c7_60b7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3118_c11_8764
BIN_OP_EQ_uxn_opcodes_h_l3118_c11_8764 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3118_c11_8764_left,
BIN_OP_EQ_uxn_opcodes_h_l3118_c11_8764_right,
BIN_OP_EQ_uxn_opcodes_h_l3118_c11_8764_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3118_c7_5824
result_stack_value_MUX_uxn_opcodes_h_l3118_c7_5824 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3118_c7_5824_cond,
result_stack_value_MUX_uxn_opcodes_h_l3118_c7_5824_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3118_c7_5824_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3118_c7_5824_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3118_c7_5824
result_is_opc_done_MUX_uxn_opcodes_h_l3118_c7_5824 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3118_c7_5824_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3118_c7_5824_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3118_c7_5824_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3118_c7_5824_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3118_c7_5824
result_is_stack_write_MUX_uxn_opcodes_h_l3118_c7_5824 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3118_c7_5824_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3118_c7_5824_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3118_c7_5824_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3118_c7_5824_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3118_c7_5824
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3118_c7_5824 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3118_c7_5824_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3118_c7_5824_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3118_c7_5824_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3118_c7_5824_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3122_c11_62d2
BIN_OP_EQ_uxn_opcodes_h_l3122_c11_62d2 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3122_c11_62d2_left,
BIN_OP_EQ_uxn_opcodes_h_l3122_c11_62d2_right,
BIN_OP_EQ_uxn_opcodes_h_l3122_c11_62d2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3122_c7_f346
result_is_opc_done_MUX_uxn_opcodes_h_l3122_c7_f346 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3122_c7_f346_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3122_c7_f346_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3122_c7_f346_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3122_c7_f346_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3122_c7_f346
result_is_stack_write_MUX_uxn_opcodes_h_l3122_c7_f346 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3122_c7_f346_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3122_c7_f346_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3122_c7_f346_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3122_c7_f346_return_output);



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
 l8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l3079_c6_3a94_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c1_4a03_return_output,
 t8_MUX_uxn_opcodes_h_l3079_c2_3d72_return_output,
 n8_MUX_uxn_opcodes_h_l3079_c2_3d72_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l3079_c2_3d72_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3079_c2_3d72_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3079_c2_3d72_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l3079_c2_3d72_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3079_c2_3d72_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3079_c2_3d72_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l3079_c2_3d72_return_output,
 l8_MUX_uxn_opcodes_h_l3079_c2_3d72_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3085_c11_7c68_return_output,
 t8_MUX_uxn_opcodes_h_l3085_c7_c2f9_return_output,
 n8_MUX_uxn_opcodes_h_l3085_c7_c2f9_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l3085_c7_c2f9_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3085_c7_c2f9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3085_c7_c2f9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l3085_c7_c2f9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3085_c7_c2f9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3085_c7_c2f9_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l3085_c7_c2f9_return_output,
 l8_MUX_uxn_opcodes_h_l3085_c7_c2f9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3088_c11_5e91_return_output,
 t8_MUX_uxn_opcodes_h_l3088_c7_707d_return_output,
 n8_MUX_uxn_opcodes_h_l3088_c7_707d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l3088_c7_707d_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3088_c7_707d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3088_c7_707d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l3088_c7_707d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3088_c7_707d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3088_c7_707d_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l3088_c7_707d_return_output,
 l8_MUX_uxn_opcodes_h_l3088_c7_707d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3092_c11_ad73_return_output,
 n8_MUX_uxn_opcodes_h_l3092_c7_3a11_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l3092_c7_3a11_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3092_c7_3a11_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3092_c7_3a11_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l3092_c7_3a11_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3092_c7_3a11_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3092_c7_3a11_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l3092_c7_3a11_return_output,
 l8_MUX_uxn_opcodes_h_l3092_c7_3a11_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3095_c11_767c_return_output,
 n8_MUX_uxn_opcodes_h_l3095_c7_e3cf_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l3095_c7_e3cf_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3095_c7_e3cf_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3095_c7_e3cf_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l3095_c7_e3cf_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3095_c7_e3cf_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3095_c7_e3cf_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l3095_c7_e3cf_return_output,
 l8_MUX_uxn_opcodes_h_l3095_c7_e3cf_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3099_c11_cc1c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l3099_c7_b9d5_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3099_c7_b9d5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3099_c7_b9d5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l3099_c7_b9d5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3099_c7_b9d5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3099_c7_b9d5_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l3099_c7_b9d5_return_output,
 l8_MUX_uxn_opcodes_h_l3099_c7_b9d5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3102_c11_4484_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l3102_c7_835b_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3102_c7_835b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3102_c7_835b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l3102_c7_835b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3102_c7_835b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3102_c7_835b_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l3102_c7_835b_return_output,
 l8_MUX_uxn_opcodes_h_l3102_c7_835b_return_output,
 BIN_OP_AND_uxn_opcodes_h_l3106_c32_4b09_return_output,
 BIN_OP_GT_uxn_opcodes_h_l3106_c32_dd07_return_output,
 MUX_uxn_opcodes_h_l3106_c32_ff84_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3108_c11_cdb4_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l3108_c7_72d0_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3108_c7_72d0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3108_c7_72d0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3108_c7_72d0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3108_c7_72d0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3114_c11_9ce2_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3114_c7_60b7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3114_c7_60b7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3114_c7_60b7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3114_c7_60b7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3118_c11_8764_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3118_c7_5824_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3118_c7_5824_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3118_c7_5824_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3118_c7_5824_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3122_c11_62d2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3122_c7_f346_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3122_c7_f346_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3079_c6_3a94_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3079_c6_3a94_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3079_c6_3a94_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c1_4a03_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c1_4a03_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c1_4a03_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c1_4a03_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l3079_c2_3d72_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l3079_c2_3d72_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l3085_c7_c2f9_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l3079_c2_3d72_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l3079_c2_3d72_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l3079_c2_3d72_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l3079_c2_3d72_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l3085_c7_c2f9_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l3079_c2_3d72_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l3079_c2_3d72_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3079_c2_3d72_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3079_c2_3d72_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3085_c7_c2f9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3079_c2_3d72_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3079_c2_3d72_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3079_c2_3d72_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3079_c2_3d72_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3085_c7_c2f9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3079_c2_3d72_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3079_c2_3d72_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3079_c2_3d72_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3079_c2_3d72_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3085_c7_c2f9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3079_c2_3d72_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3079_c2_3d72_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3079_c2_3d72_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3079_c2_3d72_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3085_c7_c2f9_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3079_c2_3d72_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3079_c2_3d72_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3079_c2_3d72_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3082_c3_d162 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3079_c2_3d72_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3085_c7_c2f9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3079_c2_3d72_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3079_c2_3d72_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3079_c2_3d72_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3079_c2_3d72_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3085_c7_c2f9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3079_c2_3d72_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3079_c2_3d72_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3079_c2_3d72_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3079_c2_3d72_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3085_c7_c2f9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3079_c2_3d72_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3079_c2_3d72_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l3079_c2_3d72_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l3079_c2_3d72_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l3085_c7_c2f9_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l3079_c2_3d72_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l3079_c2_3d72_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l3080_c3_f9a5_uxn_opcodes_h_l3080_c3_f9a5_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3085_c11_7c68_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3085_c11_7c68_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3085_c11_7c68_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l3085_c7_c2f9_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l3085_c7_c2f9_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l3088_c7_707d_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l3085_c7_c2f9_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l3085_c7_c2f9_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l3085_c7_c2f9_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l3088_c7_707d_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l3085_c7_c2f9_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3085_c7_c2f9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3085_c7_c2f9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3088_c7_707d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3085_c7_c2f9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3085_c7_c2f9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3085_c7_c2f9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3088_c7_707d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3085_c7_c2f9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3085_c7_c2f9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3085_c7_c2f9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3088_c7_707d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3085_c7_c2f9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3085_c7_c2f9_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3085_c7_c2f9_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3088_c7_707d_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3085_c7_c2f9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3085_c7_c2f9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3086_c3_0609 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3085_c7_c2f9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3088_c7_707d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3085_c7_c2f9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3085_c7_c2f9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3085_c7_c2f9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3088_c7_707d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3085_c7_c2f9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3085_c7_c2f9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3085_c7_c2f9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3088_c7_707d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3085_c7_c2f9_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l3085_c7_c2f9_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l3085_c7_c2f9_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l3088_c7_707d_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l3085_c7_c2f9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3088_c11_5e91_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3088_c11_5e91_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3088_c11_5e91_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l3088_c7_707d_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l3088_c7_707d_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l3088_c7_707d_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l3088_c7_707d_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l3088_c7_707d_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l3092_c7_3a11_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l3088_c7_707d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3088_c7_707d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3088_c7_707d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3092_c7_3a11_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3088_c7_707d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3088_c7_707d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3088_c7_707d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3092_c7_3a11_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3088_c7_707d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3088_c7_707d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3088_c7_707d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3092_c7_3a11_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3088_c7_707d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3088_c7_707d_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3088_c7_707d_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3092_c7_3a11_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3088_c7_707d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3088_c7_707d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3090_c3_3d7e : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3088_c7_707d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3092_c7_3a11_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3088_c7_707d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3088_c7_707d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3088_c7_707d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3092_c7_3a11_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3088_c7_707d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3088_c7_707d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3088_c7_707d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3092_c7_3a11_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3088_c7_707d_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l3088_c7_707d_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l3088_c7_707d_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l3092_c7_3a11_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l3088_c7_707d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3092_c11_ad73_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3092_c11_ad73_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3092_c11_ad73_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l3092_c7_3a11_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l3092_c7_3a11_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l3095_c7_e3cf_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l3092_c7_3a11_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3092_c7_3a11_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3092_c7_3a11_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3095_c7_e3cf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3092_c7_3a11_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3092_c7_3a11_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3092_c7_3a11_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3095_c7_e3cf_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3092_c7_3a11_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3092_c7_3a11_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3092_c7_3a11_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3095_c7_e3cf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3092_c7_3a11_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3092_c7_3a11_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3092_c7_3a11_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3095_c7_e3cf_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3092_c7_3a11_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3092_c7_3a11_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3093_c3_423c : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3092_c7_3a11_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3095_c7_e3cf_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3092_c7_3a11_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3092_c7_3a11_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3092_c7_3a11_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3095_c7_e3cf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3092_c7_3a11_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3092_c7_3a11_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3092_c7_3a11_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3095_c7_e3cf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3092_c7_3a11_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l3092_c7_3a11_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l3092_c7_3a11_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l3095_c7_e3cf_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l3092_c7_3a11_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3095_c11_767c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3095_c11_767c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3095_c11_767c_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l3095_c7_e3cf_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l3095_c7_e3cf_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l3095_c7_e3cf_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3095_c7_e3cf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3095_c7_e3cf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3099_c7_b9d5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3095_c7_e3cf_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3095_c7_e3cf_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3095_c7_e3cf_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3099_c7_b9d5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3095_c7_e3cf_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3095_c7_e3cf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3095_c7_e3cf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3099_c7_b9d5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3095_c7_e3cf_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3095_c7_e3cf_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3095_c7_e3cf_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3099_c7_b9d5_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3095_c7_e3cf_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3095_c7_e3cf_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3097_c3_5bf3 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3095_c7_e3cf_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3099_c7_b9d5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3095_c7_e3cf_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3095_c7_e3cf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3095_c7_e3cf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3099_c7_b9d5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3095_c7_e3cf_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3095_c7_e3cf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3095_c7_e3cf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3099_c7_b9d5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3095_c7_e3cf_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l3095_c7_e3cf_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l3095_c7_e3cf_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l3099_c7_b9d5_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l3095_c7_e3cf_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3099_c11_cc1c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3099_c11_cc1c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3099_c11_cc1c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3099_c7_b9d5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3099_c7_b9d5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3102_c7_835b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3099_c7_b9d5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3099_c7_b9d5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3099_c7_b9d5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3102_c7_835b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3099_c7_b9d5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3099_c7_b9d5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3099_c7_b9d5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3102_c7_835b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3099_c7_b9d5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3099_c7_b9d5_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3099_c7_b9d5_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3102_c7_835b_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3099_c7_b9d5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3099_c7_b9d5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3100_c3_e44c : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3099_c7_b9d5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3102_c7_835b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3099_c7_b9d5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3099_c7_b9d5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3099_c7_b9d5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3102_c7_835b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3099_c7_b9d5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3099_c7_b9d5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3099_c7_b9d5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3102_c7_835b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3099_c7_b9d5_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l3099_c7_b9d5_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l3099_c7_b9d5_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l3102_c7_835b_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l3099_c7_b9d5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3102_c11_4484_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3102_c11_4484_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3102_c11_4484_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3102_c7_835b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3102_c7_835b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3108_c7_72d0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3102_c7_835b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3102_c7_835b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3102_c7_835b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3108_c7_72d0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3102_c7_835b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3102_c7_835b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3102_c7_835b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3108_c7_72d0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3102_c7_835b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3102_c7_835b_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3102_c7_835b_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3102_c7_835b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3102_c7_835b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3102_c7_835b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3108_c7_72d0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3102_c7_835b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3102_c7_835b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3102_c7_835b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3108_c7_72d0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3102_c7_835b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3102_c7_835b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3102_c7_835b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3102_c7_835b_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l3102_c7_835b_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l3102_c7_835b_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l3102_c7_835b_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3106_c32_ff84_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3106_c32_ff84_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3106_c32_ff84_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l3106_c32_4b09_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l3106_c32_4b09_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l3106_c32_4b09_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l3106_c32_dd07_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l3106_c32_dd07_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l3106_c32_dd07_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3106_c32_ff84_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3108_c11_cdb4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3108_c11_cdb4_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3108_c11_cdb4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3108_c7_72d0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3108_c7_72d0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3108_c7_72d0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3108_c7_72d0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3108_c7_72d0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3114_c7_60b7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3108_c7_72d0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3108_c7_72d0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3108_c7_72d0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3114_c7_60b7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3108_c7_72d0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3108_c7_72d0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3111_c3_28ed : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3108_c7_72d0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3114_c7_60b7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3108_c7_72d0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3108_c7_72d0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3108_c7_72d0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3114_c7_60b7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3108_c7_72d0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3114_c11_9ce2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3114_c11_9ce2_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3114_c11_9ce2_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3114_c7_60b7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3114_c7_60b7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3118_c7_5824_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3114_c7_60b7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3114_c7_60b7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3114_c7_60b7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3118_c7_5824_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3114_c7_60b7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3114_c7_60b7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3114_c7_60b7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3118_c7_5824_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3114_c7_60b7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3114_c7_60b7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3115_c3_6139 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3114_c7_60b7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3118_c7_5824_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3114_c7_60b7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3118_c11_8764_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3118_c11_8764_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3118_c11_8764_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3118_c7_5824_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3118_c7_5824_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3118_c7_5824_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3118_c7_5824_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3118_c7_5824_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3122_c7_f346_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3118_c7_5824_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3118_c7_5824_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3118_c7_5824_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3122_c7_f346_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3118_c7_5824_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3118_c7_5824_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3119_c3_3130 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3118_c7_5824_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3118_c7_5824_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3122_c11_62d2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3122_c11_62d2_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3122_c11_62d2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3122_c7_f346_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3122_c7_f346_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3122_c7_f346_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3122_c7_f346_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3122_c7_f346_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3122_c7_f346_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3079_l3099_l3095_l3092_l3088_l3085_l3108_DUPLICATE_a708_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3079_l3102_l3099_l3095_l3092_l3118_l3088_l3085_DUPLICATE_dea1_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3079_l3102_l3099_l3095_l3122_l3092_l3118_l3088_l3114_l3085_DUPLICATE_45d9_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3079_l3102_l3099_l3095_l3092_l3088_l3085_DUPLICATE_25d6_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3102_l3099_l3095_l3122_l3092_l3118_l3088_l3114_l3085_l3108_DUPLICATE_a00e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l3102_l3099_l3095_l3092_l3088_l3085_DUPLICATE_2641_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l3102_l3118_DUPLICATE_e16f_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_287e_uxn_opcodes_h_l3127_l3075_DUPLICATE_85b2_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_n8 : unsigned(7 downto 0);
variable REG_VAR_l8 : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_n8 := n8;
  REG_VAR_l8 := l8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3114_c11_9ce2_right := to_unsigned(8, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3093_c3_423c := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3092_c7_3a11_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3093_c3_423c;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3122_c11_62d2_right := to_unsigned(10, 4);
     VAR_MUX_uxn_opcodes_h_l3106_c32_ff84_iftrue := signed(std_logic_vector(resize(to_unsigned(3, 2), 8)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3119_c3_3130 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3118_c7_5824_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3119_c3_3130;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3100_c3_e44c := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3099_c7_b9d5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3100_c3_e44c;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c1_4a03_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3082_c3_d162 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3079_c2_3d72_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3082_c3_d162;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3102_c7_835b_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3108_c7_72d0_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l3106_c32_4b09_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3088_c11_5e91_right := to_unsigned(2, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3122_c7_f346_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l3106_c32_ff84_iffalse := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3090_c3_3d7e := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3088_c7_707d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3090_c3_3d7e;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3086_c3_0609 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3085_c7_c2f9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3086_c3_0609;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3122_c7_f346_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3102_c7_835b_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3108_c11_cdb4_right := to_unsigned(7, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3111_c3_28ed := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3108_c7_72d0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3111_c3_28ed;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3092_c11_ad73_right := to_unsigned(3, 2);
     VAR_BIN_OP_GT_uxn_opcodes_h_l3106_c32_dd07_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3085_c11_7c68_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3079_c2_3d72_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3079_c6_3a94_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3097_c3_5bf3 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3095_c7_e3cf_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3097_c3_5bf3;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3102_c11_4484_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3099_c11_cc1c_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3115_c3_6139 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3114_c7_60b7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3115_c3_6139;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3108_c7_72d0_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3079_c2_3d72_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3095_c11_767c_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3118_c11_8764_right := to_unsigned(9, 4);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c1_4a03_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l3106_c32_4b09_left := VAR_ins;
     VAR_l8_MUX_uxn_opcodes_h_l3079_c2_3d72_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l3085_c7_c2f9_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l3088_c7_707d_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l3092_c7_3a11_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l3095_c7_e3cf_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l3099_c7_b9d5_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l3102_c7_835b_iffalse := l8;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3108_c7_72d0_iftrue := l8;
     VAR_n8_MUX_uxn_opcodes_h_l3079_c2_3d72_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l3085_c7_c2f9_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l3088_c7_707d_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l3092_c7_3a11_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l3095_c7_e3cf_iffalse := n8;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3118_c7_5824_iftrue := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3079_c6_3a94_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3085_c11_7c68_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3088_c11_5e91_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3092_c11_ad73_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3095_c11_767c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3099_c11_cc1c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3102_c11_4484_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3108_c11_cdb4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3114_c11_9ce2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3118_c11_8764_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3122_c11_62d2_left := VAR_phase;
     VAR_l8_MUX_uxn_opcodes_h_l3102_c7_835b_iftrue := VAR_previous_stack_read;
     VAR_n8_MUX_uxn_opcodes_h_l3095_c7_e3cf_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l3088_c7_707d_iftrue := VAR_previous_stack_read;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3114_c7_60b7_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l3079_c2_3d72_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l3085_c7_c2f9_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l3088_c7_707d_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l3092_c11_ad73] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3092_c11_ad73_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3092_c11_ad73_left;
     BIN_OP_EQ_uxn_opcodes_h_l3092_c11_ad73_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3092_c11_ad73_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3092_c11_ad73_return_output := BIN_OP_EQ_uxn_opcodes_h_l3092_c11_ad73_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3079_l3102_l3099_l3095_l3092_l3118_l3088_l3085_DUPLICATE_dea1 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3079_l3102_l3099_l3095_l3092_l3118_l3088_l3085_DUPLICATE_dea1_return_output := result.stack_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3079_l3099_l3095_l3092_l3088_l3085_l3108_DUPLICATE_a708 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3079_l3099_l3095_l3092_l3088_l3085_l3108_DUPLICATE_a708_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l3118_c11_8764] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3118_c11_8764_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3118_c11_8764_left;
     BIN_OP_EQ_uxn_opcodes_h_l3118_c11_8764_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3118_c11_8764_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3118_c11_8764_return_output := BIN_OP_EQ_uxn_opcodes_h_l3118_c11_8764_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l3106_c32_4b09] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l3106_c32_4b09_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l3106_c32_4b09_left;
     BIN_OP_AND_uxn_opcodes_h_l3106_c32_4b09_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l3106_c32_4b09_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l3106_c32_4b09_return_output := BIN_OP_AND_uxn_opcodes_h_l3106_c32_4b09_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l3102_l3099_l3095_l3092_l3088_l3085_DUPLICATE_2641 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l3102_l3099_l3095_l3092_l3088_l3085_DUPLICATE_2641_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l3102_c11_4484] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3102_c11_4484_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3102_c11_4484_left;
     BIN_OP_EQ_uxn_opcodes_h_l3102_c11_4484_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3102_c11_4484_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3102_c11_4484_return_output := BIN_OP_EQ_uxn_opcodes_h_l3102_c11_4484_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3122_c11_62d2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3122_c11_62d2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3122_c11_62d2_left;
     BIN_OP_EQ_uxn_opcodes_h_l3122_c11_62d2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3122_c11_62d2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3122_c11_62d2_return_output := BIN_OP_EQ_uxn_opcodes_h_l3122_c11_62d2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3099_c11_cc1c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3099_c11_cc1c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3099_c11_cc1c_left;
     BIN_OP_EQ_uxn_opcodes_h_l3099_c11_cc1c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3099_c11_cc1c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3099_c11_cc1c_return_output := BIN_OP_EQ_uxn_opcodes_h_l3099_c11_cc1c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3079_c6_3a94] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3079_c6_3a94_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3079_c6_3a94_left;
     BIN_OP_EQ_uxn_opcodes_h_l3079_c6_3a94_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3079_c6_3a94_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3079_c6_3a94_return_output := BIN_OP_EQ_uxn_opcodes_h_l3079_c6_3a94_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l3102_l3118_DUPLICATE_e16f LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l3102_l3118_DUPLICATE_e16f_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l3088_c11_5e91] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3088_c11_5e91_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3088_c11_5e91_left;
     BIN_OP_EQ_uxn_opcodes_h_l3088_c11_5e91_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3088_c11_5e91_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3088_c11_5e91_return_output := BIN_OP_EQ_uxn_opcodes_h_l3088_c11_5e91_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3114_c11_9ce2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3114_c11_9ce2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3114_c11_9ce2_left;
     BIN_OP_EQ_uxn_opcodes_h_l3114_c11_9ce2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3114_c11_9ce2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3114_c11_9ce2_return_output := BIN_OP_EQ_uxn_opcodes_h_l3114_c11_9ce2_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3079_l3102_l3099_l3095_l3122_l3092_l3118_l3088_l3114_l3085_DUPLICATE_45d9 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3079_l3102_l3099_l3095_l3122_l3092_l3118_l3088_l3114_l3085_DUPLICATE_45d9_return_output := result.is_stack_write;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3079_l3102_l3099_l3095_l3092_l3088_l3085_DUPLICATE_25d6 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3079_l3102_l3099_l3095_l3092_l3088_l3085_DUPLICATE_25d6_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l3095_c11_767c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3095_c11_767c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3095_c11_767c_left;
     BIN_OP_EQ_uxn_opcodes_h_l3095_c11_767c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3095_c11_767c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3095_c11_767c_return_output := BIN_OP_EQ_uxn_opcodes_h_l3095_c11_767c_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3102_l3099_l3095_l3122_l3092_l3118_l3088_l3114_l3085_l3108_DUPLICATE_a00e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3102_l3099_l3095_l3122_l3092_l3118_l3088_l3114_l3085_l3108_DUPLICATE_a00e_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l3085_c11_7c68] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3085_c11_7c68_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3085_c11_7c68_left;
     BIN_OP_EQ_uxn_opcodes_h_l3085_c11_7c68_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3085_c11_7c68_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3085_c11_7c68_return_output := BIN_OP_EQ_uxn_opcodes_h_l3085_c11_7c68_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3108_c11_cdb4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3108_c11_cdb4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3108_c11_cdb4_left;
     BIN_OP_EQ_uxn_opcodes_h_l3108_c11_cdb4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3108_c11_cdb4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3108_c11_cdb4_return_output := BIN_OP_EQ_uxn_opcodes_h_l3108_c11_cdb4_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l3106_c32_dd07_left := VAR_BIN_OP_AND_uxn_opcodes_h_l3106_c32_4b09_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c1_4a03_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3079_c6_3a94_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l3079_c2_3d72_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3079_c6_3a94_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l3079_c2_3d72_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3079_c6_3a94_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3079_c2_3d72_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3079_c6_3a94_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3079_c2_3d72_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3079_c6_3a94_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3079_c2_3d72_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3079_c6_3a94_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3079_c2_3d72_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3079_c6_3a94_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3079_c2_3d72_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3079_c6_3a94_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3079_c2_3d72_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3079_c6_3a94_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3079_c2_3d72_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3079_c6_3a94_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l3079_c2_3d72_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3079_c6_3a94_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l3085_c7_c2f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3085_c11_7c68_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l3085_c7_c2f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3085_c11_7c68_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3085_c7_c2f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3085_c11_7c68_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3085_c7_c2f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3085_c11_7c68_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3085_c7_c2f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3085_c11_7c68_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3085_c7_c2f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3085_c11_7c68_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3085_c7_c2f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3085_c11_7c68_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3085_c7_c2f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3085_c11_7c68_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3085_c7_c2f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3085_c11_7c68_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l3085_c7_c2f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3085_c11_7c68_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l3088_c7_707d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3088_c11_5e91_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l3088_c7_707d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3088_c11_5e91_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3088_c7_707d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3088_c11_5e91_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3088_c7_707d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3088_c11_5e91_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3088_c7_707d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3088_c11_5e91_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3088_c7_707d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3088_c11_5e91_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3088_c7_707d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3088_c11_5e91_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3088_c7_707d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3088_c11_5e91_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3088_c7_707d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3088_c11_5e91_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l3088_c7_707d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3088_c11_5e91_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l3092_c7_3a11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3092_c11_ad73_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l3092_c7_3a11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3092_c11_ad73_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3092_c7_3a11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3092_c11_ad73_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3092_c7_3a11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3092_c11_ad73_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3092_c7_3a11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3092_c11_ad73_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3092_c7_3a11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3092_c11_ad73_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3092_c7_3a11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3092_c11_ad73_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3092_c7_3a11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3092_c11_ad73_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3092_c7_3a11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3092_c11_ad73_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l3095_c7_e3cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3095_c11_767c_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l3095_c7_e3cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3095_c11_767c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3095_c7_e3cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3095_c11_767c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3095_c7_e3cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3095_c11_767c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3095_c7_e3cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3095_c11_767c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3095_c7_e3cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3095_c11_767c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3095_c7_e3cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3095_c11_767c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3095_c7_e3cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3095_c11_767c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3095_c7_e3cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3095_c11_767c_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l3099_c7_b9d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3099_c11_cc1c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3099_c7_b9d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3099_c11_cc1c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3099_c7_b9d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3099_c11_cc1c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3099_c7_b9d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3099_c11_cc1c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3099_c7_b9d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3099_c11_cc1c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3099_c7_b9d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3099_c11_cc1c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3099_c7_b9d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3099_c11_cc1c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3099_c7_b9d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3099_c11_cc1c_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l3102_c7_835b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3102_c11_4484_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3102_c7_835b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3102_c11_4484_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3102_c7_835b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3102_c11_4484_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3102_c7_835b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3102_c11_4484_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3102_c7_835b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3102_c11_4484_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3102_c7_835b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3102_c11_4484_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3102_c7_835b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3102_c11_4484_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3102_c7_835b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3102_c11_4484_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3108_c7_72d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3108_c11_cdb4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3108_c7_72d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3108_c11_cdb4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3108_c7_72d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3108_c11_cdb4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3108_c7_72d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3108_c11_cdb4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3108_c7_72d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3108_c11_cdb4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3114_c7_60b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3114_c11_9ce2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3114_c7_60b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3114_c11_9ce2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3114_c7_60b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3114_c11_9ce2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3114_c7_60b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3114_c11_9ce2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3118_c7_5824_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3118_c11_8764_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3118_c7_5824_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3118_c11_8764_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3118_c7_5824_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3118_c11_8764_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3118_c7_5824_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3118_c11_8764_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3122_c7_f346_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3122_c11_62d2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3122_c7_f346_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3122_c11_62d2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3079_c2_3d72_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3079_l3102_l3099_l3095_l3092_l3088_l3085_DUPLICATE_25d6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3085_c7_c2f9_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3079_l3102_l3099_l3095_l3092_l3088_l3085_DUPLICATE_25d6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3088_c7_707d_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3079_l3102_l3099_l3095_l3092_l3088_l3085_DUPLICATE_25d6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3092_c7_3a11_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3079_l3102_l3099_l3095_l3092_l3088_l3085_DUPLICATE_25d6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3095_c7_e3cf_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3079_l3102_l3099_l3095_l3092_l3088_l3085_DUPLICATE_25d6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3099_c7_b9d5_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3079_l3102_l3099_l3095_l3092_l3088_l3085_DUPLICATE_25d6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3102_c7_835b_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3079_l3102_l3099_l3095_l3092_l3088_l3085_DUPLICATE_25d6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3085_c7_c2f9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3102_l3099_l3095_l3122_l3092_l3118_l3088_l3114_l3085_l3108_DUPLICATE_a00e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3088_c7_707d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3102_l3099_l3095_l3122_l3092_l3118_l3088_l3114_l3085_l3108_DUPLICATE_a00e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3092_c7_3a11_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3102_l3099_l3095_l3122_l3092_l3118_l3088_l3114_l3085_l3108_DUPLICATE_a00e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3095_c7_e3cf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3102_l3099_l3095_l3122_l3092_l3118_l3088_l3114_l3085_l3108_DUPLICATE_a00e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3099_c7_b9d5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3102_l3099_l3095_l3122_l3092_l3118_l3088_l3114_l3085_l3108_DUPLICATE_a00e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3102_c7_835b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3102_l3099_l3095_l3122_l3092_l3118_l3088_l3114_l3085_l3108_DUPLICATE_a00e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3108_c7_72d0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3102_l3099_l3095_l3122_l3092_l3118_l3088_l3114_l3085_l3108_DUPLICATE_a00e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3114_c7_60b7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3102_l3099_l3095_l3122_l3092_l3118_l3088_l3114_l3085_l3108_DUPLICATE_a00e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3118_c7_5824_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3102_l3099_l3095_l3122_l3092_l3118_l3088_l3114_l3085_l3108_DUPLICATE_a00e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3122_c7_f346_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3102_l3099_l3095_l3122_l3092_l3118_l3088_l3114_l3085_l3108_DUPLICATE_a00e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3079_c2_3d72_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3079_l3099_l3095_l3092_l3088_l3085_l3108_DUPLICATE_a708_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3085_c7_c2f9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3079_l3099_l3095_l3092_l3088_l3085_l3108_DUPLICATE_a708_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3088_c7_707d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3079_l3099_l3095_l3092_l3088_l3085_l3108_DUPLICATE_a708_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3092_c7_3a11_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3079_l3099_l3095_l3092_l3088_l3085_l3108_DUPLICATE_a708_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3095_c7_e3cf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3079_l3099_l3095_l3092_l3088_l3085_l3108_DUPLICATE_a708_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3099_c7_b9d5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3079_l3099_l3095_l3092_l3088_l3085_l3108_DUPLICATE_a708_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3108_c7_72d0_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3079_l3099_l3095_l3092_l3088_l3085_l3108_DUPLICATE_a708_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3085_c7_c2f9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l3102_l3099_l3095_l3092_l3088_l3085_DUPLICATE_2641_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3088_c7_707d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l3102_l3099_l3095_l3092_l3088_l3085_DUPLICATE_2641_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3092_c7_3a11_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l3102_l3099_l3095_l3092_l3088_l3085_DUPLICATE_2641_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3095_c7_e3cf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l3102_l3099_l3095_l3092_l3088_l3085_DUPLICATE_2641_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3099_c7_b9d5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l3102_l3099_l3095_l3092_l3088_l3085_DUPLICATE_2641_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3102_c7_835b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l3102_l3099_l3095_l3092_l3088_l3085_DUPLICATE_2641_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3079_c2_3d72_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3079_l3102_l3099_l3095_l3122_l3092_l3118_l3088_l3114_l3085_DUPLICATE_45d9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3085_c7_c2f9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3079_l3102_l3099_l3095_l3122_l3092_l3118_l3088_l3114_l3085_DUPLICATE_45d9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3088_c7_707d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3079_l3102_l3099_l3095_l3122_l3092_l3118_l3088_l3114_l3085_DUPLICATE_45d9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3092_c7_3a11_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3079_l3102_l3099_l3095_l3122_l3092_l3118_l3088_l3114_l3085_DUPLICATE_45d9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3095_c7_e3cf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3079_l3102_l3099_l3095_l3122_l3092_l3118_l3088_l3114_l3085_DUPLICATE_45d9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3099_c7_b9d5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3079_l3102_l3099_l3095_l3122_l3092_l3118_l3088_l3114_l3085_DUPLICATE_45d9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3102_c7_835b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3079_l3102_l3099_l3095_l3122_l3092_l3118_l3088_l3114_l3085_DUPLICATE_45d9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3114_c7_60b7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3079_l3102_l3099_l3095_l3122_l3092_l3118_l3088_l3114_l3085_DUPLICATE_45d9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3118_c7_5824_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3079_l3102_l3099_l3095_l3122_l3092_l3118_l3088_l3114_l3085_DUPLICATE_45d9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3122_c7_f346_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3079_l3102_l3099_l3095_l3122_l3092_l3118_l3088_l3114_l3085_DUPLICATE_45d9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3102_c7_835b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l3102_l3118_DUPLICATE_e16f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3118_c7_5824_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l3102_l3118_DUPLICATE_e16f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3079_c2_3d72_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3079_l3102_l3099_l3095_l3092_l3118_l3088_l3085_DUPLICATE_dea1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3085_c7_c2f9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3079_l3102_l3099_l3095_l3092_l3118_l3088_l3085_DUPLICATE_dea1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3088_c7_707d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3079_l3102_l3099_l3095_l3092_l3118_l3088_l3085_DUPLICATE_dea1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3092_c7_3a11_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3079_l3102_l3099_l3095_l3092_l3118_l3088_l3085_DUPLICATE_dea1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3095_c7_e3cf_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3079_l3102_l3099_l3095_l3092_l3118_l3088_l3085_DUPLICATE_dea1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3099_c7_b9d5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3079_l3102_l3099_l3095_l3092_l3118_l3088_l3085_DUPLICATE_dea1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3102_c7_835b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3079_l3102_l3099_l3095_l3092_l3118_l3088_l3085_DUPLICATE_dea1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3118_c7_5824_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3079_l3102_l3099_l3095_l3092_l3118_l3088_l3085_DUPLICATE_dea1_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l3122_c7_f346] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3122_c7_f346_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3122_c7_f346_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3122_c7_f346_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3122_c7_f346_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3122_c7_f346_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3122_c7_f346_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3122_c7_f346_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3122_c7_f346_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l3106_c32_dd07] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l3106_c32_dd07_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l3106_c32_dd07_left;
     BIN_OP_GT_uxn_opcodes_h_l3106_c32_dd07_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l3106_c32_dd07_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l3106_c32_dd07_return_output := BIN_OP_GT_uxn_opcodes_h_l3106_c32_dd07_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l3102_c7_835b] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l3102_c7_835b_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3102_c7_835b_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l3102_c7_835b_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3102_c7_835b_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l3102_c7_835b_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3102_c7_835b_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3102_c7_835b_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l3102_c7_835b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3122_c7_f346] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3122_c7_f346_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3122_c7_f346_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3122_c7_f346_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3122_c7_f346_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3122_c7_f346_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3122_c7_f346_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3122_c7_f346_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3122_c7_f346_return_output;

     -- n8_MUX[uxn_opcodes_h_l3095_c7_e3cf] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l3095_c7_e3cf_cond <= VAR_n8_MUX_uxn_opcodes_h_l3095_c7_e3cf_cond;
     n8_MUX_uxn_opcodes_h_l3095_c7_e3cf_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l3095_c7_e3cf_iftrue;
     n8_MUX_uxn_opcodes_h_l3095_c7_e3cf_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l3095_c7_e3cf_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l3095_c7_e3cf_return_output := n8_MUX_uxn_opcodes_h_l3095_c7_e3cf_return_output;

     -- t8_MUX[uxn_opcodes_h_l3088_c7_707d] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l3088_c7_707d_cond <= VAR_t8_MUX_uxn_opcodes_h_l3088_c7_707d_cond;
     t8_MUX_uxn_opcodes_h_l3088_c7_707d_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l3088_c7_707d_iftrue;
     t8_MUX_uxn_opcodes_h_l3088_c7_707d_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l3088_c7_707d_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l3088_c7_707d_return_output := t8_MUX_uxn_opcodes_h_l3088_c7_707d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3118_c7_5824] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3118_c7_5824_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3118_c7_5824_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3118_c7_5824_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3118_c7_5824_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3118_c7_5824_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3118_c7_5824_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3118_c7_5824_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3118_c7_5824_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l3108_c7_72d0] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l3108_c7_72d0_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3108_c7_72d0_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3108_c7_72d0_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3108_c7_72d0_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3108_c7_72d0_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3108_c7_72d0_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3108_c7_72d0_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l3108_c7_72d0_return_output;

     -- l8_MUX[uxn_opcodes_h_l3102_c7_835b] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l3102_c7_835b_cond <= VAR_l8_MUX_uxn_opcodes_h_l3102_c7_835b_cond;
     l8_MUX_uxn_opcodes_h_l3102_c7_835b_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l3102_c7_835b_iftrue;
     l8_MUX_uxn_opcodes_h_l3102_c7_835b_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l3102_c7_835b_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l3102_c7_835b_return_output := l8_MUX_uxn_opcodes_h_l3102_c7_835b_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l3118_c7_5824] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3118_c7_5824_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3118_c7_5824_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3118_c7_5824_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3118_c7_5824_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3118_c7_5824_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3118_c7_5824_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3118_c7_5824_return_output := result_stack_value_MUX_uxn_opcodes_h_l3118_c7_5824_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3079_c1_4a03] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c1_4a03_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c1_4a03_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c1_4a03_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c1_4a03_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c1_4a03_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c1_4a03_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c1_4a03_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c1_4a03_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l3106_c32_ff84_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l3106_c32_dd07_return_output;
     VAR_printf_uxn_opcodes_h_l3080_c3_f9a5_uxn_opcodes_h_l3080_c3_f9a5_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c1_4a03_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l3099_c7_b9d5_iffalse := VAR_l8_MUX_uxn_opcodes_h_l3102_c7_835b_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l3092_c7_3a11_iffalse := VAR_n8_MUX_uxn_opcodes_h_l3095_c7_e3cf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3118_c7_5824_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3122_c7_f346_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3102_c7_835b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3108_c7_72d0_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3099_c7_b9d5_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3102_c7_835b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3118_c7_5824_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3122_c7_f346_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3114_c7_60b7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3118_c7_5824_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3114_c7_60b7_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l3118_c7_5824_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l3085_c7_c2f9_iffalse := VAR_t8_MUX_uxn_opcodes_h_l3088_c7_707d_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3114_c7_60b7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3114_c7_60b7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3114_c7_60b7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3114_c7_60b7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3114_c7_60b7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3114_c7_60b7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3114_c7_60b7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3114_c7_60b7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3114_c7_60b7_return_output;

     -- t8_MUX[uxn_opcodes_h_l3085_c7_c2f9] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l3085_c7_c2f9_cond <= VAR_t8_MUX_uxn_opcodes_h_l3085_c7_c2f9_cond;
     t8_MUX_uxn_opcodes_h_l3085_c7_c2f9_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l3085_c7_c2f9_iftrue;
     t8_MUX_uxn_opcodes_h_l3085_c7_c2f9_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l3085_c7_c2f9_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l3085_c7_c2f9_return_output := t8_MUX_uxn_opcodes_h_l3085_c7_c2f9_return_output;

     -- n8_MUX[uxn_opcodes_h_l3092_c7_3a11] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l3092_c7_3a11_cond <= VAR_n8_MUX_uxn_opcodes_h_l3092_c7_3a11_cond;
     n8_MUX_uxn_opcodes_h_l3092_c7_3a11_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l3092_c7_3a11_iftrue;
     n8_MUX_uxn_opcodes_h_l3092_c7_3a11_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l3092_c7_3a11_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l3092_c7_3a11_return_output := n8_MUX_uxn_opcodes_h_l3092_c7_3a11_return_output;

     -- l8_MUX[uxn_opcodes_h_l3099_c7_b9d5] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l3099_c7_b9d5_cond <= VAR_l8_MUX_uxn_opcodes_h_l3099_c7_b9d5_cond;
     l8_MUX_uxn_opcodes_h_l3099_c7_b9d5_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l3099_c7_b9d5_iftrue;
     l8_MUX_uxn_opcodes_h_l3099_c7_b9d5_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l3099_c7_b9d5_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l3099_c7_b9d5_return_output := l8_MUX_uxn_opcodes_h_l3099_c7_b9d5_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l3099_c7_b9d5] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l3099_c7_b9d5_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3099_c7_b9d5_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l3099_c7_b9d5_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3099_c7_b9d5_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l3099_c7_b9d5_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3099_c7_b9d5_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3099_c7_b9d5_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l3099_c7_b9d5_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l3114_c7_60b7] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3114_c7_60b7_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3114_c7_60b7_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3114_c7_60b7_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3114_c7_60b7_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3114_c7_60b7_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3114_c7_60b7_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3114_c7_60b7_return_output := result_stack_value_MUX_uxn_opcodes_h_l3114_c7_60b7_return_output;

     -- MUX[uxn_opcodes_h_l3106_c32_ff84] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l3106_c32_ff84_cond <= VAR_MUX_uxn_opcodes_h_l3106_c32_ff84_cond;
     MUX_uxn_opcodes_h_l3106_c32_ff84_iftrue <= VAR_MUX_uxn_opcodes_h_l3106_c32_ff84_iftrue;
     MUX_uxn_opcodes_h_l3106_c32_ff84_iffalse <= VAR_MUX_uxn_opcodes_h_l3106_c32_ff84_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l3106_c32_ff84_return_output := MUX_uxn_opcodes_h_l3106_c32_ff84_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3118_c7_5824] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3118_c7_5824_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3118_c7_5824_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3118_c7_5824_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3118_c7_5824_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3118_c7_5824_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3118_c7_5824_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3118_c7_5824_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3118_c7_5824_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3118_c7_5824] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3118_c7_5824_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3118_c7_5824_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3118_c7_5824_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3118_c7_5824_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3118_c7_5824_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3118_c7_5824_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3118_c7_5824_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3118_c7_5824_return_output;

     -- printf_uxn_opcodes_h_l3080_c3_f9a5[uxn_opcodes_h_l3080_c3_f9a5] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l3080_c3_f9a5_uxn_opcodes_h_l3080_c3_f9a5_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l3080_c3_f9a5_uxn_opcodes_h_l3080_c3_f9a5_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l3102_c7_835b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l3102_c7_835b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3102_c7_835b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3102_c7_835b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3102_c7_835b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3102_c7_835b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3102_c7_835b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3102_c7_835b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l3102_c7_835b_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3102_c7_835b_iftrue := VAR_MUX_uxn_opcodes_h_l3106_c32_ff84_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l3095_c7_e3cf_iffalse := VAR_l8_MUX_uxn_opcodes_h_l3099_c7_b9d5_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l3088_c7_707d_iffalse := VAR_n8_MUX_uxn_opcodes_h_l3092_c7_3a11_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3114_c7_60b7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3118_c7_5824_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3099_c7_b9d5_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3102_c7_835b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3095_c7_e3cf_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3099_c7_b9d5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3114_c7_60b7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3118_c7_5824_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3108_c7_72d0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3114_c7_60b7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3108_c7_72d0_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l3114_c7_60b7_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l3079_c2_3d72_iffalse := VAR_t8_MUX_uxn_opcodes_h_l3085_c7_c2f9_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l3095_c7_e3cf] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l3095_c7_e3cf_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3095_c7_e3cf_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l3095_c7_e3cf_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3095_c7_e3cf_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l3095_c7_e3cf_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3095_c7_e3cf_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3095_c7_e3cf_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l3095_c7_e3cf_return_output;

     -- n8_MUX[uxn_opcodes_h_l3088_c7_707d] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l3088_c7_707d_cond <= VAR_n8_MUX_uxn_opcodes_h_l3088_c7_707d_cond;
     n8_MUX_uxn_opcodes_h_l3088_c7_707d_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l3088_c7_707d_iftrue;
     n8_MUX_uxn_opcodes_h_l3088_c7_707d_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l3088_c7_707d_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l3088_c7_707d_return_output := n8_MUX_uxn_opcodes_h_l3088_c7_707d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3108_c7_72d0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3108_c7_72d0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3108_c7_72d0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3108_c7_72d0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3108_c7_72d0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3108_c7_72d0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3108_c7_72d0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3108_c7_72d0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3108_c7_72d0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l3102_c7_835b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3102_c7_835b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3102_c7_835b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3102_c7_835b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3102_c7_835b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3102_c7_835b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3102_c7_835b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3102_c7_835b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l3102_c7_835b_return_output;

     -- t8_MUX[uxn_opcodes_h_l3079_c2_3d72] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l3079_c2_3d72_cond <= VAR_t8_MUX_uxn_opcodes_h_l3079_c2_3d72_cond;
     t8_MUX_uxn_opcodes_h_l3079_c2_3d72_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l3079_c2_3d72_iftrue;
     t8_MUX_uxn_opcodes_h_l3079_c2_3d72_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l3079_c2_3d72_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l3079_c2_3d72_return_output := t8_MUX_uxn_opcodes_h_l3079_c2_3d72_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l3099_c7_b9d5] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l3099_c7_b9d5_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3099_c7_b9d5_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3099_c7_b9d5_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3099_c7_b9d5_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3099_c7_b9d5_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3099_c7_b9d5_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3099_c7_b9d5_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l3099_c7_b9d5_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l3108_c7_72d0] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3108_c7_72d0_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3108_c7_72d0_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3108_c7_72d0_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3108_c7_72d0_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3108_c7_72d0_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3108_c7_72d0_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3108_c7_72d0_return_output := result_stack_value_MUX_uxn_opcodes_h_l3108_c7_72d0_return_output;

     -- l8_MUX[uxn_opcodes_h_l3095_c7_e3cf] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l3095_c7_e3cf_cond <= VAR_l8_MUX_uxn_opcodes_h_l3095_c7_e3cf_cond;
     l8_MUX_uxn_opcodes_h_l3095_c7_e3cf_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l3095_c7_e3cf_iftrue;
     l8_MUX_uxn_opcodes_h_l3095_c7_e3cf_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l3095_c7_e3cf_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l3095_c7_e3cf_return_output := l8_MUX_uxn_opcodes_h_l3095_c7_e3cf_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3114_c7_60b7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3114_c7_60b7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3114_c7_60b7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3114_c7_60b7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3114_c7_60b7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3114_c7_60b7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3114_c7_60b7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3114_c7_60b7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3114_c7_60b7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3114_c7_60b7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3114_c7_60b7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3114_c7_60b7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3114_c7_60b7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3114_c7_60b7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3114_c7_60b7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3114_c7_60b7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3114_c7_60b7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3114_c7_60b7_return_output;

     -- Submodule level 4
     VAR_l8_MUX_uxn_opcodes_h_l3092_c7_3a11_iffalse := VAR_l8_MUX_uxn_opcodes_h_l3095_c7_e3cf_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l3085_c7_c2f9_iffalse := VAR_n8_MUX_uxn_opcodes_h_l3088_c7_707d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3108_c7_72d0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3114_c7_60b7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3095_c7_e3cf_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3099_c7_b9d5_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3092_c7_3a11_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3095_c7_e3cf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3108_c7_72d0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3114_c7_60b7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3099_c7_b9d5_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3102_c7_835b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3102_c7_835b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3108_c7_72d0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3102_c7_835b_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l3108_c7_72d0_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l3079_c2_3d72_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l3092_c7_3a11] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l3092_c7_3a11_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3092_c7_3a11_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l3092_c7_3a11_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3092_c7_3a11_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l3092_c7_3a11_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3092_c7_3a11_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3092_c7_3a11_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l3092_c7_3a11_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3108_c7_72d0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3108_c7_72d0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3108_c7_72d0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3108_c7_72d0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3108_c7_72d0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3108_c7_72d0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3108_c7_72d0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3108_c7_72d0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3108_c7_72d0_return_output;

     -- n8_MUX[uxn_opcodes_h_l3085_c7_c2f9] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l3085_c7_c2f9_cond <= VAR_n8_MUX_uxn_opcodes_h_l3085_c7_c2f9_cond;
     n8_MUX_uxn_opcodes_h_l3085_c7_c2f9_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l3085_c7_c2f9_iftrue;
     n8_MUX_uxn_opcodes_h_l3085_c7_c2f9_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l3085_c7_c2f9_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l3085_c7_c2f9_return_output := n8_MUX_uxn_opcodes_h_l3085_c7_c2f9_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l3099_c7_b9d5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3099_c7_b9d5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3099_c7_b9d5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3099_c7_b9d5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3099_c7_b9d5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3099_c7_b9d5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3099_c7_b9d5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3099_c7_b9d5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l3099_c7_b9d5_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l3102_c7_835b] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3102_c7_835b_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3102_c7_835b_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3102_c7_835b_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3102_c7_835b_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3102_c7_835b_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3102_c7_835b_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3102_c7_835b_return_output := result_stack_value_MUX_uxn_opcodes_h_l3102_c7_835b_return_output;

     -- l8_MUX[uxn_opcodes_h_l3092_c7_3a11] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l3092_c7_3a11_cond <= VAR_l8_MUX_uxn_opcodes_h_l3092_c7_3a11_cond;
     l8_MUX_uxn_opcodes_h_l3092_c7_3a11_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l3092_c7_3a11_iftrue;
     l8_MUX_uxn_opcodes_h_l3092_c7_3a11_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l3092_c7_3a11_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l3092_c7_3a11_return_output := l8_MUX_uxn_opcodes_h_l3092_c7_3a11_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l3095_c7_e3cf] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l3095_c7_e3cf_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3095_c7_e3cf_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3095_c7_e3cf_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3095_c7_e3cf_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3095_c7_e3cf_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3095_c7_e3cf_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3095_c7_e3cf_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l3095_c7_e3cf_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3102_c7_835b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3102_c7_835b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3102_c7_835b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3102_c7_835b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3102_c7_835b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3102_c7_835b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3102_c7_835b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3102_c7_835b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3102_c7_835b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3108_c7_72d0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3108_c7_72d0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3108_c7_72d0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3108_c7_72d0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3108_c7_72d0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3108_c7_72d0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3108_c7_72d0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3108_c7_72d0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3108_c7_72d0_return_output;

     -- Submodule level 5
     VAR_l8_MUX_uxn_opcodes_h_l3088_c7_707d_iffalse := VAR_l8_MUX_uxn_opcodes_h_l3092_c7_3a11_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l3079_c2_3d72_iffalse := VAR_n8_MUX_uxn_opcodes_h_l3085_c7_c2f9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3102_c7_835b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3108_c7_72d0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3092_c7_3a11_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3095_c7_e3cf_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3088_c7_707d_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3092_c7_3a11_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3102_c7_835b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3108_c7_72d0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3095_c7_e3cf_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3099_c7_b9d5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3099_c7_b9d5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3102_c7_835b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3099_c7_b9d5_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l3102_c7_835b_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l3095_c7_e3cf] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3095_c7_e3cf_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3095_c7_e3cf_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3095_c7_e3cf_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3095_c7_e3cf_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3095_c7_e3cf_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3095_c7_e3cf_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3095_c7_e3cf_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l3095_c7_e3cf_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3102_c7_835b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3102_c7_835b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3102_c7_835b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3102_c7_835b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3102_c7_835b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3102_c7_835b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3102_c7_835b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3102_c7_835b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3102_c7_835b_return_output;

     -- n8_MUX[uxn_opcodes_h_l3079_c2_3d72] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l3079_c2_3d72_cond <= VAR_n8_MUX_uxn_opcodes_h_l3079_c2_3d72_cond;
     n8_MUX_uxn_opcodes_h_l3079_c2_3d72_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l3079_c2_3d72_iftrue;
     n8_MUX_uxn_opcodes_h_l3079_c2_3d72_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l3079_c2_3d72_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l3079_c2_3d72_return_output := n8_MUX_uxn_opcodes_h_l3079_c2_3d72_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3102_c7_835b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3102_c7_835b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3102_c7_835b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3102_c7_835b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3102_c7_835b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3102_c7_835b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3102_c7_835b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3102_c7_835b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3102_c7_835b_return_output;

     -- l8_MUX[uxn_opcodes_h_l3088_c7_707d] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l3088_c7_707d_cond <= VAR_l8_MUX_uxn_opcodes_h_l3088_c7_707d_cond;
     l8_MUX_uxn_opcodes_h_l3088_c7_707d_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l3088_c7_707d_iftrue;
     l8_MUX_uxn_opcodes_h_l3088_c7_707d_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l3088_c7_707d_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l3088_c7_707d_return_output := l8_MUX_uxn_opcodes_h_l3088_c7_707d_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l3099_c7_b9d5] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3099_c7_b9d5_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3099_c7_b9d5_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3099_c7_b9d5_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3099_c7_b9d5_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3099_c7_b9d5_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3099_c7_b9d5_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3099_c7_b9d5_return_output := result_stack_value_MUX_uxn_opcodes_h_l3099_c7_b9d5_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l3088_c7_707d] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l3088_c7_707d_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3088_c7_707d_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l3088_c7_707d_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3088_c7_707d_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l3088_c7_707d_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3088_c7_707d_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3088_c7_707d_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l3088_c7_707d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3099_c7_b9d5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3099_c7_b9d5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3099_c7_b9d5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3099_c7_b9d5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3099_c7_b9d5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3099_c7_b9d5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3099_c7_b9d5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3099_c7_b9d5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3099_c7_b9d5_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l3092_c7_3a11] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l3092_c7_3a11_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3092_c7_3a11_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3092_c7_3a11_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3092_c7_3a11_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3092_c7_3a11_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3092_c7_3a11_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3092_c7_3a11_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l3092_c7_3a11_return_output;

     -- Submodule level 6
     VAR_l8_MUX_uxn_opcodes_h_l3085_c7_c2f9_iffalse := VAR_l8_MUX_uxn_opcodes_h_l3088_c7_707d_return_output;
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l3079_c2_3d72_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3099_c7_b9d5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3102_c7_835b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3088_c7_707d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3092_c7_3a11_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3085_c7_c2f9_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3088_c7_707d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3099_c7_b9d5_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3102_c7_835b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3092_c7_3a11_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3095_c7_e3cf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3095_c7_e3cf_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3099_c7_b9d5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3095_c7_e3cf_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l3099_c7_b9d5_return_output;
     -- l8_MUX[uxn_opcodes_h_l3085_c7_c2f9] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l3085_c7_c2f9_cond <= VAR_l8_MUX_uxn_opcodes_h_l3085_c7_c2f9_cond;
     l8_MUX_uxn_opcodes_h_l3085_c7_c2f9_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l3085_c7_c2f9_iftrue;
     l8_MUX_uxn_opcodes_h_l3085_c7_c2f9_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l3085_c7_c2f9_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l3085_c7_c2f9_return_output := l8_MUX_uxn_opcodes_h_l3085_c7_c2f9_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l3088_c7_707d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l3088_c7_707d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3088_c7_707d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3088_c7_707d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3088_c7_707d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3088_c7_707d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3088_c7_707d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3088_c7_707d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l3088_c7_707d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3099_c7_b9d5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3099_c7_b9d5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3099_c7_b9d5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3099_c7_b9d5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3099_c7_b9d5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3099_c7_b9d5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3099_c7_b9d5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3099_c7_b9d5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3099_c7_b9d5_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l3095_c7_e3cf] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3095_c7_e3cf_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3095_c7_e3cf_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3095_c7_e3cf_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3095_c7_e3cf_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3095_c7_e3cf_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3095_c7_e3cf_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3095_c7_e3cf_return_output := result_stack_value_MUX_uxn_opcodes_h_l3095_c7_e3cf_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l3085_c7_c2f9] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l3085_c7_c2f9_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3085_c7_c2f9_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l3085_c7_c2f9_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3085_c7_c2f9_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l3085_c7_c2f9_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3085_c7_c2f9_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3085_c7_c2f9_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l3085_c7_c2f9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3099_c7_b9d5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3099_c7_b9d5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3099_c7_b9d5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3099_c7_b9d5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3099_c7_b9d5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3099_c7_b9d5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3099_c7_b9d5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3099_c7_b9d5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3099_c7_b9d5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3095_c7_e3cf] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3095_c7_e3cf_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3095_c7_e3cf_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3095_c7_e3cf_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3095_c7_e3cf_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3095_c7_e3cf_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3095_c7_e3cf_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3095_c7_e3cf_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3095_c7_e3cf_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l3092_c7_3a11] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3092_c7_3a11_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3092_c7_3a11_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3092_c7_3a11_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3092_c7_3a11_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3092_c7_3a11_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3092_c7_3a11_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3092_c7_3a11_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l3092_c7_3a11_return_output;

     -- Submodule level 7
     VAR_l8_MUX_uxn_opcodes_h_l3079_c2_3d72_iffalse := VAR_l8_MUX_uxn_opcodes_h_l3085_c7_c2f9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3095_c7_e3cf_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3099_c7_b9d5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3085_c7_c2f9_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3088_c7_707d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3079_c2_3d72_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3085_c7_c2f9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3095_c7_e3cf_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3099_c7_b9d5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3088_c7_707d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3092_c7_3a11_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3092_c7_3a11_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3095_c7_e3cf_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3092_c7_3a11_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l3095_c7_e3cf_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l3079_c2_3d72] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l3079_c2_3d72_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3079_c2_3d72_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l3079_c2_3d72_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3079_c2_3d72_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l3079_c2_3d72_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3079_c2_3d72_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3079_c2_3d72_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l3079_c2_3d72_return_output;

     -- l8_MUX[uxn_opcodes_h_l3079_c2_3d72] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l3079_c2_3d72_cond <= VAR_l8_MUX_uxn_opcodes_h_l3079_c2_3d72_cond;
     l8_MUX_uxn_opcodes_h_l3079_c2_3d72_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l3079_c2_3d72_iftrue;
     l8_MUX_uxn_opcodes_h_l3079_c2_3d72_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l3079_c2_3d72_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l3079_c2_3d72_return_output := l8_MUX_uxn_opcodes_h_l3079_c2_3d72_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3095_c7_e3cf] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3095_c7_e3cf_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3095_c7_e3cf_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3095_c7_e3cf_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3095_c7_e3cf_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3095_c7_e3cf_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3095_c7_e3cf_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3095_c7_e3cf_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3095_c7_e3cf_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l3085_c7_c2f9] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l3085_c7_c2f9_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3085_c7_c2f9_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3085_c7_c2f9_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3085_c7_c2f9_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3085_c7_c2f9_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3085_c7_c2f9_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3085_c7_c2f9_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l3085_c7_c2f9_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l3088_c7_707d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3088_c7_707d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3088_c7_707d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3088_c7_707d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3088_c7_707d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3088_c7_707d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3088_c7_707d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3088_c7_707d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l3088_c7_707d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3092_c7_3a11] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3092_c7_3a11_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3092_c7_3a11_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3092_c7_3a11_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3092_c7_3a11_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3092_c7_3a11_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3092_c7_3a11_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3092_c7_3a11_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3092_c7_3a11_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l3092_c7_3a11] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3092_c7_3a11_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3092_c7_3a11_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3092_c7_3a11_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3092_c7_3a11_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3092_c7_3a11_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3092_c7_3a11_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3092_c7_3a11_return_output := result_stack_value_MUX_uxn_opcodes_h_l3092_c7_3a11_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3095_c7_e3cf] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3095_c7_e3cf_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3095_c7_e3cf_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3095_c7_e3cf_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3095_c7_e3cf_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3095_c7_e3cf_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3095_c7_e3cf_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3095_c7_e3cf_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3095_c7_e3cf_return_output;

     -- Submodule level 8
     REG_VAR_l8 := VAR_l8_MUX_uxn_opcodes_h_l3079_c2_3d72_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3092_c7_3a11_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3095_c7_e3cf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3079_c2_3d72_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3085_c7_c2f9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3092_c7_3a11_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3095_c7_e3cf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3085_c7_c2f9_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3088_c7_707d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3088_c7_707d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3092_c7_3a11_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3088_c7_707d_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l3092_c7_3a11_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l3092_c7_3a11] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3092_c7_3a11_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3092_c7_3a11_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3092_c7_3a11_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3092_c7_3a11_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3092_c7_3a11_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3092_c7_3a11_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3092_c7_3a11_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3092_c7_3a11_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l3085_c7_c2f9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3085_c7_c2f9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3085_c7_c2f9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3085_c7_c2f9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3085_c7_c2f9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3085_c7_c2f9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3085_c7_c2f9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3085_c7_c2f9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l3085_c7_c2f9_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l3079_c2_3d72] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l3079_c2_3d72_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3079_c2_3d72_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3079_c2_3d72_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3079_c2_3d72_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3079_c2_3d72_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3079_c2_3d72_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3079_c2_3d72_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l3079_c2_3d72_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3088_c7_707d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3088_c7_707d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3088_c7_707d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3088_c7_707d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3088_c7_707d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3088_c7_707d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3088_c7_707d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3088_c7_707d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3088_c7_707d_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l3088_c7_707d] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3088_c7_707d_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3088_c7_707d_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3088_c7_707d_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3088_c7_707d_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3088_c7_707d_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3088_c7_707d_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3088_c7_707d_return_output := result_stack_value_MUX_uxn_opcodes_h_l3088_c7_707d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3092_c7_3a11] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3092_c7_3a11_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3092_c7_3a11_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3092_c7_3a11_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3092_c7_3a11_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3092_c7_3a11_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3092_c7_3a11_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3092_c7_3a11_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3092_c7_3a11_return_output;

     -- Submodule level 9
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3088_c7_707d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3092_c7_3a11_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3088_c7_707d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3092_c7_3a11_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3079_c2_3d72_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3085_c7_c2f9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3085_c7_c2f9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3088_c7_707d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3085_c7_c2f9_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l3088_c7_707d_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l3088_c7_707d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3088_c7_707d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3088_c7_707d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3088_c7_707d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3088_c7_707d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3088_c7_707d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3088_c7_707d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3088_c7_707d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3088_c7_707d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3088_c7_707d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3088_c7_707d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3088_c7_707d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3088_c7_707d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3088_c7_707d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3088_c7_707d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3088_c7_707d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3088_c7_707d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3088_c7_707d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3085_c7_c2f9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3085_c7_c2f9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3085_c7_c2f9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3085_c7_c2f9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3085_c7_c2f9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3085_c7_c2f9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3085_c7_c2f9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3085_c7_c2f9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3085_c7_c2f9_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l3085_c7_c2f9] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3085_c7_c2f9_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3085_c7_c2f9_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3085_c7_c2f9_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3085_c7_c2f9_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3085_c7_c2f9_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3085_c7_c2f9_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3085_c7_c2f9_return_output := result_stack_value_MUX_uxn_opcodes_h_l3085_c7_c2f9_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l3079_c2_3d72] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3079_c2_3d72_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3079_c2_3d72_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3079_c2_3d72_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3079_c2_3d72_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3079_c2_3d72_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3079_c2_3d72_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3079_c2_3d72_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l3079_c2_3d72_return_output;

     -- Submodule level 10
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3085_c7_c2f9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3088_c7_707d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3085_c7_c2f9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3088_c7_707d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3079_c2_3d72_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3085_c7_c2f9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3079_c2_3d72_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l3085_c7_c2f9_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l3085_c7_c2f9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3085_c7_c2f9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3085_c7_c2f9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3085_c7_c2f9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3085_c7_c2f9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3085_c7_c2f9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3085_c7_c2f9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3085_c7_c2f9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3085_c7_c2f9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3079_c2_3d72] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3079_c2_3d72_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3079_c2_3d72_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3079_c2_3d72_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3079_c2_3d72_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3079_c2_3d72_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3079_c2_3d72_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3079_c2_3d72_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3079_c2_3d72_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3085_c7_c2f9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3085_c7_c2f9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3085_c7_c2f9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3085_c7_c2f9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3085_c7_c2f9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3085_c7_c2f9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3085_c7_c2f9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3085_c7_c2f9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3085_c7_c2f9_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l3079_c2_3d72] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3079_c2_3d72_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3079_c2_3d72_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3079_c2_3d72_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3079_c2_3d72_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3079_c2_3d72_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3079_c2_3d72_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3079_c2_3d72_return_output := result_stack_value_MUX_uxn_opcodes_h_l3079_c2_3d72_return_output;

     -- Submodule level 11
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3079_c2_3d72_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3085_c7_c2f9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3079_c2_3d72_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3085_c7_c2f9_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l3079_c2_3d72] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3079_c2_3d72_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3079_c2_3d72_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3079_c2_3d72_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3079_c2_3d72_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3079_c2_3d72_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3079_c2_3d72_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3079_c2_3d72_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3079_c2_3d72_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3079_c2_3d72] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3079_c2_3d72_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3079_c2_3d72_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3079_c2_3d72_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3079_c2_3d72_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3079_c2_3d72_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3079_c2_3d72_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3079_c2_3d72_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3079_c2_3d72_return_output;

     -- Submodule level 12
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_287e_uxn_opcodes_h_l3127_l3075_DUPLICATE_85b2 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_287e_uxn_opcodes_h_l3127_l3075_DUPLICATE_85b2_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_287e(
     result,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3079_c2_3d72_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3079_c2_3d72_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3079_c2_3d72_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3079_c2_3d72_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3079_c2_3d72_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3079_c2_3d72_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3079_c2_3d72_return_output);

     -- Submodule level 13
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_287e_uxn_opcodes_h_l3127_l3075_DUPLICATE_85b2_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_287e_uxn_opcodes_h_l3127_l3075_DUPLICATE_85b2_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_n8 <= REG_VAR_n8;
REG_COMB_l8 <= REG_VAR_l8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     n8 <= REG_COMB_n8;
     l8 <= REG_COMB_l8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
