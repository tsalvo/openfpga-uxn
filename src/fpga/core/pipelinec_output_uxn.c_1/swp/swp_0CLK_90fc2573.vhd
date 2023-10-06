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
-- Submodules: 68
entity swp_0CLK_90fc2573 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end swp_0CLK_90fc2573;
architecture arch of swp_0CLK_90fc2573 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l2966_c6_1727]
signal BIN_OP_EQ_uxn_opcodes_h_l2966_c6_1727_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2966_c6_1727_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2966_c6_1727_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2966_c1_2922]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2966_c1_2922_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2966_c1_2922_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2966_c1_2922_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2966_c1_2922_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2966_c2_cbca]
signal t8_MUX_uxn_opcodes_h_l2966_c2_cbca_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2966_c2_cbca_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2966_c2_cbca_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2966_c2_cbca_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l2966_c2_cbca]
signal n8_MUX_uxn_opcodes_h_l2966_c2_cbca_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2966_c2_cbca_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2966_c2_cbca_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2966_c2_cbca_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2966_c2_cbca]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2966_c2_cbca_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2966_c2_cbca_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2966_c2_cbca_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2966_c2_cbca_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2966_c2_cbca]
signal result_stack_value_MUX_uxn_opcodes_h_l2966_c2_cbca_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2966_c2_cbca_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2966_c2_cbca_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2966_c2_cbca_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2966_c2_cbca]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2966_c2_cbca_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2966_c2_cbca_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2966_c2_cbca_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2966_c2_cbca_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2966_c2_cbca]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2966_c2_cbca_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2966_c2_cbca_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2966_c2_cbca_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2966_c2_cbca_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2966_c2_cbca]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2966_c2_cbca_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2966_c2_cbca_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2966_c2_cbca_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2966_c2_cbca_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2966_c2_cbca]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2966_c2_cbca_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2966_c2_cbca_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2966_c2_cbca_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2966_c2_cbca_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2966_c2_cbca]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2966_c2_cbca_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2966_c2_cbca_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2966_c2_cbca_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2966_c2_cbca_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l2967_c3_44cf[uxn_opcodes_h_l2967_c3_44cf]
signal printf_uxn_opcodes_h_l2967_c3_44cf_uxn_opcodes_h_l2967_c3_44cf_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2972_c11_b008]
signal BIN_OP_EQ_uxn_opcodes_h_l2972_c11_b008_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2972_c11_b008_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2972_c11_b008_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2972_c7_0ca8]
signal t8_MUX_uxn_opcodes_h_l2972_c7_0ca8_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2972_c7_0ca8_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2972_c7_0ca8_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2972_c7_0ca8_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l2972_c7_0ca8]
signal n8_MUX_uxn_opcodes_h_l2972_c7_0ca8_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2972_c7_0ca8_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2972_c7_0ca8_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2972_c7_0ca8_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2972_c7_0ca8]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2972_c7_0ca8_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2972_c7_0ca8_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2972_c7_0ca8_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2972_c7_0ca8_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2972_c7_0ca8]
signal result_stack_value_MUX_uxn_opcodes_h_l2972_c7_0ca8_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2972_c7_0ca8_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2972_c7_0ca8_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2972_c7_0ca8_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2972_c7_0ca8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2972_c7_0ca8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2972_c7_0ca8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2972_c7_0ca8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2972_c7_0ca8_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2972_c7_0ca8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2972_c7_0ca8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2972_c7_0ca8_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2972_c7_0ca8_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2972_c7_0ca8_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2972_c7_0ca8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2972_c7_0ca8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2972_c7_0ca8_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2972_c7_0ca8_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2972_c7_0ca8_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2972_c7_0ca8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2972_c7_0ca8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2972_c7_0ca8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2972_c7_0ca8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2972_c7_0ca8_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2972_c7_0ca8]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2972_c7_0ca8_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2972_c7_0ca8_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2972_c7_0ca8_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2972_c7_0ca8_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2975_c11_c2c1]
signal BIN_OP_EQ_uxn_opcodes_h_l2975_c11_c2c1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2975_c11_c2c1_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2975_c11_c2c1_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2975_c7_8c38]
signal t8_MUX_uxn_opcodes_h_l2975_c7_8c38_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2975_c7_8c38_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2975_c7_8c38_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2975_c7_8c38_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l2975_c7_8c38]
signal n8_MUX_uxn_opcodes_h_l2975_c7_8c38_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2975_c7_8c38_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2975_c7_8c38_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2975_c7_8c38_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2975_c7_8c38]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2975_c7_8c38_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2975_c7_8c38_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2975_c7_8c38_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2975_c7_8c38_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2975_c7_8c38]
signal result_stack_value_MUX_uxn_opcodes_h_l2975_c7_8c38_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2975_c7_8c38_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2975_c7_8c38_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2975_c7_8c38_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2975_c7_8c38]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2975_c7_8c38_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2975_c7_8c38_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2975_c7_8c38_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2975_c7_8c38_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2975_c7_8c38]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2975_c7_8c38_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2975_c7_8c38_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2975_c7_8c38_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2975_c7_8c38_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2975_c7_8c38]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2975_c7_8c38_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2975_c7_8c38_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2975_c7_8c38_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2975_c7_8c38_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2975_c7_8c38]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2975_c7_8c38_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2975_c7_8c38_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2975_c7_8c38_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2975_c7_8c38_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2975_c7_8c38]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2975_c7_8c38_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2975_c7_8c38_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2975_c7_8c38_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2975_c7_8c38_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2979_c11_ebcb]
signal BIN_OP_EQ_uxn_opcodes_h_l2979_c11_ebcb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2979_c11_ebcb_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2979_c11_ebcb_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2979_c7_b8e5]
signal n8_MUX_uxn_opcodes_h_l2979_c7_b8e5_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2979_c7_b8e5_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2979_c7_b8e5_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2979_c7_b8e5_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2979_c7_b8e5]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2979_c7_b8e5_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2979_c7_b8e5_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2979_c7_b8e5_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2979_c7_b8e5_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2979_c7_b8e5]
signal result_stack_value_MUX_uxn_opcodes_h_l2979_c7_b8e5_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2979_c7_b8e5_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2979_c7_b8e5_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2979_c7_b8e5_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2979_c7_b8e5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2979_c7_b8e5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2979_c7_b8e5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2979_c7_b8e5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2979_c7_b8e5_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2979_c7_b8e5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2979_c7_b8e5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2979_c7_b8e5_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2979_c7_b8e5_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2979_c7_b8e5_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2979_c7_b8e5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2979_c7_b8e5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2979_c7_b8e5_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2979_c7_b8e5_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2979_c7_b8e5_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2979_c7_b8e5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2979_c7_b8e5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2979_c7_b8e5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2979_c7_b8e5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2979_c7_b8e5_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2979_c7_b8e5]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2979_c7_b8e5_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2979_c7_b8e5_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2979_c7_b8e5_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2979_c7_b8e5_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2982_c11_c028]
signal BIN_OP_EQ_uxn_opcodes_h_l2982_c11_c028_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2982_c11_c028_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2982_c11_c028_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2982_c7_f680]
signal n8_MUX_uxn_opcodes_h_l2982_c7_f680_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2982_c7_f680_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2982_c7_f680_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2982_c7_f680_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2982_c7_f680]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2982_c7_f680_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2982_c7_f680_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2982_c7_f680_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2982_c7_f680_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2982_c7_f680]
signal result_stack_value_MUX_uxn_opcodes_h_l2982_c7_f680_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2982_c7_f680_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2982_c7_f680_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2982_c7_f680_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2982_c7_f680]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2982_c7_f680_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2982_c7_f680_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2982_c7_f680_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2982_c7_f680_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2982_c7_f680]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2982_c7_f680_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2982_c7_f680_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2982_c7_f680_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2982_c7_f680_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2982_c7_f680]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2982_c7_f680_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2982_c7_f680_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2982_c7_f680_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2982_c7_f680_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2982_c7_f680]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2982_c7_f680_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2982_c7_f680_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2982_c7_f680_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2982_c7_f680_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2982_c7_f680]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2982_c7_f680_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2982_c7_f680_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2982_c7_f680_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2982_c7_f680_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2986_c32_6d4c]
signal BIN_OP_AND_uxn_opcodes_h_l2986_c32_6d4c_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2986_c32_6d4c_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2986_c32_6d4c_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l2986_c32_3dc2]
signal BIN_OP_GT_uxn_opcodes_h_l2986_c32_3dc2_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2986_c32_3dc2_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2986_c32_3dc2_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2986_c32_2661]
signal MUX_uxn_opcodes_h_l2986_c32_2661_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2986_c32_2661_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2986_c32_2661_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2986_c32_2661_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2988_c11_9dac]
signal BIN_OP_EQ_uxn_opcodes_h_l2988_c11_9dac_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2988_c11_9dac_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2988_c11_9dac_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2988_c7_c62c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2988_c7_c62c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2988_c7_c62c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2988_c7_c62c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2988_c7_c62c_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2988_c7_c62c]
signal result_stack_value_MUX_uxn_opcodes_h_l2988_c7_c62c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2988_c7_c62c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2988_c7_c62c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2988_c7_c62c_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2988_c7_c62c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2988_c7_c62c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2988_c7_c62c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2988_c7_c62c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2988_c7_c62c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2988_c7_c62c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2988_c7_c62c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2988_c7_c62c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2988_c7_c62c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2988_c7_c62c_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2988_c7_c62c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2988_c7_c62c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2988_c7_c62c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2988_c7_c62c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2988_c7_c62c_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2994_c11_7817]
signal BIN_OP_EQ_uxn_opcodes_h_l2994_c11_7817_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2994_c11_7817_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2994_c11_7817_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2994_c7_686a]
signal result_stack_value_MUX_uxn_opcodes_h_l2994_c7_686a_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2994_c7_686a_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2994_c7_686a_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2994_c7_686a_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2994_c7_686a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2994_c7_686a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2994_c7_686a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2994_c7_686a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2994_c7_686a_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2994_c7_686a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2994_c7_686a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2994_c7_686a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2994_c7_686a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2994_c7_686a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2994_c7_686a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2994_c7_686a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2994_c7_686a_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2994_c7_686a_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2994_c7_686a_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2998_c11_b446]
signal BIN_OP_EQ_uxn_opcodes_h_l2998_c11_b446_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2998_c11_b446_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2998_c11_b446_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2998_c7_9067]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2998_c7_9067_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2998_c7_9067_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2998_c7_9067_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2998_c7_9067_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2998_c7_9067]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2998_c7_9067_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2998_c7_9067_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2998_c7_9067_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2998_c7_9067_return_output : unsigned(0 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l2966_c6_1727
BIN_OP_EQ_uxn_opcodes_h_l2966_c6_1727 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2966_c6_1727_left,
BIN_OP_EQ_uxn_opcodes_h_l2966_c6_1727_right,
BIN_OP_EQ_uxn_opcodes_h_l2966_c6_1727_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2966_c1_2922
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2966_c1_2922 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2966_c1_2922_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2966_c1_2922_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2966_c1_2922_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2966_c1_2922_return_output);

