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
entity sub_0CLK_fd2391e7 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end sub_0CLK_fd2391e7;
architecture arch of sub_0CLK_fd2391e7 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l2351_c6_ecaf]
signal BIN_OP_EQ_uxn_opcodes_h_l2351_c6_ecaf_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2351_c6_ecaf_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2351_c6_ecaf_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2351_c1_e0eb]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2351_c1_e0eb_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2351_c1_e0eb_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2351_c1_e0eb_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2351_c1_e0eb_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2351_c2_b9b8]
signal n8_MUX_uxn_opcodes_h_l2351_c2_b9b8_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2351_c2_b9b8_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2351_c2_b9b8_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2351_c2_b9b8_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l2351_c2_b9b8]
signal t8_MUX_uxn_opcodes_h_l2351_c2_b9b8_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2351_c2_b9b8_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2351_c2_b9b8_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2351_c2_b9b8_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2351_c2_b9b8]
signal result_stack_value_MUX_uxn_opcodes_h_l2351_c2_b9b8_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2351_c2_b9b8_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2351_c2_b9b8_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2351_c2_b9b8_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2351_c2_b9b8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2351_c2_b9b8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2351_c2_b9b8_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2351_c2_b9b8_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2351_c2_b9b8_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2351_c2_b9b8]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2351_c2_b9b8_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2351_c2_b9b8_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2351_c2_b9b8_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2351_c2_b9b8_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2351_c2_b9b8]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2351_c2_b9b8_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2351_c2_b9b8_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2351_c2_b9b8_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2351_c2_b9b8_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2351_c2_b9b8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2351_c2_b9b8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2351_c2_b9b8_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2351_c2_b9b8_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2351_c2_b9b8_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2351_c2_b9b8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2351_c2_b9b8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2351_c2_b9b8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2351_c2_b9b8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2351_c2_b9b8_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2351_c2_b9b8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2351_c2_b9b8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2351_c2_b9b8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2351_c2_b9b8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2351_c2_b9b8_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l2352_c3_0533[uxn_opcodes_h_l2352_c3_0533]
signal printf_uxn_opcodes_h_l2352_c3_0533_uxn_opcodes_h_l2352_c3_0533_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2357_c11_d5f3]
signal BIN_OP_EQ_uxn_opcodes_h_l2357_c11_d5f3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2357_c11_d5f3_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2357_c11_d5f3_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2357_c7_facd]
signal n8_MUX_uxn_opcodes_h_l2357_c7_facd_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2357_c7_facd_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2357_c7_facd_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2357_c7_facd_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l2357_c7_facd]
signal t8_MUX_uxn_opcodes_h_l2357_c7_facd_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2357_c7_facd_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2357_c7_facd_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2357_c7_facd_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2357_c7_facd]
signal result_stack_value_MUX_uxn_opcodes_h_l2357_c7_facd_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2357_c7_facd_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2357_c7_facd_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2357_c7_facd_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2357_c7_facd]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c7_facd_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c7_facd_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c7_facd_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c7_facd_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2357_c7_facd]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2357_c7_facd_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2357_c7_facd_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2357_c7_facd_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2357_c7_facd_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2357_c7_facd]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2357_c7_facd_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2357_c7_facd_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2357_c7_facd_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2357_c7_facd_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2357_c7_facd]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c7_facd_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c7_facd_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c7_facd_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c7_facd_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2357_c7_facd]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2357_c7_facd_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2357_c7_facd_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2357_c7_facd_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2357_c7_facd_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2357_c7_facd]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2357_c7_facd_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2357_c7_facd_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2357_c7_facd_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2357_c7_facd_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2360_c11_6049]
signal BIN_OP_EQ_uxn_opcodes_h_l2360_c11_6049_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2360_c11_6049_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2360_c11_6049_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2360_c7_7bdf]
signal n8_MUX_uxn_opcodes_h_l2360_c7_7bdf_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2360_c7_7bdf_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2360_c7_7bdf_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2360_c7_7bdf_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l2360_c7_7bdf]
signal t8_MUX_uxn_opcodes_h_l2360_c7_7bdf_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2360_c7_7bdf_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2360_c7_7bdf_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2360_c7_7bdf_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2360_c7_7bdf]
signal result_stack_value_MUX_uxn_opcodes_h_l2360_c7_7bdf_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2360_c7_7bdf_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2360_c7_7bdf_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2360_c7_7bdf_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2360_c7_7bdf]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_7bdf_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_7bdf_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_7bdf_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_7bdf_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2360_c7_7bdf]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2360_c7_7bdf_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2360_c7_7bdf_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2360_c7_7bdf_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2360_c7_7bdf_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2360_c7_7bdf]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2360_c7_7bdf_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2360_c7_7bdf_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2360_c7_7bdf_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2360_c7_7bdf_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2360_c7_7bdf]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_7bdf_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_7bdf_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_7bdf_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_7bdf_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2360_c7_7bdf]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2360_c7_7bdf_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2360_c7_7bdf_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2360_c7_7bdf_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2360_c7_7bdf_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2360_c7_7bdf]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_7bdf_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_7bdf_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_7bdf_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_7bdf_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2364_c11_b38e]
signal BIN_OP_EQ_uxn_opcodes_h_l2364_c11_b38e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2364_c11_b38e_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2364_c11_b38e_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2364_c7_daa5]
signal n8_MUX_uxn_opcodes_h_l2364_c7_daa5_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2364_c7_daa5_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2364_c7_daa5_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2364_c7_daa5_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2364_c7_daa5]
signal result_stack_value_MUX_uxn_opcodes_h_l2364_c7_daa5_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2364_c7_daa5_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2364_c7_daa5_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2364_c7_daa5_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2364_c7_daa5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_daa5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_daa5_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_daa5_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_daa5_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2364_c7_daa5]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_daa5_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_daa5_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_daa5_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_daa5_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2364_c7_daa5]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2364_c7_daa5_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2364_c7_daa5_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2364_c7_daa5_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2364_c7_daa5_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2364_c7_daa5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_daa5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_daa5_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_daa5_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_daa5_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2364_c7_daa5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_daa5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_daa5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_daa5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_daa5_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2364_c7_daa5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_daa5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_daa5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_daa5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_daa5_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2367_c11_b2ab]
signal BIN_OP_EQ_uxn_opcodes_h_l2367_c11_b2ab_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2367_c11_b2ab_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2367_c11_b2ab_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2367_c7_96c1]
signal n8_MUX_uxn_opcodes_h_l2367_c7_96c1_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2367_c7_96c1_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2367_c7_96c1_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2367_c7_96c1_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2367_c7_96c1]
signal result_stack_value_MUX_uxn_opcodes_h_l2367_c7_96c1_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2367_c7_96c1_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2367_c7_96c1_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2367_c7_96c1_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2367_c7_96c1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2367_c7_96c1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2367_c7_96c1_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2367_c7_96c1_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2367_c7_96c1_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2367_c7_96c1]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2367_c7_96c1_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2367_c7_96c1_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2367_c7_96c1_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2367_c7_96c1_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2367_c7_96c1]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2367_c7_96c1_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2367_c7_96c1_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2367_c7_96c1_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2367_c7_96c1_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2367_c7_96c1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2367_c7_96c1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2367_c7_96c1_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2367_c7_96c1_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2367_c7_96c1_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2367_c7_96c1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2367_c7_96c1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2367_c7_96c1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2367_c7_96c1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2367_c7_96c1_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2367_c7_96c1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2367_c7_96c1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2367_c7_96c1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2367_c7_96c1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2367_c7_96c1_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2371_c32_2ac8]
signal BIN_OP_AND_uxn_opcodes_h_l2371_c32_2ac8_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2371_c32_2ac8_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2371_c32_2ac8_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l2371_c32_5bed]
signal BIN_OP_GT_uxn_opcodes_h_l2371_c32_5bed_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2371_c32_5bed_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2371_c32_5bed_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2371_c32_bce0]
signal MUX_uxn_opcodes_h_l2371_c32_bce0_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2371_c32_bce0_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2371_c32_bce0_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2371_c32_bce0_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2373_c11_1aa2]
signal BIN_OP_EQ_uxn_opcodes_h_l2373_c11_1aa2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2373_c11_1aa2_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2373_c11_1aa2_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2373_c7_bc08]
signal result_stack_value_MUX_uxn_opcodes_h_l2373_c7_bc08_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2373_c7_bc08_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2373_c7_bc08_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2373_c7_bc08_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2373_c7_bc08]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2373_c7_bc08_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2373_c7_bc08_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2373_c7_bc08_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2373_c7_bc08_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2373_c7_bc08]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2373_c7_bc08_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2373_c7_bc08_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2373_c7_bc08_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2373_c7_bc08_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2373_c7_bc08]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2373_c7_bc08_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2373_c7_bc08_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2373_c7_bc08_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2373_c7_bc08_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2373_c7_bc08]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_bc08_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_bc08_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_bc08_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_bc08_return_output : unsigned(0 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l2377_c24_3acd]
signal BIN_OP_MINUS_uxn_opcodes_h_l2377_c24_3acd_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l2377_c24_3acd_right : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l2377_c24_3acd_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2379_c11_7380]
signal BIN_OP_EQ_uxn_opcodes_h_l2379_c11_7380_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2379_c11_7380_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2379_c11_7380_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2379_c7_4932]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2379_c7_4932_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2379_c7_4932_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2379_c7_4932_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2379_c7_4932_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2379_c7_4932]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2379_c7_4932_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2379_c7_4932_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2379_c7_4932_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2379_c7_4932_return_output : unsigned(0 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_df93( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : signed;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.stack_value := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.is_sp_shift := ref_toks_3;
      base.is_stack_read := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.is_stack_write := ref_toks_6;
      base.is_opc_done := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2351_c6_ecaf
BIN_OP_EQ_uxn_opcodes_h_l2351_c6_ecaf : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2351_c6_ecaf_left,
BIN_OP_EQ_uxn_opcodes_h_l2351_c6_ecaf_right,
BIN_OP_EQ_uxn_opcodes_h_l2351_c6_ecaf_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2351_c1_e0eb
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2351_c1_e0eb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2351_c1_e0eb_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2351_c1_e0eb_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2351_c1_e0eb_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2351_c1_e0eb_return_output);

-- n8_MUX_uxn_opcodes_h_l2351_c2_b9b8
n8_MUX_uxn_opcodes_h_l2351_c2_b9b8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2351_c2_b9b8_cond,
n8_MUX_uxn_opcodes_h_l2351_c2_b9b8_iftrue,
n8_MUX_uxn_opcodes_h_l2351_c2_b9b8_iffalse,
n8_MUX_uxn_opcodes_h_l2351_c2_b9b8_return_output);

