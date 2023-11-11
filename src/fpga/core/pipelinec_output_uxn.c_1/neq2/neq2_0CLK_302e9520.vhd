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
-- Submodules: 66
entity neq2_0CLK_302e9520 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end neq2_0CLK_302e9520;
architecture arch of neq2_0CLK_302e9520 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal n16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_n16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l1220_c6_a9d1]
signal BIN_OP_EQ_uxn_opcodes_h_l1220_c6_a9d1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1220_c6_a9d1_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1220_c6_a9d1_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1220_c1_a7ca]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1220_c1_a7ca_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1220_c1_a7ca_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1220_c1_a7ca_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1220_c1_a7ca_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1220_c2_164e]
signal n16_MUX_uxn_opcodes_h_l1220_c2_164e_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1220_c2_164e_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1220_c2_164e_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1220_c2_164e_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1220_c2_164e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c2_164e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c2_164e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c2_164e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c2_164e_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1220_c2_164e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1220_c2_164e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1220_c2_164e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1220_c2_164e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1220_c2_164e_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1220_c2_164e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1220_c2_164e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1220_c2_164e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1220_c2_164e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1220_c2_164e_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1220_c2_164e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c2_164e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c2_164e_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c2_164e_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c2_164e_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1220_c2_164e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1220_c2_164e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1220_c2_164e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1220_c2_164e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1220_c2_164e_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1220_c2_164e]
signal result_u8_value_MUX_uxn_opcodes_h_l1220_c2_164e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1220_c2_164e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1220_c2_164e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1220_c2_164e_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1220_c2_164e]
signal t16_MUX_uxn_opcodes_h_l1220_c2_164e_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1220_c2_164e_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1220_c2_164e_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1220_c2_164e_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l1221_c3_4e3e[uxn_opcodes_h_l1221_c3_4e3e]
signal printf_uxn_opcodes_h_l1221_c3_4e3e_uxn_opcodes_h_l1221_c3_4e3e_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1225_c11_589b]
signal BIN_OP_EQ_uxn_opcodes_h_l1225_c11_589b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1225_c11_589b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1225_c11_589b_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1225_c7_884f]
signal n16_MUX_uxn_opcodes_h_l1225_c7_884f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1225_c7_884f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1225_c7_884f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1225_c7_884f_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1225_c7_884f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_884f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_884f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_884f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_884f_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1225_c7_884f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_884f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_884f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_884f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_884f_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1225_c7_884f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_884f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_884f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_884f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_884f_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1225_c7_884f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_884f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_884f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_884f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_884f_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1225_c7_884f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_884f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_884f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_884f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_884f_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1225_c7_884f]
signal result_u8_value_MUX_uxn_opcodes_h_l1225_c7_884f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1225_c7_884f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1225_c7_884f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1225_c7_884f_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1225_c7_884f]
signal t16_MUX_uxn_opcodes_h_l1225_c7_884f_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1225_c7_884f_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1225_c7_884f_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1225_c7_884f_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1228_c11_efdf]
signal BIN_OP_EQ_uxn_opcodes_h_l1228_c11_efdf_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1228_c11_efdf_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1228_c11_efdf_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1228_c7_fa81]
signal n16_MUX_uxn_opcodes_h_l1228_c7_fa81_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1228_c7_fa81_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1228_c7_fa81_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1228_c7_fa81_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1228_c7_fa81]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1228_c7_fa81_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1228_c7_fa81_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1228_c7_fa81_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1228_c7_fa81_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1228_c7_fa81]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1228_c7_fa81_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1228_c7_fa81_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1228_c7_fa81_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1228_c7_fa81_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1228_c7_fa81]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1228_c7_fa81_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1228_c7_fa81_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1228_c7_fa81_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1228_c7_fa81_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1228_c7_fa81]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1228_c7_fa81_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1228_c7_fa81_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1228_c7_fa81_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1228_c7_fa81_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1228_c7_fa81]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1228_c7_fa81_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1228_c7_fa81_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1228_c7_fa81_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1228_c7_fa81_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1228_c7_fa81]
signal result_u8_value_MUX_uxn_opcodes_h_l1228_c7_fa81_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1228_c7_fa81_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1228_c7_fa81_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1228_c7_fa81_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1228_c7_fa81]
signal t16_MUX_uxn_opcodes_h_l1228_c7_fa81_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1228_c7_fa81_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1228_c7_fa81_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1228_c7_fa81_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1233_c11_b2fc]
signal BIN_OP_EQ_uxn_opcodes_h_l1233_c11_b2fc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1233_c11_b2fc_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1233_c11_b2fc_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1233_c7_3f3d]
signal n16_MUX_uxn_opcodes_h_l1233_c7_3f3d_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1233_c7_3f3d_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1233_c7_3f3d_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1233_c7_3f3d_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1233_c7_3f3d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_3f3d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_3f3d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_3f3d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_3f3d_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1233_c7_3f3d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_3f3d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_3f3d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_3f3d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_3f3d_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1233_c7_3f3d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1233_c7_3f3d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1233_c7_3f3d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1233_c7_3f3d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1233_c7_3f3d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1233_c7_3f3d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_3f3d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_3f3d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_3f3d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_3f3d_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1233_c7_3f3d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_3f3d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_3f3d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_3f3d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_3f3d_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1233_c7_3f3d]
signal result_u8_value_MUX_uxn_opcodes_h_l1233_c7_3f3d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1233_c7_3f3d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1233_c7_3f3d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1233_c7_3f3d_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1233_c7_3f3d]
signal t16_MUX_uxn_opcodes_h_l1233_c7_3f3d_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1233_c7_3f3d_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1233_c7_3f3d_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1233_c7_3f3d_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1234_c3_b1e9]
signal BIN_OP_OR_uxn_opcodes_h_l1234_c3_b1e9_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1234_c3_b1e9_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1234_c3_b1e9_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1237_c11_1e09]
signal BIN_OP_EQ_uxn_opcodes_h_l1237_c11_1e09_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1237_c11_1e09_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1237_c11_1e09_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1237_c7_ba2c]
signal n16_MUX_uxn_opcodes_h_l1237_c7_ba2c_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1237_c7_ba2c_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1237_c7_ba2c_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1237_c7_ba2c_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1237_c7_ba2c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_ba2c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_ba2c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_ba2c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_ba2c_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1237_c7_ba2c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_ba2c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_ba2c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_ba2c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_ba2c_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1237_c7_ba2c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1237_c7_ba2c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1237_c7_ba2c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1237_c7_ba2c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1237_c7_ba2c_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1237_c7_ba2c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1237_c7_ba2c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1237_c7_ba2c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1237_c7_ba2c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1237_c7_ba2c_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1237_c7_ba2c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_ba2c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_ba2c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_ba2c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_ba2c_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1237_c7_ba2c]
signal result_u8_value_MUX_uxn_opcodes_h_l1237_c7_ba2c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1237_c7_ba2c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1237_c7_ba2c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1237_c7_ba2c_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1241_c11_d2d1]
signal BIN_OP_EQ_uxn_opcodes_h_l1241_c11_d2d1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1241_c11_d2d1_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1241_c11_d2d1_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1241_c7_e6a7]
signal n16_MUX_uxn_opcodes_h_l1241_c7_e6a7_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1241_c7_e6a7_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1241_c7_e6a7_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1241_c7_e6a7_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1241_c7_e6a7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_e6a7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_e6a7_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_e6a7_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_e6a7_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1241_c7_e6a7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_e6a7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_e6a7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_e6a7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_e6a7_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1241_c7_e6a7]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_e6a7_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_e6a7_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_e6a7_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_e6a7_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1241_c7_e6a7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_e6a7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_e6a7_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_e6a7_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_e6a7_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1241_c7_e6a7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_e6a7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_e6a7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_e6a7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_e6a7_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1241_c7_e6a7]
signal result_u8_value_MUX_uxn_opcodes_h_l1241_c7_e6a7_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1241_c7_e6a7_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1241_c7_e6a7_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1241_c7_e6a7_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1242_c3_1375]
signal BIN_OP_OR_uxn_opcodes_h_l1242_c3_1375_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1242_c3_1375_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1242_c3_1375_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1244_c30_0ce4]
signal sp_relative_shift_uxn_opcodes_h_l1244_c30_0ce4_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1244_c30_0ce4_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1244_c30_0ce4_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1244_c30_0ce4_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1247_c21_eed9]
signal BIN_OP_EQ_uxn_opcodes_h_l1247_c21_eed9_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1247_c21_eed9_right : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1247_c21_eed9_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1247_c21_8d47]
signal MUX_uxn_opcodes_h_l1247_c21_8d47_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1247_c21_8d47_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1247_c21_8d47_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1247_c21_8d47_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1249_c11_6983]
signal BIN_OP_EQ_uxn_opcodes_h_l1249_c11_6983_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1249_c11_6983_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1249_c11_6983_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1249_c7_ffd3]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c7_ffd3_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c7_ffd3_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c7_ffd3_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c7_ffd3_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1249_c7_ffd3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_ffd3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_ffd3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_ffd3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_ffd3_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1249_c7_ffd3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_ffd3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_ffd3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_ffd3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_ffd3_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1239_l1230_DUPLICATE_4cc0
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1239_l1230_DUPLICATE_4cc0_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1239_l1230_DUPLICATE_4cc0_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_4e73( ref_toks_0 : opcode_result_t;
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
      base.stack_address_sp_offset := ref_toks_1;
      base.is_stack_write := ref_toks_2;
      base.is_sp_shift := ref_toks_3;
      base.sp_relative_shift := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.u8_value := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1220_c6_a9d1
BIN_OP_EQ_uxn_opcodes_h_l1220_c6_a9d1 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1220_c6_a9d1_left,
BIN_OP_EQ_uxn_opcodes_h_l1220_c6_a9d1_right,
BIN_OP_EQ_uxn_opcodes_h_l1220_c6_a9d1_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1220_c1_a7ca
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1220_c1_a7ca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1220_c1_a7ca_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1220_c1_a7ca_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1220_c1_a7ca_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1220_c1_a7ca_return_output);

