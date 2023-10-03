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
-- Submodules: 108
entity lth2_0CLK_5fcb251d is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end lth2_0CLK_5fcb251d;
architecture arch of lth2_0CLK_5fcb251d is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1204_c6_62ef]
signal BIN_OP_EQ_uxn_opcodes_h_l1204_c6_62ef_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1204_c6_62ef_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1204_c6_62ef_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1204_c1_12fe]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1204_c1_12fe_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1204_c1_12fe_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1204_c1_12fe_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1204_c1_12fe_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1204_c2_fee4]
signal n16_MUX_uxn_opcodes_h_l1204_c2_fee4_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1204_c2_fee4_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1204_c2_fee4_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1204_c2_fee4_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1204_c2_fee4]
signal t16_MUX_uxn_opcodes_h_l1204_c2_fee4_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1204_c2_fee4_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1204_c2_fee4_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1204_c2_fee4_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1204_c2_fee4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1204_c2_fee4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1204_c2_fee4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1204_c2_fee4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1204_c2_fee4_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1204_c2_fee4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1204_c2_fee4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1204_c2_fee4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1204_c2_fee4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1204_c2_fee4_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1204_c2_fee4]
signal result_stack_value_MUX_uxn_opcodes_h_l1204_c2_fee4_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1204_c2_fee4_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1204_c2_fee4_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1204_c2_fee4_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1204_c2_fee4]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1204_c2_fee4_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1204_c2_fee4_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1204_c2_fee4_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1204_c2_fee4_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1204_c2_fee4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1204_c2_fee4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1204_c2_fee4_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1204_c2_fee4_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1204_c2_fee4_return_output : signed(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1204_c2_fee4]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1204_c2_fee4_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1204_c2_fee4_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1204_c2_fee4_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1204_c2_fee4_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1204_c2_fee4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1204_c2_fee4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1204_c2_fee4_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1204_c2_fee4_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1204_c2_fee4_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1204_c2_fee4]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1204_c2_fee4_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1204_c2_fee4_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1204_c2_fee4_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1204_c2_fee4_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l1205_c3_80f1[uxn_opcodes_h_l1205_c3_80f1]
signal printf_uxn_opcodes_h_l1205_c3_80f1_uxn_opcodes_h_l1205_c3_80f1_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1212_c11_d937]
signal BIN_OP_EQ_uxn_opcodes_h_l1212_c11_d937_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1212_c11_d937_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1212_c11_d937_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1212_c7_e6e0]
signal n16_MUX_uxn_opcodes_h_l1212_c7_e6e0_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1212_c7_e6e0_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1212_c7_e6e0_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1212_c7_e6e0_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1212_c7_e6e0]
signal t16_MUX_uxn_opcodes_h_l1212_c7_e6e0_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1212_c7_e6e0_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1212_c7_e6e0_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1212_c7_e6e0_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1212_c7_e6e0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_e6e0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_e6e0_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_e6e0_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_e6e0_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1212_c7_e6e0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_e6e0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_e6e0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_e6e0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_e6e0_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1212_c7_e6e0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_e6e0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_e6e0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_e6e0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_e6e0_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1212_c7_e6e0]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_e6e0_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_e6e0_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_e6e0_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_e6e0_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1212_c7_e6e0]
signal result_stack_value_MUX_uxn_opcodes_h_l1212_c7_e6e0_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1212_c7_e6e0_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1212_c7_e6e0_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1212_c7_e6e0_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1212_c7_e6e0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1212_c7_e6e0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1212_c7_e6e0_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1212_c7_e6e0_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1212_c7_e6e0_return_output : signed(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1212_c7_e6e0]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1212_c7_e6e0_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1212_c7_e6e0_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1212_c7_e6e0_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1212_c7_e6e0_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1216_c11_3193]
signal BIN_OP_EQ_uxn_opcodes_h_l1216_c11_3193_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1216_c11_3193_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1216_c11_3193_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1216_c7_ad8a]
signal n16_MUX_uxn_opcodes_h_l1216_c7_ad8a_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1216_c7_ad8a_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1216_c7_ad8a_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1216_c7_ad8a_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1216_c7_ad8a]
signal t16_MUX_uxn_opcodes_h_l1216_c7_ad8a_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1216_c7_ad8a_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1216_c7_ad8a_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1216_c7_ad8a_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1216_c7_ad8a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1216_c7_ad8a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1216_c7_ad8a_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1216_c7_ad8a_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1216_c7_ad8a_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1216_c7_ad8a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1216_c7_ad8a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1216_c7_ad8a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1216_c7_ad8a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1216_c7_ad8a_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1216_c7_ad8a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1216_c7_ad8a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1216_c7_ad8a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1216_c7_ad8a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1216_c7_ad8a_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1216_c7_ad8a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1216_c7_ad8a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1216_c7_ad8a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1216_c7_ad8a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1216_c7_ad8a_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1216_c7_ad8a]
signal result_stack_value_MUX_uxn_opcodes_h_l1216_c7_ad8a_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1216_c7_ad8a_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1216_c7_ad8a_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1216_c7_ad8a_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1216_c7_ad8a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1216_c7_ad8a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1216_c7_ad8a_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1216_c7_ad8a_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1216_c7_ad8a_return_output : signed(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1216_c7_ad8a]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1216_c7_ad8a_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1216_c7_ad8a_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1216_c7_ad8a_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1216_c7_ad8a_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1222_c11_dd38]
signal BIN_OP_EQ_uxn_opcodes_h_l1222_c11_dd38_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1222_c11_dd38_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1222_c11_dd38_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1222_c7_da3d]
signal n16_MUX_uxn_opcodes_h_l1222_c7_da3d_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1222_c7_da3d_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1222_c7_da3d_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1222_c7_da3d_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1222_c7_da3d]
signal t16_MUX_uxn_opcodes_h_l1222_c7_da3d_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1222_c7_da3d_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1222_c7_da3d_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1222_c7_da3d_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1222_c7_da3d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_da3d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_da3d_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_da3d_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_da3d_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1222_c7_da3d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_da3d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_da3d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_da3d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_da3d_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1222_c7_da3d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_da3d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_da3d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_da3d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_da3d_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1222_c7_da3d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1222_c7_da3d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1222_c7_da3d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1222_c7_da3d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1222_c7_da3d_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1222_c7_da3d]
signal result_stack_value_MUX_uxn_opcodes_h_l1222_c7_da3d_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1222_c7_da3d_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1222_c7_da3d_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1222_c7_da3d_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1222_c7_da3d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_da3d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_da3d_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_da3d_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_da3d_return_output : signed(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1222_c7_da3d]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1222_c7_da3d_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1222_c7_da3d_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1222_c7_da3d_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1222_c7_da3d_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1226_c11_3bb5]
signal BIN_OP_EQ_uxn_opcodes_h_l1226_c11_3bb5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1226_c11_3bb5_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1226_c11_3bb5_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1226_c7_fcb5]
signal n16_MUX_uxn_opcodes_h_l1226_c7_fcb5_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1226_c7_fcb5_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1226_c7_fcb5_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1226_c7_fcb5_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1226_c7_fcb5]
signal t16_MUX_uxn_opcodes_h_l1226_c7_fcb5_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1226_c7_fcb5_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1226_c7_fcb5_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1226_c7_fcb5_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1226_c7_fcb5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_fcb5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_fcb5_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_fcb5_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_fcb5_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1226_c7_fcb5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_fcb5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_fcb5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_fcb5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_fcb5_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1226_c7_fcb5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_fcb5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_fcb5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_fcb5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_fcb5_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1226_c7_fcb5]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1226_c7_fcb5_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1226_c7_fcb5_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1226_c7_fcb5_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1226_c7_fcb5_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1226_c7_fcb5]
signal result_stack_value_MUX_uxn_opcodes_h_l1226_c7_fcb5_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1226_c7_fcb5_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1226_c7_fcb5_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1226_c7_fcb5_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1226_c7_fcb5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_fcb5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_fcb5_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_fcb5_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_fcb5_return_output : signed(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1226_c7_fcb5]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1226_c7_fcb5_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1226_c7_fcb5_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1226_c7_fcb5_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1226_c7_fcb5_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1227_c3_3d32]
signal BIN_OP_OR_uxn_opcodes_h_l1227_c3_3d32_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1227_c3_3d32_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1227_c3_3d32_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1231_c11_9c61]
signal BIN_OP_EQ_uxn_opcodes_h_l1231_c11_9c61_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1231_c11_9c61_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1231_c11_9c61_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1231_c7_4027]
signal n16_MUX_uxn_opcodes_h_l1231_c7_4027_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1231_c7_4027_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1231_c7_4027_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1231_c7_4027_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1231_c7_4027]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1231_c7_4027_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1231_c7_4027_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1231_c7_4027_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1231_c7_4027_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1231_c7_4027]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1231_c7_4027_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1231_c7_4027_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1231_c7_4027_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1231_c7_4027_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1231_c7_4027]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1231_c7_4027_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1231_c7_4027_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1231_c7_4027_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1231_c7_4027_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1231_c7_4027]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1231_c7_4027_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1231_c7_4027_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1231_c7_4027_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1231_c7_4027_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1231_c7_4027]
signal result_stack_value_MUX_uxn_opcodes_h_l1231_c7_4027_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1231_c7_4027_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1231_c7_4027_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1231_c7_4027_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1231_c7_4027]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1231_c7_4027_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1231_c7_4027_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1231_c7_4027_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1231_c7_4027_return_output : signed(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1231_c7_4027]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1231_c7_4027_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1231_c7_4027_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1231_c7_4027_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1231_c7_4027_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1235_c11_33cb]
signal BIN_OP_EQ_uxn_opcodes_h_l1235_c11_33cb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1235_c11_33cb_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1235_c11_33cb_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1235_c7_193f]
signal n16_MUX_uxn_opcodes_h_l1235_c7_193f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1235_c7_193f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1235_c7_193f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1235_c7_193f_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1235_c7_193f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1235_c7_193f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1235_c7_193f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1235_c7_193f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1235_c7_193f_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1235_c7_193f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1235_c7_193f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1235_c7_193f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1235_c7_193f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1235_c7_193f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1235_c7_193f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1235_c7_193f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1235_c7_193f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1235_c7_193f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1235_c7_193f_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1235_c7_193f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1235_c7_193f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1235_c7_193f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1235_c7_193f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1235_c7_193f_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1235_c7_193f]
signal result_stack_value_MUX_uxn_opcodes_h_l1235_c7_193f_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1235_c7_193f_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1235_c7_193f_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1235_c7_193f_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1235_c7_193f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1235_c7_193f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1235_c7_193f_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1235_c7_193f_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1235_c7_193f_return_output : signed(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1235_c7_193f]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1235_c7_193f_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1235_c7_193f_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1235_c7_193f_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1235_c7_193f_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1241_c11_7de7]
signal BIN_OP_EQ_uxn_opcodes_h_l1241_c11_7de7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1241_c11_7de7_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1241_c11_7de7_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1241_c7_d234]
signal n16_MUX_uxn_opcodes_h_l1241_c7_d234_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1241_c7_d234_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1241_c7_d234_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1241_c7_d234_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1241_c7_d234]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_d234_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_d234_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_d234_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_d234_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1241_c7_d234]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_d234_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_d234_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_d234_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_d234_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1241_c7_d234]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_d234_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_d234_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_d234_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_d234_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1241_c7_d234]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_d234_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_d234_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_d234_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_d234_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1241_c7_d234]
signal result_stack_value_MUX_uxn_opcodes_h_l1241_c7_d234_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1241_c7_d234_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1241_c7_d234_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1241_c7_d234_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1241_c7_d234]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_d234_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_d234_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_d234_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_d234_return_output : signed(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1241_c7_d234]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1241_c7_d234_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1241_c7_d234_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1241_c7_d234_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1241_c7_d234_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1245_c11_1c01]
signal BIN_OP_EQ_uxn_opcodes_h_l1245_c11_1c01_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1245_c11_1c01_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1245_c11_1c01_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1245_c7_c654]
signal n16_MUX_uxn_opcodes_h_l1245_c7_c654_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1245_c7_c654_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1245_c7_c654_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1245_c7_c654_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1245_c7_c654]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_c654_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_c654_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_c654_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_c654_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1245_c7_c654]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_c654_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_c654_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_c654_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_c654_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1245_c7_c654]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_c654_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_c654_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_c654_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_c654_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1245_c7_c654]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1245_c7_c654_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1245_c7_c654_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1245_c7_c654_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1245_c7_c654_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1245_c7_c654]
signal result_stack_value_MUX_uxn_opcodes_h_l1245_c7_c654_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1245_c7_c654_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1245_c7_c654_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1245_c7_c654_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1245_c7_c654]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_c654_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_c654_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_c654_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_c654_return_output : signed(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1245_c7_c654]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1245_c7_c654_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1245_c7_c654_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1245_c7_c654_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1245_c7_c654_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1246_c3_cd80]
signal BIN_OP_OR_uxn_opcodes_h_l1246_c3_cd80_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1246_c3_cd80_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1246_c3_cd80_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1249_c32_8d83]
signal BIN_OP_AND_uxn_opcodes_h_l1249_c32_8d83_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1249_c32_8d83_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1249_c32_8d83_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1249_c32_736b]
signal BIN_OP_GT_uxn_opcodes_h_l1249_c32_736b_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1249_c32_736b_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1249_c32_736b_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1249_c32_14f3]
signal MUX_uxn_opcodes_h_l1249_c32_14f3_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1249_c32_14f3_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1249_c32_14f3_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1249_c32_14f3_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1251_c11_df43]
signal BIN_OP_EQ_uxn_opcodes_h_l1251_c11_df43_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1251_c11_df43_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1251_c11_df43_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1251_c7_1e58]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1251_c7_1e58_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1251_c7_1e58_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1251_c7_1e58_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1251_c7_1e58_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1251_c7_1e58]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1251_c7_1e58_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1251_c7_1e58_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1251_c7_1e58_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1251_c7_1e58_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1251_c7_1e58]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1251_c7_1e58_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1251_c7_1e58_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1251_c7_1e58_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1251_c7_1e58_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1251_c7_1e58]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1251_c7_1e58_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1251_c7_1e58_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1251_c7_1e58_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1251_c7_1e58_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1251_c7_1e58]
signal result_stack_value_MUX_uxn_opcodes_h_l1251_c7_1e58_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1251_c7_1e58_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1251_c7_1e58_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1251_c7_1e58_return_output : unsigned(7 downto 0);