-- t8_MUX_uxn_opcodes_h_l2966_c2_cbca
t8_MUX_uxn_opcodes_h_l2966_c2_cbca : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2966_c2_cbca_cond,
t8_MUX_uxn_opcodes_h_l2966_c2_cbca_iftrue,
t8_MUX_uxn_opcodes_h_l2966_c2_cbca_iffalse,
t8_MUX_uxn_opcodes_h_l2966_c2_cbca_return_output);

-- n8_MUX_uxn_opcodes_h_l2966_c2_cbca
n8_MUX_uxn_opcodes_h_l2966_c2_cbca : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2966_c2_cbca_cond,
n8_MUX_uxn_opcodes_h_l2966_c2_cbca_iftrue,
n8_MUX_uxn_opcodes_h_l2966_c2_cbca_iffalse,
n8_MUX_uxn_opcodes_h_l2966_c2_cbca_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2966_c2_cbca
result_is_sp_shift_MUX_uxn_opcodes_h_l2966_c2_cbca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2966_c2_cbca_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2966_c2_cbca_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2966_c2_cbca_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2966_c2_cbca_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2966_c2_cbca
result_stack_value_MUX_uxn_opcodes_h_l2966_c2_cbca : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2966_c2_cbca_cond,
result_stack_value_MUX_uxn_opcodes_h_l2966_c2_cbca_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2966_c2_cbca_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2966_c2_cbca_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2966_c2_cbca
result_is_stack_write_MUX_uxn_opcodes_h_l2966_c2_cbca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2966_c2_cbca_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2966_c2_cbca_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2966_c2_cbca_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2966_c2_cbca_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2966_c2_cbca
result_sp_relative_shift_MUX_uxn_opcodes_h_l2966_c2_cbca : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2966_c2_cbca_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2966_c2_cbca_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2966_c2_cbca_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2966_c2_cbca_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2966_c2_cbca
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2966_c2_cbca : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2966_c2_cbca_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2966_c2_cbca_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2966_c2_cbca_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2966_c2_cbca_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2966_c2_cbca
result_is_opc_done_MUX_uxn_opcodes_h_l2966_c2_cbca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2966_c2_cbca_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2966_c2_cbca_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2966_c2_cbca_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2966_c2_cbca_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2966_c2_cbca
result_is_stack_read_MUX_uxn_opcodes_h_l2966_c2_cbca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2966_c2_cbca_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2966_c2_cbca_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2966_c2_cbca_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2966_c2_cbca_return_output);

-- printf_uxn_opcodes_h_l2967_c3_44cf_uxn_opcodes_h_l2967_c3_44cf
printf_uxn_opcodes_h_l2967_c3_44cf_uxn_opcodes_h_l2967_c3_44cf : entity work.printf_uxn_opcodes_h_l2967_c3_44cf_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2967_c3_44cf_uxn_opcodes_h_l2967_c3_44cf_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2972_c11_b008
BIN_OP_EQ_uxn_opcodes_h_l2972_c11_b008 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2972_c11_b008_left,
BIN_OP_EQ_uxn_opcodes_h_l2972_c11_b008_right,
BIN_OP_EQ_uxn_opcodes_h_l2972_c11_b008_return_output);

-- t8_MUX_uxn_opcodes_h_l2972_c7_0ca8
t8_MUX_uxn_opcodes_h_l2972_c7_0ca8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2972_c7_0ca8_cond,
t8_MUX_uxn_opcodes_h_l2972_c7_0ca8_iftrue,
t8_MUX_uxn_opcodes_h_l2972_c7_0ca8_iffalse,
t8_MUX_uxn_opcodes_h_l2972_c7_0ca8_return_output);

-- n8_MUX_uxn_opcodes_h_l2972_c7_0ca8
n8_MUX_uxn_opcodes_h_l2972_c7_0ca8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2972_c7_0ca8_cond,
n8_MUX_uxn_opcodes_h_l2972_c7_0ca8_iftrue,
n8_MUX_uxn_opcodes_h_l2972_c7_0ca8_iffalse,
n8_MUX_uxn_opcodes_h_l2972_c7_0ca8_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2972_c7_0ca8
result_is_sp_shift_MUX_uxn_opcodes_h_l2972_c7_0ca8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2972_c7_0ca8_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2972_c7_0ca8_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2972_c7_0ca8_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2972_c7_0ca8_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2972_c7_0ca8
result_stack_value_MUX_uxn_opcodes_h_l2972_c7_0ca8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2972_c7_0ca8_cond,
result_stack_value_MUX_uxn_opcodes_h_l2972_c7_0ca8_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2972_c7_0ca8_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2972_c7_0ca8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2972_c7_0ca8
result_is_stack_write_MUX_uxn_opcodes_h_l2972_c7_0ca8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2972_c7_0ca8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2972_c7_0ca8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2972_c7_0ca8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2972_c7_0ca8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2972_c7_0ca8
result_sp_relative_shift_MUX_uxn_opcodes_h_l2972_c7_0ca8 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2972_c7_0ca8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2972_c7_0ca8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2972_c7_0ca8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2972_c7_0ca8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2972_c7_0ca8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2972_c7_0ca8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2972_c7_0ca8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2972_c7_0ca8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2972_c7_0ca8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2972_c7_0ca8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2972_c7_0ca8
result_is_opc_done_MUX_uxn_opcodes_h_l2972_c7_0ca8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2972_c7_0ca8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2972_c7_0ca8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2972_c7_0ca8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2972_c7_0ca8_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2972_c7_0ca8
result_is_stack_read_MUX_uxn_opcodes_h_l2972_c7_0ca8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2972_c7_0ca8_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2972_c7_0ca8_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2972_c7_0ca8_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2972_c7_0ca8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2975_c11_c2c1
BIN_OP_EQ_uxn_opcodes_h_l2975_c11_c2c1 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2975_c11_c2c1_left,
BIN_OP_EQ_uxn_opcodes_h_l2975_c11_c2c1_right,
BIN_OP_EQ_uxn_opcodes_h_l2975_c11_c2c1_return_output);

-- t8_MUX_uxn_opcodes_h_l2975_c7_8c38
t8_MUX_uxn_opcodes_h_l2975_c7_8c38 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2975_c7_8c38_cond,
t8_MUX_uxn_opcodes_h_l2975_c7_8c38_iftrue,
t8_MUX_uxn_opcodes_h_l2975_c7_8c38_iffalse,
t8_MUX_uxn_opcodes_h_l2975_c7_8c38_return_output);