-- n16_MUX_uxn_opcodes_h_l1220_c2_164e
n16_MUX_uxn_opcodes_h_l1220_c2_164e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1220_c2_164e_cond,
n16_MUX_uxn_opcodes_h_l1220_c2_164e_iftrue,
n16_MUX_uxn_opcodes_h_l1220_c2_164e_iffalse,
n16_MUX_uxn_opcodes_h_l1220_c2_164e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c2_164e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c2_164e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c2_164e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c2_164e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c2_164e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c2_164e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1220_c2_164e
result_is_stack_write_MUX_uxn_opcodes_h_l1220_c2_164e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1220_c2_164e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1220_c2_164e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1220_c2_164e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1220_c2_164e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1220_c2_164e
result_is_sp_shift_MUX_uxn_opcodes_h_l1220_c2_164e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1220_c2_164e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1220_c2_164e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1220_c2_164e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1220_c2_164e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c2_164e
result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c2_164e : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c2_164e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c2_164e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c2_164e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c2_164e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1220_c2_164e
result_is_opc_done_MUX_uxn_opcodes_h_l1220_c2_164e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1220_c2_164e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1220_c2_164e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1220_c2_164e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1220_c2_164e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1220_c2_164e
result_u8_value_MUX_uxn_opcodes_h_l1220_c2_164e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1220_c2_164e_cond,
result_u8_value_MUX_uxn_opcodes_h_l1220_c2_164e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1220_c2_164e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1220_c2_164e_return_output);

-- t16_MUX_uxn_opcodes_h_l1220_c2_164e
t16_MUX_uxn_opcodes_h_l1220_c2_164e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1220_c2_164e_cond,
t16_MUX_uxn_opcodes_h_l1220_c2_164e_iftrue,
t16_MUX_uxn_opcodes_h_l1220_c2_164e_iffalse,
t16_MUX_uxn_opcodes_h_l1220_c2_164e_return_output);

-- printf_uxn_opcodes_h_l1221_c3_4e3e_uxn_opcodes_h_l1221_c3_4e3e
printf_uxn_opcodes_h_l1221_c3_4e3e_uxn_opcodes_h_l1221_c3_4e3e : entity work.printf_uxn_opcodes_h_l1221_c3_4e3e_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1221_c3_4e3e_uxn_opcodes_h_l1221_c3_4e3e_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1225_c11_589b
BIN_OP_EQ_uxn_opcodes_h_l1225_c11_589b : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1225_c11_589b_left,
BIN_OP_EQ_uxn_opcodes_h_l1225_c11_589b_right,
BIN_OP_EQ_uxn_opcodes_h_l1225_c11_589b_return_output);

-- n16_MUX_uxn_opcodes_h_l1225_c7_884f
n16_MUX_uxn_opcodes_h_l1225_c7_884f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1225_c7_884f_cond,
n16_MUX_uxn_opcodes_h_l1225_c7_884f_iftrue,
n16_MUX_uxn_opcodes_h_l1225_c7_884f_iffalse,
n16_MUX_uxn_opcodes_h_l1225_c7_884f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_884f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_884f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_884f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_884f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_884f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_884f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_884f
result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_884f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_884f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_884f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_884f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_884f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_884f
result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_884f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_884f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_884f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_884f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_884f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_884f
result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_884f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_884f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_884f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_884f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_884f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_884f
result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_884f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_884f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_884f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_884f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_884f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1225_c7_884f
result_u8_value_MUX_uxn_opcodes_h_l1225_c7_884f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1225_c7_884f_cond,
result_u8_value_MUX_uxn_opcodes_h_l1225_c7_884f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1225_c7_884f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1225_c7_884f_return_output);

-- t16_MUX_uxn_opcodes_h_l1225_c7_884f
t16_MUX_uxn_opcodes_h_l1225_c7_884f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1225_c7_884f_cond,
t16_MUX_uxn_opcodes_h_l1225_c7_884f_iftrue,
t16_MUX_uxn_opcodes_h_l1225_c7_884f_iffalse,
t16_MUX_uxn_opcodes_h_l1225_c7_884f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1228_c11_efdf
BIN_OP_EQ_uxn_opcodes_h_l1228_c11_efdf : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1228_c11_efdf_left,
BIN_OP_EQ_uxn_opcodes_h_l1228_c11_efdf_right,
BIN_OP_EQ_uxn_opcodes_h_l1228_c11_efdf_return_output);

-- n16_MUX_uxn_opcodes_h_l1228_c7_fa81
n16_MUX_uxn_opcodes_h_l1228_c7_fa81 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1228_c7_fa81_cond,
n16_MUX_uxn_opcodes_h_l1228_c7_fa81_iftrue,
n16_MUX_uxn_opcodes_h_l1228_c7_fa81_iffalse,
n16_MUX_uxn_opcodes_h_l1228_c7_fa81_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1228_c7_fa81
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1228_c7_fa81 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1228_c7_fa81_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1228_c7_fa81_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1228_c7_fa81_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1228_c7_fa81_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1228_c7_fa81
result_is_stack_write_MUX_uxn_opcodes_h_l1228_c7_fa81 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1228_c7_fa81_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1228_c7_fa81_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1228_c7_fa81_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1228_c7_fa81_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1228_c7_fa81
result_is_sp_shift_MUX_uxn_opcodes_h_l1228_c7_fa81 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1228_c7_fa81_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1228_c7_fa81_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1228_c7_fa81_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1228_c7_fa81_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1228_c7_fa81
result_sp_relative_shift_MUX_uxn_opcodes_h_l1228_c7_fa81 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1228_c7_fa81_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1228_c7_fa81_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1228_c7_fa81_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1228_c7_fa81_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1228_c7_fa81
result_is_opc_done_MUX_uxn_opcodes_h_l1228_c7_fa81 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1228_c7_fa81_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1228_c7_fa81_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1228_c7_fa81_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1228_c7_fa81_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1228_c7_fa81
result_u8_value_MUX_uxn_opcodes_h_l1228_c7_fa81 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1228_c7_fa81_cond,
result_u8_value_MUX_uxn_opcodes_h_l1228_c7_fa81_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1228_c7_fa81_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1228_c7_fa81_return_output);