-- t8_MUX_uxn_opcodes_h_l2351_c2_b9b8
t8_MUX_uxn_opcodes_h_l2351_c2_b9b8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2351_c2_b9b8_cond,
t8_MUX_uxn_opcodes_h_l2351_c2_b9b8_iftrue,
t8_MUX_uxn_opcodes_h_l2351_c2_b9b8_iffalse,
t8_MUX_uxn_opcodes_h_l2351_c2_b9b8_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2351_c2_b9b8
result_stack_value_MUX_uxn_opcodes_h_l2351_c2_b9b8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2351_c2_b9b8_cond,
result_stack_value_MUX_uxn_opcodes_h_l2351_c2_b9b8_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2351_c2_b9b8_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2351_c2_b9b8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2351_c2_b9b8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2351_c2_b9b8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2351_c2_b9b8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2351_c2_b9b8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2351_c2_b9b8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2351_c2_b9b8_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2351_c2_b9b8
result_is_sp_shift_MUX_uxn_opcodes_h_l2351_c2_b9b8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2351_c2_b9b8_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2351_c2_b9b8_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2351_c2_b9b8_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2351_c2_b9b8_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2351_c2_b9b8
result_is_stack_read_MUX_uxn_opcodes_h_l2351_c2_b9b8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2351_c2_b9b8_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2351_c2_b9b8_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2351_c2_b9b8_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2351_c2_b9b8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2351_c2_b9b8
result_sp_relative_shift_MUX_uxn_opcodes_h_l2351_c2_b9b8 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2351_c2_b9b8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2351_c2_b9b8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2351_c2_b9b8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2351_c2_b9b8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2351_c2_b9b8
result_is_stack_write_MUX_uxn_opcodes_h_l2351_c2_b9b8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2351_c2_b9b8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2351_c2_b9b8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2351_c2_b9b8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2351_c2_b9b8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2351_c2_b9b8
result_is_opc_done_MUX_uxn_opcodes_h_l2351_c2_b9b8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2351_c2_b9b8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2351_c2_b9b8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2351_c2_b9b8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2351_c2_b9b8_return_output);

-- printf_uxn_opcodes_h_l2352_c3_0533_uxn_opcodes_h_l2352_c3_0533
printf_uxn_opcodes_h_l2352_c3_0533_uxn_opcodes_h_l2352_c3_0533 : entity work.printf_uxn_opcodes_h_l2352_c3_0533_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2352_c3_0533_uxn_opcodes_h_l2352_c3_0533_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2357_c11_d5f3
BIN_OP_EQ_uxn_opcodes_h_l2357_c11_d5f3 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2357_c11_d5f3_left,
BIN_OP_EQ_uxn_opcodes_h_l2357_c11_d5f3_right,
BIN_OP_EQ_uxn_opcodes_h_l2357_c11_d5f3_return_output);

-- n8_MUX_uxn_opcodes_h_l2357_c7_facd
n8_MUX_uxn_opcodes_h_l2357_c7_facd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2357_c7_facd_cond,
n8_MUX_uxn_opcodes_h_l2357_c7_facd_iftrue,
n8_MUX_uxn_opcodes_h_l2357_c7_facd_iffalse,
n8_MUX_uxn_opcodes_h_l2357_c7_facd_return_output);

-- t8_MUX_uxn_opcodes_h_l2357_c7_facd
t8_MUX_uxn_opcodes_h_l2357_c7_facd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2357_c7_facd_cond,
t8_MUX_uxn_opcodes_h_l2357_c7_facd_iftrue,
t8_MUX_uxn_opcodes_h_l2357_c7_facd_iffalse,
t8_MUX_uxn_opcodes_h_l2357_c7_facd_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2357_c7_facd
result_stack_value_MUX_uxn_opcodes_h_l2357_c7_facd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2357_c7_facd_cond,
result_stack_value_MUX_uxn_opcodes_h_l2357_c7_facd_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2357_c7_facd_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2357_c7_facd_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c7_facd
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c7_facd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c7_facd_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c7_facd_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c7_facd_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c7_facd_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2357_c7_facd
result_is_sp_shift_MUX_uxn_opcodes_h_l2357_c7_facd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2357_c7_facd_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2357_c7_facd_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2357_c7_facd_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2357_c7_facd_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2357_c7_facd
result_is_stack_read_MUX_uxn_opcodes_h_l2357_c7_facd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2357_c7_facd_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2357_c7_facd_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2357_c7_facd_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2357_c7_facd_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c7_facd
result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c7_facd : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c7_facd_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c7_facd_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c7_facd_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c7_facd_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2357_c7_facd
result_is_stack_write_MUX_uxn_opcodes_h_l2357_c7_facd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2357_c7_facd_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2357_c7_facd_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2357_c7_facd_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2357_c7_facd_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2357_c7_facd
result_is_opc_done_MUX_uxn_opcodes_h_l2357_c7_facd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2357_c7_facd_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2357_c7_facd_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2357_c7_facd_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2357_c7_facd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2360_c11_6049
BIN_OP_EQ_uxn_opcodes_h_l2360_c11_6049 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2360_c11_6049_left,
BIN_OP_EQ_uxn_opcodes_h_l2360_c11_6049_right,
BIN_OP_EQ_uxn_opcodes_h_l2360_c11_6049_return_output);