-- n8_MUX_uxn_opcodes_h_l2975_c7_8c38
n8_MUX_uxn_opcodes_h_l2975_c7_8c38 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2975_c7_8c38_cond,
n8_MUX_uxn_opcodes_h_l2975_c7_8c38_iftrue,
n8_MUX_uxn_opcodes_h_l2975_c7_8c38_iffalse,
n8_MUX_uxn_opcodes_h_l2975_c7_8c38_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2975_c7_8c38
result_is_sp_shift_MUX_uxn_opcodes_h_l2975_c7_8c38 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2975_c7_8c38_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2975_c7_8c38_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2975_c7_8c38_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2975_c7_8c38_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2975_c7_8c38
result_stack_value_MUX_uxn_opcodes_h_l2975_c7_8c38 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2975_c7_8c38_cond,
result_stack_value_MUX_uxn_opcodes_h_l2975_c7_8c38_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2975_c7_8c38_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2975_c7_8c38_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2975_c7_8c38
result_is_stack_write_MUX_uxn_opcodes_h_l2975_c7_8c38 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2975_c7_8c38_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2975_c7_8c38_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2975_c7_8c38_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2975_c7_8c38_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2975_c7_8c38
result_sp_relative_shift_MUX_uxn_opcodes_h_l2975_c7_8c38 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2975_c7_8c38_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2975_c7_8c38_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2975_c7_8c38_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2975_c7_8c38_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2975_c7_8c38
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2975_c7_8c38 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2975_c7_8c38_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2975_c7_8c38_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2975_c7_8c38_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2975_c7_8c38_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2975_c7_8c38
result_is_opc_done_MUX_uxn_opcodes_h_l2975_c7_8c38 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2975_c7_8c38_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2975_c7_8c38_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2975_c7_8c38_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2975_c7_8c38_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2975_c7_8c38
result_is_stack_read_MUX_uxn_opcodes_h_l2975_c7_8c38 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2975_c7_8c38_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2975_c7_8c38_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2975_c7_8c38_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2975_c7_8c38_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2979_c11_ebcb
BIN_OP_EQ_uxn_opcodes_h_l2979_c11_ebcb : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2979_c11_ebcb_left,
BIN_OP_EQ_uxn_opcodes_h_l2979_c11_ebcb_right,
BIN_OP_EQ_uxn_opcodes_h_l2979_c11_ebcb_return_output);

-- n8_MUX_uxn_opcodes_h_l2979_c7_b8e5
n8_MUX_uxn_opcodes_h_l2979_c7_b8e5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2979_c7_b8e5_cond,
n8_MUX_uxn_opcodes_h_l2979_c7_b8e5_iftrue,
n8_MUX_uxn_opcodes_h_l2979_c7_b8e5_iffalse,
n8_MUX_uxn_opcodes_h_l2979_c7_b8e5_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2979_c7_b8e5
result_is_sp_shift_MUX_uxn_opcodes_h_l2979_c7_b8e5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2979_c7_b8e5_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2979_c7_b8e5_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2979_c7_b8e5_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2979_c7_b8e5_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2979_c7_b8e5
result_stack_value_MUX_uxn_opcodes_h_l2979_c7_b8e5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2979_c7_b8e5_cond,
result_stack_value_MUX_uxn_opcodes_h_l2979_c7_b8e5_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2979_c7_b8e5_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2979_c7_b8e5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2979_c7_b8e5
result_is_stack_write_MUX_uxn_opcodes_h_l2979_c7_b8e5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2979_c7_b8e5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2979_c7_b8e5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2979_c7_b8e5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2979_c7_b8e5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2979_c7_b8e5
result_sp_relative_shift_MUX_uxn_opcodes_h_l2979_c7_b8e5 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2979_c7_b8e5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2979_c7_b8e5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2979_c7_b8e5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2979_c7_b8e5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2979_c7_b8e5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2979_c7_b8e5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2979_c7_b8e5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2979_c7_b8e5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2979_c7_b8e5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2979_c7_b8e5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2979_c7_b8e5
result_is_opc_done_MUX_uxn_opcodes_h_l2979_c7_b8e5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2979_c7_b8e5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2979_c7_b8e5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2979_c7_b8e5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2979_c7_b8e5_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2979_c7_b8e5
result_is_stack_read_MUX_uxn_opcodes_h_l2979_c7_b8e5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2979_c7_b8e5_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2979_c7_b8e5_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2979_c7_b8e5_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2979_c7_b8e5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2982_c11_c028
BIN_OP_EQ_uxn_opcodes_h_l2982_c11_c028 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2982_c11_c028_left,
BIN_OP_EQ_uxn_opcodes_h_l2982_c11_c028_right,
BIN_OP_EQ_uxn_opcodes_h_l2982_c11_c028_return_output);

-- n8_MUX_uxn_opcodes_h_l2982_c7_f680
n8_MUX_uxn_opcodes_h_l2982_c7_f680 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2982_c7_f680_cond,
n8_MUX_uxn_opcodes_h_l2982_c7_f680_iftrue,
n8_MUX_uxn_opcodes_h_l2982_c7_f680_iffalse,
n8_MUX_uxn_opcodes_h_l2982_c7_f680_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2982_c7_f680
result_is_sp_shift_MUX_uxn_opcodes_h_l2982_c7_f680 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2982_c7_f680_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2982_c7_f680_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2982_c7_f680_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2982_c7_f680_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2982_c7_f680
result_stack_value_MUX_uxn_opcodes_h_l2982_c7_f680 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2982_c7_f680_cond,
result_stack_value_MUX_uxn_opcodes_h_l2982_c7_f680_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2982_c7_f680_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2982_c7_f680_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2982_c7_f680
result_is_stack_write_MUX_uxn_opcodes_h_l2982_c7_f680 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2982_c7_f680_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2982_c7_f680_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2982_c7_f680_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2982_c7_f680_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2982_c7_f680
result_sp_relative_shift_MUX_uxn_opcodes_h_l2982_c7_f680 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2982_c7_f680_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2982_c7_f680_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2982_c7_f680_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2982_c7_f680_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2982_c7_f680
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2982_c7_f680 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2982_c7_f680_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2982_c7_f680_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2982_c7_f680_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2982_c7_f680_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2982_c7_f680
result_is_opc_done_MUX_uxn_opcodes_h_l2982_c7_f680 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2982_c7_f680_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2982_c7_f680_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2982_c7_f680_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2982_c7_f680_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2982_c7_f680
result_is_stack_read_MUX_uxn_opcodes_h_l2982_c7_f680 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2982_c7_f680_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2982_c7_f680_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2982_c7_f680_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2982_c7_f680_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2986_c32_6d4c
BIN_OP_AND_uxn_opcodes_h_l2986_c32_6d4c : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2986_c32_6d4c_left,
BIN_OP_AND_uxn_opcodes_h_l2986_c32_6d4c_right,
BIN_OP_AND_uxn_opcodes_h_l2986_c32_6d4c_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l2986_c32_3dc2
BIN_OP_GT_uxn_opcodes_h_l2986_c32_3dc2 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l2986_c32_3dc2_left,
BIN_OP_GT_uxn_opcodes_h_l2986_c32_3dc2_right,
BIN_OP_GT_uxn_opcodes_h_l2986_c32_3dc2_return_output);