-- t16_MUX_uxn_opcodes_h_l1228_c7_fa81
t16_MUX_uxn_opcodes_h_l1228_c7_fa81 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1228_c7_fa81_cond,
t16_MUX_uxn_opcodes_h_l1228_c7_fa81_iftrue,
t16_MUX_uxn_opcodes_h_l1228_c7_fa81_iffalse,
t16_MUX_uxn_opcodes_h_l1228_c7_fa81_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1233_c11_b2fc
BIN_OP_EQ_uxn_opcodes_h_l1233_c11_b2fc : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1233_c11_b2fc_left,
BIN_OP_EQ_uxn_opcodes_h_l1233_c11_b2fc_right,
BIN_OP_EQ_uxn_opcodes_h_l1233_c11_b2fc_return_output);

-- n16_MUX_uxn_opcodes_h_l1233_c7_3f3d
n16_MUX_uxn_opcodes_h_l1233_c7_3f3d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1233_c7_3f3d_cond,
n16_MUX_uxn_opcodes_h_l1233_c7_3f3d_iftrue,
n16_MUX_uxn_opcodes_h_l1233_c7_3f3d_iffalse,
n16_MUX_uxn_opcodes_h_l1233_c7_3f3d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_3f3d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_3f3d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_3f3d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_3f3d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_3f3d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_3f3d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_3f3d
result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_3f3d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_3f3d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_3f3d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_3f3d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_3f3d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1233_c7_3f3d
result_is_sp_shift_MUX_uxn_opcodes_h_l1233_c7_3f3d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1233_c7_3f3d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1233_c7_3f3d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1233_c7_3f3d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1233_c7_3f3d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_3f3d
result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_3f3d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_3f3d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_3f3d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_3f3d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_3f3d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_3f3d
result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_3f3d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_3f3d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_3f3d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_3f3d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_3f3d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1233_c7_3f3d
result_u8_value_MUX_uxn_opcodes_h_l1233_c7_3f3d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1233_c7_3f3d_cond,
result_u8_value_MUX_uxn_opcodes_h_l1233_c7_3f3d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1233_c7_3f3d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1233_c7_3f3d_return_output);

-- t16_MUX_uxn_opcodes_h_l1233_c7_3f3d
t16_MUX_uxn_opcodes_h_l1233_c7_3f3d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1233_c7_3f3d_cond,
t16_MUX_uxn_opcodes_h_l1233_c7_3f3d_iftrue,
t16_MUX_uxn_opcodes_h_l1233_c7_3f3d_iffalse,
t16_MUX_uxn_opcodes_h_l1233_c7_3f3d_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1234_c3_b1e9
BIN_OP_OR_uxn_opcodes_h_l1234_c3_b1e9 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1234_c3_b1e9_left,
BIN_OP_OR_uxn_opcodes_h_l1234_c3_b1e9_right,
BIN_OP_OR_uxn_opcodes_h_l1234_c3_b1e9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1237_c11_1e09
BIN_OP_EQ_uxn_opcodes_h_l1237_c11_1e09 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1237_c11_1e09_left,
BIN_OP_EQ_uxn_opcodes_h_l1237_c11_1e09_right,
BIN_OP_EQ_uxn_opcodes_h_l1237_c11_1e09_return_output);

-- n16_MUX_uxn_opcodes_h_l1237_c7_ba2c
n16_MUX_uxn_opcodes_h_l1237_c7_ba2c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1237_c7_ba2c_cond,
n16_MUX_uxn_opcodes_h_l1237_c7_ba2c_iftrue,
n16_MUX_uxn_opcodes_h_l1237_c7_ba2c_iffalse,
n16_MUX_uxn_opcodes_h_l1237_c7_ba2c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_ba2c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_ba2c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_ba2c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_ba2c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_ba2c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_ba2c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_ba2c
result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_ba2c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_ba2c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_ba2c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_ba2c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_ba2c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1237_c7_ba2c
result_is_sp_shift_MUX_uxn_opcodes_h_l1237_c7_ba2c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1237_c7_ba2c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1237_c7_ba2c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1237_c7_ba2c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1237_c7_ba2c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1237_c7_ba2c
result_sp_relative_shift_MUX_uxn_opcodes_h_l1237_c7_ba2c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1237_c7_ba2c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1237_c7_ba2c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1237_c7_ba2c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1237_c7_ba2c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_ba2c
result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_ba2c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_ba2c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_ba2c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_ba2c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_ba2c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1237_c7_ba2c
result_u8_value_MUX_uxn_opcodes_h_l1237_c7_ba2c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1237_c7_ba2c_cond,
result_u8_value_MUX_uxn_opcodes_h_l1237_c7_ba2c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1237_c7_ba2c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1237_c7_ba2c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1241_c11_d2d1
BIN_OP_EQ_uxn_opcodes_h_l1241_c11_d2d1 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1241_c11_d2d1_left,
BIN_OP_EQ_uxn_opcodes_h_l1241_c11_d2d1_right,
BIN_OP_EQ_uxn_opcodes_h_l1241_c11_d2d1_return_output);

-- n16_MUX_uxn_opcodes_h_l1241_c7_e6a7
n16_MUX_uxn_opcodes_h_l1241_c7_e6a7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1241_c7_e6a7_cond,
n16_MUX_uxn_opcodes_h_l1241_c7_e6a7_iftrue,
n16_MUX_uxn_opcodes_h_l1241_c7_e6a7_iffalse,
n16_MUX_uxn_opcodes_h_l1241_c7_e6a7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_e6a7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_e6a7 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_e6a7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_e6a7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_e6a7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_e6a7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_e6a7
result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_e6a7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_e6a7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_e6a7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_e6a7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_e6a7_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_e6a7
result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_e6a7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_e6a7_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_e6a7_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_e6a7_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_e6a7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_e6a7
result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_e6a7 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_e6a7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_e6a7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_e6a7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_e6a7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_e6a7
result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_e6a7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_e6a7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_e6a7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_e6a7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_e6a7_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1241_c7_e6a7
result_u8_value_MUX_uxn_opcodes_h_l1241_c7_e6a7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1241_c7_e6a7_cond,
result_u8_value_MUX_uxn_opcodes_h_l1241_c7_e6a7_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1241_c7_e6a7_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1241_c7_e6a7_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1242_c3_1375
BIN_OP_OR_uxn_opcodes_h_l1242_c3_1375 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1242_c3_1375_left,
BIN_OP_OR_uxn_opcodes_h_l1242_c3_1375_right,
BIN_OP_OR_uxn_opcodes_h_l1242_c3_1375_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1244_c30_0ce4
sp_relative_shift_uxn_opcodes_h_l1244_c30_0ce4 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1244_c30_0ce4_ins,
sp_relative_shift_uxn_opcodes_h_l1244_c30_0ce4_x,
sp_relative_shift_uxn_opcodes_h_l1244_c30_0ce4_y,
sp_relative_shift_uxn_opcodes_h_l1244_c30_0ce4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1247_c21_eed9
BIN_OP_EQ_uxn_opcodes_h_l1247_c21_eed9 : entity work.BIN_OP_EQ_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1247_c21_eed9_left,
BIN_OP_EQ_uxn_opcodes_h_l1247_c21_eed9_right,
BIN_OP_EQ_uxn_opcodes_h_l1247_c21_eed9_return_output);