-- BIN_OP_LT[uxn_opcodes_h_l1255_c24_3bca]
signal BIN_OP_LT_uxn_opcodes_h_l1255_c24_3bca_left : unsigned(15 downto 0);
signal BIN_OP_LT_uxn_opcodes_h_l1255_c24_3bca_right : unsigned(15 downto 0);
signal BIN_OP_LT_uxn_opcodes_h_l1255_c24_3bca_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1255_c24_9821]
signal MUX_uxn_opcodes_h_l1255_c24_9821_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1255_c24_9821_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1255_c24_9821_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1255_c24_9821_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1257_c11_92b6]
signal BIN_OP_EQ_uxn_opcodes_h_l1257_c11_92b6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1257_c11_92b6_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1257_c11_92b6_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1257_c7_81bd]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_81bd_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_81bd_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_81bd_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_81bd_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1257_c7_81bd]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_81bd_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_81bd_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_81bd_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_81bd_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1237_l1218_DUPLICATE_71af
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1237_l1218_DUPLICATE_71af_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1237_l1218_DUPLICATE_71af_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_49dd( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : signed;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_opc_done := ref_toks_1;
      base.is_stack_write := ref_toks_2;
      base.stack_value := ref_toks_3;
      base.is_stack_index_flipped := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.is_stack_read := ref_toks_6;
      base.stack_address_sp_offset := ref_toks_7;
      base.is_sp_shift := ref_toks_8;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1204_c6_62ef
BIN_OP_EQ_uxn_opcodes_h_l1204_c6_62ef : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1204_c6_62ef_left,
BIN_OP_EQ_uxn_opcodes_h_l1204_c6_62ef_right,
BIN_OP_EQ_uxn_opcodes_h_l1204_c6_62ef_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1204_c1_12fe
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1204_c1_12fe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1204_c1_12fe_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1204_c1_12fe_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1204_c1_12fe_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1204_c1_12fe_return_output);

-- n16_MUX_uxn_opcodes_h_l1204_c2_fee4
n16_MUX_uxn_opcodes_h_l1204_c2_fee4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1204_c2_fee4_cond,
n16_MUX_uxn_opcodes_h_l1204_c2_fee4_iftrue,
n16_MUX_uxn_opcodes_h_l1204_c2_fee4_iffalse,
n16_MUX_uxn_opcodes_h_l1204_c2_fee4_return_output);

-- t16_MUX_uxn_opcodes_h_l1204_c2_fee4
t16_MUX_uxn_opcodes_h_l1204_c2_fee4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1204_c2_fee4_cond,
t16_MUX_uxn_opcodes_h_l1204_c2_fee4_iftrue,
t16_MUX_uxn_opcodes_h_l1204_c2_fee4_iffalse,
t16_MUX_uxn_opcodes_h_l1204_c2_fee4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1204_c2_fee4
result_is_opc_done_MUX_uxn_opcodes_h_l1204_c2_fee4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1204_c2_fee4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1204_c2_fee4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1204_c2_fee4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1204_c2_fee4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1204_c2_fee4
result_is_stack_write_MUX_uxn_opcodes_h_l1204_c2_fee4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1204_c2_fee4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1204_c2_fee4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1204_c2_fee4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1204_c2_fee4_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1204_c2_fee4
result_stack_value_MUX_uxn_opcodes_h_l1204_c2_fee4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1204_c2_fee4_cond,
result_stack_value_MUX_uxn_opcodes_h_l1204_c2_fee4_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1204_c2_fee4_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1204_c2_fee4_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1204_c2_fee4
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1204_c2_fee4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1204_c2_fee4_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1204_c2_fee4_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1204_c2_fee4_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1204_c2_fee4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1204_c2_fee4
result_sp_relative_shift_MUX_uxn_opcodes_h_l1204_c2_fee4 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1204_c2_fee4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1204_c2_fee4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1204_c2_fee4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1204_c2_fee4_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1204_c2_fee4
result_is_stack_read_MUX_uxn_opcodes_h_l1204_c2_fee4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1204_c2_fee4_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1204_c2_fee4_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1204_c2_fee4_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1204_c2_fee4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1204_c2_fee4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1204_c2_fee4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1204_c2_fee4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1204_c2_fee4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1204_c2_fee4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1204_c2_fee4_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1204_c2_fee4
result_is_sp_shift_MUX_uxn_opcodes_h_l1204_c2_fee4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1204_c2_fee4_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1204_c2_fee4_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1204_c2_fee4_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1204_c2_fee4_return_output);

-- printf_uxn_opcodes_h_l1205_c3_80f1_uxn_opcodes_h_l1205_c3_80f1
printf_uxn_opcodes_h_l1205_c3_80f1_uxn_opcodes_h_l1205_c3_80f1 : entity work.printf_uxn_opcodes_h_l1205_c3_80f1_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1205_c3_80f1_uxn_opcodes_h_l1205_c3_80f1_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1212_c11_d937
BIN_OP_EQ_uxn_opcodes_h_l1212_c11_d937 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1212_c11_d937_left,
BIN_OP_EQ_uxn_opcodes_h_l1212_c11_d937_right,
BIN_OP_EQ_uxn_opcodes_h_l1212_c11_d937_return_output);

-- n16_MUX_uxn_opcodes_h_l1212_c7_e6e0
n16_MUX_uxn_opcodes_h_l1212_c7_e6e0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1212_c7_e6e0_cond,
n16_MUX_uxn_opcodes_h_l1212_c7_e6e0_iftrue,
n16_MUX_uxn_opcodes_h_l1212_c7_e6e0_iffalse,
n16_MUX_uxn_opcodes_h_l1212_c7_e6e0_return_output);

-- t16_MUX_uxn_opcodes_h_l1212_c7_e6e0
t16_MUX_uxn_opcodes_h_l1212_c7_e6e0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1212_c7_e6e0_cond,
t16_MUX_uxn_opcodes_h_l1212_c7_e6e0_iftrue,
t16_MUX_uxn_opcodes_h_l1212_c7_e6e0_iffalse,
t16_MUX_uxn_opcodes_h_l1212_c7_e6e0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_e6e0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_e6e0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_e6e0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_e6e0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_e6e0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_e6e0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_e6e0
result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_e6e0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_e6e0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_e6e0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_e6e0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_e6e0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_e6e0
result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_e6e0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_e6e0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_e6e0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_e6e0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_e6e0_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_e6e0
result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_e6e0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_e6e0_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_e6e0_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_e6e0_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_e6e0_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1212_c7_e6e0
result_stack_value_MUX_uxn_opcodes_h_l1212_c7_e6e0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1212_c7_e6e0_cond,
result_stack_value_MUX_uxn_opcodes_h_l1212_c7_e6e0_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1212_c7_e6e0_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1212_c7_e6e0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1212_c7_e6e0
result_sp_relative_shift_MUX_uxn_opcodes_h_l1212_c7_e6e0 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1212_c7_e6e0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1212_c7_e6e0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1212_c7_e6e0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1212_c7_e6e0_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1212_c7_e6e0
result_is_stack_read_MUX_uxn_opcodes_h_l1212_c7_e6e0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1212_c7_e6e0_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1212_c7_e6e0_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1212_c7_e6e0_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1212_c7_e6e0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1216_c11_3193
BIN_OP_EQ_uxn_opcodes_h_l1216_c11_3193 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1216_c11_3193_left,
BIN_OP_EQ_uxn_opcodes_h_l1216_c11_3193_right,
BIN_OP_EQ_uxn_opcodes_h_l1216_c11_3193_return_output);

-- n16_MUX_uxn_opcodes_h_l1216_c7_ad8a
n16_MUX_uxn_opcodes_h_l1216_c7_ad8a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1216_c7_ad8a_cond,
n16_MUX_uxn_opcodes_h_l1216_c7_ad8a_iftrue,
n16_MUX_uxn_opcodes_h_l1216_c7_ad8a_iffalse,
n16_MUX_uxn_opcodes_h_l1216_c7_ad8a_return_output);

-- t16_MUX_uxn_opcodes_h_l1216_c7_ad8a
t16_MUX_uxn_opcodes_h_l1216_c7_ad8a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1216_c7_ad8a_cond,
t16_MUX_uxn_opcodes_h_l1216_c7_ad8a_iftrue,
t16_MUX_uxn_opcodes_h_l1216_c7_ad8a_iffalse,
t16_MUX_uxn_opcodes_h_l1216_c7_ad8a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1216_c7_ad8a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1216_c7_ad8a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1216_c7_ad8a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1216_c7_ad8a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1216_c7_ad8a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1216_c7_ad8a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1216_c7_ad8a
result_is_opc_done_MUX_uxn_opcodes_h_l1216_c7_ad8a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1216_c7_ad8a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1216_c7_ad8a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1216_c7_ad8a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1216_c7_ad8a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1216_c7_ad8a
result_is_stack_write_MUX_uxn_opcodes_h_l1216_c7_ad8a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1216_c7_ad8a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1216_c7_ad8a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1216_c7_ad8a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1216_c7_ad8a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1216_c7_ad8a
result_is_sp_shift_MUX_uxn_opcodes_h_l1216_c7_ad8a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1216_c7_ad8a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1216_c7_ad8a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1216_c7_ad8a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1216_c7_ad8a_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1216_c7_ad8a
result_stack_value_MUX_uxn_opcodes_h_l1216_c7_ad8a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1216_c7_ad8a_cond,
result_stack_value_MUX_uxn_opcodes_h_l1216_c7_ad8a_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1216_c7_ad8a_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1216_c7_ad8a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1216_c7_ad8a
result_sp_relative_shift_MUX_uxn_opcodes_h_l1216_c7_ad8a : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1216_c7_ad8a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1216_c7_ad8a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1216_c7_ad8a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1216_c7_ad8a_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1216_c7_ad8a
result_is_stack_read_MUX_uxn_opcodes_h_l1216_c7_ad8a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1216_c7_ad8a_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1216_c7_ad8a_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1216_c7_ad8a_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1216_c7_ad8a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1222_c11_dd38
BIN_OP_EQ_uxn_opcodes_h_l1222_c11_dd38 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1222_c11_dd38_left,
BIN_OP_EQ_uxn_opcodes_h_l1222_c11_dd38_right,
BIN_OP_EQ_uxn_opcodes_h_l1222_c11_dd38_return_output);

-- n16_MUX_uxn_opcodes_h_l1222_c7_da3d
n16_MUX_uxn_opcodes_h_l1222_c7_da3d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1222_c7_da3d_cond,
n16_MUX_uxn_opcodes_h_l1222_c7_da3d_iftrue,
n16_MUX_uxn_opcodes_h_l1222_c7_da3d_iffalse,
n16_MUX_uxn_opcodes_h_l1222_c7_da3d_return_output);

-- t16_MUX_uxn_opcodes_h_l1222_c7_da3d
t16_MUX_uxn_opcodes_h_l1222_c7_da3d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1222_c7_da3d_cond,
t16_MUX_uxn_opcodes_h_l1222_c7_da3d_iftrue,
t16_MUX_uxn_opcodes_h_l1222_c7_da3d_iffalse,
t16_MUX_uxn_opcodes_h_l1222_c7_da3d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_da3d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_da3d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_da3d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_da3d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_da3d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_da3d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_da3d
result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_da3d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_da3d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_da3d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_da3d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_da3d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_da3d
result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_da3d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_da3d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_da3d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_da3d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_da3d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1222_c7_da3d
result_is_sp_shift_MUX_uxn_opcodes_h_l1222_c7_da3d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1222_c7_da3d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1222_c7_da3d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1222_c7_da3d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1222_c7_da3d_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1222_c7_da3d
result_stack_value_MUX_uxn_opcodes_h_l1222_c7_da3d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1222_c7_da3d_cond,
result_stack_value_MUX_uxn_opcodes_h_l1222_c7_da3d_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1222_c7_da3d_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1222_c7_da3d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_da3d
result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_da3d : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_da3d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_da3d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_da3d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_da3d_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1222_c7_da3d
result_is_stack_read_MUX_uxn_opcodes_h_l1222_c7_da3d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1222_c7_da3d_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1222_c7_da3d_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1222_c7_da3d_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1222_c7_da3d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1226_c11_3bb5
BIN_OP_EQ_uxn_opcodes_h_l1226_c11_3bb5 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1226_c11_3bb5_left,
BIN_OP_EQ_uxn_opcodes_h_l1226_c11_3bb5_right,
BIN_OP_EQ_uxn_opcodes_h_l1226_c11_3bb5_return_output);