-- n8_MUX_uxn_opcodes_h_l2360_c7_7bdf
n8_MUX_uxn_opcodes_h_l2360_c7_7bdf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2360_c7_7bdf_cond,
n8_MUX_uxn_opcodes_h_l2360_c7_7bdf_iftrue,
n8_MUX_uxn_opcodes_h_l2360_c7_7bdf_iffalse,
n8_MUX_uxn_opcodes_h_l2360_c7_7bdf_return_output);

-- t8_MUX_uxn_opcodes_h_l2360_c7_7bdf
t8_MUX_uxn_opcodes_h_l2360_c7_7bdf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2360_c7_7bdf_cond,
t8_MUX_uxn_opcodes_h_l2360_c7_7bdf_iftrue,
t8_MUX_uxn_opcodes_h_l2360_c7_7bdf_iffalse,
t8_MUX_uxn_opcodes_h_l2360_c7_7bdf_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2360_c7_7bdf
result_stack_value_MUX_uxn_opcodes_h_l2360_c7_7bdf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2360_c7_7bdf_cond,
result_stack_value_MUX_uxn_opcodes_h_l2360_c7_7bdf_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2360_c7_7bdf_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2360_c7_7bdf_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_7bdf
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_7bdf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_7bdf_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_7bdf_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_7bdf_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_7bdf_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2360_c7_7bdf
result_is_sp_shift_MUX_uxn_opcodes_h_l2360_c7_7bdf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2360_c7_7bdf_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2360_c7_7bdf_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2360_c7_7bdf_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2360_c7_7bdf_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2360_c7_7bdf
result_is_stack_read_MUX_uxn_opcodes_h_l2360_c7_7bdf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2360_c7_7bdf_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2360_c7_7bdf_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2360_c7_7bdf_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2360_c7_7bdf_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_7bdf
result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_7bdf : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_7bdf_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_7bdf_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_7bdf_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_7bdf_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2360_c7_7bdf
result_is_stack_write_MUX_uxn_opcodes_h_l2360_c7_7bdf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2360_c7_7bdf_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2360_c7_7bdf_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2360_c7_7bdf_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2360_c7_7bdf_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_7bdf
result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_7bdf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_7bdf_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_7bdf_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_7bdf_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_7bdf_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2364_c11_b38e
BIN_OP_EQ_uxn_opcodes_h_l2364_c11_b38e : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2364_c11_b38e_left,
BIN_OP_EQ_uxn_opcodes_h_l2364_c11_b38e_right,
BIN_OP_EQ_uxn_opcodes_h_l2364_c11_b38e_return_output);

-- n8_MUX_uxn_opcodes_h_l2364_c7_daa5
n8_MUX_uxn_opcodes_h_l2364_c7_daa5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2364_c7_daa5_cond,
n8_MUX_uxn_opcodes_h_l2364_c7_daa5_iftrue,
n8_MUX_uxn_opcodes_h_l2364_c7_daa5_iffalse,
n8_MUX_uxn_opcodes_h_l2364_c7_daa5_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2364_c7_daa5
result_stack_value_MUX_uxn_opcodes_h_l2364_c7_daa5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2364_c7_daa5_cond,
result_stack_value_MUX_uxn_opcodes_h_l2364_c7_daa5_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2364_c7_daa5_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2364_c7_daa5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_daa5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_daa5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_daa5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_daa5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_daa5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_daa5_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_daa5
result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_daa5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_daa5_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_daa5_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_daa5_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_daa5_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2364_c7_daa5
result_is_stack_read_MUX_uxn_opcodes_h_l2364_c7_daa5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2364_c7_daa5_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2364_c7_daa5_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2364_c7_daa5_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2364_c7_daa5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_daa5
result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_daa5 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_daa5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_daa5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_daa5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_daa5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_daa5
result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_daa5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_daa5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_daa5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_daa5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_daa5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_daa5
result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_daa5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_daa5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_daa5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_daa5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_daa5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2367_c11_b2ab
BIN_OP_EQ_uxn_opcodes_h_l2367_c11_b2ab : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2367_c11_b2ab_left,
BIN_OP_EQ_uxn_opcodes_h_l2367_c11_b2ab_right,
BIN_OP_EQ_uxn_opcodes_h_l2367_c11_b2ab_return_output);

-- n8_MUX_uxn_opcodes_h_l2367_c7_96c1
n8_MUX_uxn_opcodes_h_l2367_c7_96c1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2367_c7_96c1_cond,
n8_MUX_uxn_opcodes_h_l2367_c7_96c1_iftrue,
n8_MUX_uxn_opcodes_h_l2367_c7_96c1_iffalse,
n8_MUX_uxn_opcodes_h_l2367_c7_96c1_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2367_c7_96c1
result_stack_value_MUX_uxn_opcodes_h_l2367_c7_96c1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2367_c7_96c1_cond,
result_stack_value_MUX_uxn_opcodes_h_l2367_c7_96c1_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2367_c7_96c1_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2367_c7_96c1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2367_c7_96c1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2367_c7_96c1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2367_c7_96c1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2367_c7_96c1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2367_c7_96c1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2367_c7_96c1_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2367_c7_96c1
result_is_sp_shift_MUX_uxn_opcodes_h_l2367_c7_96c1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2367_c7_96c1_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2367_c7_96c1_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2367_c7_96c1_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2367_c7_96c1_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2367_c7_96c1
result_is_stack_read_MUX_uxn_opcodes_h_l2367_c7_96c1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2367_c7_96c1_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2367_c7_96c1_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2367_c7_96c1_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2367_c7_96c1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2367_c7_96c1
result_sp_relative_shift_MUX_uxn_opcodes_h_l2367_c7_96c1 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2367_c7_96c1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2367_c7_96c1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2367_c7_96c1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2367_c7_96c1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2367_c7_96c1
result_is_stack_write_MUX_uxn_opcodes_h_l2367_c7_96c1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2367_c7_96c1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2367_c7_96c1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2367_c7_96c1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2367_c7_96c1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2367_c7_96c1
result_is_opc_done_MUX_uxn_opcodes_h_l2367_c7_96c1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2367_c7_96c1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2367_c7_96c1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2367_c7_96c1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2367_c7_96c1_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2371_c32_2ac8
BIN_OP_AND_uxn_opcodes_h_l2371_c32_2ac8 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2371_c32_2ac8_left,
BIN_OP_AND_uxn_opcodes_h_l2371_c32_2ac8_right,
BIN_OP_AND_uxn_opcodes_h_l2371_c32_2ac8_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l2371_c32_5bed
BIN_OP_GT_uxn_opcodes_h_l2371_c32_5bed : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l2371_c32_5bed_left,
BIN_OP_GT_uxn_opcodes_h_l2371_c32_5bed_right,
BIN_OP_GT_uxn_opcodes_h_l2371_c32_5bed_return_output);