-- MUX_uxn_opcodes_h_l1247_c21_8d47
MUX_uxn_opcodes_h_l1247_c21_8d47 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1247_c21_8d47_cond,
MUX_uxn_opcodes_h_l1247_c21_8d47_iftrue,
MUX_uxn_opcodes_h_l1247_c21_8d47_iffalse,
MUX_uxn_opcodes_h_l1247_c21_8d47_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1249_c11_6983
BIN_OP_EQ_uxn_opcodes_h_l1249_c11_6983 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1249_c11_6983_left,
BIN_OP_EQ_uxn_opcodes_h_l1249_c11_6983_right,
BIN_OP_EQ_uxn_opcodes_h_l1249_c11_6983_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c7_ffd3
result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c7_ffd3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c7_ffd3_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c7_ffd3_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c7_ffd3_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c7_ffd3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_ffd3
result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_ffd3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_ffd3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_ffd3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_ffd3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_ffd3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_ffd3
result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_ffd3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_ffd3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_ffd3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_ffd3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_ffd3_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1239_l1230_DUPLICATE_4cc0
CONST_SL_8_uint16_t_uxn_opcodes_h_l1239_l1230_DUPLICATE_4cc0 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1239_l1230_DUPLICATE_4cc0_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1239_l1230_DUPLICATE_4cc0_return_output);



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
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1220_c6_a9d1_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1220_c1_a7ca_return_output,
 n16_MUX_uxn_opcodes_h_l1220_c2_164e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c2_164e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1220_c2_164e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1220_c2_164e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c2_164e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1220_c2_164e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1220_c2_164e_return_output,
 t16_MUX_uxn_opcodes_h_l1220_c2_164e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1225_c11_589b_return_output,
 n16_MUX_uxn_opcodes_h_l1225_c7_884f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_884f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_884f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_884f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_884f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_884f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1225_c7_884f_return_output,
 t16_MUX_uxn_opcodes_h_l1225_c7_884f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1228_c11_efdf_return_output,
 n16_MUX_uxn_opcodes_h_l1228_c7_fa81_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1228_c7_fa81_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1228_c7_fa81_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1228_c7_fa81_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1228_c7_fa81_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1228_c7_fa81_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1228_c7_fa81_return_output,
 t16_MUX_uxn_opcodes_h_l1228_c7_fa81_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1233_c11_b2fc_return_output,
 n16_MUX_uxn_opcodes_h_l1233_c7_3f3d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_3f3d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_3f3d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1233_c7_3f3d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_3f3d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_3f3d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1233_c7_3f3d_return_output,
 t16_MUX_uxn_opcodes_h_l1233_c7_3f3d_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1234_c3_b1e9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1237_c11_1e09_return_output,
 n16_MUX_uxn_opcodes_h_l1237_c7_ba2c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_ba2c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_ba2c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1237_c7_ba2c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1237_c7_ba2c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_ba2c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1237_c7_ba2c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1241_c11_d2d1_return_output,
 n16_MUX_uxn_opcodes_h_l1241_c7_e6a7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_e6a7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_e6a7_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_e6a7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_e6a7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_e6a7_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1241_c7_e6a7_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1242_c3_1375_return_output,
 sp_relative_shift_uxn_opcodes_h_l1244_c30_0ce4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1247_c21_eed9_return_output,
 MUX_uxn_opcodes_h_l1247_c21_8d47_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1249_c11_6983_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c7_ffd3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_ffd3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_ffd3_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1239_l1230_DUPLICATE_4cc0_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1220_c6_a9d1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1220_c6_a9d1_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1220_c6_a9d1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1220_c1_a7ca_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1220_c1_a7ca_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1220_c1_a7ca_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1220_c1_a7ca_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1220_c2_164e_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1220_c2_164e_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1225_c7_884f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1220_c2_164e_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1220_c2_164e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c2_164e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1222_c3_2b75 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c2_164e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_884f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c2_164e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c2_164e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1220_c2_164e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1220_c2_164e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_884f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1220_c2_164e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1220_c2_164e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1220_c2_164e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1220_c2_164e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_884f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1220_c2_164e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1220_c2_164e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c2_164e_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c2_164e_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_884f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c2_164e_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c2_164e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1220_c2_164e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1220_c2_164e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_884f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1220_c2_164e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1220_c2_164e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1220_c2_164e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1220_c2_164e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1225_c7_884f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1220_c2_164e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1220_c2_164e_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1220_c2_164e_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1220_c2_164e_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1225_c7_884f_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1220_c2_164e_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1220_c2_164e_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1221_c3_4e3e_uxn_opcodes_h_l1221_c3_4e3e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1225_c11_589b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1225_c11_589b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1225_c11_589b_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1225_c7_884f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1225_c7_884f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1228_c7_fa81_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1225_c7_884f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_884f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1226_c3_edf3 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_884f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1228_c7_fa81_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_884f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_884f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_884f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1228_c7_fa81_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_884f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_884f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_884f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1228_c7_fa81_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_884f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_884f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_884f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1228_c7_fa81_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_884f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_884f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_884f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1228_c7_fa81_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_884f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1225_c7_884f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1225_c7_884f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1228_c7_fa81_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1225_c7_884f_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1225_c7_884f_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1225_c7_884f_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1228_c7_fa81_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1225_c7_884f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1228_c11_efdf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1228_c11_efdf_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1228_c11_efdf_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1228_c7_fa81_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1228_c7_fa81_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1233_c7_3f3d_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1228_c7_fa81_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1228_c7_fa81_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1231_c3_9e1a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1228_c7_fa81_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_3f3d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1228_c7_fa81_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1228_c7_fa81_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1228_c7_fa81_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_3f3d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1228_c7_fa81_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1228_c7_fa81_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1228_c7_fa81_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1233_c7_3f3d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1228_c7_fa81_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1228_c7_fa81_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1228_c7_fa81_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_3f3d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1228_c7_fa81_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1228_c7_fa81_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1228_c7_fa81_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_3f3d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1228_c7_fa81_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1228_c7_fa81_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1228_c7_fa81_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1233_c7_3f3d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1228_c7_fa81_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1228_c7_fa81_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1228_c7_fa81_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1233_c7_3f3d_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1228_c7_fa81_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1233_c11_b2fc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1233_c11_b2fc_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1233_c11_b2fc_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1233_c7_3f3d_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1233_c7_3f3d_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1237_c7_ba2c_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1233_c7_3f3d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_3f3d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1235_c3_d060 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_3f3d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_ba2c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_3f3d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_3f3d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_3f3d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_ba2c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_3f3d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1233_c7_3f3d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1233_c7_3f3d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1237_c7_ba2c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1233_c7_3f3d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_3f3d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_3f3d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1237_c7_ba2c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_3f3d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_3f3d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_3f3d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_ba2c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_3f3d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1233_c7_3f3d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1233_c7_3f3d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1237_c7_ba2c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1233_c7_3f3d_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1233_c7_3f3d_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1233_c7_3f3d_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1233_c7_3f3d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1234_c3_b1e9_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1234_c3_b1e9_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1234_c3_b1e9_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1237_c11_1e09_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1237_c11_1e09_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1237_c11_1e09_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1237_c7_ba2c_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1237_c7_ba2c_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1241_c7_e6a7_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1237_c7_ba2c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_ba2c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_ba2c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_e6a7_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_ba2c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_ba2c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_ba2c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_e6a7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_ba2c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1237_c7_ba2c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1237_c7_ba2c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_e6a7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1237_c7_ba2c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1237_c7_ba2c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1237_c7_ba2c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_e6a7_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1237_c7_ba2c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_ba2c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_ba2c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_e6a7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_ba2c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1237_c7_ba2c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1237_c7_ba2c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1241_c7_e6a7_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1237_c7_ba2c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_d2d1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_d2d1_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_d2d1_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1241_c7_e6a7_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1241_c7_e6a7_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1241_c7_e6a7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_e6a7_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1246_c3_c109 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_e6a7_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_e6a7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_e6a7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_e6a7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_ffd3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_e6a7_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_e6a7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_e6a7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c7_ffd3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_e6a7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_e6a7_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_e6a7_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_e6a7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_e6a7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_e6a7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_ffd3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_e6a7_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1241_c7_e6a7_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1241_c7_e6a7_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1241_c7_e6a7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1242_c3_1375_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1242_c3_1375_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1242_c3_1375_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1244_c30_0ce4_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1244_c30_0ce4_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1244_c30_0ce4_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1244_c30_0ce4_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1247_c21_8d47_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1247_c21_8d47_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1247_c21_8d47_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1247_c21_eed9_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1247_c21_eed9_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1247_c21_eed9_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1247_c21_8d47_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1249_c11_6983_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1249_c11_6983_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1249_c11_6983_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c7_ffd3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c7_ffd3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c7_ffd3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_ffd3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_ffd3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_ffd3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_ffd3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_ffd3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_ffd3_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1237_l1233_l1228_l1225_l1220_l1249_DUPLICATE_0931_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1237_l1233_l1228_l1225_l1220_l1249_DUPLICATE_0363_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1241_l1237_l1233_l1228_l1225_l1220_DUPLICATE_3615_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1241_l1237_l1233_l1228_l1225_l1220_DUPLICATE_de7a_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1241_l1237_l1233_l1228_l1225_l1249_DUPLICATE_36ae_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1229_l1238_l1242_l1234_DUPLICATE_337e_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1239_l1230_DUPLICATE_4cc0_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1239_l1230_DUPLICATE_4cc0_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1237_l1241_DUPLICATE_5207_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4e73_uxn_opcodes_h_l1255_l1216_DUPLICATE_48a0_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_n16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_n16 := n16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1220_c2_164e_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1220_c6_a9d1_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1226_c3_edf3 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_884f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1226_c3_edf3;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1235_c3_d060 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_3f3d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1235_c3_d060;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_e6a7_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1246_c3_c109 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_e6a7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1246_c3_c109;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1225_c11_589b_right := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_e6a7_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_ffd3_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1233_c11_b2fc_right := to_unsigned(3, 2);
     VAR_sp_relative_shift_uxn_opcodes_h_l1244_c30_0ce4_y := resize(to_signed(-3, 3), 4);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_ffd3_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1220_c1_a7ca_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1231_c3_9e1a := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1228_c7_fa81_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1231_c3_9e1a;
     VAR_MUX_uxn_opcodes_h_l1247_c21_8d47_iffalse := resize(to_unsigned(1, 1), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_d2d1_right := to_unsigned(5, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c7_ffd3_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1222_c3_2b75 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c2_164e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1222_c3_2b75;
     VAR_MUX_uxn_opcodes_h_l1247_c21_8d47_iftrue := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1228_c11_efdf_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1249_c11_6983_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1237_c11_1e09_right := to_unsigned(4, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l1244_c30_0ce4_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1220_c1_a7ca_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l1244_c30_0ce4_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1242_c3_1375_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1220_c2_164e_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1225_c7_884f_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1228_c7_fa81_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1233_c7_3f3d_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1241_c7_e6a7_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1220_c6_a9d1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1225_c11_589b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1228_c11_efdf_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1233_c11_b2fc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1237_c11_1e09_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_d2d1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1249_c11_6983_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1247_c21_eed9_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1234_c3_b1e9_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1220_c2_164e_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1225_c7_884f_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1233_c7_3f3d_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l1228_c11_efdf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1228_c11_efdf_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1228_c11_efdf_left;
     BIN_OP_EQ_uxn_opcodes_h_l1228_c11_efdf_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1228_c11_efdf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1228_c11_efdf_return_output := BIN_OP_EQ_uxn_opcodes_h_l1228_c11_efdf_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l1244_c30_0ce4] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1244_c30_0ce4_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1244_c30_0ce4_ins;
     sp_relative_shift_uxn_opcodes_h_l1244_c30_0ce4_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1244_c30_0ce4_x;
     sp_relative_shift_uxn_opcodes_h_l1244_c30_0ce4_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1244_c30_0ce4_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1244_c30_0ce4_return_output := sp_relative_shift_uxn_opcodes_h_l1244_c30_0ce4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1220_c6_a9d1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1220_c6_a9d1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1220_c6_a9d1_left;
     BIN_OP_EQ_uxn_opcodes_h_l1220_c6_a9d1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1220_c6_a9d1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1220_c6_a9d1_return_output := BIN_OP_EQ_uxn_opcodes_h_l1220_c6_a9d1_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1229_l1238_l1242_l1234_DUPLICATE_337e LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1229_l1238_l1242_l1234_DUPLICATE_337e_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1237_c11_1e09] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1237_c11_1e09_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1237_c11_1e09_left;
     BIN_OP_EQ_uxn_opcodes_h_l1237_c11_1e09_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1237_c11_1e09_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1237_c11_1e09_return_output := BIN_OP_EQ_uxn_opcodes_h_l1237_c11_1e09_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1237_l1233_l1228_l1225_l1220_l1249_DUPLICATE_0931 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1237_l1233_l1228_l1225_l1220_l1249_DUPLICATE_0931_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1225_c11_589b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1225_c11_589b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1225_c11_589b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1225_c11_589b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1225_c11_589b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1225_c11_589b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1225_c11_589b_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1241_l1237_l1233_l1228_l1225_l1249_DUPLICATE_36ae LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1241_l1237_l1233_l1228_l1225_l1249_DUPLICATE_36ae_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1237_l1241_DUPLICATE_5207 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1237_l1241_DUPLICATE_5207_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1241_l1237_l1233_l1228_l1225_l1220_DUPLICATE_3615 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1241_l1237_l1233_l1228_l1225_l1220_DUPLICATE_3615_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1241_c11_d2d1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1241_c11_d2d1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_d2d1_left;
     BIN_OP_EQ_uxn_opcodes_h_l1241_c11_d2d1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_d2d1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_d2d1_return_output := BIN_OP_EQ_uxn_opcodes_h_l1241_c11_d2d1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1233_c11_b2fc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1233_c11_b2fc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1233_c11_b2fc_left;
     BIN_OP_EQ_uxn_opcodes_h_l1233_c11_b2fc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1233_c11_b2fc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1233_c11_b2fc_return_output := BIN_OP_EQ_uxn_opcodes_h_l1233_c11_b2fc_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1237_l1233_l1228_l1225_l1220_l1249_DUPLICATE_0363 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1237_l1233_l1228_l1225_l1220_l1249_DUPLICATE_0363_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1241_l1237_l1233_l1228_l1225_l1220_DUPLICATE_de7a LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1241_l1237_l1233_l1228_l1225_l1220_DUPLICATE_de7a_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1249_c11_6983] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1249_c11_6983_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1249_c11_6983_left;
     BIN_OP_EQ_uxn_opcodes_h_l1249_c11_6983_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1249_c11_6983_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1249_c11_6983_return_output := BIN_OP_EQ_uxn_opcodes_h_l1249_c11_6983_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1220_c1_a7ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1220_c6_a9d1_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1220_c2_164e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1220_c6_a9d1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1220_c2_164e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1220_c6_a9d1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1220_c2_164e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1220_c6_a9d1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1220_c2_164e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1220_c6_a9d1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c2_164e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1220_c6_a9d1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c2_164e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1220_c6_a9d1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1220_c2_164e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1220_c6_a9d1_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1220_c2_164e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1220_c6_a9d1_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1225_c7_884f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1225_c11_589b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_884f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1225_c11_589b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_884f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1225_c11_589b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_884f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1225_c11_589b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_884f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1225_c11_589b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_884f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1225_c11_589b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1225_c7_884f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1225_c11_589b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1225_c7_884f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1225_c11_589b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1228_c7_fa81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1228_c11_efdf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1228_c7_fa81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1228_c11_efdf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1228_c7_fa81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1228_c11_efdf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1228_c7_fa81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1228_c11_efdf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1228_c7_fa81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1228_c11_efdf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1228_c7_fa81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1228_c11_efdf_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1228_c7_fa81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1228_c11_efdf_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1228_c7_fa81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1228_c11_efdf_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1233_c7_3f3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1233_c11_b2fc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_3f3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1233_c11_b2fc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1233_c7_3f3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1233_c11_b2fc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_3f3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1233_c11_b2fc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_3f3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1233_c11_b2fc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_3f3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1233_c11_b2fc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1233_c7_3f3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1233_c11_b2fc_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1233_c7_3f3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1233_c11_b2fc_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1237_c7_ba2c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1237_c11_1e09_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_ba2c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1237_c11_1e09_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1237_c7_ba2c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1237_c11_1e09_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_ba2c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1237_c11_1e09_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1237_c7_ba2c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1237_c11_1e09_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_ba2c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1237_c11_1e09_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1237_c7_ba2c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1237_c11_1e09_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1241_c7_e6a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_d2d1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_e6a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_d2d1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_e6a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_d2d1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_e6a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_d2d1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_e6a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_d2d1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_e6a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_d2d1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1241_c7_e6a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_d2d1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_ffd3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1249_c11_6983_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c7_ffd3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1249_c11_6983_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_ffd3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1249_c11_6983_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1234_c3_b1e9_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1229_l1238_l1242_l1234_DUPLICATE_337e_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1242_c3_1375_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1229_l1238_l1242_l1234_DUPLICATE_337e_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1239_l1230_DUPLICATE_4cc0_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1229_l1238_l1242_l1234_DUPLICATE_337e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c2_164e_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1241_l1237_l1233_l1228_l1225_l1220_DUPLICATE_3615_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_884f_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1241_l1237_l1233_l1228_l1225_l1220_DUPLICATE_3615_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1228_c7_fa81_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1241_l1237_l1233_l1228_l1225_l1220_DUPLICATE_3615_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_3f3d_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1241_l1237_l1233_l1228_l1225_l1220_DUPLICATE_3615_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1237_c7_ba2c_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1241_l1237_l1233_l1228_l1225_l1220_DUPLICATE_3615_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_e6a7_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1241_l1237_l1233_l1228_l1225_l1220_DUPLICATE_3615_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_884f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1241_l1237_l1233_l1228_l1225_l1249_DUPLICATE_36ae_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1228_c7_fa81_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1241_l1237_l1233_l1228_l1225_l1249_DUPLICATE_36ae_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_3f3d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1241_l1237_l1233_l1228_l1225_l1249_DUPLICATE_36ae_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_ba2c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1241_l1237_l1233_l1228_l1225_l1249_DUPLICATE_36ae_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_e6a7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1241_l1237_l1233_l1228_l1225_l1249_DUPLICATE_36ae_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_ffd3_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1241_l1237_l1233_l1228_l1225_l1249_DUPLICATE_36ae_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1220_c2_164e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1237_l1233_l1228_l1225_l1220_l1249_DUPLICATE_0363_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_884f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1237_l1233_l1228_l1225_l1220_l1249_DUPLICATE_0363_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1228_c7_fa81_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1237_l1233_l1228_l1225_l1220_l1249_DUPLICATE_0363_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1233_c7_3f3d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1237_l1233_l1228_l1225_l1220_l1249_DUPLICATE_0363_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1237_c7_ba2c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1237_l1233_l1228_l1225_l1220_l1249_DUPLICATE_0363_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c7_ffd3_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1237_l1233_l1228_l1225_l1220_l1249_DUPLICATE_0363_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1220_c2_164e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1237_l1233_l1228_l1225_l1220_l1249_DUPLICATE_0931_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_884f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1237_l1233_l1228_l1225_l1220_l1249_DUPLICATE_0931_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1228_c7_fa81_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1237_l1233_l1228_l1225_l1220_l1249_DUPLICATE_0931_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_3f3d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1237_l1233_l1228_l1225_l1220_l1249_DUPLICATE_0931_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_ba2c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1237_l1233_l1228_l1225_l1220_l1249_DUPLICATE_0931_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_ffd3_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1237_l1233_l1228_l1225_l1220_l1249_DUPLICATE_0931_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_ba2c_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1237_l1241_DUPLICATE_5207_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_e6a7_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1237_l1241_DUPLICATE_5207_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1220_c2_164e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1241_l1237_l1233_l1228_l1225_l1220_DUPLICATE_de7a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1225_c7_884f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1241_l1237_l1233_l1228_l1225_l1220_DUPLICATE_de7a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1228_c7_fa81_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1241_l1237_l1233_l1228_l1225_l1220_DUPLICATE_de7a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1233_c7_3f3d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1241_l1237_l1233_l1228_l1225_l1220_DUPLICATE_de7a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1237_c7_ba2c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1241_l1237_l1233_l1228_l1225_l1220_DUPLICATE_de7a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1241_c7_e6a7_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1241_l1237_l1233_l1228_l1225_l1220_DUPLICATE_de7a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_e6a7_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1244_c30_0ce4_return_output;
     -- BIN_OP_OR[uxn_opcodes_h_l1242_c3_1375] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1242_c3_1375_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1242_c3_1375_left;
     BIN_OP_OR_uxn_opcodes_h_l1242_c3_1375_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1242_c3_1375_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1242_c3_1375_return_output := BIN_OP_OR_uxn_opcodes_h_l1242_c3_1375_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1249_c7_ffd3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_ffd3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_ffd3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_ffd3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_ffd3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_ffd3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_ffd3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_ffd3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_ffd3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1249_c7_ffd3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_ffd3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_ffd3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_ffd3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_ffd3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_ffd3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_ffd3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_ffd3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_ffd3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1241_c7_e6a7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_e6a7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_e6a7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_e6a7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_e6a7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_e6a7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_e6a7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_e6a7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_e6a7_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1220_c1_a7ca] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1220_c1_a7ca_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1220_c1_a7ca_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1220_c1_a7ca_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1220_c1_a7ca_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1220_c1_a7ca_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1220_c1_a7ca_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1220_c1_a7ca_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1220_c1_a7ca_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1249_c7_ffd3] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c7_ffd3_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c7_ffd3_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c7_ffd3_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c7_ffd3_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c7_ffd3_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c7_ffd3_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c7_ffd3_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c7_ffd3_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1234_c3_b1e9] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1234_c3_b1e9_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1234_c3_b1e9_left;
     BIN_OP_OR_uxn_opcodes_h_l1234_c3_b1e9_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1234_c3_b1e9_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1234_c3_b1e9_return_output := BIN_OP_OR_uxn_opcodes_h_l1234_c3_b1e9_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1239_l1230_DUPLICATE_4cc0 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1239_l1230_DUPLICATE_4cc0_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1239_l1230_DUPLICATE_4cc0_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1239_l1230_DUPLICATE_4cc0_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1239_l1230_DUPLICATE_4cc0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1241_c7_e6a7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_e6a7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_e6a7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_e6a7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_e6a7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_e6a7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_e6a7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_e6a7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_e6a7_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l1233_c7_3f3d_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1234_c3_b1e9_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1247_c21_eed9_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1242_c3_1375_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1241_c7_e6a7_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1242_c3_1375_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1237_c7_ba2c_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1239_l1230_DUPLICATE_4cc0_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1228_c7_fa81_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1239_l1230_DUPLICATE_4cc0_return_output;
     VAR_printf_uxn_opcodes_h_l1221_c3_4e3e_uxn_opcodes_h_l1221_c3_4e3e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1220_c1_a7ca_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_e6a7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_ffd3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_e6a7_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1249_c7_ffd3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_e6a7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_ffd3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1237_c7_ba2c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_e6a7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_ba2c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_e6a7_return_output;
     -- n16_MUX[uxn_opcodes_h_l1241_c7_e6a7] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1241_c7_e6a7_cond <= VAR_n16_MUX_uxn_opcodes_h_l1241_c7_e6a7_cond;
     n16_MUX_uxn_opcodes_h_l1241_c7_e6a7_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1241_c7_e6a7_iftrue;
     n16_MUX_uxn_opcodes_h_l1241_c7_e6a7_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1241_c7_e6a7_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1241_c7_e6a7_return_output := n16_MUX_uxn_opcodes_h_l1241_c7_e6a7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1237_c7_ba2c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_ba2c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_ba2c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_ba2c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_ba2c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_ba2c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_ba2c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_ba2c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_ba2c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1237_c7_ba2c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1237_c7_ba2c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1237_c7_ba2c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1237_c7_ba2c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1237_c7_ba2c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1237_c7_ba2c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1237_c7_ba2c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1237_c7_ba2c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1237_c7_ba2c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1241_c7_e6a7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_e6a7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_e6a7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_e6a7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_e6a7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_e6a7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_e6a7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_e6a7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_e6a7_return_output;

     -- t16_MUX[uxn_opcodes_h_l1233_c7_3f3d] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1233_c7_3f3d_cond <= VAR_t16_MUX_uxn_opcodes_h_l1233_c7_3f3d_cond;
     t16_MUX_uxn_opcodes_h_l1233_c7_3f3d_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1233_c7_3f3d_iftrue;
     t16_MUX_uxn_opcodes_h_l1233_c7_3f3d_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1233_c7_3f3d_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1233_c7_3f3d_return_output := t16_MUX_uxn_opcodes_h_l1233_c7_3f3d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1247_c21_eed9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1247_c21_eed9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1247_c21_eed9_left;
     BIN_OP_EQ_uxn_opcodes_h_l1247_c21_eed9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1247_c21_eed9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1247_c21_eed9_return_output := BIN_OP_EQ_uxn_opcodes_h_l1247_c21_eed9_return_output;

     -- printf_uxn_opcodes_h_l1221_c3_4e3e[uxn_opcodes_h_l1221_c3_4e3e] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1221_c3_4e3e_uxn_opcodes_h_l1221_c3_4e3e_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1221_c3_4e3e_uxn_opcodes_h_l1221_c3_4e3e_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1241_c7_e6a7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_e6a7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_e6a7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_e6a7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_e6a7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_e6a7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_e6a7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_e6a7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_e6a7_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1241_c7_e6a7] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_e6a7_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_e6a7_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_e6a7_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_e6a7_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_e6a7_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_e6a7_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_e6a7_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_e6a7_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_opcodes_h_l1247_c21_8d47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1247_c21_eed9_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1237_c7_ba2c_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1241_c7_e6a7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_ba2c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_e6a7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1237_c7_ba2c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_e6a7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_ba2c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_e6a7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_3f3d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1237_c7_ba2c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_3f3d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1237_c7_ba2c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1228_c7_fa81_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1233_c7_3f3d_return_output;
     -- MUX[uxn_opcodes_h_l1247_c21_8d47] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1247_c21_8d47_cond <= VAR_MUX_uxn_opcodes_h_l1247_c21_8d47_cond;
     MUX_uxn_opcodes_h_l1247_c21_8d47_iftrue <= VAR_MUX_uxn_opcodes_h_l1247_c21_8d47_iftrue;
     MUX_uxn_opcodes_h_l1247_c21_8d47_iffalse <= VAR_MUX_uxn_opcodes_h_l1247_c21_8d47_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1247_c21_8d47_return_output := MUX_uxn_opcodes_h_l1247_c21_8d47_return_output;

     -- n16_MUX[uxn_opcodes_h_l1237_c7_ba2c] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1237_c7_ba2c_cond <= VAR_n16_MUX_uxn_opcodes_h_l1237_c7_ba2c_cond;
     n16_MUX_uxn_opcodes_h_l1237_c7_ba2c_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1237_c7_ba2c_iftrue;
     n16_MUX_uxn_opcodes_h_l1237_c7_ba2c_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1237_c7_ba2c_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1237_c7_ba2c_return_output := n16_MUX_uxn_opcodes_h_l1237_c7_ba2c_return_output;

     -- t16_MUX[uxn_opcodes_h_l1228_c7_fa81] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1228_c7_fa81_cond <= VAR_t16_MUX_uxn_opcodes_h_l1228_c7_fa81_cond;
     t16_MUX_uxn_opcodes_h_l1228_c7_fa81_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1228_c7_fa81_iftrue;
     t16_MUX_uxn_opcodes_h_l1228_c7_fa81_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1228_c7_fa81_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1228_c7_fa81_return_output := t16_MUX_uxn_opcodes_h_l1228_c7_fa81_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1237_c7_ba2c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1237_c7_ba2c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1237_c7_ba2c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1237_c7_ba2c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1237_c7_ba2c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1237_c7_ba2c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1237_c7_ba2c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1237_c7_ba2c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1237_c7_ba2c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1233_c7_3f3d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_3f3d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_3f3d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_3f3d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_3f3d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_3f3d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_3f3d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_3f3d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_3f3d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1237_c7_ba2c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_ba2c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_ba2c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_ba2c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_ba2c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_ba2c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_ba2c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_ba2c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_ba2c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1233_c7_3f3d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_3f3d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_3f3d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_3f3d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_3f3d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_3f3d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_3f3d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_3f3d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_3f3d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1237_c7_ba2c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_ba2c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_ba2c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_ba2c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_ba2c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_ba2c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_ba2c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_ba2c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_ba2c_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1241_c7_e6a7_iftrue := VAR_MUX_uxn_opcodes_h_l1247_c21_8d47_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1233_c7_3f3d_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1237_c7_ba2c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_3f3d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1237_c7_ba2c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1233_c7_3f3d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1237_c7_ba2c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_3f3d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1237_c7_ba2c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1228_c7_fa81_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_3f3d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1228_c7_fa81_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_3f3d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1225_c7_884f_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1228_c7_fa81_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1228_c7_fa81] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1228_c7_fa81_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1228_c7_fa81_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1228_c7_fa81_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1228_c7_fa81_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1228_c7_fa81_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1228_c7_fa81_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1228_c7_fa81_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1228_c7_fa81_return_output;

     -- t16_MUX[uxn_opcodes_h_l1225_c7_884f] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1225_c7_884f_cond <= VAR_t16_MUX_uxn_opcodes_h_l1225_c7_884f_cond;
     t16_MUX_uxn_opcodes_h_l1225_c7_884f_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1225_c7_884f_iftrue;
     t16_MUX_uxn_opcodes_h_l1225_c7_884f_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1225_c7_884f_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1225_c7_884f_return_output := t16_MUX_uxn_opcodes_h_l1225_c7_884f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1233_c7_3f3d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1233_c7_3f3d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1233_c7_3f3d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1233_c7_3f3d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1233_c7_3f3d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1233_c7_3f3d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1233_c7_3f3d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1233_c7_3f3d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1233_c7_3f3d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1233_c7_3f3d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_3f3d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_3f3d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_3f3d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_3f3d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_3f3d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_3f3d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_3f3d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_3f3d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1233_c7_3f3d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_3f3d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_3f3d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_3f3d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_3f3d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_3f3d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_3f3d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_3f3d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_3f3d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1228_c7_fa81] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1228_c7_fa81_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1228_c7_fa81_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1228_c7_fa81_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1228_c7_fa81_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1228_c7_fa81_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1228_c7_fa81_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1228_c7_fa81_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1228_c7_fa81_return_output;

     -- n16_MUX[uxn_opcodes_h_l1233_c7_3f3d] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1233_c7_3f3d_cond <= VAR_n16_MUX_uxn_opcodes_h_l1233_c7_3f3d_cond;
     n16_MUX_uxn_opcodes_h_l1233_c7_3f3d_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1233_c7_3f3d_iftrue;
     n16_MUX_uxn_opcodes_h_l1233_c7_3f3d_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1233_c7_3f3d_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1233_c7_3f3d_return_output := n16_MUX_uxn_opcodes_h_l1233_c7_3f3d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1241_c7_e6a7] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1241_c7_e6a7_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1241_c7_e6a7_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1241_c7_e6a7_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1241_c7_e6a7_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1241_c7_e6a7_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1241_c7_e6a7_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1241_c7_e6a7_return_output := result_u8_value_MUX_uxn_opcodes_h_l1241_c7_e6a7_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1228_c7_fa81_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1233_c7_3f3d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1228_c7_fa81_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_3f3d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1228_c7_fa81_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1233_c7_3f3d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1228_c7_fa81_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_3f3d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_884f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1228_c7_fa81_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_884f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1228_c7_fa81_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1237_c7_ba2c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1241_c7_e6a7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1220_c2_164e_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1225_c7_884f_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1228_c7_fa81] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1228_c7_fa81_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1228_c7_fa81_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1228_c7_fa81_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1228_c7_fa81_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1228_c7_fa81_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1228_c7_fa81_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1228_c7_fa81_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1228_c7_fa81_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1228_c7_fa81] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1228_c7_fa81_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1228_c7_fa81_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1228_c7_fa81_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1228_c7_fa81_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1228_c7_fa81_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1228_c7_fa81_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1228_c7_fa81_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1228_c7_fa81_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1225_c7_884f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_884f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_884f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_884f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_884f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_884f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_884f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_884f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_884f_return_output;

     -- t16_MUX[uxn_opcodes_h_l1220_c2_164e] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1220_c2_164e_cond <= VAR_t16_MUX_uxn_opcodes_h_l1220_c2_164e_cond;
     t16_MUX_uxn_opcodes_h_l1220_c2_164e_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1220_c2_164e_iftrue;
     t16_MUX_uxn_opcodes_h_l1220_c2_164e_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1220_c2_164e_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1220_c2_164e_return_output := t16_MUX_uxn_opcodes_h_l1220_c2_164e_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1237_c7_ba2c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1237_c7_ba2c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1237_c7_ba2c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1237_c7_ba2c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1237_c7_ba2c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1237_c7_ba2c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1237_c7_ba2c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1237_c7_ba2c_return_output := result_u8_value_MUX_uxn_opcodes_h_l1237_c7_ba2c_return_output;

     -- n16_MUX[uxn_opcodes_h_l1228_c7_fa81] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1228_c7_fa81_cond <= VAR_n16_MUX_uxn_opcodes_h_l1228_c7_fa81_cond;
     n16_MUX_uxn_opcodes_h_l1228_c7_fa81_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1228_c7_fa81_iftrue;
     n16_MUX_uxn_opcodes_h_l1228_c7_fa81_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1228_c7_fa81_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1228_c7_fa81_return_output := n16_MUX_uxn_opcodes_h_l1228_c7_fa81_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1225_c7_884f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_884f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_884f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_884f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_884f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_884f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_884f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_884f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_884f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1228_c7_fa81] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1228_c7_fa81_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1228_c7_fa81_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1228_c7_fa81_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1228_c7_fa81_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1228_c7_fa81_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1228_c7_fa81_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1228_c7_fa81_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1228_c7_fa81_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1225_c7_884f_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1228_c7_fa81_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_884f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1228_c7_fa81_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_884f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1228_c7_fa81_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_884f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1228_c7_fa81_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c2_164e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1225_c7_884f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c2_164e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1225_c7_884f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1233_c7_3f3d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1237_c7_ba2c_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1220_c2_164e_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1225_c7_884f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_884f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_884f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_884f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_884f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_884f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_884f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_884f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_884f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1220_c2_164e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c2_164e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c2_164e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c2_164e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c2_164e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c2_164e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c2_164e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c2_164e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c2_164e_return_output;

     -- n16_MUX[uxn_opcodes_h_l1225_c7_884f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1225_c7_884f_cond <= VAR_n16_MUX_uxn_opcodes_h_l1225_c7_884f_cond;
     n16_MUX_uxn_opcodes_h_l1225_c7_884f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1225_c7_884f_iftrue;
     n16_MUX_uxn_opcodes_h_l1225_c7_884f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1225_c7_884f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1225_c7_884f_return_output := n16_MUX_uxn_opcodes_h_l1225_c7_884f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1220_c2_164e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c2_164e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c2_164e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c2_164e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c2_164e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c2_164e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c2_164e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c2_164e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c2_164e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1225_c7_884f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_884f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_884f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_884f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_884f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_884f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_884f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_884f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_884f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1225_c7_884f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_884f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_884f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_884f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_884f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_884f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_884f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_884f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_884f_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1233_c7_3f3d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1233_c7_3f3d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1233_c7_3f3d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1233_c7_3f3d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1233_c7_3f3d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1233_c7_3f3d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1233_c7_3f3d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1233_c7_3f3d_return_output := result_u8_value_MUX_uxn_opcodes_h_l1233_c7_3f3d_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1220_c2_164e_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1225_c7_884f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1220_c2_164e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1225_c7_884f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1220_c2_164e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1225_c7_884f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1220_c2_164e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1225_c7_884f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1228_c7_fa81_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1233_c7_3f3d_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1220_c2_164e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1220_c2_164e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1220_c2_164e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1220_c2_164e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1220_c2_164e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1220_c2_164e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1220_c2_164e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1220_c2_164e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1220_c2_164e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1220_c2_164e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1220_c2_164e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1220_c2_164e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1220_c2_164e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1220_c2_164e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1220_c2_164e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1220_c2_164e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1220_c2_164e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1220_c2_164e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1220_c2_164e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1220_c2_164e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1220_c2_164e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1220_c2_164e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1220_c2_164e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1220_c2_164e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1220_c2_164e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1220_c2_164e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1220_c2_164e_return_output;

     -- n16_MUX[uxn_opcodes_h_l1220_c2_164e] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1220_c2_164e_cond <= VAR_n16_MUX_uxn_opcodes_h_l1220_c2_164e_cond;
     n16_MUX_uxn_opcodes_h_l1220_c2_164e_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1220_c2_164e_iftrue;
     n16_MUX_uxn_opcodes_h_l1220_c2_164e_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1220_c2_164e_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1220_c2_164e_return_output := n16_MUX_uxn_opcodes_h_l1220_c2_164e_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1228_c7_fa81] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1228_c7_fa81_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1228_c7_fa81_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1228_c7_fa81_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1228_c7_fa81_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1228_c7_fa81_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1228_c7_fa81_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1228_c7_fa81_return_output := result_u8_value_MUX_uxn_opcodes_h_l1228_c7_fa81_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1220_c2_164e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1225_c7_884f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1228_c7_fa81_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1225_c7_884f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1225_c7_884f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1225_c7_884f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1225_c7_884f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1225_c7_884f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1225_c7_884f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1225_c7_884f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1225_c7_884f_return_output := result_u8_value_MUX_uxn_opcodes_h_l1225_c7_884f_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1220_c2_164e_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1225_c7_884f_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1220_c2_164e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1220_c2_164e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1220_c2_164e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1220_c2_164e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1220_c2_164e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1220_c2_164e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1220_c2_164e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1220_c2_164e_return_output := result_u8_value_MUX_uxn_opcodes_h_l1220_c2_164e_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_4e73_uxn_opcodes_h_l1255_l1216_DUPLICATE_48a0 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4e73_uxn_opcodes_h_l1255_l1216_DUPLICATE_48a0_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_4e73(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c2_164e_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1220_c2_164e_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1220_c2_164e_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c2_164e_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1220_c2_164e_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1220_c2_164e_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4e73_uxn_opcodes_h_l1255_l1216_DUPLICATE_48a0_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4e73_uxn_opcodes_h_l1255_l1216_DUPLICATE_48a0_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_n16 <= REG_VAR_n16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     n16 <= REG_COMB_n16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