-- n16_MUX_uxn_opcodes_h_l1226_c7_fcb5
n16_MUX_uxn_opcodes_h_l1226_c7_fcb5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1226_c7_fcb5_cond,
n16_MUX_uxn_opcodes_h_l1226_c7_fcb5_iftrue,
n16_MUX_uxn_opcodes_h_l1226_c7_fcb5_iffalse,
n16_MUX_uxn_opcodes_h_l1226_c7_fcb5_return_output);

-- t16_MUX_uxn_opcodes_h_l1226_c7_fcb5
t16_MUX_uxn_opcodes_h_l1226_c7_fcb5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1226_c7_fcb5_cond,
t16_MUX_uxn_opcodes_h_l1226_c7_fcb5_iftrue,
t16_MUX_uxn_opcodes_h_l1226_c7_fcb5_iffalse,
t16_MUX_uxn_opcodes_h_l1226_c7_fcb5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_fcb5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_fcb5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_fcb5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_fcb5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_fcb5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_fcb5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_fcb5
result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_fcb5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_fcb5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_fcb5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_fcb5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_fcb5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_fcb5
result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_fcb5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_fcb5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_fcb5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_fcb5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_fcb5_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1226_c7_fcb5
result_is_sp_shift_MUX_uxn_opcodes_h_l1226_c7_fcb5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1226_c7_fcb5_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1226_c7_fcb5_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1226_c7_fcb5_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1226_c7_fcb5_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1226_c7_fcb5
result_stack_value_MUX_uxn_opcodes_h_l1226_c7_fcb5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1226_c7_fcb5_cond,
result_stack_value_MUX_uxn_opcodes_h_l1226_c7_fcb5_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1226_c7_fcb5_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1226_c7_fcb5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_fcb5
result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_fcb5 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_fcb5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_fcb5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_fcb5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_fcb5_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1226_c7_fcb5
result_is_stack_read_MUX_uxn_opcodes_h_l1226_c7_fcb5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1226_c7_fcb5_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1226_c7_fcb5_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1226_c7_fcb5_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1226_c7_fcb5_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1227_c3_3d32
BIN_OP_OR_uxn_opcodes_h_l1227_c3_3d32 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1227_c3_3d32_left,
BIN_OP_OR_uxn_opcodes_h_l1227_c3_3d32_right,
BIN_OP_OR_uxn_opcodes_h_l1227_c3_3d32_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1231_c11_9c61
BIN_OP_EQ_uxn_opcodes_h_l1231_c11_9c61 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1231_c11_9c61_left,
BIN_OP_EQ_uxn_opcodes_h_l1231_c11_9c61_right,
BIN_OP_EQ_uxn_opcodes_h_l1231_c11_9c61_return_output);

-- n16_MUX_uxn_opcodes_h_l1231_c7_4027
n16_MUX_uxn_opcodes_h_l1231_c7_4027 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1231_c7_4027_cond,
n16_MUX_uxn_opcodes_h_l1231_c7_4027_iftrue,
n16_MUX_uxn_opcodes_h_l1231_c7_4027_iffalse,
n16_MUX_uxn_opcodes_h_l1231_c7_4027_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1231_c7_4027
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1231_c7_4027 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1231_c7_4027_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1231_c7_4027_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1231_c7_4027_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1231_c7_4027_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1231_c7_4027
result_is_opc_done_MUX_uxn_opcodes_h_l1231_c7_4027 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1231_c7_4027_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1231_c7_4027_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1231_c7_4027_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1231_c7_4027_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1231_c7_4027
result_is_stack_write_MUX_uxn_opcodes_h_l1231_c7_4027 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1231_c7_4027_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1231_c7_4027_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1231_c7_4027_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1231_c7_4027_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1231_c7_4027
result_is_sp_shift_MUX_uxn_opcodes_h_l1231_c7_4027 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1231_c7_4027_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1231_c7_4027_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1231_c7_4027_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1231_c7_4027_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1231_c7_4027
result_stack_value_MUX_uxn_opcodes_h_l1231_c7_4027 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1231_c7_4027_cond,
result_stack_value_MUX_uxn_opcodes_h_l1231_c7_4027_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1231_c7_4027_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1231_c7_4027_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1231_c7_4027
result_sp_relative_shift_MUX_uxn_opcodes_h_l1231_c7_4027 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1231_c7_4027_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1231_c7_4027_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1231_c7_4027_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1231_c7_4027_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1231_c7_4027
result_is_stack_read_MUX_uxn_opcodes_h_l1231_c7_4027 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1231_c7_4027_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1231_c7_4027_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1231_c7_4027_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1231_c7_4027_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1235_c11_33cb
BIN_OP_EQ_uxn_opcodes_h_l1235_c11_33cb : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1235_c11_33cb_left,
BIN_OP_EQ_uxn_opcodes_h_l1235_c11_33cb_right,
BIN_OP_EQ_uxn_opcodes_h_l1235_c11_33cb_return_output);

-- n16_MUX_uxn_opcodes_h_l1235_c7_193f
n16_MUX_uxn_opcodes_h_l1235_c7_193f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1235_c7_193f_cond,
n16_MUX_uxn_opcodes_h_l1235_c7_193f_iftrue,
n16_MUX_uxn_opcodes_h_l1235_c7_193f_iffalse,
n16_MUX_uxn_opcodes_h_l1235_c7_193f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1235_c7_193f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1235_c7_193f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1235_c7_193f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1235_c7_193f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1235_c7_193f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1235_c7_193f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1235_c7_193f
result_is_opc_done_MUX_uxn_opcodes_h_l1235_c7_193f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1235_c7_193f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1235_c7_193f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1235_c7_193f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1235_c7_193f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1235_c7_193f
result_is_stack_write_MUX_uxn_opcodes_h_l1235_c7_193f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1235_c7_193f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1235_c7_193f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1235_c7_193f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1235_c7_193f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1235_c7_193f
result_is_sp_shift_MUX_uxn_opcodes_h_l1235_c7_193f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1235_c7_193f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1235_c7_193f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1235_c7_193f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1235_c7_193f_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1235_c7_193f
result_stack_value_MUX_uxn_opcodes_h_l1235_c7_193f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1235_c7_193f_cond,
result_stack_value_MUX_uxn_opcodes_h_l1235_c7_193f_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1235_c7_193f_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1235_c7_193f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1235_c7_193f
result_sp_relative_shift_MUX_uxn_opcodes_h_l1235_c7_193f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1235_c7_193f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1235_c7_193f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1235_c7_193f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1235_c7_193f_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1235_c7_193f
result_is_stack_read_MUX_uxn_opcodes_h_l1235_c7_193f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1235_c7_193f_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1235_c7_193f_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1235_c7_193f_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1235_c7_193f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1241_c11_7de7
BIN_OP_EQ_uxn_opcodes_h_l1241_c11_7de7 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1241_c11_7de7_left,
BIN_OP_EQ_uxn_opcodes_h_l1241_c11_7de7_right,
BIN_OP_EQ_uxn_opcodes_h_l1241_c11_7de7_return_output);

-- n16_MUX_uxn_opcodes_h_l1241_c7_d234
n16_MUX_uxn_opcodes_h_l1241_c7_d234 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1241_c7_d234_cond,
n16_MUX_uxn_opcodes_h_l1241_c7_d234_iftrue,
n16_MUX_uxn_opcodes_h_l1241_c7_d234_iffalse,
n16_MUX_uxn_opcodes_h_l1241_c7_d234_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_d234
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_d234 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_d234_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_d234_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_d234_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_d234_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_d234
result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_d234 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_d234_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_d234_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_d234_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_d234_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_d234
result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_d234 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_d234_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_d234_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_d234_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_d234_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_d234
result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_d234 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_d234_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_d234_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_d234_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_d234_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1241_c7_d234
result_stack_value_MUX_uxn_opcodes_h_l1241_c7_d234 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1241_c7_d234_cond,
result_stack_value_MUX_uxn_opcodes_h_l1241_c7_d234_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1241_c7_d234_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1241_c7_d234_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_d234
result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_d234 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_d234_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_d234_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_d234_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_d234_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1241_c7_d234
result_is_stack_read_MUX_uxn_opcodes_h_l1241_c7_d234 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1241_c7_d234_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1241_c7_d234_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1241_c7_d234_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1241_c7_d234_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1245_c11_1c01
BIN_OP_EQ_uxn_opcodes_h_l1245_c11_1c01 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1245_c11_1c01_left,
BIN_OP_EQ_uxn_opcodes_h_l1245_c11_1c01_right,
BIN_OP_EQ_uxn_opcodes_h_l1245_c11_1c01_return_output);

-- n16_MUX_uxn_opcodes_h_l1245_c7_c654
n16_MUX_uxn_opcodes_h_l1245_c7_c654 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1245_c7_c654_cond,
n16_MUX_uxn_opcodes_h_l1245_c7_c654_iftrue,
n16_MUX_uxn_opcodes_h_l1245_c7_c654_iffalse,
n16_MUX_uxn_opcodes_h_l1245_c7_c654_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_c654
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_c654 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_c654_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_c654_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_c654_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_c654_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_c654
result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_c654 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_c654_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_c654_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_c654_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_c654_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_c654
result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_c654 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_c654_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_c654_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_c654_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_c654_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1245_c7_c654
result_is_sp_shift_MUX_uxn_opcodes_h_l1245_c7_c654 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1245_c7_c654_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1245_c7_c654_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1245_c7_c654_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1245_c7_c654_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1245_c7_c654
result_stack_value_MUX_uxn_opcodes_h_l1245_c7_c654 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1245_c7_c654_cond,
result_stack_value_MUX_uxn_opcodes_h_l1245_c7_c654_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1245_c7_c654_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1245_c7_c654_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_c654
result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_c654 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_c654_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_c654_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_c654_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_c654_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1245_c7_c654
result_is_stack_read_MUX_uxn_opcodes_h_l1245_c7_c654 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1245_c7_c654_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1245_c7_c654_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1245_c7_c654_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1245_c7_c654_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1246_c3_cd80
BIN_OP_OR_uxn_opcodes_h_l1246_c3_cd80 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1246_c3_cd80_left,
BIN_OP_OR_uxn_opcodes_h_l1246_c3_cd80_right,
BIN_OP_OR_uxn_opcodes_h_l1246_c3_cd80_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1249_c32_8d83
BIN_OP_AND_uxn_opcodes_h_l1249_c32_8d83 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1249_c32_8d83_left,
BIN_OP_AND_uxn_opcodes_h_l1249_c32_8d83_right,
BIN_OP_AND_uxn_opcodes_h_l1249_c32_8d83_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1249_c32_736b
BIN_OP_GT_uxn_opcodes_h_l1249_c32_736b : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1249_c32_736b_left,
BIN_OP_GT_uxn_opcodes_h_l1249_c32_736b_right,
BIN_OP_GT_uxn_opcodes_h_l1249_c32_736b_return_output);

-- MUX_uxn_opcodes_h_l1249_c32_14f3
MUX_uxn_opcodes_h_l1249_c32_14f3 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1249_c32_14f3_cond,
MUX_uxn_opcodes_h_l1249_c32_14f3_iftrue,
MUX_uxn_opcodes_h_l1249_c32_14f3_iffalse,
MUX_uxn_opcodes_h_l1249_c32_14f3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1251_c11_df43
BIN_OP_EQ_uxn_opcodes_h_l1251_c11_df43 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1251_c11_df43_left,
BIN_OP_EQ_uxn_opcodes_h_l1251_c11_df43_right,
BIN_OP_EQ_uxn_opcodes_h_l1251_c11_df43_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1251_c7_1e58
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1251_c7_1e58 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1251_c7_1e58_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1251_c7_1e58_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1251_c7_1e58_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1251_c7_1e58_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1251_c7_1e58
result_is_opc_done_MUX_uxn_opcodes_h_l1251_c7_1e58 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1251_c7_1e58_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1251_c7_1e58_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1251_c7_1e58_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1251_c7_1e58_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1251_c7_1e58
result_is_stack_write_MUX_uxn_opcodes_h_l1251_c7_1e58 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1251_c7_1e58_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1251_c7_1e58_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1251_c7_1e58_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1251_c7_1e58_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1251_c7_1e58
result_is_sp_shift_MUX_uxn_opcodes_h_l1251_c7_1e58 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1251_c7_1e58_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1251_c7_1e58_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1251_c7_1e58_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1251_c7_1e58_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1251_c7_1e58
result_stack_value_MUX_uxn_opcodes_h_l1251_c7_1e58 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1251_c7_1e58_cond,
result_stack_value_MUX_uxn_opcodes_h_l1251_c7_1e58_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1251_c7_1e58_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1251_c7_1e58_return_output);

-- BIN_OP_LT_uxn_opcodes_h_l1255_c24_3bca
BIN_OP_LT_uxn_opcodes_h_l1255_c24_3bca : entity work.BIN_OP_LT_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_LT_uxn_opcodes_h_l1255_c24_3bca_left,
BIN_OP_LT_uxn_opcodes_h_l1255_c24_3bca_right,
BIN_OP_LT_uxn_opcodes_h_l1255_c24_3bca_return_output);