-- MUX_uxn_opcodes_h_l2371_c32_bce0
MUX_uxn_opcodes_h_l2371_c32_bce0 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2371_c32_bce0_cond,
MUX_uxn_opcodes_h_l2371_c32_bce0_iftrue,
MUX_uxn_opcodes_h_l2371_c32_bce0_iffalse,
MUX_uxn_opcodes_h_l2371_c32_bce0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2373_c11_1aa2
BIN_OP_EQ_uxn_opcodes_h_l2373_c11_1aa2 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2373_c11_1aa2_left,
BIN_OP_EQ_uxn_opcodes_h_l2373_c11_1aa2_right,
BIN_OP_EQ_uxn_opcodes_h_l2373_c11_1aa2_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2373_c7_bc08
result_stack_value_MUX_uxn_opcodes_h_l2373_c7_bc08 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2373_c7_bc08_cond,
result_stack_value_MUX_uxn_opcodes_h_l2373_c7_bc08_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2373_c7_bc08_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2373_c7_bc08_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2373_c7_bc08
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2373_c7_bc08 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2373_c7_bc08_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2373_c7_bc08_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2373_c7_bc08_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2373_c7_bc08_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2373_c7_bc08
result_is_sp_shift_MUX_uxn_opcodes_h_l2373_c7_bc08 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2373_c7_bc08_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2373_c7_bc08_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2373_c7_bc08_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2373_c7_bc08_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2373_c7_bc08
result_is_stack_write_MUX_uxn_opcodes_h_l2373_c7_bc08 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2373_c7_bc08_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2373_c7_bc08_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2373_c7_bc08_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2373_c7_bc08_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_bc08
result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_bc08 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_bc08_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_bc08_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_bc08_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_bc08_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l2377_c24_3acd
BIN_OP_MINUS_uxn_opcodes_h_l2377_c24_3acd : entity work.BIN_OP_MINUS_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l2377_c24_3acd_left,
BIN_OP_MINUS_uxn_opcodes_h_l2377_c24_3acd_right,
BIN_OP_MINUS_uxn_opcodes_h_l2377_c24_3acd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2379_c11_7380
BIN_OP_EQ_uxn_opcodes_h_l2379_c11_7380 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2379_c11_7380_left,
BIN_OP_EQ_uxn_opcodes_h_l2379_c11_7380_right,
BIN_OP_EQ_uxn_opcodes_h_l2379_c11_7380_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2379_c7_4932
result_is_stack_write_MUX_uxn_opcodes_h_l2379_c7_4932 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2379_c7_4932_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2379_c7_4932_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2379_c7_4932_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2379_c7_4932_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2379_c7_4932
result_is_opc_done_MUX_uxn_opcodes_h_l2379_c7_4932 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2379_c7_4932_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2379_c7_4932_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2379_c7_4932_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2379_c7_4932_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2351_c6_ecaf_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2351_c1_e0eb_return_output,
 n8_MUX_uxn_opcodes_h_l2351_c2_b9b8_return_output,
 t8_MUX_uxn_opcodes_h_l2351_c2_b9b8_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2351_c2_b9b8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2351_c2_b9b8_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2351_c2_b9b8_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2351_c2_b9b8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2351_c2_b9b8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2351_c2_b9b8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2351_c2_b9b8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2357_c11_d5f3_return_output,
 n8_MUX_uxn_opcodes_h_l2357_c7_facd_return_output,
 t8_MUX_uxn_opcodes_h_l2357_c7_facd_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2357_c7_facd_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c7_facd_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2357_c7_facd_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2357_c7_facd_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c7_facd_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2357_c7_facd_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2357_c7_facd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2360_c11_6049_return_output,
 n8_MUX_uxn_opcodes_h_l2360_c7_7bdf_return_output,
 t8_MUX_uxn_opcodes_h_l2360_c7_7bdf_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2360_c7_7bdf_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_7bdf_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2360_c7_7bdf_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2360_c7_7bdf_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_7bdf_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2360_c7_7bdf_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_7bdf_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2364_c11_b38e_return_output,
 n8_MUX_uxn_opcodes_h_l2364_c7_daa5_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2364_c7_daa5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_daa5_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_daa5_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2364_c7_daa5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_daa5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_daa5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_daa5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2367_c11_b2ab_return_output,
 n8_MUX_uxn_opcodes_h_l2367_c7_96c1_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2367_c7_96c1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2367_c7_96c1_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2367_c7_96c1_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2367_c7_96c1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2367_c7_96c1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2367_c7_96c1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2367_c7_96c1_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2371_c32_2ac8_return_output,
 BIN_OP_GT_uxn_opcodes_h_l2371_c32_5bed_return_output,
 MUX_uxn_opcodes_h_l2371_c32_bce0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2373_c11_1aa2_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2373_c7_bc08_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2373_c7_bc08_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2373_c7_bc08_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2373_c7_bc08_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_bc08_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l2377_c24_3acd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2379_c11_7380_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2379_c7_4932_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2379_c7_4932_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2351_c6_ecaf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2351_c6_ecaf_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2351_c6_ecaf_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2351_c1_e0eb_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2351_c1_e0eb_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2351_c1_e0eb_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2351_c1_e0eb_iffalse : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2351_c2_b9b8_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2351_c2_b9b8_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2357_c7_facd_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2351_c2_b9b8_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2351_c2_b9b8_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2351_c2_b9b8_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2351_c2_b9b8_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2357_c7_facd_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2351_c2_b9b8_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2351_c2_b9b8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2351_c2_b9b8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2351_c2_b9b8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2357_c7_facd_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2351_c2_b9b8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2351_c2_b9b8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2351_c2_b9b8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2354_c3_4f9c : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2351_c2_b9b8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c7_facd_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2351_c2_b9b8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2351_c2_b9b8_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2351_c2_b9b8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2351_c2_b9b8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2357_c7_facd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2351_c2_b9b8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2351_c2_b9b8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2351_c2_b9b8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2351_c2_b9b8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2357_c7_facd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2351_c2_b9b8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2351_c2_b9b8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2351_c2_b9b8_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2351_c2_b9b8_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c7_facd_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2351_c2_b9b8_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2351_c2_b9b8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2351_c2_b9b8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2351_c2_b9b8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2357_c7_facd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2351_c2_b9b8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2351_c2_b9b8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2351_c2_b9b8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2351_c2_b9b8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2357_c7_facd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2351_c2_b9b8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2351_c2_b9b8_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2352_c3_0533_uxn_opcodes_h_l2352_c3_0533_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2357_c11_d5f3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2357_c11_d5f3_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2357_c11_d5f3_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2357_c7_facd_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2357_c7_facd_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2360_c7_7bdf_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2357_c7_facd_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2357_c7_facd_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2357_c7_facd_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2360_c7_7bdf_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2357_c7_facd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2357_c7_facd_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2357_c7_facd_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2360_c7_7bdf_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2357_c7_facd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c7_facd_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2358_c3_8efa : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c7_facd_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_7bdf_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c7_facd_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2357_c7_facd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2357_c7_facd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2360_c7_7bdf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2357_c7_facd_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2357_c7_facd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2357_c7_facd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2360_c7_7bdf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2357_c7_facd_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c7_facd_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c7_facd_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_7bdf_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c7_facd_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2357_c7_facd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2357_c7_facd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2360_c7_7bdf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2357_c7_facd_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2357_c7_facd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2357_c7_facd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_7bdf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2357_c7_facd_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c11_6049_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c11_6049_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c11_6049_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2360_c7_7bdf_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2360_c7_7bdf_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2364_c7_daa5_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2360_c7_7bdf_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2360_c7_7bdf_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2360_c7_7bdf_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2360_c7_7bdf_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2360_c7_7bdf_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2360_c7_7bdf_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2364_c7_daa5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2360_c7_7bdf_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_7bdf_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2362_c3_02d9 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_7bdf_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_daa5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_7bdf_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2360_c7_7bdf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2360_c7_7bdf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_daa5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2360_c7_7bdf_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2360_c7_7bdf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2360_c7_7bdf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2364_c7_daa5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2360_c7_7bdf_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_7bdf_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_7bdf_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_daa5_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_7bdf_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2360_c7_7bdf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2360_c7_7bdf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_daa5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2360_c7_7bdf_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_7bdf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_7bdf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_daa5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_7bdf_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_b38e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_b38e_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_b38e_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2364_c7_daa5_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2364_c7_daa5_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2367_c7_96c1_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2364_c7_daa5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2364_c7_daa5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2364_c7_daa5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2367_c7_96c1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2364_c7_daa5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_daa5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2365_c3_b2fc : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_daa5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2367_c7_96c1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_daa5_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_daa5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_daa5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2367_c7_96c1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_daa5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2364_c7_daa5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2364_c7_daa5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2367_c7_96c1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2364_c7_daa5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_daa5_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_daa5_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2367_c7_96c1_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_daa5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_daa5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_daa5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2367_c7_96c1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_daa5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_daa5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_daa5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2367_c7_96c1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_daa5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2367_c11_b2ab_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2367_c11_b2ab_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2367_c11_b2ab_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2367_c7_96c1_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2367_c7_96c1_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2367_c7_96c1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2367_c7_96c1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2367_c7_96c1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2373_c7_bc08_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2367_c7_96c1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2367_c7_96c1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2367_c7_96c1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2373_c7_bc08_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2367_c7_96c1_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2367_c7_96c1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2367_c7_96c1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2373_c7_bc08_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2367_c7_96c1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2367_c7_96c1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2367_c7_96c1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2367_c7_96c1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2367_c7_96c1_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2367_c7_96c1_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2367_c7_96c1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2367_c7_96c1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2367_c7_96c1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2373_c7_bc08_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2367_c7_96c1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2367_c7_96c1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2367_c7_96c1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_bc08_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2367_c7_96c1_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2371_c32_bce0_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2371_c32_bce0_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2371_c32_bce0_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2371_c32_2ac8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2371_c32_2ac8_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2371_c32_2ac8_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2371_c32_5bed_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2371_c32_5bed_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2371_c32_5bed_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2371_c32_bce0_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2373_c11_1aa2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2373_c11_1aa2_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2373_c11_1aa2_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2373_c7_bc08_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2373_c7_bc08_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2373_c7_bc08_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2373_c7_bc08_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2376_c3_daf8 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2373_c7_bc08_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2373_c7_bc08_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2373_c7_bc08_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2373_c7_bc08_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2373_c7_bc08_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2373_c7_bc08_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2373_c7_bc08_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2379_c7_4932_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2373_c7_bc08_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_bc08_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_bc08_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2379_c7_4932_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_bc08_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2377_c24_3acd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2377_c24_3acd_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2377_c24_3acd_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2379_c11_7380_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2379_c11_7380_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2379_c11_7380_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2379_c7_4932_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2379_c7_4932_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2379_c7_4932_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2379_c7_4932_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2379_c7_4932_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2379_c7_4932_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2367_l2364_l2360_l2357_l2351_l2373_DUPLICATE_ff4d_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2364_l2360_l2357_l2351_l2373_DUPLICATE_5135_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2367_l2364_l2360_l2357_l2351_DUPLICATE_f4ac_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2367_l2364_l2360_l2357_l2351_l2379_DUPLICATE_3eb1_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2367_l2360_l2364_l2357_DUPLICATE_e434_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2367_l2364_l2360_l2357_l2379_l2373_DUPLICATE_9b7e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2367_l2373_DUPLICATE_ea98_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_df93_uxn_opcodes_h_l2384_l2347_DUPLICATE_f3c2_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_b38e_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c11_6049_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2379_c11_7380_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2351_c6_ecaf_right := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2379_c7_4932_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2367_c11_b2ab_right := to_unsigned(4, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2379_c7_4932_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2373_c7_bc08_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2373_c11_1aa2_right := to_unsigned(5, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2373_c7_bc08_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2376_c3_daf8 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2373_c7_bc08_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2376_c3_daf8;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2358_c3_8efa := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c7_facd_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2358_c3_8efa;
     VAR_MUX_uxn_opcodes_h_l2371_c32_bce0_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2357_c11_d5f3_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2362_c3_02d9 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_7bdf_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2362_c3_02d9;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2365_c3_b2fc := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_daa5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2365_c3_b2fc;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2367_c7_96c1_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2351_c1_e0eb_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l2371_c32_5bed_right := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2351_c2_b9b8_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l2371_c32_bce0_iffalse := resize(to_signed(-1, 2), 8);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2367_c7_96c1_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2354_c3_4f9c := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2351_c2_b9b8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2354_c3_4f9c;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2371_c32_2ac8_right := to_unsigned(128, 8);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2351_c2_b9b8_iftrue := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2351_c1_e0eb_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2371_c32_2ac8_left := VAR_ins;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2377_c24_3acd_left := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2351_c2_b9b8_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2357_c7_facd_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2360_c7_7bdf_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2364_c7_daa5_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2367_c7_96c1_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2351_c6_ecaf_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2357_c11_d5f3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c11_6049_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_b38e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2367_c11_b2ab_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2373_c11_1aa2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2379_c11_7380_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l2367_c7_96c1_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l2360_c7_7bdf_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2377_c24_3acd_right := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2351_c2_b9b8_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2357_c7_facd_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2360_c7_7bdf_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l2364_c11_b38e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2364_c11_b38e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_b38e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2364_c11_b38e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_b38e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_b38e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2364_c11_b38e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2351_c6_ecaf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2351_c6_ecaf_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2351_c6_ecaf_left;
     BIN_OP_EQ_uxn_opcodes_h_l2351_c6_ecaf_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2351_c6_ecaf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2351_c6_ecaf_return_output := BIN_OP_EQ_uxn_opcodes_h_l2351_c6_ecaf_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2364_l2360_l2357_l2351_l2373_DUPLICATE_5135 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2364_l2360_l2357_l2351_l2373_DUPLICATE_5135_return_output := result.is_sp_shift;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2367_l2364_l2360_l2357_l2351_DUPLICATE_f4ac LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2367_l2364_l2360_l2357_l2351_DUPLICATE_f4ac_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2367_l2360_l2364_l2357_DUPLICATE_e434 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2367_l2360_l2364_l2357_DUPLICATE_e434_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l2360_c11_6049] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2360_c11_6049_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c11_6049_left;
     BIN_OP_EQ_uxn_opcodes_h_l2360_c11_6049_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c11_6049_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c11_6049_return_output := BIN_OP_EQ_uxn_opcodes_h_l2360_c11_6049_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l2371_c32_2ac8] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2371_c32_2ac8_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2371_c32_2ac8_left;
     BIN_OP_AND_uxn_opcodes_h_l2371_c32_2ac8_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2371_c32_2ac8_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2371_c32_2ac8_return_output := BIN_OP_AND_uxn_opcodes_h_l2371_c32_2ac8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2367_c11_b2ab] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2367_c11_b2ab_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2367_c11_b2ab_left;
     BIN_OP_EQ_uxn_opcodes_h_l2367_c11_b2ab_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2367_c11_b2ab_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2367_c11_b2ab_return_output := BIN_OP_EQ_uxn_opcodes_h_l2367_c11_b2ab_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2367_l2373_DUPLICATE_ea98 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2367_l2373_DUPLICATE_ea98_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2379_c11_7380] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2379_c11_7380_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2379_c11_7380_left;
     BIN_OP_EQ_uxn_opcodes_h_l2379_c11_7380_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2379_c11_7380_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2379_c11_7380_return_output := BIN_OP_EQ_uxn_opcodes_h_l2379_c11_7380_return_output;

     -- BIN_OP_MINUS[uxn_opcodes_h_l2377_c24_3acd] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l2377_c24_3acd_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l2377_c24_3acd_left;
     BIN_OP_MINUS_uxn_opcodes_h_l2377_c24_3acd_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l2377_c24_3acd_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2377_c24_3acd_return_output := BIN_OP_MINUS_uxn_opcodes_h_l2377_c24_3acd_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2373_c11_1aa2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2373_c11_1aa2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2373_c11_1aa2_left;
     BIN_OP_EQ_uxn_opcodes_h_l2373_c11_1aa2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2373_c11_1aa2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2373_c11_1aa2_return_output := BIN_OP_EQ_uxn_opcodes_h_l2373_c11_1aa2_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2367_l2364_l2360_l2357_l2351_l2379_DUPLICATE_3eb1 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2367_l2364_l2360_l2357_l2351_l2379_DUPLICATE_3eb1_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2357_c11_d5f3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2357_c11_d5f3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2357_c11_d5f3_left;
     BIN_OP_EQ_uxn_opcodes_h_l2357_c11_d5f3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2357_c11_d5f3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2357_c11_d5f3_return_output := BIN_OP_EQ_uxn_opcodes_h_l2357_c11_d5f3_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2367_l2364_l2360_l2357_l2351_l2373_DUPLICATE_ff4d LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2367_l2364_l2360_l2357_l2351_l2373_DUPLICATE_ff4d_return_output := result.stack_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2367_l2364_l2360_l2357_l2379_l2373_DUPLICATE_9b7e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2367_l2364_l2360_l2357_l2379_l2373_DUPLICATE_9b7e_return_output := result.is_opc_done;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l2371_c32_5bed_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2371_c32_2ac8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2351_c1_e0eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2351_c6_ecaf_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2351_c2_b9b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2351_c6_ecaf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2351_c2_b9b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2351_c6_ecaf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2351_c2_b9b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2351_c6_ecaf_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2351_c2_b9b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2351_c6_ecaf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2351_c2_b9b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2351_c6_ecaf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2351_c2_b9b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2351_c6_ecaf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2351_c2_b9b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2351_c6_ecaf_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2351_c2_b9b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2351_c6_ecaf_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2351_c2_b9b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2351_c6_ecaf_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2357_c7_facd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2357_c11_d5f3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2357_c7_facd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2357_c11_d5f3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2357_c7_facd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2357_c11_d5f3_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2357_c7_facd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2357_c11_d5f3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2357_c7_facd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2357_c11_d5f3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c7_facd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2357_c11_d5f3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c7_facd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2357_c11_d5f3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2357_c7_facd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2357_c11_d5f3_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2357_c7_facd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2357_c11_d5f3_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2360_c7_7bdf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c11_6049_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_7bdf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c11_6049_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2360_c7_7bdf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c11_6049_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2360_c7_7bdf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c11_6049_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2360_c7_7bdf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c11_6049_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_7bdf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c11_6049_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_7bdf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c11_6049_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2360_c7_7bdf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c11_6049_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2360_c7_7bdf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c11_6049_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2364_c7_daa5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_b38e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_daa5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_b38e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_daa5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_b38e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2364_c7_daa5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_b38e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_daa5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_b38e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_daa5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_b38e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_daa5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_b38e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2364_c7_daa5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_b38e_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2367_c7_96c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2367_c11_b2ab_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2367_c7_96c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2367_c11_b2ab_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2367_c7_96c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2367_c11_b2ab_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2367_c7_96c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2367_c11_b2ab_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2367_c7_96c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2367_c11_b2ab_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2367_c7_96c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2367_c11_b2ab_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2367_c7_96c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2367_c11_b2ab_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2367_c7_96c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2367_c11_b2ab_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_bc08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2373_c11_1aa2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2373_c7_bc08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2373_c11_1aa2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2373_c7_bc08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2373_c11_1aa2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2373_c7_bc08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2373_c11_1aa2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2373_c7_bc08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2373_c11_1aa2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2379_c7_4932_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2379_c11_7380_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2379_c7_4932_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2379_c11_7380_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2373_c7_bc08_iftrue := VAR_BIN_OP_MINUS_uxn_opcodes_h_l2377_c24_3acd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2351_c2_b9b8_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2367_l2364_l2360_l2357_l2351_DUPLICATE_f4ac_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c7_facd_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2367_l2364_l2360_l2357_l2351_DUPLICATE_f4ac_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_7bdf_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2367_l2364_l2360_l2357_l2351_DUPLICATE_f4ac_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_daa5_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2367_l2364_l2360_l2357_l2351_DUPLICATE_f4ac_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2367_c7_96c1_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2367_l2364_l2360_l2357_l2351_DUPLICATE_f4ac_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2357_c7_facd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2367_l2364_l2360_l2357_l2379_l2373_DUPLICATE_9b7e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_7bdf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2367_l2364_l2360_l2357_l2379_l2373_DUPLICATE_9b7e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_daa5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2367_l2364_l2360_l2357_l2379_l2373_DUPLICATE_9b7e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2367_c7_96c1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2367_l2364_l2360_l2357_l2379_l2373_DUPLICATE_9b7e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_bc08_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2367_l2364_l2360_l2357_l2379_l2373_DUPLICATE_9b7e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2379_c7_4932_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2367_l2364_l2360_l2357_l2379_l2373_DUPLICATE_9b7e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2351_c2_b9b8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2364_l2360_l2357_l2351_l2373_DUPLICATE_5135_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2357_c7_facd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2364_l2360_l2357_l2351_l2373_DUPLICATE_5135_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2360_c7_7bdf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2364_l2360_l2357_l2351_l2373_DUPLICATE_5135_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_daa5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2364_l2360_l2357_l2351_l2373_DUPLICATE_5135_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2373_c7_bc08_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2364_l2360_l2357_l2351_l2373_DUPLICATE_5135_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2357_c7_facd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2367_l2360_l2364_l2357_DUPLICATE_e434_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2360_c7_7bdf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2367_l2360_l2364_l2357_DUPLICATE_e434_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2364_c7_daa5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2367_l2360_l2364_l2357_DUPLICATE_e434_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2367_c7_96c1_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2367_l2360_l2364_l2357_DUPLICATE_e434_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2351_c2_b9b8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2367_l2364_l2360_l2357_l2351_l2379_DUPLICATE_3eb1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2357_c7_facd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2367_l2364_l2360_l2357_l2351_l2379_DUPLICATE_3eb1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2360_c7_7bdf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2367_l2364_l2360_l2357_l2351_l2379_DUPLICATE_3eb1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_daa5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2367_l2364_l2360_l2357_l2351_l2379_DUPLICATE_3eb1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2367_c7_96c1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2367_l2364_l2360_l2357_l2351_l2379_DUPLICATE_3eb1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2379_c7_4932_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2367_l2364_l2360_l2357_l2351_l2379_DUPLICATE_3eb1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2367_c7_96c1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2367_l2373_DUPLICATE_ea98_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2373_c7_bc08_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2367_l2373_DUPLICATE_ea98_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2351_c2_b9b8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2367_l2364_l2360_l2357_l2351_l2373_DUPLICATE_ff4d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2357_c7_facd_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2367_l2364_l2360_l2357_l2351_l2373_DUPLICATE_ff4d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2360_c7_7bdf_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2367_l2364_l2360_l2357_l2351_l2373_DUPLICATE_ff4d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2364_c7_daa5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2367_l2364_l2360_l2357_l2351_l2373_DUPLICATE_ff4d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2367_c7_96c1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2367_l2364_l2360_l2357_l2351_l2373_DUPLICATE_ff4d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2373_c7_bc08_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2367_l2364_l2360_l2357_l2351_l2373_DUPLICATE_ff4d_return_output;
     -- t8_MUX[uxn_opcodes_h_l2360_c7_7bdf] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2360_c7_7bdf_cond <= VAR_t8_MUX_uxn_opcodes_h_l2360_c7_7bdf_cond;
     t8_MUX_uxn_opcodes_h_l2360_c7_7bdf_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2360_c7_7bdf_iftrue;
     t8_MUX_uxn_opcodes_h_l2360_c7_7bdf_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2360_c7_7bdf_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2360_c7_7bdf_return_output := t8_MUX_uxn_opcodes_h_l2360_c7_7bdf_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2373_c7_bc08] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2373_c7_bc08_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2373_c7_bc08_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2373_c7_bc08_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2373_c7_bc08_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2373_c7_bc08_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2373_c7_bc08_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2373_c7_bc08_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2373_c7_bc08_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l2371_c32_5bed] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l2371_c32_5bed_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l2371_c32_5bed_left;
     BIN_OP_GT_uxn_opcodes_h_l2371_c32_5bed_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l2371_c32_5bed_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l2371_c32_5bed_return_output := BIN_OP_GT_uxn_opcodes_h_l2371_c32_5bed_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2379_c7_4932] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2379_c7_4932_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2379_c7_4932_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2379_c7_4932_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2379_c7_4932_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2379_c7_4932_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2379_c7_4932_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2379_c7_4932_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2379_c7_4932_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2373_c7_bc08] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2373_c7_bc08_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2373_c7_bc08_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2373_c7_bc08_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2373_c7_bc08_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2373_c7_bc08_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2373_c7_bc08_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2373_c7_bc08_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2373_c7_bc08_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2379_c7_4932] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2379_c7_4932_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2379_c7_4932_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2379_c7_4932_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2379_c7_4932_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2379_c7_4932_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2379_c7_4932_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2379_c7_4932_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2379_c7_4932_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2351_c1_e0eb] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2351_c1_e0eb_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2351_c1_e0eb_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2351_c1_e0eb_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2351_c1_e0eb_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2351_c1_e0eb_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2351_c1_e0eb_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2351_c1_e0eb_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2351_c1_e0eb_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2373_c7_bc08] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2373_c7_bc08_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2373_c7_bc08_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2373_c7_bc08_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2373_c7_bc08_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2373_c7_bc08_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2373_c7_bc08_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2373_c7_bc08_return_output := result_stack_value_MUX_uxn_opcodes_h_l2373_c7_bc08_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2367_c7_96c1] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2367_c7_96c1_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2367_c7_96c1_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2367_c7_96c1_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2367_c7_96c1_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2367_c7_96c1_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2367_c7_96c1_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2367_c7_96c1_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2367_c7_96c1_return_output;

     -- n8_MUX[uxn_opcodes_h_l2367_c7_96c1] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2367_c7_96c1_cond <= VAR_n8_MUX_uxn_opcodes_h_l2367_c7_96c1_cond;
     n8_MUX_uxn_opcodes_h_l2367_c7_96c1_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2367_c7_96c1_iftrue;
     n8_MUX_uxn_opcodes_h_l2367_c7_96c1_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2367_c7_96c1_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2367_c7_96c1_return_output := n8_MUX_uxn_opcodes_h_l2367_c7_96c1_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l2371_c32_bce0_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l2371_c32_5bed_return_output;
     VAR_printf_uxn_opcodes_h_l2352_c3_0533_uxn_opcodes_h_l2352_c3_0533_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2351_c1_e0eb_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2364_c7_daa5_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2367_c7_96c1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_bc08_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2379_c7_4932_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2367_c7_96c1_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2373_c7_bc08_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2364_c7_daa5_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2367_c7_96c1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2373_c7_bc08_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2379_c7_4932_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2367_c7_96c1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2373_c7_bc08_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2367_c7_96c1_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2373_c7_bc08_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2357_c7_facd_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2360_c7_7bdf_return_output;
     -- t8_MUX[uxn_opcodes_h_l2357_c7_facd] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2357_c7_facd_cond <= VAR_t8_MUX_uxn_opcodes_h_l2357_c7_facd_cond;
     t8_MUX_uxn_opcodes_h_l2357_c7_facd_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2357_c7_facd_iftrue;
     t8_MUX_uxn_opcodes_h_l2357_c7_facd_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2357_c7_facd_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2357_c7_facd_return_output := t8_MUX_uxn_opcodes_h_l2357_c7_facd_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2373_c7_bc08] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_bc08_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_bc08_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_bc08_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_bc08_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_bc08_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_bc08_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_bc08_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_bc08_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2367_c7_96c1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2367_c7_96c1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2367_c7_96c1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2367_c7_96c1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2367_c7_96c1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2367_c7_96c1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2367_c7_96c1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2367_c7_96c1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2367_c7_96c1_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2364_c7_daa5] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2364_c7_daa5_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2364_c7_daa5_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2364_c7_daa5_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2364_c7_daa5_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2364_c7_daa5_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2364_c7_daa5_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2364_c7_daa5_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2364_c7_daa5_return_output;

     -- printf_uxn_opcodes_h_l2352_c3_0533[uxn_opcodes_h_l2352_c3_0533] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2352_c3_0533_uxn_opcodes_h_l2352_c3_0533_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2352_c3_0533_uxn_opcodes_h_l2352_c3_0533_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- n8_MUX[uxn_opcodes_h_l2364_c7_daa5] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2364_c7_daa5_cond <= VAR_n8_MUX_uxn_opcodes_h_l2364_c7_daa5_cond;
     n8_MUX_uxn_opcodes_h_l2364_c7_daa5_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2364_c7_daa5_iftrue;
     n8_MUX_uxn_opcodes_h_l2364_c7_daa5_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2364_c7_daa5_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2364_c7_daa5_return_output := n8_MUX_uxn_opcodes_h_l2364_c7_daa5_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2367_c7_96c1] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2367_c7_96c1_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2367_c7_96c1_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2367_c7_96c1_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2367_c7_96c1_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2367_c7_96c1_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2367_c7_96c1_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2367_c7_96c1_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2367_c7_96c1_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2367_c7_96c1] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2367_c7_96c1_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2367_c7_96c1_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2367_c7_96c1_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2367_c7_96c1_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2367_c7_96c1_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2367_c7_96c1_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2367_c7_96c1_return_output := result_stack_value_MUX_uxn_opcodes_h_l2367_c7_96c1_return_output;

     -- MUX[uxn_opcodes_h_l2371_c32_bce0] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2371_c32_bce0_cond <= VAR_MUX_uxn_opcodes_h_l2371_c32_bce0_cond;
     MUX_uxn_opcodes_h_l2371_c32_bce0_iftrue <= VAR_MUX_uxn_opcodes_h_l2371_c32_bce0_iftrue;
     MUX_uxn_opcodes_h_l2371_c32_bce0_iffalse <= VAR_MUX_uxn_opcodes_h_l2371_c32_bce0_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2371_c32_bce0_return_output := MUX_uxn_opcodes_h_l2371_c32_bce0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2373_c7_bc08] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2373_c7_bc08_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2373_c7_bc08_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2373_c7_bc08_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2373_c7_bc08_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2373_c7_bc08_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2373_c7_bc08_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2373_c7_bc08_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2373_c7_bc08_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2367_c7_96c1_iftrue := VAR_MUX_uxn_opcodes_h_l2371_c32_bce0_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2360_c7_7bdf_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2364_c7_daa5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2367_c7_96c1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_bc08_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_daa5_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2367_c7_96c1_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2360_c7_7bdf_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2364_c7_daa5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2367_c7_96c1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2373_c7_bc08_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_daa5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2367_c7_96c1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2364_c7_daa5_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2367_c7_96c1_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2351_c2_b9b8_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2357_c7_facd_return_output;
     -- n8_MUX[uxn_opcodes_h_l2360_c7_7bdf] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2360_c7_7bdf_cond <= VAR_n8_MUX_uxn_opcodes_h_l2360_c7_7bdf_cond;
     n8_MUX_uxn_opcodes_h_l2360_c7_7bdf_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2360_c7_7bdf_iftrue;
     n8_MUX_uxn_opcodes_h_l2360_c7_7bdf_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2360_c7_7bdf_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2360_c7_7bdf_return_output := n8_MUX_uxn_opcodes_h_l2360_c7_7bdf_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2367_c7_96c1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2367_c7_96c1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2367_c7_96c1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2367_c7_96c1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2367_c7_96c1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2367_c7_96c1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2367_c7_96c1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2367_c7_96c1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2367_c7_96c1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2367_c7_96c1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2367_c7_96c1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2367_c7_96c1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2367_c7_96c1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2367_c7_96c1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2367_c7_96c1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2367_c7_96c1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2367_c7_96c1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2367_c7_96c1_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2364_c7_daa5] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2364_c7_daa5_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2364_c7_daa5_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2364_c7_daa5_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2364_c7_daa5_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2364_c7_daa5_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2364_c7_daa5_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2364_c7_daa5_return_output := result_stack_value_MUX_uxn_opcodes_h_l2364_c7_daa5_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2360_c7_7bdf] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2360_c7_7bdf_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2360_c7_7bdf_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2360_c7_7bdf_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2360_c7_7bdf_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2360_c7_7bdf_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2360_c7_7bdf_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2360_c7_7bdf_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2360_c7_7bdf_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2364_c7_daa5] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_daa5_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_daa5_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_daa5_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_daa5_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_daa5_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_daa5_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_daa5_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_daa5_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2367_c7_96c1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2367_c7_96c1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2367_c7_96c1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2367_c7_96c1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2367_c7_96c1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2367_c7_96c1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2367_c7_96c1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2367_c7_96c1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2367_c7_96c1_return_output;

     -- t8_MUX[uxn_opcodes_h_l2351_c2_b9b8] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2351_c2_b9b8_cond <= VAR_t8_MUX_uxn_opcodes_h_l2351_c2_b9b8_cond;
     t8_MUX_uxn_opcodes_h_l2351_c2_b9b8_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2351_c2_b9b8_iftrue;
     t8_MUX_uxn_opcodes_h_l2351_c2_b9b8_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2351_c2_b9b8_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2351_c2_b9b8_return_output := t8_MUX_uxn_opcodes_h_l2351_c2_b9b8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2364_c7_daa5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_daa5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_daa5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_daa5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_daa5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_daa5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_daa5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_daa5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_daa5_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l2357_c7_facd_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2360_c7_7bdf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_daa5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2367_c7_96c1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2360_c7_7bdf_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_daa5_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2357_c7_facd_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2360_c7_7bdf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_daa5_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2367_c7_96c1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_daa5_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2367_c7_96c1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_7bdf_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_daa5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2360_c7_7bdf_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2364_c7_daa5_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l2351_c2_b9b8_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l2357_c7_facd] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2357_c7_facd_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2357_c7_facd_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2357_c7_facd_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2357_c7_facd_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2357_c7_facd_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2357_c7_facd_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2357_c7_facd_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2357_c7_facd_return_output;

     -- n8_MUX[uxn_opcodes_h_l2357_c7_facd] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2357_c7_facd_cond <= VAR_n8_MUX_uxn_opcodes_h_l2357_c7_facd_cond;
     n8_MUX_uxn_opcodes_h_l2357_c7_facd_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2357_c7_facd_iftrue;
     n8_MUX_uxn_opcodes_h_l2357_c7_facd_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2357_c7_facd_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2357_c7_facd_return_output := n8_MUX_uxn_opcodes_h_l2357_c7_facd_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2360_c7_7bdf] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2360_c7_7bdf_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2360_c7_7bdf_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2360_c7_7bdf_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2360_c7_7bdf_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2360_c7_7bdf_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2360_c7_7bdf_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2360_c7_7bdf_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2360_c7_7bdf_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2360_c7_7bdf] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_7bdf_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_7bdf_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_7bdf_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_7bdf_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_7bdf_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_7bdf_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_7bdf_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_7bdf_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2364_c7_daa5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_daa5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_daa5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_daa5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_daa5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_daa5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_daa5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_daa5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_daa5_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2360_c7_7bdf] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2360_c7_7bdf_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2360_c7_7bdf_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2360_c7_7bdf_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2360_c7_7bdf_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2360_c7_7bdf_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2360_c7_7bdf_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2360_c7_7bdf_return_output := result_stack_value_MUX_uxn_opcodes_h_l2360_c7_7bdf_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2364_c7_daa5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_daa5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_daa5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_daa5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_daa5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_daa5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_daa5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_daa5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_daa5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2364_c7_daa5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_daa5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_daa5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_daa5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_daa5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_daa5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_daa5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_daa5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_daa5_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l2351_c2_b9b8_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2357_c7_facd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_7bdf_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_daa5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2357_c7_facd_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2360_c7_7bdf_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2351_c2_b9b8_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2357_c7_facd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2360_c7_7bdf_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_daa5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_7bdf_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_daa5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c7_facd_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_7bdf_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2357_c7_facd_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2360_c7_7bdf_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2360_c7_7bdf] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2360_c7_7bdf_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2360_c7_7bdf_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2360_c7_7bdf_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2360_c7_7bdf_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2360_c7_7bdf_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2360_c7_7bdf_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2360_c7_7bdf_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2360_c7_7bdf_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2357_c7_facd] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c7_facd_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c7_facd_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c7_facd_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c7_facd_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c7_facd_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c7_facd_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c7_facd_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c7_facd_return_output;

     -- n8_MUX[uxn_opcodes_h_l2351_c2_b9b8] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2351_c2_b9b8_cond <= VAR_n8_MUX_uxn_opcodes_h_l2351_c2_b9b8_cond;
     n8_MUX_uxn_opcodes_h_l2351_c2_b9b8_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2351_c2_b9b8_iftrue;
     n8_MUX_uxn_opcodes_h_l2351_c2_b9b8_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2351_c2_b9b8_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2351_c2_b9b8_return_output := n8_MUX_uxn_opcodes_h_l2351_c2_b9b8_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2360_c7_7bdf] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_7bdf_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_7bdf_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_7bdf_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_7bdf_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_7bdf_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_7bdf_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_7bdf_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_7bdf_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2357_c7_facd] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2357_c7_facd_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2357_c7_facd_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2357_c7_facd_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2357_c7_facd_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2357_c7_facd_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2357_c7_facd_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2357_c7_facd_return_output := result_stack_value_MUX_uxn_opcodes_h_l2357_c7_facd_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2357_c7_facd] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2357_c7_facd_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2357_c7_facd_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2357_c7_facd_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2357_c7_facd_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2357_c7_facd_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2357_c7_facd_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2357_c7_facd_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2357_c7_facd_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2360_c7_7bdf] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_7bdf_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_7bdf_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_7bdf_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_7bdf_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_7bdf_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_7bdf_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_7bdf_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_7bdf_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2351_c2_b9b8] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2351_c2_b9b8_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2351_c2_b9b8_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2351_c2_b9b8_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2351_c2_b9b8_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2351_c2_b9b8_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2351_c2_b9b8_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2351_c2_b9b8_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2351_c2_b9b8_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l2351_c2_b9b8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2357_c7_facd_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_7bdf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2351_c2_b9b8_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2357_c7_facd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2357_c7_facd_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2360_c7_7bdf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c7_facd_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_7bdf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2351_c2_b9b8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c7_facd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2351_c2_b9b8_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2357_c7_facd_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2357_c7_facd] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2357_c7_facd_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2357_c7_facd_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2357_c7_facd_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2357_c7_facd_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2357_c7_facd_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2357_c7_facd_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2357_c7_facd_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2357_c7_facd_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2351_c2_b9b8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2351_c2_b9b8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2351_c2_b9b8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2351_c2_b9b8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2351_c2_b9b8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2351_c2_b9b8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2351_c2_b9b8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2351_c2_b9b8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2351_c2_b9b8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2357_c7_facd] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2357_c7_facd_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2357_c7_facd_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2357_c7_facd_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2357_c7_facd_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2357_c7_facd_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2357_c7_facd_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2357_c7_facd_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2357_c7_facd_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2351_c2_b9b8] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2351_c2_b9b8_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2351_c2_b9b8_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2351_c2_b9b8_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2351_c2_b9b8_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2351_c2_b9b8_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2351_c2_b9b8_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2351_c2_b9b8_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2351_c2_b9b8_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2357_c7_facd] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c7_facd_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c7_facd_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c7_facd_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c7_facd_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c7_facd_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c7_facd_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c7_facd_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c7_facd_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2351_c2_b9b8] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2351_c2_b9b8_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2351_c2_b9b8_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2351_c2_b9b8_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2351_c2_b9b8_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2351_c2_b9b8_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2351_c2_b9b8_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2351_c2_b9b8_return_output := result_stack_value_MUX_uxn_opcodes_h_l2351_c2_b9b8_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2351_c2_b9b8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2357_c7_facd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2351_c2_b9b8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2357_c7_facd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2351_c2_b9b8_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c7_facd_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2351_c2_b9b8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2351_c2_b9b8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2351_c2_b9b8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2351_c2_b9b8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2351_c2_b9b8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2351_c2_b9b8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2351_c2_b9b8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2351_c2_b9b8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2351_c2_b9b8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2351_c2_b9b8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2351_c2_b9b8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2351_c2_b9b8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2351_c2_b9b8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2351_c2_b9b8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2351_c2_b9b8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2351_c2_b9b8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2351_c2_b9b8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2351_c2_b9b8_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2351_c2_b9b8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2351_c2_b9b8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2351_c2_b9b8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2351_c2_b9b8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2351_c2_b9b8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2351_c2_b9b8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2351_c2_b9b8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2351_c2_b9b8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2351_c2_b9b8_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_df93_uxn_opcodes_h_l2384_l2347_DUPLICATE_f3c2 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_df93_uxn_opcodes_h_l2384_l2347_DUPLICATE_f3c2_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_df93(
     result,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2351_c2_b9b8_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2351_c2_b9b8_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2351_c2_b9b8_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2351_c2_b9b8_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2351_c2_b9b8_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2351_c2_b9b8_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2351_c2_b9b8_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_df93_uxn_opcodes_h_l2384_l2347_DUPLICATE_f3c2_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_df93_uxn_opcodes_h_l2384_l2347_DUPLICATE_f3c2_return_output;
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