-- MUX_uxn_opcodes_h_l2986_c32_2661
MUX_uxn_opcodes_h_l2986_c32_2661 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2986_c32_2661_cond,
MUX_uxn_opcodes_h_l2986_c32_2661_iftrue,
MUX_uxn_opcodes_h_l2986_c32_2661_iffalse,
MUX_uxn_opcodes_h_l2986_c32_2661_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2988_c11_9dac
BIN_OP_EQ_uxn_opcodes_h_l2988_c11_9dac : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2988_c11_9dac_left,
BIN_OP_EQ_uxn_opcodes_h_l2988_c11_9dac_right,
BIN_OP_EQ_uxn_opcodes_h_l2988_c11_9dac_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2988_c7_c62c
result_is_sp_shift_MUX_uxn_opcodes_h_l2988_c7_c62c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2988_c7_c62c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2988_c7_c62c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2988_c7_c62c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2988_c7_c62c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2988_c7_c62c
result_stack_value_MUX_uxn_opcodes_h_l2988_c7_c62c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2988_c7_c62c_cond,
result_stack_value_MUX_uxn_opcodes_h_l2988_c7_c62c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2988_c7_c62c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2988_c7_c62c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2988_c7_c62c
result_is_stack_write_MUX_uxn_opcodes_h_l2988_c7_c62c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2988_c7_c62c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2988_c7_c62c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2988_c7_c62c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2988_c7_c62c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2988_c7_c62c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2988_c7_c62c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2988_c7_c62c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2988_c7_c62c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2988_c7_c62c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2988_c7_c62c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2988_c7_c62c
result_is_opc_done_MUX_uxn_opcodes_h_l2988_c7_c62c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2988_c7_c62c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2988_c7_c62c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2988_c7_c62c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2988_c7_c62c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2994_c11_7817
BIN_OP_EQ_uxn_opcodes_h_l2994_c11_7817 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2994_c11_7817_left,
BIN_OP_EQ_uxn_opcodes_h_l2994_c11_7817_right,
BIN_OP_EQ_uxn_opcodes_h_l2994_c11_7817_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2994_c7_686a
result_stack_value_MUX_uxn_opcodes_h_l2994_c7_686a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2994_c7_686a_cond,
result_stack_value_MUX_uxn_opcodes_h_l2994_c7_686a_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2994_c7_686a_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2994_c7_686a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2994_c7_686a
result_is_opc_done_MUX_uxn_opcodes_h_l2994_c7_686a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2994_c7_686a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2994_c7_686a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2994_c7_686a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2994_c7_686a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2994_c7_686a
result_is_stack_write_MUX_uxn_opcodes_h_l2994_c7_686a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2994_c7_686a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2994_c7_686a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2994_c7_686a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2994_c7_686a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2994_c7_686a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2994_c7_686a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2994_c7_686a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2994_c7_686a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2994_c7_686a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2994_c7_686a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2998_c11_b446
BIN_OP_EQ_uxn_opcodes_h_l2998_c11_b446 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2998_c11_b446_left,
BIN_OP_EQ_uxn_opcodes_h_l2998_c11_b446_right,
BIN_OP_EQ_uxn_opcodes_h_l2998_c11_b446_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2998_c7_9067
result_is_opc_done_MUX_uxn_opcodes_h_l2998_c7_9067 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2998_c7_9067_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2998_c7_9067_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2998_c7_9067_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2998_c7_9067_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2998_c7_9067
result_is_stack_write_MUX_uxn_opcodes_h_l2998_c7_9067 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2998_c7_9067_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2998_c7_9067_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2998_c7_9067_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2998_c7_9067_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2966_c6_1727_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2966_c1_2922_return_output,
 t8_MUX_uxn_opcodes_h_l2966_c2_cbca_return_output,
 n8_MUX_uxn_opcodes_h_l2966_c2_cbca_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2966_c2_cbca_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2966_c2_cbca_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2966_c2_cbca_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2966_c2_cbca_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2966_c2_cbca_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2966_c2_cbca_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2966_c2_cbca_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2972_c11_b008_return_output,
 t8_MUX_uxn_opcodes_h_l2972_c7_0ca8_return_output,
 n8_MUX_uxn_opcodes_h_l2972_c7_0ca8_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2972_c7_0ca8_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2972_c7_0ca8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2972_c7_0ca8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2972_c7_0ca8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2972_c7_0ca8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2972_c7_0ca8_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2972_c7_0ca8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2975_c11_c2c1_return_output,
 t8_MUX_uxn_opcodes_h_l2975_c7_8c38_return_output,
 n8_MUX_uxn_opcodes_h_l2975_c7_8c38_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2975_c7_8c38_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2975_c7_8c38_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2975_c7_8c38_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2975_c7_8c38_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2975_c7_8c38_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2975_c7_8c38_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2975_c7_8c38_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2979_c11_ebcb_return_output,
 n8_MUX_uxn_opcodes_h_l2979_c7_b8e5_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2979_c7_b8e5_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2979_c7_b8e5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2979_c7_b8e5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2979_c7_b8e5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2979_c7_b8e5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2979_c7_b8e5_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2979_c7_b8e5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2982_c11_c028_return_output,
 n8_MUX_uxn_opcodes_h_l2982_c7_f680_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2982_c7_f680_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2982_c7_f680_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2982_c7_f680_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2982_c7_f680_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2982_c7_f680_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2982_c7_f680_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2982_c7_f680_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2986_c32_6d4c_return_output,
 BIN_OP_GT_uxn_opcodes_h_l2986_c32_3dc2_return_output,
 MUX_uxn_opcodes_h_l2986_c32_2661_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2988_c11_9dac_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2988_c7_c62c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2988_c7_c62c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2988_c7_c62c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2988_c7_c62c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2988_c7_c62c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2994_c11_7817_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2994_c7_686a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2994_c7_686a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2994_c7_686a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2994_c7_686a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2998_c11_b446_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2998_c7_9067_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2998_c7_9067_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2966_c6_1727_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2966_c6_1727_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2966_c6_1727_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2966_c1_2922_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2966_c1_2922_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2966_c1_2922_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2966_c1_2922_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2966_c2_cbca_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2966_c2_cbca_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2972_c7_0ca8_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2966_c2_cbca_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2966_c2_cbca_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2966_c2_cbca_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2966_c2_cbca_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2972_c7_0ca8_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2966_c2_cbca_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2966_c2_cbca_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2966_c2_cbca_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2966_c2_cbca_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2972_c7_0ca8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2966_c2_cbca_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2966_c2_cbca_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2966_c2_cbca_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2966_c2_cbca_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2972_c7_0ca8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2966_c2_cbca_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2966_c2_cbca_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2966_c2_cbca_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2966_c2_cbca_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2972_c7_0ca8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2966_c2_cbca_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2966_c2_cbca_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2966_c2_cbca_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2966_c2_cbca_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2972_c7_0ca8_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2966_c2_cbca_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2966_c2_cbca_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2966_c2_cbca_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2969_c3_f599 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2966_c2_cbca_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2972_c7_0ca8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2966_c2_cbca_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2966_c2_cbca_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2966_c2_cbca_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2966_c2_cbca_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2972_c7_0ca8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2966_c2_cbca_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2966_c2_cbca_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2966_c2_cbca_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2966_c2_cbca_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2972_c7_0ca8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2966_c2_cbca_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2966_c2_cbca_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2967_c3_44cf_uxn_opcodes_h_l2967_c3_44cf_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2972_c11_b008_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2972_c11_b008_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2972_c11_b008_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2972_c7_0ca8_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2972_c7_0ca8_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2975_c7_8c38_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2972_c7_0ca8_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2972_c7_0ca8_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2972_c7_0ca8_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2975_c7_8c38_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2972_c7_0ca8_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2972_c7_0ca8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2972_c7_0ca8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2975_c7_8c38_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2972_c7_0ca8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2972_c7_0ca8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2972_c7_0ca8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2975_c7_8c38_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2972_c7_0ca8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2972_c7_0ca8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2972_c7_0ca8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2975_c7_8c38_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2972_c7_0ca8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2972_c7_0ca8_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2972_c7_0ca8_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2975_c7_8c38_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2972_c7_0ca8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2972_c7_0ca8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2973_c3_0379 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2972_c7_0ca8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2975_c7_8c38_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2972_c7_0ca8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2972_c7_0ca8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2972_c7_0ca8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2975_c7_8c38_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2972_c7_0ca8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2972_c7_0ca8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2972_c7_0ca8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2975_c7_8c38_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2972_c7_0ca8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2975_c11_c2c1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2975_c11_c2c1_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2975_c11_c2c1_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2975_c7_8c38_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2975_c7_8c38_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2975_c7_8c38_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2975_c7_8c38_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2975_c7_8c38_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2979_c7_b8e5_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2975_c7_8c38_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2975_c7_8c38_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2975_c7_8c38_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2979_c7_b8e5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2975_c7_8c38_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2975_c7_8c38_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2975_c7_8c38_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2979_c7_b8e5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2975_c7_8c38_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2975_c7_8c38_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2975_c7_8c38_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2979_c7_b8e5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2975_c7_8c38_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2975_c7_8c38_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2975_c7_8c38_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2979_c7_b8e5_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2975_c7_8c38_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2975_c7_8c38_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2977_c3_5411 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2975_c7_8c38_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2979_c7_b8e5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2975_c7_8c38_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2975_c7_8c38_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2975_c7_8c38_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2979_c7_b8e5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2975_c7_8c38_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2975_c7_8c38_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2975_c7_8c38_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2979_c7_b8e5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2975_c7_8c38_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2979_c11_ebcb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2979_c11_ebcb_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2979_c11_ebcb_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2979_c7_b8e5_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2979_c7_b8e5_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2982_c7_f680_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2979_c7_b8e5_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2979_c7_b8e5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2979_c7_b8e5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2982_c7_f680_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2979_c7_b8e5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2979_c7_b8e5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2979_c7_b8e5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2982_c7_f680_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2979_c7_b8e5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2979_c7_b8e5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2979_c7_b8e5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2982_c7_f680_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2979_c7_b8e5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2979_c7_b8e5_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2979_c7_b8e5_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2982_c7_f680_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2979_c7_b8e5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2979_c7_b8e5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2980_c3_bb34 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2979_c7_b8e5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2982_c7_f680_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2979_c7_b8e5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2979_c7_b8e5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2979_c7_b8e5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2982_c7_f680_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2979_c7_b8e5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2979_c7_b8e5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2979_c7_b8e5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2982_c7_f680_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2979_c7_b8e5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2982_c11_c028_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2982_c11_c028_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2982_c11_c028_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2982_c7_f680_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2982_c7_f680_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2982_c7_f680_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2982_c7_f680_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2982_c7_f680_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2988_c7_c62c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2982_c7_f680_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2982_c7_f680_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2982_c7_f680_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2988_c7_c62c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2982_c7_f680_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2982_c7_f680_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2982_c7_f680_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2988_c7_c62c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2982_c7_f680_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2982_c7_f680_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2982_c7_f680_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2982_c7_f680_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2982_c7_f680_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2982_c7_f680_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2988_c7_c62c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2982_c7_f680_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2982_c7_f680_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2982_c7_f680_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2988_c7_c62c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2982_c7_f680_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2982_c7_f680_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2982_c7_f680_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2982_c7_f680_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2986_c32_2661_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2986_c32_2661_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2986_c32_2661_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2986_c32_6d4c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2986_c32_6d4c_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2986_c32_6d4c_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2986_c32_3dc2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2986_c32_3dc2_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2986_c32_3dc2_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2986_c32_2661_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2988_c11_9dac_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2988_c11_9dac_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2988_c11_9dac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2988_c7_c62c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2988_c7_c62c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2988_c7_c62c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2988_c7_c62c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2988_c7_c62c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2994_c7_686a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2988_c7_c62c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2988_c7_c62c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2988_c7_c62c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2994_c7_686a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2988_c7_c62c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2988_c7_c62c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2991_c3_8f13 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2988_c7_c62c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2994_c7_686a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2988_c7_c62c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2988_c7_c62c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2988_c7_c62c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2994_c7_686a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2988_c7_c62c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2994_c11_7817_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2994_c11_7817_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2994_c11_7817_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2994_c7_686a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2994_c7_686a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2994_c7_686a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2994_c7_686a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2994_c7_686a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2998_c7_9067_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2994_c7_686a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2994_c7_686a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2994_c7_686a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2998_c7_9067_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2994_c7_686a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2994_c7_686a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2995_c3_a4bd : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2994_c7_686a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2994_c7_686a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2998_c11_b446_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2998_c11_b446_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2998_c11_b446_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2998_c7_9067_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2998_c7_9067_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2998_c7_9067_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2998_c7_9067_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2998_c7_9067_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2998_c7_9067_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2979_l2975_l2972_l2966_l2988_DUPLICATE_e0c0_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2979_l2975_l2972_l2966_l2994_l2982_DUPLICATE_8ff5_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2979_l2975_l2972_l2998_l2966_l2994_l2982_DUPLICATE_8ee9_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2979_l2975_l2972_l2966_l2982_DUPLICATE_f12c_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2979_l2975_l2972_l2998_l2994_l2988_l2982_DUPLICATE_f174_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2975_l2979_l2972_l2982_DUPLICATE_51fe_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2994_l2982_DUPLICATE_d286_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_287e_uxn_opcodes_h_l3003_l2962_DUPLICATE_146e_return_output : opcode_result_t;
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
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2982_c7_f680_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l2986_c32_3dc2_right := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2966_c1_2922_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2973_c3_0379 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2972_c7_0ca8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2973_c3_0379;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2966_c6_1727_right := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2998_c7_9067_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2998_c11_b446_right := to_unsigned(7, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2988_c7_c62c_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2977_c3_5411 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2975_c7_8c38_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2977_c3_5411;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2986_c32_6d4c_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2988_c11_9dac_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2991_c3_8f13 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2988_c7_c62c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2991_c3_8f13;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2966_c2_cbca_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2982_c11_c028_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2979_c11_ebcb_right := to_unsigned(3, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2966_c2_cbca_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2982_c7_f680_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2972_c11_b008_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2998_c7_9067_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2988_c7_c62c_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l2986_c32_2661_iffalse := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2969_c3_f599 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2966_c2_cbca_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2969_c3_f599;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2994_c11_7817_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2975_c11_c2c1_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2995_c3_a4bd := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2994_c7_686a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2995_c3_a4bd;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2980_c3_bb34 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2979_c7_b8e5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2980_c3_bb34;
     VAR_MUX_uxn_opcodes_h_l2986_c32_2661_iftrue := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2966_c1_2922_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2986_c32_6d4c_left := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l2966_c2_cbca_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2972_c7_0ca8_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2975_c7_8c38_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2979_c7_b8e5_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2982_c7_f680_iffalse := n8;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2988_c7_c62c_iftrue := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2966_c6_1727_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2972_c11_b008_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2975_c11_c2c1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2979_c11_ebcb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2982_c11_c028_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2988_c11_9dac_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2994_c11_7817_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2998_c11_b446_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l2982_c7_f680_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l2975_c7_8c38_iftrue := VAR_previous_stack_read;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2994_c7_686a_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2966_c2_cbca_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2972_c7_0ca8_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2975_c7_8c38_iffalse := t8;
     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2994_l2982_DUPLICATE_d286 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2994_l2982_DUPLICATE_d286_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2994_c11_7817] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2994_c11_7817_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2994_c11_7817_left;
     BIN_OP_EQ_uxn_opcodes_h_l2994_c11_7817_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2994_c11_7817_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2994_c11_7817_return_output := BIN_OP_EQ_uxn_opcodes_h_l2994_c11_7817_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2979_l2975_l2972_l2966_l2988_DUPLICATE_e0c0 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2979_l2975_l2972_l2966_l2988_DUPLICATE_e0c0_return_output := result.is_sp_shift;

     -- BIN_OP_AND[uxn_opcodes_h_l2986_c32_6d4c] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2986_c32_6d4c_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2986_c32_6d4c_left;
     BIN_OP_AND_uxn_opcodes_h_l2986_c32_6d4c_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2986_c32_6d4c_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2986_c32_6d4c_return_output := BIN_OP_AND_uxn_opcodes_h_l2986_c32_6d4c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2972_c11_b008] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2972_c11_b008_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2972_c11_b008_left;
     BIN_OP_EQ_uxn_opcodes_h_l2972_c11_b008_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2972_c11_b008_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2972_c11_b008_return_output := BIN_OP_EQ_uxn_opcodes_h_l2972_c11_b008_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2979_l2975_l2972_l2966_l2994_l2982_DUPLICATE_8ff5 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2979_l2975_l2972_l2966_l2994_l2982_DUPLICATE_8ff5_return_output := result.stack_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2979_l2975_l2972_l2998_l2994_l2988_l2982_DUPLICATE_f174 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2979_l2975_l2972_l2998_l2994_l2988_l2982_DUPLICATE_f174_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2975_l2979_l2972_l2982_DUPLICATE_51fe LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2975_l2979_l2972_l2982_DUPLICATE_51fe_return_output := result.is_stack_read;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2979_l2975_l2972_l2998_l2966_l2994_l2982_DUPLICATE_8ee9 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2979_l2975_l2972_l2998_l2966_l2994_l2982_DUPLICATE_8ee9_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2982_c11_c028] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2982_c11_c028_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2982_c11_c028_left;
     BIN_OP_EQ_uxn_opcodes_h_l2982_c11_c028_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2982_c11_c028_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2982_c11_c028_return_output := BIN_OP_EQ_uxn_opcodes_h_l2982_c11_c028_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2975_c11_c2c1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2975_c11_c2c1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2975_c11_c2c1_left;
     BIN_OP_EQ_uxn_opcodes_h_l2975_c11_c2c1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2975_c11_c2c1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2975_c11_c2c1_return_output := BIN_OP_EQ_uxn_opcodes_h_l2975_c11_c2c1_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2979_l2975_l2972_l2966_l2982_DUPLICATE_f12c LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2979_l2975_l2972_l2966_l2982_DUPLICATE_f12c_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2966_c6_1727] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2966_c6_1727_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2966_c6_1727_left;
     BIN_OP_EQ_uxn_opcodes_h_l2966_c6_1727_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2966_c6_1727_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2966_c6_1727_return_output := BIN_OP_EQ_uxn_opcodes_h_l2966_c6_1727_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2988_c11_9dac] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2988_c11_9dac_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2988_c11_9dac_left;
     BIN_OP_EQ_uxn_opcodes_h_l2988_c11_9dac_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2988_c11_9dac_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2988_c11_9dac_return_output := BIN_OP_EQ_uxn_opcodes_h_l2988_c11_9dac_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2998_c11_b446] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2998_c11_b446_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2998_c11_b446_left;
     BIN_OP_EQ_uxn_opcodes_h_l2998_c11_b446_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2998_c11_b446_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2998_c11_b446_return_output := BIN_OP_EQ_uxn_opcodes_h_l2998_c11_b446_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2979_c11_ebcb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2979_c11_ebcb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2979_c11_ebcb_left;
     BIN_OP_EQ_uxn_opcodes_h_l2979_c11_ebcb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2979_c11_ebcb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2979_c11_ebcb_return_output := BIN_OP_EQ_uxn_opcodes_h_l2979_c11_ebcb_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l2986_c32_3dc2_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2986_c32_6d4c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2966_c1_2922_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2966_c6_1727_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2966_c2_cbca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2966_c6_1727_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2966_c2_cbca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2966_c6_1727_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2966_c2_cbca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2966_c6_1727_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2966_c2_cbca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2966_c6_1727_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2966_c2_cbca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2966_c6_1727_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2966_c2_cbca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2966_c6_1727_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2966_c2_cbca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2966_c6_1727_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2966_c2_cbca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2966_c6_1727_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2966_c2_cbca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2966_c6_1727_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2972_c7_0ca8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2972_c11_b008_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2972_c7_0ca8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2972_c11_b008_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2972_c7_0ca8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2972_c11_b008_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2972_c7_0ca8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2972_c11_b008_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2972_c7_0ca8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2972_c11_b008_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2972_c7_0ca8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2972_c11_b008_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2972_c7_0ca8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2972_c11_b008_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2972_c7_0ca8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2972_c11_b008_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2972_c7_0ca8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2972_c11_b008_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2975_c7_8c38_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2975_c11_c2c1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2975_c7_8c38_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2975_c11_c2c1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2975_c7_8c38_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2975_c11_c2c1_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2975_c7_8c38_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2975_c11_c2c1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2975_c7_8c38_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2975_c11_c2c1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2975_c7_8c38_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2975_c11_c2c1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2975_c7_8c38_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2975_c11_c2c1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2975_c7_8c38_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2975_c11_c2c1_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2975_c7_8c38_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2975_c11_c2c1_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2979_c7_b8e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2979_c11_ebcb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2979_c7_b8e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2979_c11_ebcb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2979_c7_b8e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2979_c11_ebcb_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2979_c7_b8e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2979_c11_ebcb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2979_c7_b8e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2979_c11_ebcb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2979_c7_b8e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2979_c11_ebcb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2979_c7_b8e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2979_c11_ebcb_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2979_c7_b8e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2979_c11_ebcb_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2982_c7_f680_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2982_c11_c028_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2982_c7_f680_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2982_c11_c028_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2982_c7_f680_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2982_c11_c028_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2982_c7_f680_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2982_c11_c028_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2982_c7_f680_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2982_c11_c028_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2982_c7_f680_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2982_c11_c028_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2982_c7_f680_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2982_c11_c028_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2982_c7_f680_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2982_c11_c028_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2988_c7_c62c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2988_c11_9dac_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2988_c7_c62c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2988_c11_9dac_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2988_c7_c62c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2988_c11_9dac_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2988_c7_c62c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2988_c11_9dac_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2988_c7_c62c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2988_c11_9dac_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2994_c7_686a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2994_c11_7817_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2994_c7_686a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2994_c11_7817_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2994_c7_686a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2994_c11_7817_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2994_c7_686a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2994_c11_7817_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2998_c7_9067_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2998_c11_b446_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2998_c7_9067_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2998_c11_b446_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2966_c2_cbca_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2979_l2975_l2972_l2966_l2982_DUPLICATE_f12c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2972_c7_0ca8_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2979_l2975_l2972_l2966_l2982_DUPLICATE_f12c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2975_c7_8c38_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2979_l2975_l2972_l2966_l2982_DUPLICATE_f12c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2979_c7_b8e5_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2979_l2975_l2972_l2966_l2982_DUPLICATE_f12c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2982_c7_f680_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2979_l2975_l2972_l2966_l2982_DUPLICATE_f12c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2972_c7_0ca8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2979_l2975_l2972_l2998_l2994_l2988_l2982_DUPLICATE_f174_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2975_c7_8c38_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2979_l2975_l2972_l2998_l2994_l2988_l2982_DUPLICATE_f174_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2979_c7_b8e5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2979_l2975_l2972_l2998_l2994_l2988_l2982_DUPLICATE_f174_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2982_c7_f680_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2979_l2975_l2972_l2998_l2994_l2988_l2982_DUPLICATE_f174_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2988_c7_c62c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2979_l2975_l2972_l2998_l2994_l2988_l2982_DUPLICATE_f174_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2994_c7_686a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2979_l2975_l2972_l2998_l2994_l2988_l2982_DUPLICATE_f174_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2998_c7_9067_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2979_l2975_l2972_l2998_l2994_l2988_l2982_DUPLICATE_f174_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2966_c2_cbca_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2979_l2975_l2972_l2966_l2988_DUPLICATE_e0c0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2972_c7_0ca8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2979_l2975_l2972_l2966_l2988_DUPLICATE_e0c0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2975_c7_8c38_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2979_l2975_l2972_l2966_l2988_DUPLICATE_e0c0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2979_c7_b8e5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2979_l2975_l2972_l2966_l2988_DUPLICATE_e0c0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2988_c7_c62c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2979_l2975_l2972_l2966_l2988_DUPLICATE_e0c0_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2972_c7_0ca8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2975_l2979_l2972_l2982_DUPLICATE_51fe_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2975_c7_8c38_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2975_l2979_l2972_l2982_DUPLICATE_51fe_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2979_c7_b8e5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2975_l2979_l2972_l2982_DUPLICATE_51fe_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2982_c7_f680_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2975_l2979_l2972_l2982_DUPLICATE_51fe_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2966_c2_cbca_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2979_l2975_l2972_l2998_l2966_l2994_l2982_DUPLICATE_8ee9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2972_c7_0ca8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2979_l2975_l2972_l2998_l2966_l2994_l2982_DUPLICATE_8ee9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2975_c7_8c38_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2979_l2975_l2972_l2998_l2966_l2994_l2982_DUPLICATE_8ee9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2979_c7_b8e5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2979_l2975_l2972_l2998_l2966_l2994_l2982_DUPLICATE_8ee9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2982_c7_f680_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2979_l2975_l2972_l2998_l2966_l2994_l2982_DUPLICATE_8ee9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2994_c7_686a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2979_l2975_l2972_l2998_l2966_l2994_l2982_DUPLICATE_8ee9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2998_c7_9067_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2979_l2975_l2972_l2998_l2966_l2994_l2982_DUPLICATE_8ee9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2982_c7_f680_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2994_l2982_DUPLICATE_d286_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2994_c7_686a_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2994_l2982_DUPLICATE_d286_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2966_c2_cbca_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2979_l2975_l2972_l2966_l2994_l2982_DUPLICATE_8ff5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2972_c7_0ca8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2979_l2975_l2972_l2966_l2994_l2982_DUPLICATE_8ff5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2975_c7_8c38_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2979_l2975_l2972_l2966_l2994_l2982_DUPLICATE_8ff5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2979_c7_b8e5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2979_l2975_l2972_l2966_l2994_l2982_DUPLICATE_8ff5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2982_c7_f680_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2979_l2975_l2972_l2966_l2994_l2982_DUPLICATE_8ff5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2994_c7_686a_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2979_l2975_l2972_l2966_l2994_l2982_DUPLICATE_8ff5_return_output;
     -- t8_MUX[uxn_opcodes_h_l2975_c7_8c38] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2975_c7_8c38_cond <= VAR_t8_MUX_uxn_opcodes_h_l2975_c7_8c38_cond;
     t8_MUX_uxn_opcodes_h_l2975_c7_8c38_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2975_c7_8c38_iftrue;
     t8_MUX_uxn_opcodes_h_l2975_c7_8c38_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2975_c7_8c38_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2975_c7_8c38_return_output := t8_MUX_uxn_opcodes_h_l2975_c7_8c38_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2966_c1_2922] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2966_c1_2922_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2966_c1_2922_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2966_c1_2922_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2966_c1_2922_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2966_c1_2922_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2966_c1_2922_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2966_c1_2922_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2966_c1_2922_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2988_c7_c62c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2988_c7_c62c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2988_c7_c62c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2988_c7_c62c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2988_c7_c62c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2988_c7_c62c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2988_c7_c62c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2988_c7_c62c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2988_c7_c62c_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l2986_c32_3dc2] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l2986_c32_3dc2_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l2986_c32_3dc2_left;
     BIN_OP_GT_uxn_opcodes_h_l2986_c32_3dc2_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l2986_c32_3dc2_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l2986_c32_3dc2_return_output := BIN_OP_GT_uxn_opcodes_h_l2986_c32_3dc2_return_output;

     -- n8_MUX[uxn_opcodes_h_l2982_c7_f680] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2982_c7_f680_cond <= VAR_n8_MUX_uxn_opcodes_h_l2982_c7_f680_cond;
     n8_MUX_uxn_opcodes_h_l2982_c7_f680_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2982_c7_f680_iftrue;
     n8_MUX_uxn_opcodes_h_l2982_c7_f680_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2982_c7_f680_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2982_c7_f680_return_output := n8_MUX_uxn_opcodes_h_l2982_c7_f680_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2998_c7_9067] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2998_c7_9067_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2998_c7_9067_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2998_c7_9067_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2998_c7_9067_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2998_c7_9067_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2998_c7_9067_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2998_c7_9067_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2998_c7_9067_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2994_c7_686a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2994_c7_686a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2994_c7_686a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2994_c7_686a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2994_c7_686a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2994_c7_686a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2994_c7_686a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2994_c7_686a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2994_c7_686a_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2982_c7_f680] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2982_c7_f680_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2982_c7_f680_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2982_c7_f680_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2982_c7_f680_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2982_c7_f680_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2982_c7_f680_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2982_c7_f680_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2982_c7_f680_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2994_c7_686a] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2994_c7_686a_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2994_c7_686a_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2994_c7_686a_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2994_c7_686a_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2994_c7_686a_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2994_c7_686a_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2994_c7_686a_return_output := result_stack_value_MUX_uxn_opcodes_h_l2994_c7_686a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2998_c7_9067] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2998_c7_9067_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2998_c7_9067_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2998_c7_9067_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2998_c7_9067_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2998_c7_9067_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2998_c7_9067_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2998_c7_9067_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2998_c7_9067_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l2986_c32_2661_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l2986_c32_3dc2_return_output;
     VAR_printf_uxn_opcodes_h_l2967_c3_44cf_uxn_opcodes_h_l2967_c3_44cf_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2966_c1_2922_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2979_c7_b8e5_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2982_c7_f680_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2994_c7_686a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2998_c7_9067_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2982_c7_f680_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2988_c7_c62c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2979_c7_b8e5_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2982_c7_f680_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2994_c7_686a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2998_c7_9067_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2988_c7_c62c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2994_c7_686a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2988_c7_c62c_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2994_c7_686a_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2972_c7_0ca8_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2975_c7_8c38_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2982_c7_f680] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2982_c7_f680_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2982_c7_f680_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2982_c7_f680_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2982_c7_f680_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2982_c7_f680_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2982_c7_f680_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2982_c7_f680_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2982_c7_f680_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2988_c7_c62c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2988_c7_c62c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2988_c7_c62c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2988_c7_c62c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2988_c7_c62c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2988_c7_c62c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2988_c7_c62c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2988_c7_c62c_return_output := result_stack_value_MUX_uxn_opcodes_h_l2988_c7_c62c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2994_c7_686a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2994_c7_686a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2994_c7_686a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2994_c7_686a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2994_c7_686a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2994_c7_686a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2994_c7_686a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2994_c7_686a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2994_c7_686a_return_output;

     -- MUX[uxn_opcodes_h_l2986_c32_2661] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2986_c32_2661_cond <= VAR_MUX_uxn_opcodes_h_l2986_c32_2661_cond;
     MUX_uxn_opcodes_h_l2986_c32_2661_iftrue <= VAR_MUX_uxn_opcodes_h_l2986_c32_2661_iftrue;
     MUX_uxn_opcodes_h_l2986_c32_2661_iffalse <= VAR_MUX_uxn_opcodes_h_l2986_c32_2661_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2986_c32_2661_return_output := MUX_uxn_opcodes_h_l2986_c32_2661_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2988_c7_c62c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2988_c7_c62c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2988_c7_c62c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2988_c7_c62c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2988_c7_c62c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2988_c7_c62c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2988_c7_c62c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2988_c7_c62c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2988_c7_c62c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2994_c7_686a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2994_c7_686a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2994_c7_686a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2994_c7_686a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2994_c7_686a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2994_c7_686a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2994_c7_686a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2994_c7_686a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2994_c7_686a_return_output;

     -- printf_uxn_opcodes_h_l2967_c3_44cf[uxn_opcodes_h_l2967_c3_44cf] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2967_c3_44cf_uxn_opcodes_h_l2967_c3_44cf_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2967_c3_44cf_uxn_opcodes_h_l2967_c3_44cf_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- t8_MUX[uxn_opcodes_h_l2972_c7_0ca8] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2972_c7_0ca8_cond <= VAR_t8_MUX_uxn_opcodes_h_l2972_c7_0ca8_cond;
     t8_MUX_uxn_opcodes_h_l2972_c7_0ca8_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2972_c7_0ca8_iftrue;
     t8_MUX_uxn_opcodes_h_l2972_c7_0ca8_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2972_c7_0ca8_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2972_c7_0ca8_return_output := t8_MUX_uxn_opcodes_h_l2972_c7_0ca8_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2979_c7_b8e5] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2979_c7_b8e5_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2979_c7_b8e5_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2979_c7_b8e5_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2979_c7_b8e5_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2979_c7_b8e5_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2979_c7_b8e5_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2979_c7_b8e5_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2979_c7_b8e5_return_output;

     -- n8_MUX[uxn_opcodes_h_l2979_c7_b8e5] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2979_c7_b8e5_cond <= VAR_n8_MUX_uxn_opcodes_h_l2979_c7_b8e5_cond;
     n8_MUX_uxn_opcodes_h_l2979_c7_b8e5_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2979_c7_b8e5_iftrue;
     n8_MUX_uxn_opcodes_h_l2979_c7_b8e5_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2979_c7_b8e5_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2979_c7_b8e5_return_output := n8_MUX_uxn_opcodes_h_l2979_c7_b8e5_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2982_c7_f680_iftrue := VAR_MUX_uxn_opcodes_h_l2986_c32_2661_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2975_c7_8c38_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2979_c7_b8e5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2988_c7_c62c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2994_c7_686a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2979_c7_b8e5_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2982_c7_f680_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2975_c7_8c38_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2979_c7_b8e5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2988_c7_c62c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2994_c7_686a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2982_c7_f680_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2988_c7_c62c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2982_c7_f680_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2988_c7_c62c_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2966_c2_cbca_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2972_c7_0ca8_return_output;
     -- t8_MUX[uxn_opcodes_h_l2966_c2_cbca] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2966_c2_cbca_cond <= VAR_t8_MUX_uxn_opcodes_h_l2966_c2_cbca_cond;
     t8_MUX_uxn_opcodes_h_l2966_c2_cbca_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2966_c2_cbca_iftrue;
     t8_MUX_uxn_opcodes_h_l2966_c2_cbca_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2966_c2_cbca_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2966_c2_cbca_return_output := t8_MUX_uxn_opcodes_h_l2966_c2_cbca_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2979_c7_b8e5] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2979_c7_b8e5_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2979_c7_b8e5_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2979_c7_b8e5_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2979_c7_b8e5_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2979_c7_b8e5_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2979_c7_b8e5_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2979_c7_b8e5_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2979_c7_b8e5_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2982_c7_f680] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2982_c7_f680_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2982_c7_f680_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2982_c7_f680_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2982_c7_f680_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2982_c7_f680_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2982_c7_f680_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2982_c7_f680_return_output := result_stack_value_MUX_uxn_opcodes_h_l2982_c7_f680_return_output;

     -- n8_MUX[uxn_opcodes_h_l2975_c7_8c38] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2975_c7_8c38_cond <= VAR_n8_MUX_uxn_opcodes_h_l2975_c7_8c38_cond;
     n8_MUX_uxn_opcodes_h_l2975_c7_8c38_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2975_c7_8c38_iftrue;
     n8_MUX_uxn_opcodes_h_l2975_c7_8c38_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2975_c7_8c38_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2975_c7_8c38_return_output := n8_MUX_uxn_opcodes_h_l2975_c7_8c38_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2982_c7_f680] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2982_c7_f680_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2982_c7_f680_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2982_c7_f680_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2982_c7_f680_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2982_c7_f680_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2982_c7_f680_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2982_c7_f680_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2982_c7_f680_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2982_c7_f680] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2982_c7_f680_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2982_c7_f680_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2982_c7_f680_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2982_c7_f680_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2982_c7_f680_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2982_c7_f680_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2982_c7_f680_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2982_c7_f680_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2988_c7_c62c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2988_c7_c62c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2988_c7_c62c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2988_c7_c62c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2988_c7_c62c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2988_c7_c62c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2988_c7_c62c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2988_c7_c62c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2988_c7_c62c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2988_c7_c62c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2988_c7_c62c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2988_c7_c62c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2988_c7_c62c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2988_c7_c62c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2988_c7_c62c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2988_c7_c62c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2988_c7_c62c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2988_c7_c62c_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2975_c7_8c38] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2975_c7_8c38_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2975_c7_8c38_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2975_c7_8c38_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2975_c7_8c38_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2975_c7_8c38_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2975_c7_8c38_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2975_c7_8c38_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2975_c7_8c38_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l2972_c7_0ca8_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2975_c7_8c38_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2982_c7_f680_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2988_c7_c62c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2975_c7_8c38_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2979_c7_b8e5_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2972_c7_0ca8_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2975_c7_8c38_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2982_c7_f680_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2988_c7_c62c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2979_c7_b8e5_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2982_c7_f680_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2979_c7_b8e5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2982_c7_f680_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2979_c7_b8e5_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2982_c7_f680_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l2966_c2_cbca_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2982_c7_f680] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2982_c7_f680_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2982_c7_f680_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2982_c7_f680_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2982_c7_f680_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2982_c7_f680_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2982_c7_f680_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2982_c7_f680_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2982_c7_f680_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2979_c7_b8e5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2979_c7_b8e5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2979_c7_b8e5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2979_c7_b8e5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2979_c7_b8e5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2979_c7_b8e5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2979_c7_b8e5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2979_c7_b8e5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2979_c7_b8e5_return_output;

     -- n8_MUX[uxn_opcodes_h_l2972_c7_0ca8] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2972_c7_0ca8_cond <= VAR_n8_MUX_uxn_opcodes_h_l2972_c7_0ca8_cond;
     n8_MUX_uxn_opcodes_h_l2972_c7_0ca8_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2972_c7_0ca8_iftrue;
     n8_MUX_uxn_opcodes_h_l2972_c7_0ca8_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2972_c7_0ca8_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2972_c7_0ca8_return_output := n8_MUX_uxn_opcodes_h_l2972_c7_0ca8_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2975_c7_8c38] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2975_c7_8c38_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2975_c7_8c38_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2975_c7_8c38_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2975_c7_8c38_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2975_c7_8c38_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2975_c7_8c38_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2975_c7_8c38_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2975_c7_8c38_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2982_c7_f680] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2982_c7_f680_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2982_c7_f680_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2982_c7_f680_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2982_c7_f680_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2982_c7_f680_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2982_c7_f680_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2982_c7_f680_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2982_c7_f680_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2979_c7_b8e5] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2979_c7_b8e5_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2979_c7_b8e5_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2979_c7_b8e5_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2979_c7_b8e5_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2979_c7_b8e5_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2979_c7_b8e5_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2979_c7_b8e5_return_output := result_stack_value_MUX_uxn_opcodes_h_l2979_c7_b8e5_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2972_c7_0ca8] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2972_c7_0ca8_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2972_c7_0ca8_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2972_c7_0ca8_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2972_c7_0ca8_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2972_c7_0ca8_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2972_c7_0ca8_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2972_c7_0ca8_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2972_c7_0ca8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2979_c7_b8e5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2979_c7_b8e5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2979_c7_b8e5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2979_c7_b8e5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2979_c7_b8e5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2979_c7_b8e5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2979_c7_b8e5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2979_c7_b8e5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2979_c7_b8e5_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l2966_c2_cbca_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2972_c7_0ca8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2979_c7_b8e5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2982_c7_f680_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2972_c7_0ca8_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2975_c7_8c38_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2966_c2_cbca_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2972_c7_0ca8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2979_c7_b8e5_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2982_c7_f680_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2975_c7_8c38_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2979_c7_b8e5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2975_c7_8c38_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2979_c7_b8e5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2975_c7_8c38_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2979_c7_b8e5_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2975_c7_8c38] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2975_c7_8c38_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2975_c7_8c38_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2975_c7_8c38_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2975_c7_8c38_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2975_c7_8c38_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2975_c7_8c38_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2975_c7_8c38_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2975_c7_8c38_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2966_c2_cbca] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2966_c2_cbca_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2966_c2_cbca_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2966_c2_cbca_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2966_c2_cbca_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2966_c2_cbca_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2966_c2_cbca_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2966_c2_cbca_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2966_c2_cbca_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2979_c7_b8e5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2979_c7_b8e5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2979_c7_b8e5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2979_c7_b8e5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2979_c7_b8e5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2979_c7_b8e5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2979_c7_b8e5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2979_c7_b8e5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2979_c7_b8e5_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2979_c7_b8e5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2979_c7_b8e5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2979_c7_b8e5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2979_c7_b8e5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2979_c7_b8e5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2979_c7_b8e5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2979_c7_b8e5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2979_c7_b8e5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2979_c7_b8e5_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2972_c7_0ca8] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2972_c7_0ca8_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2972_c7_0ca8_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2972_c7_0ca8_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2972_c7_0ca8_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2972_c7_0ca8_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2972_c7_0ca8_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2972_c7_0ca8_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2972_c7_0ca8_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2975_c7_8c38] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2975_c7_8c38_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2975_c7_8c38_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2975_c7_8c38_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2975_c7_8c38_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2975_c7_8c38_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2975_c7_8c38_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2975_c7_8c38_return_output := result_stack_value_MUX_uxn_opcodes_h_l2975_c7_8c38_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2975_c7_8c38] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2975_c7_8c38_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2975_c7_8c38_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2975_c7_8c38_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2975_c7_8c38_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2975_c7_8c38_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2975_c7_8c38_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2975_c7_8c38_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2975_c7_8c38_return_output;

     -- n8_MUX[uxn_opcodes_h_l2966_c2_cbca] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2966_c2_cbca_cond <= VAR_n8_MUX_uxn_opcodes_h_l2966_c2_cbca_cond;
     n8_MUX_uxn_opcodes_h_l2966_c2_cbca_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2966_c2_cbca_iftrue;
     n8_MUX_uxn_opcodes_h_l2966_c2_cbca_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2966_c2_cbca_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2966_c2_cbca_return_output := n8_MUX_uxn_opcodes_h_l2966_c2_cbca_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l2966_c2_cbca_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2975_c7_8c38_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2979_c7_b8e5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2966_c2_cbca_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2972_c7_0ca8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2975_c7_8c38_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2979_c7_b8e5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2972_c7_0ca8_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2975_c7_8c38_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2972_c7_0ca8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2975_c7_8c38_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2972_c7_0ca8_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2975_c7_8c38_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2972_c7_0ca8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2972_c7_0ca8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2972_c7_0ca8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2972_c7_0ca8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2972_c7_0ca8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2972_c7_0ca8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2972_c7_0ca8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2972_c7_0ca8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2972_c7_0ca8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2972_c7_0ca8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2972_c7_0ca8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2972_c7_0ca8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2972_c7_0ca8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2972_c7_0ca8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2972_c7_0ca8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2972_c7_0ca8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2972_c7_0ca8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2972_c7_0ca8_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2972_c7_0ca8] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2972_c7_0ca8_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2972_c7_0ca8_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2972_c7_0ca8_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2972_c7_0ca8_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2972_c7_0ca8_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2972_c7_0ca8_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2972_c7_0ca8_return_output := result_stack_value_MUX_uxn_opcodes_h_l2972_c7_0ca8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2975_c7_8c38] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2975_c7_8c38_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2975_c7_8c38_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2975_c7_8c38_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2975_c7_8c38_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2975_c7_8c38_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2975_c7_8c38_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2975_c7_8c38_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2975_c7_8c38_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2966_c2_cbca] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2966_c2_cbca_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2966_c2_cbca_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2966_c2_cbca_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2966_c2_cbca_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2966_c2_cbca_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2966_c2_cbca_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2966_c2_cbca_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2966_c2_cbca_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2975_c7_8c38] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2975_c7_8c38_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2975_c7_8c38_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2975_c7_8c38_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2975_c7_8c38_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2975_c7_8c38_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2975_c7_8c38_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2975_c7_8c38_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2975_c7_8c38_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2972_c7_0ca8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2975_c7_8c38_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2972_c7_0ca8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2975_c7_8c38_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2966_c2_cbca_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2972_c7_0ca8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2966_c2_cbca_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2972_c7_0ca8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2966_c2_cbca_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2972_c7_0ca8_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2966_c2_cbca] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2966_c2_cbca_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2966_c2_cbca_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2966_c2_cbca_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2966_c2_cbca_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2966_c2_cbca_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2966_c2_cbca_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2966_c2_cbca_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2966_c2_cbca_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2972_c7_0ca8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2972_c7_0ca8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2972_c7_0ca8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2972_c7_0ca8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2972_c7_0ca8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2972_c7_0ca8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2972_c7_0ca8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2972_c7_0ca8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2972_c7_0ca8_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2966_c2_cbca] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2966_c2_cbca_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2966_c2_cbca_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2966_c2_cbca_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2966_c2_cbca_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2966_c2_cbca_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2966_c2_cbca_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2966_c2_cbca_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2966_c2_cbca_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2966_c2_cbca] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2966_c2_cbca_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2966_c2_cbca_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2966_c2_cbca_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2966_c2_cbca_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2966_c2_cbca_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2966_c2_cbca_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2966_c2_cbca_return_output := result_stack_value_MUX_uxn_opcodes_h_l2966_c2_cbca_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2972_c7_0ca8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2972_c7_0ca8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2972_c7_0ca8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2972_c7_0ca8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2972_c7_0ca8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2972_c7_0ca8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2972_c7_0ca8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2972_c7_0ca8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2972_c7_0ca8_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2966_c2_cbca_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2972_c7_0ca8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2966_c2_cbca_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2972_c7_0ca8_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2966_c2_cbca] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2966_c2_cbca_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2966_c2_cbca_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2966_c2_cbca_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2966_c2_cbca_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2966_c2_cbca_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2966_c2_cbca_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2966_c2_cbca_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2966_c2_cbca_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2966_c2_cbca] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2966_c2_cbca_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2966_c2_cbca_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2966_c2_cbca_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2966_c2_cbca_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2966_c2_cbca_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2966_c2_cbca_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2966_c2_cbca_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2966_c2_cbca_return_output;

     -- Submodule level 9
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_287e_uxn_opcodes_h_l3003_l2962_DUPLICATE_146e LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_287e_uxn_opcodes_h_l3003_l2962_DUPLICATE_146e_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_287e(
     result,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2966_c2_cbca_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2966_c2_cbca_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2966_c2_cbca_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2966_c2_cbca_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2966_c2_cbca_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2966_c2_cbca_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2966_c2_cbca_return_output);

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_287e_uxn_opcodes_h_l3003_l2962_DUPLICATE_146e_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_287e_uxn_opcodes_h_l3003_l2962_DUPLICATE_146e_return_output;
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