-- MUX_uxn_opcodes_h_l1255_c24_9821
MUX_uxn_opcodes_h_l1255_c24_9821 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1255_c24_9821_cond,
MUX_uxn_opcodes_h_l1255_c24_9821_iftrue,
MUX_uxn_opcodes_h_l1255_c24_9821_iffalse,
MUX_uxn_opcodes_h_l1255_c24_9821_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1257_c11_92b6
BIN_OP_EQ_uxn_opcodes_h_l1257_c11_92b6 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1257_c11_92b6_left,
BIN_OP_EQ_uxn_opcodes_h_l1257_c11_92b6_right,
BIN_OP_EQ_uxn_opcodes_h_l1257_c11_92b6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_81bd
result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_81bd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_81bd_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_81bd_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_81bd_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_81bd_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_81bd
result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_81bd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_81bd_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_81bd_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_81bd_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_81bd_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1237_l1218_DUPLICATE_71af
CONST_SL_8_uint16_t_uxn_opcodes_h_l1237_l1218_DUPLICATE_71af : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1237_l1218_DUPLICATE_71af_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1237_l1218_DUPLICATE_71af_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 pc,
 previous_stack_read,
 previous_ram_read,
 -- Registers
 t16,
 n16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1204_c6_62ef_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1204_c1_12fe_return_output,
 n16_MUX_uxn_opcodes_h_l1204_c2_fee4_return_output,
 t16_MUX_uxn_opcodes_h_l1204_c2_fee4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1204_c2_fee4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1204_c2_fee4_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1204_c2_fee4_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1204_c2_fee4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1204_c2_fee4_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1204_c2_fee4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1204_c2_fee4_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1204_c2_fee4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1212_c11_d937_return_output,
 n16_MUX_uxn_opcodes_h_l1212_c7_e6e0_return_output,
 t16_MUX_uxn_opcodes_h_l1212_c7_e6e0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_e6e0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_e6e0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_e6e0_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_e6e0_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1212_c7_e6e0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1212_c7_e6e0_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1212_c7_e6e0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1216_c11_3193_return_output,
 n16_MUX_uxn_opcodes_h_l1216_c7_ad8a_return_output,
 t16_MUX_uxn_opcodes_h_l1216_c7_ad8a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1216_c7_ad8a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1216_c7_ad8a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1216_c7_ad8a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1216_c7_ad8a_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1216_c7_ad8a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1216_c7_ad8a_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1216_c7_ad8a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1222_c11_dd38_return_output,
 n16_MUX_uxn_opcodes_h_l1222_c7_da3d_return_output,
 t16_MUX_uxn_opcodes_h_l1222_c7_da3d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_da3d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_da3d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_da3d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1222_c7_da3d_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1222_c7_da3d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_da3d_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1222_c7_da3d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1226_c11_3bb5_return_output,
 n16_MUX_uxn_opcodes_h_l1226_c7_fcb5_return_output,
 t16_MUX_uxn_opcodes_h_l1226_c7_fcb5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_fcb5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_fcb5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_fcb5_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1226_c7_fcb5_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1226_c7_fcb5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_fcb5_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1226_c7_fcb5_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1227_c3_3d32_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1231_c11_9c61_return_output,
 n16_MUX_uxn_opcodes_h_l1231_c7_4027_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1231_c7_4027_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1231_c7_4027_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1231_c7_4027_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1231_c7_4027_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1231_c7_4027_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1231_c7_4027_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1231_c7_4027_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1235_c11_33cb_return_output,
 n16_MUX_uxn_opcodes_h_l1235_c7_193f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1235_c7_193f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1235_c7_193f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1235_c7_193f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1235_c7_193f_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1235_c7_193f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1235_c7_193f_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1235_c7_193f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1241_c11_7de7_return_output,
 n16_MUX_uxn_opcodes_h_l1241_c7_d234_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_d234_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_d234_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_d234_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_d234_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1241_c7_d234_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_d234_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1241_c7_d234_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1245_c11_1c01_return_output,
 n16_MUX_uxn_opcodes_h_l1245_c7_c654_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_c654_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_c654_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_c654_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1245_c7_c654_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1245_c7_c654_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_c654_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1245_c7_c654_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1246_c3_cd80_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1249_c32_8d83_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1249_c32_736b_return_output,
 MUX_uxn_opcodes_h_l1249_c32_14f3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1251_c11_df43_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1251_c7_1e58_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1251_c7_1e58_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1251_c7_1e58_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1251_c7_1e58_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1251_c7_1e58_return_output,
 BIN_OP_LT_uxn_opcodes_h_l1255_c24_3bca_return_output,
 MUX_uxn_opcodes_h_l1255_c24_9821_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1257_c11_92b6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_81bd_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_81bd_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1237_l1218_DUPLICATE_71af_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1204_c6_62ef_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1204_c6_62ef_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1204_c6_62ef_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1204_c1_12fe_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1204_c1_12fe_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1204_c1_12fe_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1204_c1_12fe_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1204_c2_fee4_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1204_c2_fee4_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1212_c7_e6e0_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1204_c2_fee4_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1204_c2_fee4_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1204_c2_fee4_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1204_c2_fee4_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1212_c7_e6e0_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1204_c2_fee4_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1204_c2_fee4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1204_c2_fee4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1204_c2_fee4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_e6e0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1204_c2_fee4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1204_c2_fee4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1204_c2_fee4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1204_c2_fee4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_e6e0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1204_c2_fee4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1204_c2_fee4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1204_c2_fee4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1204_c2_fee4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1212_c7_e6e0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1204_c2_fee4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1204_c2_fee4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1204_c2_fee4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1204_c2_fee4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1204_c2_fee4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1204_c2_fee4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1204_c2_fee4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1204_c2_fee4_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1204_c2_fee4_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1212_c7_e6e0_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1204_c2_fee4_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1204_c2_fee4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1204_c2_fee4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1204_c2_fee4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1212_c7_e6e0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1204_c2_fee4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1204_c2_fee4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1204_c2_fee4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1208_c3_3421 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1204_c2_fee4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_e6e0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1204_c2_fee4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1204_c2_fee4_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1204_c2_fee4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1204_c2_fee4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_e6e0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1204_c2_fee4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1204_c2_fee4_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1205_c3_80f1_uxn_opcodes_h_l1205_c3_80f1_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1212_c11_d937_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1212_c11_d937_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1212_c11_d937_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1212_c7_e6e0_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1212_c7_e6e0_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1216_c7_ad8a_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1212_c7_e6e0_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1212_c7_e6e0_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1212_c7_e6e0_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1216_c7_ad8a_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1212_c7_e6e0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_e6e0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1214_c3_90fc : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_e6e0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1216_c7_ad8a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_e6e0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_e6e0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_e6e0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1216_c7_ad8a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_e6e0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_e6e0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_e6e0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1216_c7_ad8a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_e6e0_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_e6e0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_e6e0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1216_c7_ad8a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_e6e0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1212_c7_e6e0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1212_c7_e6e0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1216_c7_ad8a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1212_c7_e6e0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1212_c7_e6e0_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1212_c7_e6e0_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1216_c7_ad8a_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1212_c7_e6e0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1212_c7_e6e0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1212_c7_e6e0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1216_c7_ad8a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1212_c7_e6e0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1216_c11_3193_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1216_c11_3193_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1216_c11_3193_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1216_c7_ad8a_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1216_c7_ad8a_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1222_c7_da3d_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1216_c7_ad8a_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1216_c7_ad8a_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1216_c7_ad8a_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1222_c7_da3d_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1216_c7_ad8a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1216_c7_ad8a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1220_c3_6057 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1216_c7_ad8a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_da3d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1216_c7_ad8a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1216_c7_ad8a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1216_c7_ad8a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_da3d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1216_c7_ad8a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1216_c7_ad8a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1216_c7_ad8a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_da3d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1216_c7_ad8a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1216_c7_ad8a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1216_c7_ad8a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1222_c7_da3d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1216_c7_ad8a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1216_c7_ad8a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1216_c7_ad8a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1222_c7_da3d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1216_c7_ad8a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1216_c7_ad8a_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1216_c7_ad8a_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_da3d_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1216_c7_ad8a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1216_c7_ad8a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1216_c7_ad8a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1222_c7_da3d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1216_c7_ad8a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_dd38_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_dd38_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_dd38_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1222_c7_da3d_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1222_c7_da3d_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1226_c7_fcb5_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1222_c7_da3d_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1222_c7_da3d_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1222_c7_da3d_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1226_c7_fcb5_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1222_c7_da3d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_da3d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1224_c3_0c63 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_da3d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_fcb5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_da3d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_da3d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_da3d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_fcb5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_da3d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_da3d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_da3d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_fcb5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_da3d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1222_c7_da3d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1222_c7_da3d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1226_c7_fcb5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1222_c7_da3d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1222_c7_da3d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1222_c7_da3d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1226_c7_fcb5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1222_c7_da3d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_da3d_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_da3d_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_fcb5_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_da3d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1222_c7_da3d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1222_c7_da3d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1226_c7_fcb5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1222_c7_da3d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1226_c11_3bb5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1226_c11_3bb5_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1226_c11_3bb5_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1226_c7_fcb5_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1226_c7_fcb5_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1231_c7_4027_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1226_c7_fcb5_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1226_c7_fcb5_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1226_c7_fcb5_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1226_c7_fcb5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_fcb5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1229_c3_835d : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_fcb5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1231_c7_4027_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_fcb5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_fcb5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_fcb5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1231_c7_4027_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_fcb5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_fcb5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_fcb5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1231_c7_4027_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_fcb5_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1226_c7_fcb5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1226_c7_fcb5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1231_c7_4027_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1226_c7_fcb5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1226_c7_fcb5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1226_c7_fcb5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1231_c7_4027_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1226_c7_fcb5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_fcb5_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_fcb5_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1231_c7_4027_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_fcb5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1226_c7_fcb5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1226_c7_fcb5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1231_c7_4027_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1226_c7_fcb5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1227_c3_3d32_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1227_c3_3d32_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1227_c3_3d32_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1231_c11_9c61_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1231_c11_9c61_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1231_c11_9c61_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1231_c7_4027_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1231_c7_4027_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1235_c7_193f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1231_c7_4027_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1231_c7_4027_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1233_c3_9e16 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1231_c7_4027_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1235_c7_193f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1231_c7_4027_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1231_c7_4027_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1231_c7_4027_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1235_c7_193f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1231_c7_4027_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1231_c7_4027_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1231_c7_4027_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1235_c7_193f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1231_c7_4027_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1231_c7_4027_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1231_c7_4027_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1235_c7_193f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1231_c7_4027_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1231_c7_4027_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1231_c7_4027_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1235_c7_193f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1231_c7_4027_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1231_c7_4027_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1231_c7_4027_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1235_c7_193f_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1231_c7_4027_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1231_c7_4027_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1231_c7_4027_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1235_c7_193f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1231_c7_4027_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1235_c11_33cb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1235_c11_33cb_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1235_c11_33cb_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1235_c7_193f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1235_c7_193f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1241_c7_d234_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1235_c7_193f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1235_c7_193f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1239_c3_2315 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1235_c7_193f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_d234_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1235_c7_193f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1235_c7_193f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1235_c7_193f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_d234_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1235_c7_193f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1235_c7_193f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1235_c7_193f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_d234_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1235_c7_193f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1235_c7_193f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1235_c7_193f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_d234_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1235_c7_193f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1235_c7_193f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1235_c7_193f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1241_c7_d234_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1235_c7_193f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1235_c7_193f_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1235_c7_193f_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_d234_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1235_c7_193f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1235_c7_193f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1235_c7_193f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1241_c7_d234_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1235_c7_193f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_7de7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_7de7_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_7de7_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1241_c7_d234_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1241_c7_d234_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1245_c7_c654_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1241_c7_d234_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_d234_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1243_c3_2f72 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_d234_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_c654_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_d234_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_d234_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_d234_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_c654_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_d234_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_d234_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_d234_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_c654_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_d234_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_d234_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_d234_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1245_c7_c654_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_d234_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1241_c7_d234_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1241_c7_d234_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1245_c7_c654_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1241_c7_d234_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_d234_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_d234_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_c654_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_d234_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1241_c7_d234_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1241_c7_d234_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1245_c7_c654_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1241_c7_d234_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1245_c11_1c01_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1245_c11_1c01_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1245_c11_1c01_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1245_c7_c654_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1245_c7_c654_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1245_c7_c654_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_c654_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_c654_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1251_c7_1e58_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_c654_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_c654_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_c654_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1251_c7_1e58_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_c654_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_c654_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_c654_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1251_c7_1e58_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_c654_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1245_c7_c654_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1245_c7_c654_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1251_c7_1e58_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1245_c7_c654_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1245_c7_c654_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1245_c7_c654_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1251_c7_1e58_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1245_c7_c654_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_c654_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_c654_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_c654_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1245_c7_c654_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1245_c7_c654_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1245_c7_c654_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1245_c7_c654_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1246_c3_cd80_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1246_c3_cd80_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1246_c3_cd80_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1249_c32_14f3_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1249_c32_14f3_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1249_c32_14f3_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1249_c32_8d83_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1249_c32_8d83_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1249_c32_8d83_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1249_c32_736b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1249_c32_736b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1249_c32_736b_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1249_c32_14f3_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1251_c11_df43_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1251_c11_df43_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1251_c11_df43_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1251_c7_1e58_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1254_c3_59b6 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1251_c7_1e58_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1251_c7_1e58_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1251_c7_1e58_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1251_c7_1e58_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_81bd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1251_c7_1e58_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1251_c7_1e58_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1251_c7_1e58_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_81bd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1251_c7_1e58_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1251_c7_1e58_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1251_c7_1e58_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1251_c7_1e58_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1251_c7_1e58_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1251_c7_1e58_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1251_c7_1e58_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1255_c24_9821_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1255_c24_9821_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1255_c24_9821_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_LT_uxn_opcodes_h_l1255_c24_3bca_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_LT_uxn_opcodes_h_l1255_c24_3bca_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_LT_uxn_opcodes_h_l1255_c24_3bca_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1255_c24_9821_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1257_c11_92b6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1257_c11_92b6_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1257_c11_92b6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_81bd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_81bd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_81bd_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_81bd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_81bd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_81bd_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1226_l1222_l1204_l1251_l1216_l1245_l1212_l1241_l1235_l1231_DUPLICATE_95d3_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1226_l1222_l1204_l1216_l1245_l1212_l1241_l1235_l1231_DUPLICATE_263d_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1226_l1222_l1204_l1251_l1216_l1212_l1241_l1235_l1231_DUPLICATE_2ed2_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1226_l1257_l1222_l1251_l1216_l1245_l1212_l1241_l1235_l1231_DUPLICATE_1c03_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1226_l1257_l1222_l1216_l1245_l1212_l1241_l1235_l1231_DUPLICATE_c5a1_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1227_l1236_l1246_l1217_DUPLICATE_a9b8_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1237_l1218_DUPLICATE_71af_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1237_l1218_DUPLICATE_71af_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1251_l1245_DUPLICATE_210f_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_49dd_uxn_opcodes_h_l1262_l1200_DUPLICATE_5bd3_return_output : opcode_result_t;
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
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1222_c7_da3d_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l1249_c32_14f3_iffalse := resize(to_signed(-3, 3), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_dd38_right := to_unsigned(3, 2);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1245_c7_c654_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1231_c7_4027_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1226_c7_fcb5_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1216_c7_ad8a_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1204_c2_fee4_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1204_c1_12fe_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1254_c3_59b6 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1251_c7_1e58_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1254_c3_59b6;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1204_c2_fee4_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1204_c2_fee4_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1224_c3_0c63 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_da3d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1224_c3_0c63;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1204_c6_62ef_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1239_c3_2315 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1235_c7_193f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1239_c3_2315;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1233_c3_9e16 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1231_c7_4027_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1233_c3_9e16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1245_c11_1c01_right := to_unsigned(8, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1208_c3_3421 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1204_c2_fee4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1208_c3_3421;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1220_c3_6057 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1216_c7_ad8a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1220_c3_6057;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1251_c11_df43_right := to_unsigned(9, 4);
     VAR_BIN_OP_GT_uxn_opcodes_h_l1249_c32_736b_right := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1249_c32_14f3_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_MUX_uxn_opcodes_h_l1255_c24_9821_iftrue := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1229_c3_835d := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_fcb5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1229_c3_835d;
     VAR_MUX_uxn_opcodes_h_l1255_c24_9821_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_7de7_right := to_unsigned(7, 3);
     VAR_BIN_OP_AND_uxn_opcodes_h_l1249_c32_8d83_right := to_unsigned(128, 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1214_c3_90fc := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_e6e0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1214_c3_90fc;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1251_c7_1e58_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1235_c11_33cb_right := to_unsigned(6, 3);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1212_c7_e6e0_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1251_c7_1e58_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1231_c11_9c61_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1257_c11_92b6_right := to_unsigned(10, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1212_c11_d937_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_81bd_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1216_c11_3193_right := to_unsigned(2, 2);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1204_c2_fee4_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1243_c3_2f72 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_d234_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1243_c3_2f72;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1235_c7_193f_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1245_c7_c654_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1241_c7_d234_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1226_c11_3bb5_right := to_unsigned(4, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_81bd_iftrue := to_unsigned(0, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_phase := phase;
     VAR_ins := ins;
     VAR_pc := pc;
     VAR_previous_stack_read := previous_stack_read;
     VAR_previous_ram_read := previous_ram_read;

     -- Submodule level 0
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1204_c1_12fe_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1249_c32_8d83_left := VAR_ins;
     VAR_BIN_OP_LT_uxn_opcodes_h_l1255_c24_3bca_left := n16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1246_c3_cd80_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1204_c2_fee4_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1212_c7_e6e0_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1216_c7_ad8a_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1222_c7_da3d_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1226_c7_fcb5_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1231_c7_4027_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1241_c7_d234_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1245_c7_c654_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1204_c6_62ef_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1212_c11_d937_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1216_c11_3193_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_dd38_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1226_c11_3bb5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1231_c11_9c61_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1235_c11_33cb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_7de7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1245_c11_1c01_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1251_c11_df43_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1257_c11_92b6_left := VAR_phase;
     VAR_BIN_OP_LT_uxn_opcodes_h_l1255_c24_3bca_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1227_c3_3d32_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1204_c2_fee4_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1212_c7_e6e0_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1222_c7_da3d_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1226_c7_fcb5_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l1251_c11_df43] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1251_c11_df43_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1251_c11_df43_left;
     BIN_OP_EQ_uxn_opcodes_h_l1251_c11_df43_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1251_c11_df43_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1251_c11_df43_return_output := BIN_OP_EQ_uxn_opcodes_h_l1251_c11_df43_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1245_c11_1c01] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1245_c11_1c01_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1245_c11_1c01_left;
     BIN_OP_EQ_uxn_opcodes_h_l1245_c11_1c01_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1245_c11_1c01_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1245_c11_1c01_return_output := BIN_OP_EQ_uxn_opcodes_h_l1245_c11_1c01_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1226_l1222_l1204_l1251_l1216_l1212_l1241_l1235_l1231_DUPLICATE_2ed2 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1226_l1222_l1204_l1251_l1216_l1212_l1241_l1235_l1231_DUPLICATE_2ed2_return_output := result.is_sp_shift;

     -- BIN_OP_AND[uxn_opcodes_h_l1249_c32_8d83] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1249_c32_8d83_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1249_c32_8d83_left;
     BIN_OP_AND_uxn_opcodes_h_l1249_c32_8d83_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1249_c32_8d83_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1249_c32_8d83_return_output := BIN_OP_AND_uxn_opcodes_h_l1249_c32_8d83_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1231_c11_9c61] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1231_c11_9c61_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1231_c11_9c61_left;
     BIN_OP_EQ_uxn_opcodes_h_l1231_c11_9c61_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1231_c11_9c61_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1231_c11_9c61_return_output := BIN_OP_EQ_uxn_opcodes_h_l1231_c11_9c61_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1204_c2_fee4] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1204_c2_fee4_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1226_l1222_l1204_l1216_l1245_l1212_l1241_l1235_l1231_DUPLICATE_263d LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1226_l1222_l1204_l1216_l1245_l1212_l1241_l1235_l1231_DUPLICATE_263d_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1241_c11_7de7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1241_c11_7de7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_7de7_left;
     BIN_OP_EQ_uxn_opcodes_h_l1241_c11_7de7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_7de7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_7de7_return_output := BIN_OP_EQ_uxn_opcodes_h_l1241_c11_7de7_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1227_l1236_l1246_l1217_DUPLICATE_a9b8 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1227_l1236_l1246_l1217_DUPLICATE_a9b8_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1222_c11_dd38] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1222_c11_dd38_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_dd38_left;
     BIN_OP_EQ_uxn_opcodes_h_l1222_c11_dd38_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_dd38_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_dd38_return_output := BIN_OP_EQ_uxn_opcodes_h_l1222_c11_dd38_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1212_c11_d937] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1212_c11_d937_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1212_c11_d937_left;
     BIN_OP_EQ_uxn_opcodes_h_l1212_c11_d937_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1212_c11_d937_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1212_c11_d937_return_output := BIN_OP_EQ_uxn_opcodes_h_l1212_c11_d937_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1226_c11_3bb5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1226_c11_3bb5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1226_c11_3bb5_left;
     BIN_OP_EQ_uxn_opcodes_h_l1226_c11_3bb5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1226_c11_3bb5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1226_c11_3bb5_return_output := BIN_OP_EQ_uxn_opcodes_h_l1226_c11_3bb5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1235_c11_33cb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1235_c11_33cb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1235_c11_33cb_left;
     BIN_OP_EQ_uxn_opcodes_h_l1235_c11_33cb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1235_c11_33cb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1235_c11_33cb_return_output := BIN_OP_EQ_uxn_opcodes_h_l1235_c11_33cb_return_output;

     -- BIN_OP_LT[uxn_opcodes_h_l1255_c24_3bca] LATENCY=0
     -- Inputs
     BIN_OP_LT_uxn_opcodes_h_l1255_c24_3bca_left <= VAR_BIN_OP_LT_uxn_opcodes_h_l1255_c24_3bca_left;
     BIN_OP_LT_uxn_opcodes_h_l1255_c24_3bca_right <= VAR_BIN_OP_LT_uxn_opcodes_h_l1255_c24_3bca_right;
     -- Outputs
     VAR_BIN_OP_LT_uxn_opcodes_h_l1255_c24_3bca_return_output := BIN_OP_LT_uxn_opcodes_h_l1255_c24_3bca_return_output;

     -- result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d[uxn_opcodes_h_l1245_c7_c654] LATENCY=0
     VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1245_c7_c654_return_output := result.is_stack_read;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1251_l1245_DUPLICATE_210f LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1251_l1245_DUPLICATE_210f_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1257_c11_92b6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1257_c11_92b6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1257_c11_92b6_left;
     BIN_OP_EQ_uxn_opcodes_h_l1257_c11_92b6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1257_c11_92b6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1257_c11_92b6_return_output := BIN_OP_EQ_uxn_opcodes_h_l1257_c11_92b6_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1226_l1222_l1204_l1251_l1216_l1245_l1212_l1241_l1235_l1231_DUPLICATE_95d3 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1226_l1222_l1204_l1251_l1216_l1245_l1212_l1241_l1235_l1231_DUPLICATE_95d3_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1204_c6_62ef] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1204_c6_62ef_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1204_c6_62ef_left;
     BIN_OP_EQ_uxn_opcodes_h_l1204_c6_62ef_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1204_c6_62ef_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1204_c6_62ef_return_output := BIN_OP_EQ_uxn_opcodes_h_l1204_c6_62ef_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1216_c11_3193] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1216_c11_3193_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1216_c11_3193_left;
     BIN_OP_EQ_uxn_opcodes_h_l1216_c11_3193_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1216_c11_3193_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1216_c11_3193_return_output := BIN_OP_EQ_uxn_opcodes_h_l1216_c11_3193_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1226_l1257_l1222_l1216_l1245_l1212_l1241_l1235_l1231_DUPLICATE_c5a1 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1226_l1257_l1222_l1216_l1245_l1212_l1241_l1235_l1231_DUPLICATE_c5a1_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1226_l1257_l1222_l1251_l1216_l1245_l1212_l1241_l1235_l1231_DUPLICATE_1c03 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1226_l1257_l1222_l1251_l1216_l1245_l1212_l1241_l1235_l1231_DUPLICATE_1c03_return_output := result.is_opc_done;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1249_c32_736b_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1249_c32_8d83_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1204_c1_12fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1204_c6_62ef_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1204_c2_fee4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1204_c6_62ef_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1204_c2_fee4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1204_c6_62ef_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1204_c2_fee4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1204_c6_62ef_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1204_c2_fee4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1204_c6_62ef_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1204_c2_fee4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1204_c6_62ef_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1204_c2_fee4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1204_c6_62ef_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1204_c2_fee4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1204_c6_62ef_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1204_c2_fee4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1204_c6_62ef_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1204_c2_fee4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1204_c6_62ef_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1204_c2_fee4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1204_c6_62ef_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1212_c7_e6e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1212_c11_d937_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_e6e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1212_c11_d937_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_e6e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1212_c11_d937_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1212_c7_e6e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1212_c11_d937_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_e6e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1212_c11_d937_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1212_c7_e6e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1212_c11_d937_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_e6e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1212_c11_d937_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1212_c7_e6e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1212_c11_d937_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1212_c7_e6e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1212_c11_d937_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1216_c7_ad8a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1216_c11_3193_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1216_c7_ad8a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1216_c11_3193_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1216_c7_ad8a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1216_c11_3193_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1216_c7_ad8a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1216_c11_3193_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1216_c7_ad8a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1216_c11_3193_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1216_c7_ad8a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1216_c11_3193_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1216_c7_ad8a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1216_c11_3193_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1216_c7_ad8a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1216_c11_3193_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1216_c7_ad8a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1216_c11_3193_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1222_c7_da3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_dd38_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_da3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_dd38_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1222_c7_da3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_dd38_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1222_c7_da3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_dd38_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_da3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_dd38_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_da3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_dd38_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_da3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_dd38_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1222_c7_da3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_dd38_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1222_c7_da3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_dd38_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1226_c7_fcb5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1226_c11_3bb5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_fcb5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1226_c11_3bb5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1226_c7_fcb5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1226_c11_3bb5_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1226_c7_fcb5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1226_c11_3bb5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_fcb5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1226_c11_3bb5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_fcb5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1226_c11_3bb5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_fcb5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1226_c11_3bb5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1226_c7_fcb5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1226_c11_3bb5_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1226_c7_fcb5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1226_c11_3bb5_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1231_c7_4027_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1231_c11_9c61_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1231_c7_4027_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1231_c11_9c61_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1231_c7_4027_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1231_c11_9c61_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1231_c7_4027_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1231_c11_9c61_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1231_c7_4027_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1231_c11_9c61_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1231_c7_4027_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1231_c11_9c61_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1231_c7_4027_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1231_c11_9c61_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1231_c7_4027_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1231_c11_9c61_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1235_c7_193f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1235_c11_33cb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1235_c7_193f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1235_c11_33cb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1235_c7_193f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1235_c11_33cb_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1235_c7_193f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1235_c11_33cb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1235_c7_193f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1235_c11_33cb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1235_c7_193f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1235_c11_33cb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1235_c7_193f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1235_c11_33cb_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1235_c7_193f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1235_c11_33cb_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1241_c7_d234_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_7de7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_d234_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_7de7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_d234_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_7de7_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1241_c7_d234_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_7de7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_d234_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_7de7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_d234_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_7de7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_d234_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_7de7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1241_c7_d234_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_7de7_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1245_c7_c654_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1245_c11_1c01_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_c654_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1245_c11_1c01_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1245_c7_c654_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1245_c11_1c01_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1245_c7_c654_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1245_c11_1c01_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_c654_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1245_c11_1c01_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_c654_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1245_c11_1c01_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_c654_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1245_c11_1c01_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1245_c7_c654_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1245_c11_1c01_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1251_c7_1e58_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1251_c11_df43_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1251_c7_1e58_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1251_c11_df43_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1251_c7_1e58_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1251_c11_df43_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1251_c7_1e58_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1251_c11_df43_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1251_c7_1e58_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1251_c11_df43_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_81bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1257_c11_92b6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_81bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1257_c11_92b6_return_output;
     VAR_MUX_uxn_opcodes_h_l1255_c24_9821_cond := VAR_BIN_OP_LT_uxn_opcodes_h_l1255_c24_3bca_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1227_c3_3d32_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1227_l1236_l1246_l1217_DUPLICATE_a9b8_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1246_c3_cd80_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1227_l1236_l1246_l1217_DUPLICATE_a9b8_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1237_l1218_DUPLICATE_71af_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1227_l1236_l1246_l1217_DUPLICATE_a9b8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1204_c2_fee4_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1226_l1222_l1204_l1216_l1245_l1212_l1241_l1235_l1231_DUPLICATE_263d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1212_c7_e6e0_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1226_l1222_l1204_l1216_l1245_l1212_l1241_l1235_l1231_DUPLICATE_263d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1216_c7_ad8a_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1226_l1222_l1204_l1216_l1245_l1212_l1241_l1235_l1231_DUPLICATE_263d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_da3d_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1226_l1222_l1204_l1216_l1245_l1212_l1241_l1235_l1231_DUPLICATE_263d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_fcb5_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1226_l1222_l1204_l1216_l1245_l1212_l1241_l1235_l1231_DUPLICATE_263d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1231_c7_4027_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1226_l1222_l1204_l1216_l1245_l1212_l1241_l1235_l1231_DUPLICATE_263d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1235_c7_193f_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1226_l1222_l1204_l1216_l1245_l1212_l1241_l1235_l1231_DUPLICATE_263d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_d234_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1226_l1222_l1204_l1216_l1245_l1212_l1241_l1235_l1231_DUPLICATE_263d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_c654_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1226_l1222_l1204_l1216_l1245_l1212_l1241_l1235_l1231_DUPLICATE_263d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_e6e0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1226_l1257_l1222_l1251_l1216_l1245_l1212_l1241_l1235_l1231_DUPLICATE_1c03_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1216_c7_ad8a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1226_l1257_l1222_l1251_l1216_l1245_l1212_l1241_l1235_l1231_DUPLICATE_1c03_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_da3d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1226_l1257_l1222_l1251_l1216_l1245_l1212_l1241_l1235_l1231_DUPLICATE_1c03_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_fcb5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1226_l1257_l1222_l1251_l1216_l1245_l1212_l1241_l1235_l1231_DUPLICATE_1c03_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1231_c7_4027_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1226_l1257_l1222_l1251_l1216_l1245_l1212_l1241_l1235_l1231_DUPLICATE_1c03_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1235_c7_193f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1226_l1257_l1222_l1251_l1216_l1245_l1212_l1241_l1235_l1231_DUPLICATE_1c03_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_d234_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1226_l1257_l1222_l1251_l1216_l1245_l1212_l1241_l1235_l1231_DUPLICATE_1c03_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_c654_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1226_l1257_l1222_l1251_l1216_l1245_l1212_l1241_l1235_l1231_DUPLICATE_1c03_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1251_c7_1e58_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1226_l1257_l1222_l1251_l1216_l1245_l1212_l1241_l1235_l1231_DUPLICATE_1c03_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_81bd_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1226_l1257_l1222_l1251_l1216_l1245_l1212_l1241_l1235_l1231_DUPLICATE_1c03_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1204_c2_fee4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1226_l1222_l1204_l1251_l1216_l1212_l1241_l1235_l1231_DUPLICATE_2ed2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_e6e0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1226_l1222_l1204_l1251_l1216_l1212_l1241_l1235_l1231_DUPLICATE_2ed2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1216_c7_ad8a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1226_l1222_l1204_l1251_l1216_l1212_l1241_l1235_l1231_DUPLICATE_2ed2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1222_c7_da3d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1226_l1222_l1204_l1251_l1216_l1212_l1241_l1235_l1231_DUPLICATE_2ed2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1226_c7_fcb5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1226_l1222_l1204_l1251_l1216_l1212_l1241_l1235_l1231_DUPLICATE_2ed2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1231_c7_4027_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1226_l1222_l1204_l1251_l1216_l1212_l1241_l1235_l1231_DUPLICATE_2ed2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1235_c7_193f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1226_l1222_l1204_l1251_l1216_l1212_l1241_l1235_l1231_DUPLICATE_2ed2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_d234_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1226_l1222_l1204_l1251_l1216_l1212_l1241_l1235_l1231_DUPLICATE_2ed2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1251_c7_1e58_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1226_l1222_l1204_l1251_l1216_l1212_l1241_l1235_l1231_DUPLICATE_2ed2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_e6e0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1226_l1257_l1222_l1216_l1245_l1212_l1241_l1235_l1231_DUPLICATE_c5a1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1216_c7_ad8a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1226_l1257_l1222_l1216_l1245_l1212_l1241_l1235_l1231_DUPLICATE_c5a1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_da3d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1226_l1257_l1222_l1216_l1245_l1212_l1241_l1235_l1231_DUPLICATE_c5a1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_fcb5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1226_l1257_l1222_l1216_l1245_l1212_l1241_l1235_l1231_DUPLICATE_c5a1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1231_c7_4027_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1226_l1257_l1222_l1216_l1245_l1212_l1241_l1235_l1231_DUPLICATE_c5a1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1235_c7_193f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1226_l1257_l1222_l1216_l1245_l1212_l1241_l1235_l1231_DUPLICATE_c5a1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_d234_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1226_l1257_l1222_l1216_l1245_l1212_l1241_l1235_l1231_DUPLICATE_c5a1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_c654_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1226_l1257_l1222_l1216_l1245_l1212_l1241_l1235_l1231_DUPLICATE_c5a1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_81bd_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1226_l1257_l1222_l1216_l1245_l1212_l1241_l1235_l1231_DUPLICATE_c5a1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_c654_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1251_l1245_DUPLICATE_210f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1251_c7_1e58_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1251_l1245_DUPLICATE_210f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1204_c2_fee4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1226_l1222_l1204_l1251_l1216_l1245_l1212_l1241_l1235_l1231_DUPLICATE_95d3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1212_c7_e6e0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1226_l1222_l1204_l1251_l1216_l1245_l1212_l1241_l1235_l1231_DUPLICATE_95d3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1216_c7_ad8a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1226_l1222_l1204_l1251_l1216_l1245_l1212_l1241_l1235_l1231_DUPLICATE_95d3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1222_c7_da3d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1226_l1222_l1204_l1251_l1216_l1245_l1212_l1241_l1235_l1231_DUPLICATE_95d3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1226_c7_fcb5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1226_l1222_l1204_l1251_l1216_l1245_l1212_l1241_l1235_l1231_DUPLICATE_95d3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1231_c7_4027_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1226_l1222_l1204_l1251_l1216_l1245_l1212_l1241_l1235_l1231_DUPLICATE_95d3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1235_c7_193f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1226_l1222_l1204_l1251_l1216_l1245_l1212_l1241_l1235_l1231_DUPLICATE_95d3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1241_c7_d234_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1226_l1222_l1204_l1251_l1216_l1245_l1212_l1241_l1235_l1231_DUPLICATE_95d3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1245_c7_c654_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1226_l1222_l1204_l1251_l1216_l1245_l1212_l1241_l1235_l1231_DUPLICATE_95d3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1251_c7_1e58_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1226_l1222_l1204_l1251_l1216_l1245_l1212_l1241_l1235_l1231_DUPLICATE_95d3_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1204_c2_fee4_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1204_c2_fee4_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1245_c7_c654_iffalse := VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1245_c7_c654_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l1245_c7_c654] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1245_c7_c654_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1245_c7_c654_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1245_c7_c654_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1245_c7_c654_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1245_c7_c654_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1245_c7_c654_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1245_c7_c654_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1245_c7_c654_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1249_c32_736b] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1249_c32_736b_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1249_c32_736b_left;
     BIN_OP_GT_uxn_opcodes_h_l1249_c32_736b_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1249_c32_736b_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1249_c32_736b_return_output := BIN_OP_GT_uxn_opcodes_h_l1249_c32_736b_return_output;

     -- MUX[uxn_opcodes_h_l1255_c24_9821] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1255_c24_9821_cond <= VAR_MUX_uxn_opcodes_h_l1255_c24_9821_cond;
     MUX_uxn_opcodes_h_l1255_c24_9821_iftrue <= VAR_MUX_uxn_opcodes_h_l1255_c24_9821_iftrue;
     MUX_uxn_opcodes_h_l1255_c24_9821_iffalse <= VAR_MUX_uxn_opcodes_h_l1255_c24_9821_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1255_c24_9821_return_output := MUX_uxn_opcodes_h_l1255_c24_9821_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1251_c7_1e58] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1251_c7_1e58_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1251_c7_1e58_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1251_c7_1e58_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1251_c7_1e58_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1251_c7_1e58_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1251_c7_1e58_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1251_c7_1e58_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1251_c7_1e58_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1227_c3_3d32] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1227_c3_3d32_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1227_c3_3d32_left;
     BIN_OP_OR_uxn_opcodes_h_l1227_c3_3d32_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1227_c3_3d32_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1227_c3_3d32_return_output := BIN_OP_OR_uxn_opcodes_h_l1227_c3_3d32_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1251_c7_1e58] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1251_c7_1e58_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1251_c7_1e58_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1251_c7_1e58_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1251_c7_1e58_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1251_c7_1e58_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1251_c7_1e58_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1251_c7_1e58_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1251_c7_1e58_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1246_c3_cd80] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1246_c3_cd80_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1246_c3_cd80_left;
     BIN_OP_OR_uxn_opcodes_h_l1246_c3_cd80_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1246_c3_cd80_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1246_c3_cd80_return_output := BIN_OP_OR_uxn_opcodes_h_l1246_c3_cd80_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1257_c7_81bd] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_81bd_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_81bd_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_81bd_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_81bd_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_81bd_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_81bd_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_81bd_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_81bd_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1237_l1218_DUPLICATE_71af LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1237_l1218_DUPLICATE_71af_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1237_l1218_DUPLICATE_71af_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1237_l1218_DUPLICATE_71af_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1237_l1218_DUPLICATE_71af_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1257_c7_81bd] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_81bd_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_81bd_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_81bd_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_81bd_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_81bd_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_81bd_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_81bd_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_81bd_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1204_c2_fee4] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1204_c2_fee4_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1204_c2_fee4_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1204_c2_fee4_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1204_c2_fee4_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1204_c2_fee4_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1204_c2_fee4_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1204_c2_fee4_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1204_c2_fee4_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1204_c1_12fe] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1204_c1_12fe_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1204_c1_12fe_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1204_c1_12fe_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1204_c1_12fe_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1204_c1_12fe_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1204_c1_12fe_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1204_c1_12fe_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1204_c1_12fe_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1249_c32_14f3_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1249_c32_736b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1226_c7_fcb5_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1227_c3_3d32_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1245_c7_c654_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1246_c3_cd80_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1235_c7_193f_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1237_l1218_DUPLICATE_71af_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1216_c7_ad8a_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1237_l1218_DUPLICATE_71af_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1251_c7_1e58_iftrue := VAR_MUX_uxn_opcodes_h_l1255_c24_9821_return_output;
     VAR_printf_uxn_opcodes_h_l1205_c3_80f1_uxn_opcodes_h_l1205_c3_80f1_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1204_c1_12fe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1251_c7_1e58_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_81bd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1245_c7_c654_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1251_c7_1e58_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1241_c7_d234_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1245_c7_c654_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1251_c7_1e58_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_81bd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_c654_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1251_c7_1e58_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1245_c7_c654] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1245_c7_c654_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1245_c7_c654_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1245_c7_c654_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1245_c7_c654_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1245_c7_c654_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1245_c7_c654_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1245_c7_c654_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1245_c7_c654_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1251_c7_1e58] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1251_c7_1e58_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1251_c7_1e58_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1251_c7_1e58_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1251_c7_1e58_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1251_c7_1e58_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1251_c7_1e58_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1251_c7_1e58_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1251_c7_1e58_return_output;

     -- n16_MUX[uxn_opcodes_h_l1245_c7_c654] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1245_c7_c654_cond <= VAR_n16_MUX_uxn_opcodes_h_l1245_c7_c654_cond;
     n16_MUX_uxn_opcodes_h_l1245_c7_c654_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1245_c7_c654_iftrue;
     n16_MUX_uxn_opcodes_h_l1245_c7_c654_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1245_c7_c654_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1245_c7_c654_return_output := n16_MUX_uxn_opcodes_h_l1245_c7_c654_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1245_c7_c654] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_c654_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_c654_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_c654_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_c654_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_c654_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_c654_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_c654_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_c654_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1241_c7_d234] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1241_c7_d234_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1241_c7_d234_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1241_c7_d234_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1241_c7_d234_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1241_c7_d234_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1241_c7_d234_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1241_c7_d234_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1241_c7_d234_return_output;

     -- MUX[uxn_opcodes_h_l1249_c32_14f3] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1249_c32_14f3_cond <= VAR_MUX_uxn_opcodes_h_l1249_c32_14f3_cond;
     MUX_uxn_opcodes_h_l1249_c32_14f3_iftrue <= VAR_MUX_uxn_opcodes_h_l1249_c32_14f3_iftrue;
     MUX_uxn_opcodes_h_l1249_c32_14f3_iffalse <= VAR_MUX_uxn_opcodes_h_l1249_c32_14f3_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1249_c32_14f3_return_output := MUX_uxn_opcodes_h_l1249_c32_14f3_return_output;

     -- t16_MUX[uxn_opcodes_h_l1226_c7_fcb5] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1226_c7_fcb5_cond <= VAR_t16_MUX_uxn_opcodes_h_l1226_c7_fcb5_cond;
     t16_MUX_uxn_opcodes_h_l1226_c7_fcb5_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1226_c7_fcb5_iftrue;
     t16_MUX_uxn_opcodes_h_l1226_c7_fcb5_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1226_c7_fcb5_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1226_c7_fcb5_return_output := t16_MUX_uxn_opcodes_h_l1226_c7_fcb5_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1251_c7_1e58] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1251_c7_1e58_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1251_c7_1e58_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1251_c7_1e58_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1251_c7_1e58_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1251_c7_1e58_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1251_c7_1e58_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1251_c7_1e58_return_output := result_stack_value_MUX_uxn_opcodes_h_l1251_c7_1e58_return_output;

     -- printf_uxn_opcodes_h_l1205_c3_80f1[uxn_opcodes_h_l1205_c3_80f1] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1205_c3_80f1_uxn_opcodes_h_l1205_c3_80f1_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1205_c3_80f1_uxn_opcodes_h_l1205_c3_80f1_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1251_c7_1e58] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1251_c7_1e58_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1251_c7_1e58_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1251_c7_1e58_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1251_c7_1e58_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1251_c7_1e58_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1251_c7_1e58_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1251_c7_1e58_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1251_c7_1e58_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_c654_iftrue := VAR_MUX_uxn_opcodes_h_l1249_c32_14f3_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1241_c7_d234_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1245_c7_c654_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_c654_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1251_c7_1e58_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_d234_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1245_c7_c654_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1235_c7_193f_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1241_c7_d234_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_c654_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1251_c7_1e58_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_d234_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_c654_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1245_c7_c654_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1251_c7_1e58_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1222_c7_da3d_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1226_c7_fcb5_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1245_c7_c654] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_c654_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_c654_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_c654_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_c654_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_c654_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_c654_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_c654_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_c654_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1245_c7_c654] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1245_c7_c654_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1245_c7_c654_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1245_c7_c654_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1245_c7_c654_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1245_c7_c654_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1245_c7_c654_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1245_c7_c654_return_output := result_stack_value_MUX_uxn_opcodes_h_l1245_c7_c654_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1245_c7_c654] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_c654_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_c654_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_c654_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_c654_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_c654_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_c654_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_c654_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_c654_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1235_c7_193f] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1235_c7_193f_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1235_c7_193f_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1235_c7_193f_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1235_c7_193f_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1235_c7_193f_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1235_c7_193f_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1235_c7_193f_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1235_c7_193f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1241_c7_d234] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_d234_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_d234_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_d234_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_d234_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_d234_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_d234_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_d234_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_d234_return_output;

     -- n16_MUX[uxn_opcodes_h_l1241_c7_d234] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1241_c7_d234_cond <= VAR_n16_MUX_uxn_opcodes_h_l1241_c7_d234_cond;
     n16_MUX_uxn_opcodes_h_l1241_c7_d234_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1241_c7_d234_iftrue;
     n16_MUX_uxn_opcodes_h_l1241_c7_d234_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1241_c7_d234_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1241_c7_d234_return_output := n16_MUX_uxn_opcodes_h_l1241_c7_d234_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1245_c7_c654] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_c654_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_c654_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_c654_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_c654_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_c654_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_c654_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_c654_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_c654_return_output;

     -- t16_MUX[uxn_opcodes_h_l1222_c7_da3d] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1222_c7_da3d_cond <= VAR_t16_MUX_uxn_opcodes_h_l1222_c7_da3d_cond;
     t16_MUX_uxn_opcodes_h_l1222_c7_da3d_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1222_c7_da3d_iftrue;
     t16_MUX_uxn_opcodes_h_l1222_c7_da3d_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1222_c7_da3d_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1222_c7_da3d_return_output := t16_MUX_uxn_opcodes_h_l1222_c7_da3d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1241_c7_d234] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_d234_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_d234_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_d234_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_d234_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_d234_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_d234_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_d234_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_d234_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l1235_c7_193f_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1241_c7_d234_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_d234_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_c654_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1235_c7_193f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1241_c7_d234_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1231_c7_4027_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1235_c7_193f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_d234_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_c654_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_d234_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_c654_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1235_c7_193f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_d234_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1241_c7_d234_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1245_c7_c654_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1216_c7_ad8a_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1222_c7_da3d_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1241_c7_d234] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_d234_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_d234_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_d234_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_d234_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_d234_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_d234_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_d234_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_d234_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1235_c7_193f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1235_c7_193f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1235_c7_193f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1235_c7_193f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1235_c7_193f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1235_c7_193f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1235_c7_193f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1235_c7_193f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1235_c7_193f_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1241_c7_d234] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1241_c7_d234_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1241_c7_d234_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1241_c7_d234_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1241_c7_d234_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1241_c7_d234_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1241_c7_d234_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1241_c7_d234_return_output := result_stack_value_MUX_uxn_opcodes_h_l1241_c7_d234_return_output;

     -- t16_MUX[uxn_opcodes_h_l1216_c7_ad8a] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1216_c7_ad8a_cond <= VAR_t16_MUX_uxn_opcodes_h_l1216_c7_ad8a_cond;
     t16_MUX_uxn_opcodes_h_l1216_c7_ad8a_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1216_c7_ad8a_iftrue;
     t16_MUX_uxn_opcodes_h_l1216_c7_ad8a_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1216_c7_ad8a_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1216_c7_ad8a_return_output := t16_MUX_uxn_opcodes_h_l1216_c7_ad8a_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1231_c7_4027] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1231_c7_4027_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1231_c7_4027_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1231_c7_4027_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1231_c7_4027_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1231_c7_4027_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1231_c7_4027_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1231_c7_4027_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1231_c7_4027_return_output;

     -- n16_MUX[uxn_opcodes_h_l1235_c7_193f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1235_c7_193f_cond <= VAR_n16_MUX_uxn_opcodes_h_l1235_c7_193f_cond;
     n16_MUX_uxn_opcodes_h_l1235_c7_193f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1235_c7_193f_iftrue;
     n16_MUX_uxn_opcodes_h_l1235_c7_193f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1235_c7_193f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1235_c7_193f_return_output := n16_MUX_uxn_opcodes_h_l1235_c7_193f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1235_c7_193f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1235_c7_193f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1235_c7_193f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1235_c7_193f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1235_c7_193f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1235_c7_193f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1235_c7_193f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1235_c7_193f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1235_c7_193f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1241_c7_d234] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_d234_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_d234_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_d234_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_d234_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_d234_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_d234_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_d234_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_d234_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1241_c7_d234] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_d234_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_d234_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_d234_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_d234_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_d234_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_d234_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_d234_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_d234_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1231_c7_4027_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1235_c7_193f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1235_c7_193f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_d234_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1231_c7_4027_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1235_c7_193f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1226_c7_fcb5_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1231_c7_4027_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1235_c7_193f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_d234_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1235_c7_193f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_d234_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1231_c7_4027_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1235_c7_193f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1235_c7_193f_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1241_c7_d234_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1212_c7_e6e0_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1216_c7_ad8a_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1235_c7_193f] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1235_c7_193f_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1235_c7_193f_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1235_c7_193f_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1235_c7_193f_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1235_c7_193f_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1235_c7_193f_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1235_c7_193f_return_output := result_stack_value_MUX_uxn_opcodes_h_l1235_c7_193f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1231_c7_4027] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1231_c7_4027_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1231_c7_4027_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1231_c7_4027_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1231_c7_4027_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1231_c7_4027_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1231_c7_4027_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1231_c7_4027_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1231_c7_4027_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1226_c7_fcb5] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1226_c7_fcb5_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1226_c7_fcb5_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1226_c7_fcb5_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1226_c7_fcb5_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1226_c7_fcb5_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1226_c7_fcb5_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1226_c7_fcb5_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1226_c7_fcb5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1235_c7_193f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1235_c7_193f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1235_c7_193f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1235_c7_193f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1235_c7_193f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1235_c7_193f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1235_c7_193f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1235_c7_193f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1235_c7_193f_return_output;

     -- n16_MUX[uxn_opcodes_h_l1231_c7_4027] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1231_c7_4027_cond <= VAR_n16_MUX_uxn_opcodes_h_l1231_c7_4027_cond;
     n16_MUX_uxn_opcodes_h_l1231_c7_4027_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1231_c7_4027_iftrue;
     n16_MUX_uxn_opcodes_h_l1231_c7_4027_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1231_c7_4027_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1231_c7_4027_return_output := n16_MUX_uxn_opcodes_h_l1231_c7_4027_return_output;

     -- t16_MUX[uxn_opcodes_h_l1212_c7_e6e0] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1212_c7_e6e0_cond <= VAR_t16_MUX_uxn_opcodes_h_l1212_c7_e6e0_cond;
     t16_MUX_uxn_opcodes_h_l1212_c7_e6e0_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1212_c7_e6e0_iftrue;
     t16_MUX_uxn_opcodes_h_l1212_c7_e6e0_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1212_c7_e6e0_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1212_c7_e6e0_return_output := t16_MUX_uxn_opcodes_h_l1212_c7_e6e0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1235_c7_193f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1235_c7_193f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1235_c7_193f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1235_c7_193f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1235_c7_193f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1235_c7_193f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1235_c7_193f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1235_c7_193f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1235_c7_193f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1231_c7_4027] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1231_c7_4027_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1231_c7_4027_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1231_c7_4027_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1231_c7_4027_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1231_c7_4027_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1231_c7_4027_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1231_c7_4027_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1231_c7_4027_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1235_c7_193f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1235_c7_193f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1235_c7_193f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1235_c7_193f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1235_c7_193f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1235_c7_193f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1235_c7_193f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1235_c7_193f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1235_c7_193f_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1226_c7_fcb5_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1231_c7_4027_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1231_c7_4027_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1235_c7_193f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1226_c7_fcb5_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1231_c7_4027_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1222_c7_da3d_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1226_c7_fcb5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1231_c7_4027_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1235_c7_193f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1231_c7_4027_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1235_c7_193f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_fcb5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1231_c7_4027_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1231_c7_4027_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1235_c7_193f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1204_c2_fee4_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1212_c7_e6e0_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1231_c7_4027] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1231_c7_4027_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1231_c7_4027_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1231_c7_4027_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1231_c7_4027_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1231_c7_4027_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1231_c7_4027_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1231_c7_4027_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1231_c7_4027_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1226_c7_fcb5] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1226_c7_fcb5_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1226_c7_fcb5_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1226_c7_fcb5_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1226_c7_fcb5_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1226_c7_fcb5_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1226_c7_fcb5_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1226_c7_fcb5_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1226_c7_fcb5_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1231_c7_4027] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1231_c7_4027_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1231_c7_4027_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1231_c7_4027_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1231_c7_4027_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1231_c7_4027_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1231_c7_4027_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1231_c7_4027_return_output := result_stack_value_MUX_uxn_opcodes_h_l1231_c7_4027_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1231_c7_4027] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1231_c7_4027_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1231_c7_4027_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1231_c7_4027_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1231_c7_4027_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1231_c7_4027_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1231_c7_4027_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1231_c7_4027_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1231_c7_4027_return_output;

     -- t16_MUX[uxn_opcodes_h_l1204_c2_fee4] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1204_c2_fee4_cond <= VAR_t16_MUX_uxn_opcodes_h_l1204_c2_fee4_cond;
     t16_MUX_uxn_opcodes_h_l1204_c2_fee4_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1204_c2_fee4_iftrue;
     t16_MUX_uxn_opcodes_h_l1204_c2_fee4_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1204_c2_fee4_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1204_c2_fee4_return_output := t16_MUX_uxn_opcodes_h_l1204_c2_fee4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1226_c7_fcb5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_fcb5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_fcb5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_fcb5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_fcb5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_fcb5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_fcb5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_fcb5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_fcb5_return_output;

     -- n16_MUX[uxn_opcodes_h_l1226_c7_fcb5] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1226_c7_fcb5_cond <= VAR_n16_MUX_uxn_opcodes_h_l1226_c7_fcb5_cond;
     n16_MUX_uxn_opcodes_h_l1226_c7_fcb5_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1226_c7_fcb5_iftrue;
     n16_MUX_uxn_opcodes_h_l1226_c7_fcb5_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1226_c7_fcb5_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1226_c7_fcb5_return_output := n16_MUX_uxn_opcodes_h_l1226_c7_fcb5_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1231_c7_4027] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1231_c7_4027_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1231_c7_4027_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1231_c7_4027_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1231_c7_4027_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1231_c7_4027_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1231_c7_4027_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1231_c7_4027_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1231_c7_4027_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1222_c7_da3d] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1222_c7_da3d_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1222_c7_da3d_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1222_c7_da3d_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1222_c7_da3d_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1222_c7_da3d_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1222_c7_da3d_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1222_c7_da3d_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1222_c7_da3d_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1222_c7_da3d_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1226_c7_fcb5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_fcb5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1231_c7_4027_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1222_c7_da3d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1226_c7_fcb5_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1216_c7_ad8a_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1222_c7_da3d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_fcb5_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1231_c7_4027_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_fcb5_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1231_c7_4027_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_da3d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_fcb5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1226_c7_fcb5_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1231_c7_4027_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1204_c2_fee4_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1226_c7_fcb5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_fcb5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_fcb5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_fcb5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_fcb5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_fcb5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_fcb5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_fcb5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_fcb5_return_output;

     -- n16_MUX[uxn_opcodes_h_l1222_c7_da3d] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1222_c7_da3d_cond <= VAR_n16_MUX_uxn_opcodes_h_l1222_c7_da3d_cond;
     n16_MUX_uxn_opcodes_h_l1222_c7_da3d_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1222_c7_da3d_iftrue;
     n16_MUX_uxn_opcodes_h_l1222_c7_da3d_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1222_c7_da3d_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1222_c7_da3d_return_output := n16_MUX_uxn_opcodes_h_l1222_c7_da3d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1226_c7_fcb5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_fcb5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_fcb5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_fcb5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_fcb5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_fcb5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_fcb5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_fcb5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_fcb5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1226_c7_fcb5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_fcb5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_fcb5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_fcb5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_fcb5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_fcb5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_fcb5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_fcb5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_fcb5_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1226_c7_fcb5] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1226_c7_fcb5_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1226_c7_fcb5_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1226_c7_fcb5_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1226_c7_fcb5_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1226_c7_fcb5_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1226_c7_fcb5_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1226_c7_fcb5_return_output := result_stack_value_MUX_uxn_opcodes_h_l1226_c7_fcb5_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1216_c7_ad8a] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1216_c7_ad8a_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1216_c7_ad8a_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1216_c7_ad8a_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1216_c7_ad8a_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1216_c7_ad8a_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1216_c7_ad8a_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1216_c7_ad8a_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1216_c7_ad8a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1222_c7_da3d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1222_c7_da3d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1222_c7_da3d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1222_c7_da3d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1222_c7_da3d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1222_c7_da3d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1222_c7_da3d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1222_c7_da3d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1222_c7_da3d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1222_c7_da3d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_da3d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_da3d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_da3d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_da3d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_da3d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_da3d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_da3d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_da3d_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l1216_c7_ad8a_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1222_c7_da3d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_da3d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_fcb5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1216_c7_ad8a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1222_c7_da3d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1212_c7_e6e0_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1216_c7_ad8a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_da3d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_fcb5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_da3d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_fcb5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1216_c7_ad8a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_da3d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1222_c7_da3d_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1226_c7_fcb5_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1216_c7_ad8a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1216_c7_ad8a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1216_c7_ad8a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1216_c7_ad8a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1216_c7_ad8a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1216_c7_ad8a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1216_c7_ad8a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1216_c7_ad8a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1216_c7_ad8a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1216_c7_ad8a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1216_c7_ad8a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1216_c7_ad8a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1216_c7_ad8a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1216_c7_ad8a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1216_c7_ad8a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1216_c7_ad8a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1216_c7_ad8a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1216_c7_ad8a_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1212_c7_e6e0] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1212_c7_e6e0_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1212_c7_e6e0_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1212_c7_e6e0_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1212_c7_e6e0_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1212_c7_e6e0_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1212_c7_e6e0_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1212_c7_e6e0_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1212_c7_e6e0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1222_c7_da3d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_da3d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_da3d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_da3d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_da3d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_da3d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_da3d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_da3d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_da3d_return_output;

     -- n16_MUX[uxn_opcodes_h_l1216_c7_ad8a] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1216_c7_ad8a_cond <= VAR_n16_MUX_uxn_opcodes_h_l1216_c7_ad8a_cond;
     n16_MUX_uxn_opcodes_h_l1216_c7_ad8a_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1216_c7_ad8a_iftrue;
     n16_MUX_uxn_opcodes_h_l1216_c7_ad8a_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1216_c7_ad8a_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1216_c7_ad8a_return_output := n16_MUX_uxn_opcodes_h_l1216_c7_ad8a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1222_c7_da3d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_da3d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_da3d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_da3d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_da3d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_da3d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_da3d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_da3d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_da3d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1222_c7_da3d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_da3d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_da3d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_da3d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_da3d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_da3d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_da3d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_da3d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_da3d_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1222_c7_da3d] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1222_c7_da3d_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1222_c7_da3d_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1222_c7_da3d_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1222_c7_da3d_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1222_c7_da3d_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1222_c7_da3d_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1222_c7_da3d_return_output := result_stack_value_MUX_uxn_opcodes_h_l1222_c7_da3d_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l1212_c7_e6e0_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1216_c7_ad8a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1216_c7_ad8a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_da3d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_e6e0_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1216_c7_ad8a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1204_c2_fee4_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1212_c7_e6e0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1216_c7_ad8a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_da3d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1216_c7_ad8a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_da3d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_e6e0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1216_c7_ad8a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1216_c7_ad8a_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1222_c7_da3d_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1216_c7_ad8a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1216_c7_ad8a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1216_c7_ad8a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1216_c7_ad8a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1216_c7_ad8a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1216_c7_ad8a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1216_c7_ad8a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1216_c7_ad8a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1216_c7_ad8a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1212_c7_e6e0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_e6e0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_e6e0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_e6e0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_e6e0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_e6e0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_e6e0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_e6e0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_e6e0_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1204_c2_fee4] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1204_c2_fee4_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1204_c2_fee4_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1204_c2_fee4_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1204_c2_fee4_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1204_c2_fee4_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1204_c2_fee4_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1204_c2_fee4_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1204_c2_fee4_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1212_c7_e6e0] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_e6e0_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_e6e0_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_e6e0_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_e6e0_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_e6e0_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_e6e0_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_e6e0_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_e6e0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1216_c7_ad8a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1216_c7_ad8a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1216_c7_ad8a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1216_c7_ad8a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1216_c7_ad8a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1216_c7_ad8a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1216_c7_ad8a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1216_c7_ad8a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1216_c7_ad8a_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1216_c7_ad8a] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1216_c7_ad8a_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1216_c7_ad8a_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1216_c7_ad8a_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1216_c7_ad8a_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1216_c7_ad8a_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1216_c7_ad8a_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1216_c7_ad8a_return_output := result_stack_value_MUX_uxn_opcodes_h_l1216_c7_ad8a_return_output;

     -- n16_MUX[uxn_opcodes_h_l1212_c7_e6e0] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1212_c7_e6e0_cond <= VAR_n16_MUX_uxn_opcodes_h_l1212_c7_e6e0_cond;
     n16_MUX_uxn_opcodes_h_l1212_c7_e6e0_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1212_c7_e6e0_iftrue;
     n16_MUX_uxn_opcodes_h_l1212_c7_e6e0_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1212_c7_e6e0_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1212_c7_e6e0_return_output := n16_MUX_uxn_opcodes_h_l1212_c7_e6e0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1216_c7_ad8a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1216_c7_ad8a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1216_c7_ad8a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1216_c7_ad8a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1216_c7_ad8a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1216_c7_ad8a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1216_c7_ad8a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1216_c7_ad8a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1216_c7_ad8a_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l1204_c2_fee4_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1212_c7_e6e0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_e6e0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1216_c7_ad8a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1204_c2_fee4_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1212_c7_e6e0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_e6e0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1216_c7_ad8a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1212_c7_e6e0_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1216_c7_ad8a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1204_c2_fee4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1212_c7_e6e0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1212_c7_e6e0_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1216_c7_ad8a_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1212_c7_e6e0] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1212_c7_e6e0_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1212_c7_e6e0_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1212_c7_e6e0_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1212_c7_e6e0_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1212_c7_e6e0_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1212_c7_e6e0_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1212_c7_e6e0_return_output := result_stack_value_MUX_uxn_opcodes_h_l1212_c7_e6e0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1212_c7_e6e0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_e6e0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_e6e0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_e6e0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_e6e0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_e6e0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_e6e0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_e6e0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_e6e0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1212_c7_e6e0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1212_c7_e6e0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1212_c7_e6e0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1212_c7_e6e0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1212_c7_e6e0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1212_c7_e6e0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1212_c7_e6e0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1212_c7_e6e0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1212_c7_e6e0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1212_c7_e6e0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_e6e0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_e6e0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_e6e0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_e6e0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_e6e0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_e6e0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_e6e0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_e6e0_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1204_c2_fee4] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1204_c2_fee4_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1204_c2_fee4_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1204_c2_fee4_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1204_c2_fee4_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1204_c2_fee4_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1204_c2_fee4_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1204_c2_fee4_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1204_c2_fee4_return_output;

     -- n16_MUX[uxn_opcodes_h_l1204_c2_fee4] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1204_c2_fee4_cond <= VAR_n16_MUX_uxn_opcodes_h_l1204_c2_fee4_cond;
     n16_MUX_uxn_opcodes_h_l1204_c2_fee4_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1204_c2_fee4_iftrue;
     n16_MUX_uxn_opcodes_h_l1204_c2_fee4_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1204_c2_fee4_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1204_c2_fee4_return_output := n16_MUX_uxn_opcodes_h_l1204_c2_fee4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1204_c2_fee4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1204_c2_fee4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1204_c2_fee4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1204_c2_fee4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1204_c2_fee4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1204_c2_fee4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1204_c2_fee4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1204_c2_fee4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1204_c2_fee4_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1204_c2_fee4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1204_c2_fee4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1212_c7_e6e0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1204_c2_fee4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1212_c7_e6e0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1204_c2_fee4_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1212_c7_e6e0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1204_c2_fee4_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1212_c7_e6e0_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1204_c2_fee4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1204_c2_fee4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1204_c2_fee4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1204_c2_fee4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1204_c2_fee4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1204_c2_fee4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1204_c2_fee4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1204_c2_fee4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1204_c2_fee4_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1204_c2_fee4] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1204_c2_fee4_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1204_c2_fee4_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1204_c2_fee4_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1204_c2_fee4_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1204_c2_fee4_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1204_c2_fee4_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1204_c2_fee4_return_output := result_stack_value_MUX_uxn_opcodes_h_l1204_c2_fee4_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1204_c2_fee4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1204_c2_fee4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1204_c2_fee4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1204_c2_fee4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1204_c2_fee4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1204_c2_fee4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1204_c2_fee4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1204_c2_fee4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1204_c2_fee4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1204_c2_fee4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1204_c2_fee4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1204_c2_fee4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1204_c2_fee4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1204_c2_fee4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1204_c2_fee4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1204_c2_fee4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1204_c2_fee4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1204_c2_fee4_return_output;

     -- Submodule level 12
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_49dd_uxn_opcodes_h_l1262_l1200_DUPLICATE_5bd3 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_49dd_uxn_opcodes_h_l1262_l1200_DUPLICATE_5bd3_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_49dd(
     result,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1204_c2_fee4_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1204_c2_fee4_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1204_c2_fee4_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1204_c2_fee4_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1204_c2_fee4_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1204_c2_fee4_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1204_c2_fee4_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1204_c2_fee4_return_output);

     -- Submodule level 13
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_49dd_uxn_opcodes_h_l1262_l1200_DUPLICATE_5bd3_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_49dd_uxn_opcodes_h_l1262_l1200_DUPLICATE_5bd3_return_output;
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
