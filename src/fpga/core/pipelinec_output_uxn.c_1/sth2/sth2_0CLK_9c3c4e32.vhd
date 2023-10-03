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
-- Submodules: 95
entity sth2_0CLK_9c3c4e32 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end sth2_0CLK_9c3c4e32;
architecture arch of sth2_0CLK_9c3c4e32 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l1556_c6_3b16]
signal BIN_OP_EQ_uxn_opcodes_h_l1556_c6_3b16_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1556_c6_3b16_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1556_c6_3b16_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1556_c1_ffa0]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1556_c1_ffa0_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1556_c1_ffa0_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1556_c1_ffa0_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1556_c1_ffa0_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1556_c2_3377]
signal t16_MUX_uxn_opcodes_h_l1556_c2_3377_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1556_c2_3377_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1556_c2_3377_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1556_c2_3377_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1556_c2_3377]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1556_c2_3377_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1556_c2_3377_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1556_c2_3377_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1556_c2_3377_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1556_c2_3377]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1556_c2_3377_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1556_c2_3377_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1556_c2_3377_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1556_c2_3377_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1556_c2_3377]
signal result_stack_value_MUX_uxn_opcodes_h_l1556_c2_3377_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1556_c2_3377_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1556_c2_3377_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1556_c2_3377_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1556_c2_3377]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1556_c2_3377_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1556_c2_3377_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1556_c2_3377_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1556_c2_3377_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1556_c2_3377]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1556_c2_3377_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1556_c2_3377_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1556_c2_3377_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1556_c2_3377_return_output : signed(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1556_c2_3377]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1556_c2_3377_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1556_c2_3377_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1556_c2_3377_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1556_c2_3377_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1556_c2_3377]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1556_c2_3377_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1556_c2_3377_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1556_c2_3377_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1556_c2_3377_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1556_c2_3377]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1556_c2_3377_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1556_c2_3377_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1556_c2_3377_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1556_c2_3377_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l1557_c3_e35f[uxn_opcodes_h_l1557_c3_e35f]
signal printf_uxn_opcodes_h_l1557_c3_e35f_uxn_opcodes_h_l1557_c3_e35f_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1564_c11_f14b]
signal BIN_OP_EQ_uxn_opcodes_h_l1564_c11_f14b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1564_c11_f14b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1564_c11_f14b_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1564_c7_f76d]
signal t16_MUX_uxn_opcodes_h_l1564_c7_f76d_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1564_c7_f76d_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1564_c7_f76d_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1564_c7_f76d_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1564_c7_f76d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1564_c7_f76d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1564_c7_f76d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1564_c7_f76d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1564_c7_f76d_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1564_c7_f76d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1564_c7_f76d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1564_c7_f76d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1564_c7_f76d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1564_c7_f76d_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1564_c7_f76d]
signal result_stack_value_MUX_uxn_opcodes_h_l1564_c7_f76d_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1564_c7_f76d_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1564_c7_f76d_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1564_c7_f76d_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1564_c7_f76d]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1564_c7_f76d_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1564_c7_f76d_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1564_c7_f76d_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1564_c7_f76d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1564_c7_f76d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1564_c7_f76d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1564_c7_f76d_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1564_c7_f76d_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1564_c7_f76d_return_output : signed(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1564_c7_f76d]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1564_c7_f76d_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1564_c7_f76d_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1564_c7_f76d_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1564_c7_f76d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1564_c7_f76d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1564_c7_f76d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1564_c7_f76d_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1564_c7_f76d_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1564_c7_f76d_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1564_c7_f76d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1564_c7_f76d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1564_c7_f76d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1564_c7_f76d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1564_c7_f76d_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1568_c11_a70b]
signal BIN_OP_EQ_uxn_opcodes_h_l1568_c11_a70b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1568_c11_a70b_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1568_c11_a70b_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1568_c7_a645]
signal t16_MUX_uxn_opcodes_h_l1568_c7_a645_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1568_c7_a645_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1568_c7_a645_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1568_c7_a645_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1568_c7_a645]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_a645_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_a645_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_a645_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_a645_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1568_c7_a645]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_a645_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_a645_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_a645_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_a645_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1568_c7_a645]
signal result_stack_value_MUX_uxn_opcodes_h_l1568_c7_a645_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1568_c7_a645_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1568_c7_a645_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1568_c7_a645_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1568_c7_a645]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1568_c7_a645_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1568_c7_a645_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1568_c7_a645_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1568_c7_a645_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1568_c7_a645]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_a645_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_a645_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_a645_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_a645_return_output : signed(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1568_c7_a645]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1568_c7_a645_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1568_c7_a645_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1568_c7_a645_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1568_c7_a645_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1568_c7_a645]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_a645_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_a645_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_a645_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_a645_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1568_c7_a645]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_a645_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_a645_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_a645_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_a645_return_output : unsigned(0 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1570_c3_df9a]
signal CONST_SL_8_uxn_opcodes_h_l1570_c3_df9a_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1570_c3_df9a_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1574_c11_7e9f]
signal BIN_OP_EQ_uxn_opcodes_h_l1574_c11_7e9f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1574_c11_7e9f_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1574_c11_7e9f_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1574_c7_bc8b]
signal t16_MUX_uxn_opcodes_h_l1574_c7_bc8b_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1574_c7_bc8b_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1574_c7_bc8b_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1574_c7_bc8b_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1574_c7_bc8b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_bc8b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_bc8b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_bc8b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_bc8b_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1574_c7_bc8b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_bc8b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_bc8b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_bc8b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_bc8b_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1574_c7_bc8b]
signal result_stack_value_MUX_uxn_opcodes_h_l1574_c7_bc8b_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1574_c7_bc8b_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1574_c7_bc8b_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1574_c7_bc8b_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1574_c7_bc8b]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1574_c7_bc8b_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1574_c7_bc8b_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1574_c7_bc8b_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1574_c7_bc8b_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1574_c7_bc8b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_bc8b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_bc8b_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_bc8b_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_bc8b_return_output : signed(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1574_c7_bc8b]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1574_c7_bc8b_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1574_c7_bc8b_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1574_c7_bc8b_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1574_c7_bc8b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1574_c7_bc8b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_bc8b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_bc8b_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_bc8b_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_bc8b_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1574_c7_bc8b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_bc8b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_bc8b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_bc8b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_bc8b_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1578_c11_5433]
signal BIN_OP_EQ_uxn_opcodes_h_l1578_c11_5433_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1578_c11_5433_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1578_c11_5433_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1578_c7_7ba4]
signal t16_MUX_uxn_opcodes_h_l1578_c7_7ba4_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1578_c7_7ba4_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1578_c7_7ba4_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1578_c7_7ba4_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1578_c7_7ba4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_7ba4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_7ba4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_7ba4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_7ba4_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1578_c7_7ba4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_7ba4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_7ba4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_7ba4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_7ba4_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1578_c7_7ba4]
signal result_stack_value_MUX_uxn_opcodes_h_l1578_c7_7ba4_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1578_c7_7ba4_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1578_c7_7ba4_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1578_c7_7ba4_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1578_c7_7ba4]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1578_c7_7ba4_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1578_c7_7ba4_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1578_c7_7ba4_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1578_c7_7ba4_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1578_c7_7ba4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_7ba4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_7ba4_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_7ba4_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_7ba4_return_output : signed(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1578_c7_7ba4]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1578_c7_7ba4_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1578_c7_7ba4_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1578_c7_7ba4_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1578_c7_7ba4_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1578_c7_7ba4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_7ba4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_7ba4_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_7ba4_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_7ba4_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1578_c7_7ba4]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1578_c7_7ba4_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1578_c7_7ba4_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1578_c7_7ba4_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1578_c7_7ba4_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1579_c3_c17a]
signal BIN_OP_OR_uxn_opcodes_h_l1579_c3_c17a_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1579_c3_c17a_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1579_c3_c17a_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1582_c11_2792]
signal BIN_OP_EQ_uxn_opcodes_h_l1582_c11_2792_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1582_c11_2792_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1582_c11_2792_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1582_c7_03ac]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_03ac_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_03ac_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_03ac_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_03ac_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1582_c7_03ac]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_03ac_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_03ac_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_03ac_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_03ac_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1582_c7_03ac]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1582_c7_03ac_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1582_c7_03ac_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1582_c7_03ac_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1582_c7_03ac_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1582_c7_03ac]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_03ac_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_03ac_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_03ac_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_03ac_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1582_c7_03ac]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1582_c7_03ac_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1582_c7_03ac_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1582_c7_03ac_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1582_c7_03ac_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1582_c7_03ac]
signal result_stack_value_MUX_uxn_opcodes_h_l1582_c7_03ac_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1582_c7_03ac_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1582_c7_03ac_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1582_c7_03ac_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1582_c7_03ac]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1582_c7_03ac_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1582_c7_03ac_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1582_c7_03ac_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1582_c7_03ac_return_output : signed(7 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1584_c32_949d]
signal BIN_OP_AND_uxn_opcodes_h_l1584_c32_949d_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1584_c32_949d_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1584_c32_949d_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1584_c32_2221]
signal BIN_OP_GT_uxn_opcodes_h_l1584_c32_2221_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1584_c32_2221_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1584_c32_2221_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1584_c32_5784]
signal MUX_uxn_opcodes_h_l1584_c32_5784_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1584_c32_5784_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1584_c32_5784_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1584_c32_5784_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1586_c11_ff20]
signal BIN_OP_EQ_uxn_opcodes_h_l1586_c11_ff20_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1586_c11_ff20_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1586_c11_ff20_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1586_c7_27df]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1586_c7_27df_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1586_c7_27df_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1586_c7_27df_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1586_c7_27df_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1586_c7_27df]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1586_c7_27df_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1586_c7_27df_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1586_c7_27df_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1586_c7_27df_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1586_c7_27df]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1586_c7_27df_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1586_c7_27df_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1586_c7_27df_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1586_c7_27df_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1586_c7_27df]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1586_c7_27df_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1586_c7_27df_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1586_c7_27df_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1586_c7_27df_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1586_c7_27df]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1586_c7_27df_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1586_c7_27df_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1586_c7_27df_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1586_c7_27df_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1586_c7_27df]
signal result_stack_value_MUX_uxn_opcodes_h_l1586_c7_27df_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1586_c7_27df_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1586_c7_27df_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1586_c7_27df_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1586_c7_27df]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1586_c7_27df_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1586_c7_27df_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1586_c7_27df_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1586_c7_27df_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1591_c11_6614]
signal BIN_OP_EQ_uxn_opcodes_h_l1591_c11_6614_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1591_c11_6614_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1591_c11_6614_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1591_c7_8fc5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1591_c7_8fc5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1591_c7_8fc5_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1591_c7_8fc5_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1591_c7_8fc5_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1591_c7_8fc5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1591_c7_8fc5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1591_c7_8fc5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1591_c7_8fc5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1591_c7_8fc5_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1591_c7_8fc5]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1591_c7_8fc5_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1591_c7_8fc5_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1591_c7_8fc5_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1591_c7_8fc5_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1591_c7_8fc5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1591_c7_8fc5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1591_c7_8fc5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1591_c7_8fc5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1591_c7_8fc5_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1591_c7_8fc5]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1591_c7_8fc5_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1591_c7_8fc5_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1591_c7_8fc5_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1591_c7_8fc5_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1591_c7_8fc5]
signal result_stack_value_MUX_uxn_opcodes_h_l1591_c7_8fc5_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1591_c7_8fc5_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1591_c7_8fc5_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1591_c7_8fc5_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1597_c11_5e6f]
signal BIN_OP_EQ_uxn_opcodes_h_l1597_c11_5e6f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1597_c11_5e6f_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1597_c11_5e6f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1597_c7_c945]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1597_c7_c945_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1597_c7_c945_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1597_c7_c945_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1597_c7_c945_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1597_c7_c945]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1597_c7_c945_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1597_c7_c945_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1597_c7_c945_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1597_c7_c945_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1597_c7_c945]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1597_c7_c945_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1597_c7_c945_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1597_c7_c945_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1597_c7_c945_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1597_c7_c945]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1597_c7_c945_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1597_c7_c945_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1597_c7_c945_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1597_c7_c945_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1597_c7_c945]
signal result_stack_value_MUX_uxn_opcodes_h_l1597_c7_c945_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1597_c7_c945_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1597_c7_c945_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1597_c7_c945_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1600_c34_1492]
signal CONST_SR_8_uxn_opcodes_h_l1600_c34_1492_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1600_c34_1492_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1602_c11_fcb9]
signal BIN_OP_EQ_uxn_opcodes_h_l1602_c11_fcb9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1602_c11_fcb9_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1602_c11_fcb9_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1602_c7_eec2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1602_c7_eec2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1602_c7_eec2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1602_c7_eec2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1602_c7_eec2_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1602_c7_eec2]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1602_c7_eec2_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1602_c7_eec2_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1602_c7_eec2_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1602_c7_eec2_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1602_c7_eec2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1602_c7_eec2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1602_c7_eec2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1602_c7_eec2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1602_c7_eec2_return_output : unsigned(0 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l1556_c6_3b16
BIN_OP_EQ_uxn_opcodes_h_l1556_c6_3b16 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1556_c6_3b16_left,
BIN_OP_EQ_uxn_opcodes_h_l1556_c6_3b16_right,
BIN_OP_EQ_uxn_opcodes_h_l1556_c6_3b16_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1556_c1_ffa0
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1556_c1_ffa0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1556_c1_ffa0_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1556_c1_ffa0_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1556_c1_ffa0_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1556_c1_ffa0_return_output);

-- t16_MUX_uxn_opcodes_h_l1556_c2_3377
t16_MUX_uxn_opcodes_h_l1556_c2_3377 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1556_c2_3377_cond,
t16_MUX_uxn_opcodes_h_l1556_c2_3377_iftrue,
t16_MUX_uxn_opcodes_h_l1556_c2_3377_iffalse,
t16_MUX_uxn_opcodes_h_l1556_c2_3377_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1556_c2_3377
result_is_opc_done_MUX_uxn_opcodes_h_l1556_c2_3377 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1556_c2_3377_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1556_c2_3377_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1556_c2_3377_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1556_c2_3377_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1556_c2_3377
result_is_stack_write_MUX_uxn_opcodes_h_l1556_c2_3377 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1556_c2_3377_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1556_c2_3377_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1556_c2_3377_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1556_c2_3377_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1556_c2_3377
result_stack_value_MUX_uxn_opcodes_h_l1556_c2_3377 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1556_c2_3377_cond,
result_stack_value_MUX_uxn_opcodes_h_l1556_c2_3377_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1556_c2_3377_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1556_c2_3377_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1556_c2_3377
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1556_c2_3377 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1556_c2_3377_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1556_c2_3377_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1556_c2_3377_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1556_c2_3377_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1556_c2_3377
result_sp_relative_shift_MUX_uxn_opcodes_h_l1556_c2_3377 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1556_c2_3377_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1556_c2_3377_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1556_c2_3377_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1556_c2_3377_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1556_c2_3377
result_is_stack_read_MUX_uxn_opcodes_h_l1556_c2_3377 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1556_c2_3377_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1556_c2_3377_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1556_c2_3377_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1556_c2_3377_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1556_c2_3377
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1556_c2_3377 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1556_c2_3377_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1556_c2_3377_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1556_c2_3377_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1556_c2_3377_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1556_c2_3377
result_is_sp_shift_MUX_uxn_opcodes_h_l1556_c2_3377 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1556_c2_3377_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1556_c2_3377_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1556_c2_3377_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1556_c2_3377_return_output);

-- printf_uxn_opcodes_h_l1557_c3_e35f_uxn_opcodes_h_l1557_c3_e35f
printf_uxn_opcodes_h_l1557_c3_e35f_uxn_opcodes_h_l1557_c3_e35f : entity work.printf_uxn_opcodes_h_l1557_c3_e35f_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1557_c3_e35f_uxn_opcodes_h_l1557_c3_e35f_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1564_c11_f14b
BIN_OP_EQ_uxn_opcodes_h_l1564_c11_f14b : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1564_c11_f14b_left,
BIN_OP_EQ_uxn_opcodes_h_l1564_c11_f14b_right,
BIN_OP_EQ_uxn_opcodes_h_l1564_c11_f14b_return_output);

-- t16_MUX_uxn_opcodes_h_l1564_c7_f76d
t16_MUX_uxn_opcodes_h_l1564_c7_f76d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1564_c7_f76d_cond,
t16_MUX_uxn_opcodes_h_l1564_c7_f76d_iftrue,
t16_MUX_uxn_opcodes_h_l1564_c7_f76d_iffalse,
t16_MUX_uxn_opcodes_h_l1564_c7_f76d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1564_c7_f76d
result_is_opc_done_MUX_uxn_opcodes_h_l1564_c7_f76d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1564_c7_f76d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1564_c7_f76d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1564_c7_f76d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1564_c7_f76d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1564_c7_f76d
result_is_stack_write_MUX_uxn_opcodes_h_l1564_c7_f76d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1564_c7_f76d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1564_c7_f76d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1564_c7_f76d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1564_c7_f76d_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1564_c7_f76d
result_stack_value_MUX_uxn_opcodes_h_l1564_c7_f76d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1564_c7_f76d_cond,
result_stack_value_MUX_uxn_opcodes_h_l1564_c7_f76d_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1564_c7_f76d_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1564_c7_f76d_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1564_c7_f76d
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1564_c7_f76d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1564_c7_f76d_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1564_c7_f76d_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1564_c7_f76d_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1564_c7_f76d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1564_c7_f76d
result_sp_relative_shift_MUX_uxn_opcodes_h_l1564_c7_f76d : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1564_c7_f76d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1564_c7_f76d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1564_c7_f76d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1564_c7_f76d_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1564_c7_f76d
result_is_stack_read_MUX_uxn_opcodes_h_l1564_c7_f76d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1564_c7_f76d_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1564_c7_f76d_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1564_c7_f76d_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1564_c7_f76d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1564_c7_f76d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1564_c7_f76d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1564_c7_f76d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1564_c7_f76d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1564_c7_f76d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1564_c7_f76d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1564_c7_f76d
result_is_sp_shift_MUX_uxn_opcodes_h_l1564_c7_f76d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1564_c7_f76d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1564_c7_f76d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1564_c7_f76d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1564_c7_f76d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1568_c11_a70b
BIN_OP_EQ_uxn_opcodes_h_l1568_c11_a70b : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1568_c11_a70b_left,
BIN_OP_EQ_uxn_opcodes_h_l1568_c11_a70b_right,
BIN_OP_EQ_uxn_opcodes_h_l1568_c11_a70b_return_output);

-- t16_MUX_uxn_opcodes_h_l1568_c7_a645
t16_MUX_uxn_opcodes_h_l1568_c7_a645 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1568_c7_a645_cond,
t16_MUX_uxn_opcodes_h_l1568_c7_a645_iftrue,
t16_MUX_uxn_opcodes_h_l1568_c7_a645_iffalse,
t16_MUX_uxn_opcodes_h_l1568_c7_a645_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_a645
result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_a645 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_a645_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_a645_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_a645_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_a645_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_a645
result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_a645 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_a645_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_a645_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_a645_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_a645_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1568_c7_a645
result_stack_value_MUX_uxn_opcodes_h_l1568_c7_a645 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1568_c7_a645_cond,
result_stack_value_MUX_uxn_opcodes_h_l1568_c7_a645_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1568_c7_a645_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1568_c7_a645_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1568_c7_a645
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1568_c7_a645 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1568_c7_a645_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1568_c7_a645_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1568_c7_a645_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1568_c7_a645_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_a645
result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_a645 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_a645_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_a645_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_a645_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_a645_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1568_c7_a645
result_is_stack_read_MUX_uxn_opcodes_h_l1568_c7_a645 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1568_c7_a645_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1568_c7_a645_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1568_c7_a645_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1568_c7_a645_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_a645
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_a645 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_a645_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_a645_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_a645_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_a645_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_a645
result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_a645 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_a645_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_a645_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_a645_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_a645_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1570_c3_df9a
CONST_SL_8_uxn_opcodes_h_l1570_c3_df9a : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1570_c3_df9a_x,
CONST_SL_8_uxn_opcodes_h_l1570_c3_df9a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1574_c11_7e9f
BIN_OP_EQ_uxn_opcodes_h_l1574_c11_7e9f : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1574_c11_7e9f_left,
BIN_OP_EQ_uxn_opcodes_h_l1574_c11_7e9f_right,
BIN_OP_EQ_uxn_opcodes_h_l1574_c11_7e9f_return_output);

-- t16_MUX_uxn_opcodes_h_l1574_c7_bc8b
t16_MUX_uxn_opcodes_h_l1574_c7_bc8b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1574_c7_bc8b_cond,
t16_MUX_uxn_opcodes_h_l1574_c7_bc8b_iftrue,
t16_MUX_uxn_opcodes_h_l1574_c7_bc8b_iffalse,
t16_MUX_uxn_opcodes_h_l1574_c7_bc8b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_bc8b
result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_bc8b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_bc8b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_bc8b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_bc8b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_bc8b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_bc8b
result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_bc8b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_bc8b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_bc8b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_bc8b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_bc8b_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1574_c7_bc8b
result_stack_value_MUX_uxn_opcodes_h_l1574_c7_bc8b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1574_c7_bc8b_cond,
result_stack_value_MUX_uxn_opcodes_h_l1574_c7_bc8b_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1574_c7_bc8b_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1574_c7_bc8b_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1574_c7_bc8b
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1574_c7_bc8b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1574_c7_bc8b_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1574_c7_bc8b_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1574_c7_bc8b_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1574_c7_bc8b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_bc8b
result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_bc8b : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_bc8b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_bc8b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_bc8b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_bc8b_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1574_c7_bc8b
result_is_stack_read_MUX_uxn_opcodes_h_l1574_c7_bc8b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1574_c7_bc8b_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1574_c7_bc8b_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1574_c7_bc8b_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1574_c7_bc8b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_bc8b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_bc8b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_bc8b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_bc8b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_bc8b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_bc8b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_bc8b
result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_bc8b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_bc8b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_bc8b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_bc8b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_bc8b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1578_c11_5433
BIN_OP_EQ_uxn_opcodes_h_l1578_c11_5433 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1578_c11_5433_left,
BIN_OP_EQ_uxn_opcodes_h_l1578_c11_5433_right,
BIN_OP_EQ_uxn_opcodes_h_l1578_c11_5433_return_output);

-- t16_MUX_uxn_opcodes_h_l1578_c7_7ba4
t16_MUX_uxn_opcodes_h_l1578_c7_7ba4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1578_c7_7ba4_cond,
t16_MUX_uxn_opcodes_h_l1578_c7_7ba4_iftrue,
t16_MUX_uxn_opcodes_h_l1578_c7_7ba4_iffalse,
t16_MUX_uxn_opcodes_h_l1578_c7_7ba4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_7ba4
result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_7ba4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_7ba4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_7ba4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_7ba4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_7ba4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_7ba4
result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_7ba4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_7ba4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_7ba4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_7ba4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_7ba4_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1578_c7_7ba4
result_stack_value_MUX_uxn_opcodes_h_l1578_c7_7ba4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1578_c7_7ba4_cond,
result_stack_value_MUX_uxn_opcodes_h_l1578_c7_7ba4_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1578_c7_7ba4_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1578_c7_7ba4_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1578_c7_7ba4
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1578_c7_7ba4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1578_c7_7ba4_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1578_c7_7ba4_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1578_c7_7ba4_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1578_c7_7ba4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_7ba4
result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_7ba4 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_7ba4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_7ba4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_7ba4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_7ba4_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1578_c7_7ba4
result_is_stack_read_MUX_uxn_opcodes_h_l1578_c7_7ba4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1578_c7_7ba4_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1578_c7_7ba4_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1578_c7_7ba4_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1578_c7_7ba4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_7ba4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_7ba4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_7ba4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_7ba4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_7ba4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_7ba4_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1578_c7_7ba4
result_is_sp_shift_MUX_uxn_opcodes_h_l1578_c7_7ba4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1578_c7_7ba4_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1578_c7_7ba4_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1578_c7_7ba4_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1578_c7_7ba4_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1579_c3_c17a
BIN_OP_OR_uxn_opcodes_h_l1579_c3_c17a : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1579_c3_c17a_left,
BIN_OP_OR_uxn_opcodes_h_l1579_c3_c17a_right,
BIN_OP_OR_uxn_opcodes_h_l1579_c3_c17a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1582_c11_2792
BIN_OP_EQ_uxn_opcodes_h_l1582_c11_2792 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1582_c11_2792_left,
BIN_OP_EQ_uxn_opcodes_h_l1582_c11_2792_right,
BIN_OP_EQ_uxn_opcodes_h_l1582_c11_2792_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_03ac
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_03ac : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_03ac_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_03ac_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_03ac_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_03ac_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_03ac
result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_03ac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_03ac_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_03ac_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_03ac_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_03ac_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1582_c7_03ac
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1582_c7_03ac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1582_c7_03ac_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1582_c7_03ac_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1582_c7_03ac_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1582_c7_03ac_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_03ac
result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_03ac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_03ac_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_03ac_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_03ac_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_03ac_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1582_c7_03ac
result_is_sp_shift_MUX_uxn_opcodes_h_l1582_c7_03ac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1582_c7_03ac_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1582_c7_03ac_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1582_c7_03ac_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1582_c7_03ac_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1582_c7_03ac
result_stack_value_MUX_uxn_opcodes_h_l1582_c7_03ac : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1582_c7_03ac_cond,
result_stack_value_MUX_uxn_opcodes_h_l1582_c7_03ac_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1582_c7_03ac_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1582_c7_03ac_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1582_c7_03ac
result_sp_relative_shift_MUX_uxn_opcodes_h_l1582_c7_03ac : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1582_c7_03ac_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1582_c7_03ac_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1582_c7_03ac_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1582_c7_03ac_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1584_c32_949d
BIN_OP_AND_uxn_opcodes_h_l1584_c32_949d : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1584_c32_949d_left,
BIN_OP_AND_uxn_opcodes_h_l1584_c32_949d_right,
BIN_OP_AND_uxn_opcodes_h_l1584_c32_949d_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1584_c32_2221
BIN_OP_GT_uxn_opcodes_h_l1584_c32_2221 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1584_c32_2221_left,
BIN_OP_GT_uxn_opcodes_h_l1584_c32_2221_right,
BIN_OP_GT_uxn_opcodes_h_l1584_c32_2221_return_output);

-- MUX_uxn_opcodes_h_l1584_c32_5784
MUX_uxn_opcodes_h_l1584_c32_5784 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1584_c32_5784_cond,
MUX_uxn_opcodes_h_l1584_c32_5784_iftrue,
MUX_uxn_opcodes_h_l1584_c32_5784_iffalse,
MUX_uxn_opcodes_h_l1584_c32_5784_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1586_c11_ff20
BIN_OP_EQ_uxn_opcodes_h_l1586_c11_ff20 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1586_c11_ff20_left,
BIN_OP_EQ_uxn_opcodes_h_l1586_c11_ff20_right,
BIN_OP_EQ_uxn_opcodes_h_l1586_c11_ff20_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1586_c7_27df
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1586_c7_27df : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1586_c7_27df_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1586_c7_27df_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1586_c7_27df_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1586_c7_27df_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1586_c7_27df
result_is_opc_done_MUX_uxn_opcodes_h_l1586_c7_27df : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1586_c7_27df_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1586_c7_27df_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1586_c7_27df_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1586_c7_27df_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1586_c7_27df
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1586_c7_27df : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1586_c7_27df_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1586_c7_27df_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1586_c7_27df_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1586_c7_27df_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1586_c7_27df
result_is_stack_write_MUX_uxn_opcodes_h_l1586_c7_27df : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1586_c7_27df_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1586_c7_27df_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1586_c7_27df_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1586_c7_27df_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1586_c7_27df
result_is_sp_shift_MUX_uxn_opcodes_h_l1586_c7_27df : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1586_c7_27df_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1586_c7_27df_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1586_c7_27df_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1586_c7_27df_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1586_c7_27df
result_stack_value_MUX_uxn_opcodes_h_l1586_c7_27df : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1586_c7_27df_cond,
result_stack_value_MUX_uxn_opcodes_h_l1586_c7_27df_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1586_c7_27df_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1586_c7_27df_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1586_c7_27df
result_sp_relative_shift_MUX_uxn_opcodes_h_l1586_c7_27df : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1586_c7_27df_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1586_c7_27df_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1586_c7_27df_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1586_c7_27df_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1591_c11_6614
BIN_OP_EQ_uxn_opcodes_h_l1591_c11_6614 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1591_c11_6614_left,
BIN_OP_EQ_uxn_opcodes_h_l1591_c11_6614_right,
BIN_OP_EQ_uxn_opcodes_h_l1591_c11_6614_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1591_c7_8fc5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1591_c7_8fc5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1591_c7_8fc5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1591_c7_8fc5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1591_c7_8fc5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1591_c7_8fc5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1591_c7_8fc5
result_is_opc_done_MUX_uxn_opcodes_h_l1591_c7_8fc5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1591_c7_8fc5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1591_c7_8fc5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1591_c7_8fc5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1591_c7_8fc5_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1591_c7_8fc5
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1591_c7_8fc5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1591_c7_8fc5_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1591_c7_8fc5_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1591_c7_8fc5_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1591_c7_8fc5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1591_c7_8fc5
result_is_stack_write_MUX_uxn_opcodes_h_l1591_c7_8fc5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1591_c7_8fc5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1591_c7_8fc5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1591_c7_8fc5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1591_c7_8fc5_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1591_c7_8fc5
result_is_sp_shift_MUX_uxn_opcodes_h_l1591_c7_8fc5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1591_c7_8fc5_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1591_c7_8fc5_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1591_c7_8fc5_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1591_c7_8fc5_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1591_c7_8fc5
result_stack_value_MUX_uxn_opcodes_h_l1591_c7_8fc5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1591_c7_8fc5_cond,
result_stack_value_MUX_uxn_opcodes_h_l1591_c7_8fc5_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1591_c7_8fc5_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1591_c7_8fc5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1597_c11_5e6f
BIN_OP_EQ_uxn_opcodes_h_l1597_c11_5e6f : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1597_c11_5e6f_left,
BIN_OP_EQ_uxn_opcodes_h_l1597_c11_5e6f_right,
BIN_OP_EQ_uxn_opcodes_h_l1597_c11_5e6f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1597_c7_c945
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1597_c7_c945 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1597_c7_c945_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1597_c7_c945_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1597_c7_c945_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1597_c7_c945_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1597_c7_c945
result_is_opc_done_MUX_uxn_opcodes_h_l1597_c7_c945 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1597_c7_c945_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1597_c7_c945_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1597_c7_c945_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1597_c7_c945_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1597_c7_c945
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1597_c7_c945 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1597_c7_c945_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1597_c7_c945_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1597_c7_c945_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1597_c7_c945_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1597_c7_c945
result_is_stack_write_MUX_uxn_opcodes_h_l1597_c7_c945 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1597_c7_c945_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1597_c7_c945_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1597_c7_c945_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1597_c7_c945_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1597_c7_c945
result_stack_value_MUX_uxn_opcodes_h_l1597_c7_c945 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1597_c7_c945_cond,
result_stack_value_MUX_uxn_opcodes_h_l1597_c7_c945_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1597_c7_c945_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1597_c7_c945_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1600_c34_1492
CONST_SR_8_uxn_opcodes_h_l1600_c34_1492 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1600_c34_1492_x,
CONST_SR_8_uxn_opcodes_h_l1600_c34_1492_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1602_c11_fcb9
BIN_OP_EQ_uxn_opcodes_h_l1602_c11_fcb9 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1602_c11_fcb9_left,
BIN_OP_EQ_uxn_opcodes_h_l1602_c11_fcb9_right,
BIN_OP_EQ_uxn_opcodes_h_l1602_c11_fcb9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1602_c7_eec2
result_is_stack_write_MUX_uxn_opcodes_h_l1602_c7_eec2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1602_c7_eec2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1602_c7_eec2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1602_c7_eec2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1602_c7_eec2_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1602_c7_eec2
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1602_c7_eec2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1602_c7_eec2_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1602_c7_eec2_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1602_c7_eec2_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1602_c7_eec2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1602_c7_eec2
result_is_opc_done_MUX_uxn_opcodes_h_l1602_c7_eec2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1602_c7_eec2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1602_c7_eec2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1602_c7_eec2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1602_c7_eec2_return_output);



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
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1556_c6_3b16_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1556_c1_ffa0_return_output,
 t16_MUX_uxn_opcodes_h_l1556_c2_3377_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1556_c2_3377_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1556_c2_3377_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1556_c2_3377_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1556_c2_3377_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1556_c2_3377_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1556_c2_3377_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1556_c2_3377_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1556_c2_3377_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1564_c11_f14b_return_output,
 t16_MUX_uxn_opcodes_h_l1564_c7_f76d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1564_c7_f76d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1564_c7_f76d_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1564_c7_f76d_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1564_c7_f76d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1564_c7_f76d_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1564_c7_f76d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1564_c7_f76d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1564_c7_f76d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1568_c11_a70b_return_output,
 t16_MUX_uxn_opcodes_h_l1568_c7_a645_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_a645_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_a645_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1568_c7_a645_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1568_c7_a645_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_a645_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1568_c7_a645_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_a645_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_a645_return_output,
 CONST_SL_8_uxn_opcodes_h_l1570_c3_df9a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1574_c11_7e9f_return_output,
 t16_MUX_uxn_opcodes_h_l1574_c7_bc8b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_bc8b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_bc8b_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1574_c7_bc8b_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1574_c7_bc8b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_bc8b_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1574_c7_bc8b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_bc8b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_bc8b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1578_c11_5433_return_output,
 t16_MUX_uxn_opcodes_h_l1578_c7_7ba4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_7ba4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_7ba4_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1578_c7_7ba4_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1578_c7_7ba4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_7ba4_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1578_c7_7ba4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_7ba4_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1578_c7_7ba4_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1579_c3_c17a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1582_c11_2792_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_03ac_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_03ac_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1582_c7_03ac_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_03ac_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1582_c7_03ac_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1582_c7_03ac_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1582_c7_03ac_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1584_c32_949d_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1584_c32_2221_return_output,
 MUX_uxn_opcodes_h_l1584_c32_5784_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1586_c11_ff20_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1586_c7_27df_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1586_c7_27df_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1586_c7_27df_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1586_c7_27df_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1586_c7_27df_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1586_c7_27df_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1586_c7_27df_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1591_c11_6614_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1591_c7_8fc5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1591_c7_8fc5_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1591_c7_8fc5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1591_c7_8fc5_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1591_c7_8fc5_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1591_c7_8fc5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1597_c11_5e6f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1597_c7_c945_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1597_c7_c945_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1597_c7_c945_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1597_c7_c945_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1597_c7_c945_return_output,
 CONST_SR_8_uxn_opcodes_h_l1600_c34_1492_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1602_c11_fcb9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1602_c7_eec2_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1602_c7_eec2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1602_c7_eec2_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1556_c6_3b16_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1556_c6_3b16_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1556_c6_3b16_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1556_c1_ffa0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1556_c1_ffa0_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1556_c1_ffa0_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1556_c1_ffa0_iffalse : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1556_c2_3377_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1556_c2_3377_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1564_c7_f76d_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1556_c2_3377_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1556_c2_3377_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1556_c2_3377_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1556_c2_3377_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1564_c7_f76d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1556_c2_3377_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1556_c2_3377_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1556_c2_3377_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1556_c2_3377_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1564_c7_f76d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1556_c2_3377_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1556_c2_3377_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1556_c2_3377_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1556_c2_3377_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1564_c7_f76d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1556_c2_3377_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1556_c2_3377_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1556_c2_3377_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1556_c2_3377_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1564_c7_f76d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1556_c2_3377_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1556_c2_3377_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1556_c2_3377_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1556_c2_3377_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1564_c7_f76d_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1556_c2_3377_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1556_c2_3377_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1556_c2_3377_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1556_c2_3377_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1564_c7_f76d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1556_c2_3377_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1556_c2_3377_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1556_c2_3377_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1560_c3_0fc4 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1556_c2_3377_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1564_c7_f76d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1556_c2_3377_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1556_c2_3377_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1556_c2_3377_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1556_c2_3377_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1564_c7_f76d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1556_c2_3377_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1556_c2_3377_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1557_c3_e35f_uxn_opcodes_h_l1557_c3_e35f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1564_c11_f14b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1564_c11_f14b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1564_c11_f14b_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1564_c7_f76d_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1564_c7_f76d_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1568_c7_a645_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1564_c7_f76d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1564_c7_f76d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1564_c7_f76d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_a645_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1564_c7_f76d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1564_c7_f76d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1564_c7_f76d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_a645_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1564_c7_f76d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1564_c7_f76d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1564_c7_f76d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1568_c7_a645_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1564_c7_f76d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1564_c7_f76d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1564_c7_f76d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1568_c7_a645_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1564_c7_f76d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1564_c7_f76d_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1564_c7_f76d_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_a645_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1564_c7_f76d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1564_c7_f76d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1564_c7_f76d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1568_c7_a645_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1564_c7_f76d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1564_c7_f76d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1566_c3_3faa : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1564_c7_f76d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_a645_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1564_c7_f76d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1564_c7_f76d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1564_c7_f76d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_a645_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1564_c7_f76d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1568_c11_a70b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1568_c11_a70b_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1568_c11_a70b_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1568_c7_a645_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1568_c7_a645_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1574_c7_bc8b_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1568_c7_a645_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_a645_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_a645_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_bc8b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_a645_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_a645_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_a645_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_bc8b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_a645_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1568_c7_a645_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1568_c7_a645_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1574_c7_bc8b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1568_c7_a645_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1568_c7_a645_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1568_c7_a645_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1574_c7_bc8b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1568_c7_a645_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_a645_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_a645_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_bc8b_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_a645_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1568_c7_a645_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1568_c7_a645_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1574_c7_bc8b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1568_c7_a645_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_a645_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1572_c3_f3d0 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_a645_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_bc8b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_a645_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_a645_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_a645_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_bc8b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_a645_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1570_c3_df9a_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1570_c3_df9a_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_7e9f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_7e9f_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_7e9f_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1574_c7_bc8b_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1574_c7_bc8b_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1578_c7_7ba4_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1574_c7_bc8b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_bc8b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_bc8b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_7ba4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_bc8b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_bc8b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_bc8b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_7ba4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_bc8b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1574_c7_bc8b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1574_c7_bc8b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1578_c7_7ba4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1574_c7_bc8b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1574_c7_bc8b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1574_c7_bc8b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1578_c7_7ba4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1574_c7_bc8b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_bc8b_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_bc8b_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_7ba4_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_bc8b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1574_c7_bc8b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1574_c7_bc8b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1578_c7_7ba4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1574_c7_bc8b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_bc8b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1576_c3_0e82 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_bc8b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_7ba4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_bc8b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_bc8b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_bc8b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1578_c7_7ba4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_bc8b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_5433_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_5433_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_5433_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1578_c7_7ba4_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1578_c7_7ba4_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1578_c7_7ba4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_7ba4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_7ba4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_03ac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_7ba4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_7ba4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_7ba4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_03ac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_7ba4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1578_c7_7ba4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1578_c7_7ba4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1582_c7_03ac_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1578_c7_7ba4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1578_c7_7ba4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1578_c7_7ba4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1582_c7_03ac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1578_c7_7ba4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_7ba4_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_7ba4_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1582_c7_03ac_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_7ba4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1578_c7_7ba4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1578_c7_7ba4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1578_c7_7ba4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1578_c7_7ba4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_7ba4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_7ba4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_03ac_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_7ba4_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1578_c7_7ba4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1578_c7_7ba4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1582_c7_03ac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1578_c7_7ba4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1579_c3_c17a_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1579_c3_c17a_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1579_c3_c17a_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1582_c11_2792_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1582_c11_2792_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1582_c11_2792_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_03ac_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_03ac_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1586_c7_27df_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_03ac_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_03ac_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_03ac_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1586_c7_27df_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_03ac_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1582_c7_03ac_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1582_c7_03ac_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1586_c7_27df_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1582_c7_03ac_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_03ac_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_03ac_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1586_c7_27df_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_03ac_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1582_c7_03ac_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1582_c7_03ac_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1586_c7_27df_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1582_c7_03ac_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1582_c7_03ac_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1582_c7_03ac_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1586_c7_27df_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1582_c7_03ac_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1582_c7_03ac_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1582_c7_03ac_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1586_c7_27df_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1582_c7_03ac_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1584_c32_5784_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1584_c32_5784_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1584_c32_5784_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1584_c32_949d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1584_c32_949d_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1584_c32_949d_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1584_c32_2221_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1584_c32_2221_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1584_c32_2221_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1584_c32_5784_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1586_c11_ff20_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1586_c11_ff20_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1586_c11_ff20_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1586_c7_27df_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1586_c7_27df_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1591_c7_8fc5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1586_c7_27df_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1586_c7_27df_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1586_c7_27df_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1591_c7_8fc5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1586_c7_27df_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1586_c7_27df_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1586_c7_27df_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1591_c7_8fc5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1586_c7_27df_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1586_c7_27df_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1586_c7_27df_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1591_c7_8fc5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1586_c7_27df_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1586_c7_27df_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1586_c7_27df_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1591_c7_8fc5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1586_c7_27df_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1586_c7_27df_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1586_c7_27df_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1591_c7_8fc5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1586_c7_27df_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1586_c7_27df_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1589_c3_6b55 : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1586_c7_27df_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1586_c7_27df_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1591_c11_6614_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1591_c11_6614_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1591_c11_6614_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1591_c7_8fc5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1594_c3_09fe : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1591_c7_8fc5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1597_c7_c945_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1591_c7_8fc5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1591_c7_8fc5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1591_c7_8fc5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1597_c7_c945_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1591_c7_8fc5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1591_c7_8fc5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1591_c7_8fc5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1597_c7_c945_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1591_c7_8fc5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1591_c7_8fc5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1591_c7_8fc5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1597_c7_c945_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1591_c7_8fc5_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1591_c7_8fc5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1591_c7_8fc5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1591_c7_8fc5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1591_c7_8fc5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1591_c7_8fc5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1597_c7_c945_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1591_c7_8fc5_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1595_c24_aa68_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1597_c11_5e6f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1597_c11_5e6f_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1597_c11_5e6f_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1597_c7_c945_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1599_c3_ec92 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1597_c7_c945_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1597_c7_c945_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1597_c7_c945_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1597_c7_c945_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1602_c7_eec2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1597_c7_c945_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1597_c7_c945_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1597_c7_c945_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1602_c7_eec2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1597_c7_c945_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1597_c7_c945_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1597_c7_c945_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1602_c7_eec2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1597_c7_c945_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1597_c7_c945_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1597_c7_c945_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1597_c7_c945_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1600_c34_1492_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1600_c34_1492_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1600_c24_f9fa_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1602_c11_fcb9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1602_c11_fcb9_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1602_c11_fcb9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1602_c7_eec2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1602_c7_eec2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1602_c7_eec2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1602_c7_eec2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1602_c7_eec2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1602_c7_eec2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1602_c7_eec2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1602_c7_eec2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1602_c7_eec2_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1574_l1582_l1556_l1564_l1578_l1597_l1568_l1586_DUPLICATE_75fa_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1574_l1556_l1564_l1578_l1568_l1586_DUPLICATE_3a52_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1574_l1556_l1591_l1564_l1578_l1568_DUPLICATE_7afc_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1574_l1602_l1582_l1591_l1564_l1578_l1597_l1568_l1586_DUPLICATE_34d7_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1574_l1602_l1582_l1564_l1578_l1568_l1586_DUPLICATE_25d0_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1574_l1602_l1582_l1591_l1564_l1578_l1597_l1568_DUPLICATE_f6b5_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1579_l1569_DUPLICATE_d2dd_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1582_l1578_l1597_l1586_DUPLICATE_7c74_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_49dd_uxn_opcodes_h_l1552_l1608_DUPLICATE_a5ed_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1597_c11_5e6f_right := to_unsigned(8, 4);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1556_c2_3377_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l1584_c32_2221_right := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1586_c7_27df_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1560_c3_0fc4 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1556_c2_3377_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1560_c3_0fc4;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1602_c11_fcb9_right := to_unsigned(9, 4);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1602_c7_eec2_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l1584_c32_5784_iftrue := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_5433_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1576_c3_0e82 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_bc8b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1576_c3_0e82;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1556_c2_3377_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1582_c11_2792_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1568_c11_a70b_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1591_c11_6614_right := to_unsigned(7, 3);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1574_c7_bc8b_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1591_c7_8fc5_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1556_c2_3377_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1584_c32_5784_iffalse := resize(to_signed(-2, 3), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1586_c11_ff20_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1599_c3_ec92 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1597_c7_c945_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1599_c3_ec92;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1566_c3_3faa := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1564_c7_f76d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1566_c3_3faa;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1564_c7_f76d_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1556_c2_3377_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1572_c3_f3d0 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_a645_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1572_c3_f3d0;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1602_c7_eec2_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1578_c7_7ba4_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1589_c3_6b55 := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1586_c7_27df_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1589_c3_6b55;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1564_c11_f14b_right := to_unsigned(1, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1586_c7_27df_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_7e9f_right := to_unsigned(3, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1591_c7_8fc5_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1556_c6_3b16_right := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1602_c7_eec2_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1568_c7_a645_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l1584_c32_949d_right := to_unsigned(128, 8);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1597_c7_c945_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1556_c1_ffa0_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1594_c3_09fe := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1591_c7_8fc5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1594_c3_09fe;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1582_c7_03ac_iftrue := to_unsigned(1, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1556_c1_ffa0_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1584_c32_949d_left := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1556_c6_3b16_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1564_c11_f14b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1568_c11_a70b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_7e9f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_5433_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1582_c11_2792_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1586_c11_ff20_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1591_c11_6614_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1597_c11_5e6f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1602_c11_fcb9_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1579_c3_c17a_left := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1600_c34_1492_x := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1556_c2_3377_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1564_c7_f76d_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1574_c7_bc8b_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1578_c7_7ba4_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l1586_c11_ff20] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1586_c11_ff20_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1586_c11_ff20_left;
     BIN_OP_EQ_uxn_opcodes_h_l1586_c11_ff20_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1586_c11_ff20_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1586_c11_ff20_return_output := BIN_OP_EQ_uxn_opcodes_h_l1586_c11_ff20_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1564_c11_f14b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1564_c11_f14b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1564_c11_f14b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1564_c11_f14b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1564_c11_f14b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1564_c11_f14b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1564_c11_f14b_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1574_l1602_l1582_l1564_l1578_l1568_l1586_DUPLICATE_25d0 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1574_l1602_l1582_l1564_l1578_l1568_l1586_DUPLICATE_25d0_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1568_c11_a70b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1568_c11_a70b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1568_c11_a70b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1568_c11_a70b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1568_c11_a70b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1568_c11_a70b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1568_c11_a70b_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1574_l1556_l1564_l1578_l1568_l1586_DUPLICATE_3a52 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1574_l1556_l1564_l1578_l1568_l1586_DUPLICATE_3a52_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1582_l1578_l1597_l1586_DUPLICATE_7c74 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1582_l1578_l1597_l1586_DUPLICATE_7c74_return_output := result.stack_address_sp_offset;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1595_c24_aa68] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1595_c24_aa68_return_output := CAST_TO_uint8_t_uint16_t(
     t16);

     -- BIN_OP_EQ[uxn_opcodes_h_l1597_c11_5e6f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1597_c11_5e6f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1597_c11_5e6f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1597_c11_5e6f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1597_c11_5e6f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1597_c11_5e6f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1597_c11_5e6f_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1574_l1602_l1582_l1591_l1564_l1578_l1597_l1568_DUPLICATE_f6b5 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1574_l1602_l1582_l1591_l1564_l1578_l1597_l1568_DUPLICATE_f6b5_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1574_l1602_l1582_l1591_l1564_l1578_l1597_l1568_l1586_DUPLICATE_34d7 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1574_l1602_l1582_l1591_l1564_l1578_l1597_l1568_l1586_DUPLICATE_34d7_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1602_c11_fcb9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1602_c11_fcb9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1602_c11_fcb9_left;
     BIN_OP_EQ_uxn_opcodes_h_l1602_c11_fcb9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1602_c11_fcb9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1602_c11_fcb9_return_output := BIN_OP_EQ_uxn_opcodes_h_l1602_c11_fcb9_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l1600_c34_1492] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1600_c34_1492_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1600_c34_1492_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1600_c34_1492_return_output := CONST_SR_8_uxn_opcodes_h_l1600_c34_1492_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1574_l1582_l1556_l1564_l1578_l1597_l1568_l1586_DUPLICATE_75fa LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1574_l1582_l1556_l1564_l1578_l1597_l1568_l1586_DUPLICATE_75fa_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1556_c6_3b16] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1556_c6_3b16_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1556_c6_3b16_left;
     BIN_OP_EQ_uxn_opcodes_h_l1556_c6_3b16_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1556_c6_3b16_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1556_c6_3b16_return_output := BIN_OP_EQ_uxn_opcodes_h_l1556_c6_3b16_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1578_c11_5433] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1578_c11_5433_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_5433_left;
     BIN_OP_EQ_uxn_opcodes_h_l1578_c11_5433_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_5433_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_5433_return_output := BIN_OP_EQ_uxn_opcodes_h_l1578_c11_5433_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1579_l1569_DUPLICATE_d2dd LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1579_l1569_DUPLICATE_d2dd_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1574_c11_7e9f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1574_c11_7e9f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_7e9f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1574_c11_7e9f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_7e9f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_7e9f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1574_c11_7e9f_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1574_l1556_l1591_l1564_l1578_l1568_DUPLICATE_7afc LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1574_l1556_l1591_l1564_l1578_l1568_DUPLICATE_7afc_return_output := result.is_sp_shift;

     -- result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d[uxn_opcodes_h_l1578_c7_7ba4] LATENCY=0
     VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1578_c7_7ba4_return_output := result.is_stack_read;

     -- BIN_OP_AND[uxn_opcodes_h_l1584_c32_949d] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1584_c32_949d_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1584_c32_949d_left;
     BIN_OP_AND_uxn_opcodes_h_l1584_c32_949d_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1584_c32_949d_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1584_c32_949d_return_output := BIN_OP_AND_uxn_opcodes_h_l1584_c32_949d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1591_c11_6614] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1591_c11_6614_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1591_c11_6614_left;
     BIN_OP_EQ_uxn_opcodes_h_l1591_c11_6614_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1591_c11_6614_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1591_c11_6614_return_output := BIN_OP_EQ_uxn_opcodes_h_l1591_c11_6614_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1582_c11_2792] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1582_c11_2792_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1582_c11_2792_left;
     BIN_OP_EQ_uxn_opcodes_h_l1582_c11_2792_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1582_c11_2792_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1582_c11_2792_return_output := BIN_OP_EQ_uxn_opcodes_h_l1582_c11_2792_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1584_c32_2221_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1584_c32_949d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1556_c1_ffa0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1556_c6_3b16_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1556_c2_3377_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1556_c6_3b16_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1556_c2_3377_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1556_c6_3b16_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1556_c2_3377_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1556_c6_3b16_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1556_c2_3377_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1556_c6_3b16_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1556_c2_3377_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1556_c6_3b16_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1556_c2_3377_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1556_c6_3b16_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1556_c2_3377_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1556_c6_3b16_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1556_c2_3377_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1556_c6_3b16_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1556_c2_3377_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1556_c6_3b16_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1564_c7_f76d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1564_c11_f14b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1564_c7_f76d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1564_c11_f14b_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1564_c7_f76d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1564_c11_f14b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1564_c7_f76d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1564_c11_f14b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1564_c7_f76d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1564_c11_f14b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1564_c7_f76d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1564_c11_f14b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1564_c7_f76d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1564_c11_f14b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1564_c7_f76d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1564_c11_f14b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1564_c7_f76d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1564_c11_f14b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_a645_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1568_c11_a70b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_a645_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1568_c11_a70b_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1568_c7_a645_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1568_c11_a70b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1568_c7_a645_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1568_c11_a70b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_a645_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1568_c11_a70b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_a645_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1568_c11_a70b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_a645_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1568_c11_a70b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1568_c7_a645_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1568_c11_a70b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1568_c7_a645_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1568_c11_a70b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_bc8b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_7e9f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_bc8b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_7e9f_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1574_c7_bc8b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_7e9f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1574_c7_bc8b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_7e9f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_bc8b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_7e9f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_bc8b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_7e9f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_bc8b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_7e9f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1574_c7_bc8b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_7e9f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1574_c7_bc8b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_7e9f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_7ba4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_5433_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1578_c7_7ba4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_5433_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1578_c7_7ba4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_5433_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1578_c7_7ba4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_5433_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_7ba4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_5433_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_7ba4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_5433_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_7ba4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_5433_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1578_c7_7ba4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_5433_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1578_c7_7ba4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_5433_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_03ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1582_c11_2792_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1582_c7_03ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1582_c11_2792_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1582_c7_03ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1582_c11_2792_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_03ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1582_c11_2792_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1582_c7_03ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1582_c11_2792_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_03ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1582_c11_2792_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1582_c7_03ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1582_c11_2792_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1586_c7_27df_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1586_c11_ff20_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1586_c7_27df_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1586_c11_ff20_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1586_c7_27df_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1586_c11_ff20_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1586_c7_27df_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1586_c11_ff20_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1586_c7_27df_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1586_c11_ff20_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1586_c7_27df_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1586_c11_ff20_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1586_c7_27df_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1586_c11_ff20_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1591_c7_8fc5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1591_c11_6614_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1591_c7_8fc5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1591_c11_6614_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1591_c7_8fc5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1591_c11_6614_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1591_c7_8fc5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1591_c11_6614_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1591_c7_8fc5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1591_c11_6614_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1591_c7_8fc5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1591_c11_6614_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1597_c7_c945_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1597_c11_5e6f_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1597_c7_c945_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1597_c11_5e6f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1597_c7_c945_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1597_c11_5e6f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1597_c7_c945_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1597_c11_5e6f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1597_c7_c945_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1597_c11_5e6f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1602_c7_eec2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1602_c11_fcb9_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1602_c7_eec2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1602_c11_fcb9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1602_c7_eec2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1602_c11_fcb9_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1579_c3_c17a_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1579_l1569_DUPLICATE_d2dd_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1570_c3_df9a_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1579_l1569_DUPLICATE_d2dd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1591_c7_8fc5_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1595_c24_aa68_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1556_c2_3377_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1574_l1556_l1564_l1578_l1568_l1586_DUPLICATE_3a52_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1564_c7_f76d_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1574_l1556_l1564_l1578_l1568_l1586_DUPLICATE_3a52_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_a645_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1574_l1556_l1564_l1578_l1568_l1586_DUPLICATE_3a52_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_bc8b_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1574_l1556_l1564_l1578_l1568_l1586_DUPLICATE_3a52_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_7ba4_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1574_l1556_l1564_l1578_l1568_l1586_DUPLICATE_3a52_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1586_c7_27df_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1574_l1556_l1564_l1578_l1568_l1586_DUPLICATE_3a52_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1564_c7_f76d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1574_l1602_l1582_l1591_l1564_l1578_l1597_l1568_l1586_DUPLICATE_34d7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_a645_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1574_l1602_l1582_l1591_l1564_l1578_l1597_l1568_l1586_DUPLICATE_34d7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_bc8b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1574_l1602_l1582_l1591_l1564_l1578_l1597_l1568_l1586_DUPLICATE_34d7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_7ba4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1574_l1602_l1582_l1591_l1564_l1578_l1597_l1568_l1586_DUPLICATE_34d7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_03ac_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1574_l1602_l1582_l1591_l1564_l1578_l1597_l1568_l1586_DUPLICATE_34d7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1586_c7_27df_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1574_l1602_l1582_l1591_l1564_l1578_l1597_l1568_l1586_DUPLICATE_34d7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1591_c7_8fc5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1574_l1602_l1582_l1591_l1564_l1578_l1597_l1568_l1586_DUPLICATE_34d7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1597_c7_c945_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1574_l1602_l1582_l1591_l1564_l1578_l1597_l1568_l1586_DUPLICATE_34d7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1602_c7_eec2_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1574_l1602_l1582_l1591_l1564_l1578_l1597_l1568_l1586_DUPLICATE_34d7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1556_c2_3377_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1574_l1556_l1591_l1564_l1578_l1568_DUPLICATE_7afc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1564_c7_f76d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1574_l1556_l1591_l1564_l1578_l1568_DUPLICATE_7afc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_a645_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1574_l1556_l1591_l1564_l1578_l1568_DUPLICATE_7afc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_bc8b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1574_l1556_l1591_l1564_l1578_l1568_DUPLICATE_7afc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1578_c7_7ba4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1574_l1556_l1591_l1564_l1578_l1568_DUPLICATE_7afc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1591_c7_8fc5_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1574_l1556_l1591_l1564_l1578_l1568_DUPLICATE_7afc_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1564_c7_f76d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1574_l1602_l1582_l1591_l1564_l1578_l1597_l1568_DUPLICATE_f6b5_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1568_c7_a645_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1574_l1602_l1582_l1591_l1564_l1578_l1597_l1568_DUPLICATE_f6b5_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1574_c7_bc8b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1574_l1602_l1582_l1591_l1564_l1578_l1597_l1568_DUPLICATE_f6b5_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1578_c7_7ba4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1574_l1602_l1582_l1591_l1564_l1578_l1597_l1568_DUPLICATE_f6b5_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1582_c7_03ac_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1574_l1602_l1582_l1591_l1564_l1578_l1597_l1568_DUPLICATE_f6b5_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1591_c7_8fc5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1574_l1602_l1582_l1591_l1564_l1578_l1597_l1568_DUPLICATE_f6b5_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1597_c7_c945_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1574_l1602_l1582_l1591_l1564_l1578_l1597_l1568_DUPLICATE_f6b5_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1602_c7_eec2_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1574_l1602_l1582_l1591_l1564_l1578_l1597_l1568_DUPLICATE_f6b5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1564_c7_f76d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1574_l1602_l1582_l1564_l1578_l1568_l1586_DUPLICATE_25d0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_a645_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1574_l1602_l1582_l1564_l1578_l1568_l1586_DUPLICATE_25d0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_bc8b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1574_l1602_l1582_l1564_l1578_l1568_l1586_DUPLICATE_25d0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_7ba4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1574_l1602_l1582_l1564_l1578_l1568_l1586_DUPLICATE_25d0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_03ac_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1574_l1602_l1582_l1564_l1578_l1568_l1586_DUPLICATE_25d0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1586_c7_27df_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1574_l1602_l1582_l1564_l1578_l1568_l1586_DUPLICATE_25d0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1602_c7_eec2_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1574_l1602_l1582_l1564_l1578_l1568_l1586_DUPLICATE_25d0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_7ba4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1582_l1578_l1597_l1586_DUPLICATE_7c74_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_03ac_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1582_l1578_l1597_l1586_DUPLICATE_7c74_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1586_c7_27df_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1582_l1578_l1597_l1586_DUPLICATE_7c74_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1597_c7_c945_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1582_l1578_l1597_l1586_DUPLICATE_7c74_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1556_c2_3377_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1574_l1582_l1556_l1564_l1578_l1597_l1568_l1586_DUPLICATE_75fa_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1564_c7_f76d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1574_l1582_l1556_l1564_l1578_l1597_l1568_l1586_DUPLICATE_75fa_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1568_c7_a645_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1574_l1582_l1556_l1564_l1578_l1597_l1568_l1586_DUPLICATE_75fa_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1574_c7_bc8b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1574_l1582_l1556_l1564_l1578_l1597_l1568_l1586_DUPLICATE_75fa_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1578_c7_7ba4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1574_l1582_l1556_l1564_l1578_l1597_l1568_l1586_DUPLICATE_75fa_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1582_c7_03ac_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1574_l1582_l1556_l1564_l1578_l1597_l1568_l1586_DUPLICATE_75fa_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1586_c7_27df_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1574_l1582_l1556_l1564_l1578_l1597_l1568_l1586_DUPLICATE_75fa_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1597_c7_c945_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1574_l1582_l1556_l1564_l1578_l1597_l1568_l1586_DUPLICATE_75fa_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1578_c7_7ba4_iffalse := VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1578_c7_7ba4_return_output;
     -- CAST_TO_uint8_t[uxn_opcodes_h_l1600_c24_f9fa] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1600_c24_f9fa_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1600_c34_1492_return_output);

     -- BIN_OP_GT[uxn_opcodes_h_l1584_c32_2221] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1584_c32_2221_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1584_c32_2221_left;
     BIN_OP_GT_uxn_opcodes_h_l1584_c32_2221_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1584_c32_2221_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1584_c32_2221_return_output := BIN_OP_GT_uxn_opcodes_h_l1584_c32_2221_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1578_c7_7ba4] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1578_c7_7ba4_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1578_c7_7ba4_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1578_c7_7ba4_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1578_c7_7ba4_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1578_c7_7ba4_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1578_c7_7ba4_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1578_c7_7ba4_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1578_c7_7ba4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1597_c7_c945] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1597_c7_c945_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1597_c7_c945_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1597_c7_c945_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1597_c7_c945_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1597_c7_c945_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1597_c7_c945_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1597_c7_c945_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1597_c7_c945_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1586_c7_27df] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1586_c7_27df_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1586_c7_27df_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1586_c7_27df_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1586_c7_27df_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1586_c7_27df_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1586_c7_27df_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1586_c7_27df_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1586_c7_27df_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1602_c7_eec2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1602_c7_eec2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1602_c7_eec2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1602_c7_eec2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1602_c7_eec2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1602_c7_eec2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1602_c7_eec2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1602_c7_eec2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1602_c7_eec2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1602_c7_eec2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1602_c7_eec2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1602_c7_eec2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1602_c7_eec2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1602_c7_eec2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1602_c7_eec2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1602_c7_eec2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1602_c7_eec2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1602_c7_eec2_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l1570_c3_df9a] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1570_c3_df9a_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1570_c3_df9a_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1570_c3_df9a_return_output := CONST_SL_8_uxn_opcodes_h_l1570_c3_df9a_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1602_c7_eec2] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1602_c7_eec2_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1602_c7_eec2_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1602_c7_eec2_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1602_c7_eec2_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1602_c7_eec2_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1602_c7_eec2_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1602_c7_eec2_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1602_c7_eec2_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1556_c1_ffa0] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1556_c1_ffa0_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1556_c1_ffa0_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1556_c1_ffa0_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1556_c1_ffa0_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1556_c1_ffa0_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1556_c1_ffa0_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1556_c1_ffa0_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1556_c1_ffa0_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1591_c7_8fc5] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1591_c7_8fc5_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1591_c7_8fc5_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1591_c7_8fc5_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1591_c7_8fc5_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1591_c7_8fc5_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1591_c7_8fc5_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1591_c7_8fc5_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1591_c7_8fc5_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1579_c3_c17a] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1579_c3_c17a_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1579_c3_c17a_left;
     BIN_OP_OR_uxn_opcodes_h_l1579_c3_c17a_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1579_c3_c17a_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1579_c3_c17a_return_output := BIN_OP_OR_uxn_opcodes_h_l1579_c3_c17a_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1584_c32_5784_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1584_c32_2221_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1578_c7_7ba4_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1579_c3_c17a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1597_c7_c945_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1600_c24_f9fa_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1568_c7_a645_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1570_c3_df9a_return_output;
     VAR_printf_uxn_opcodes_h_l1557_c3_e35f_uxn_opcodes_h_l1557_c3_e35f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1556_c1_ffa0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1597_c7_c945_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1602_c7_eec2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1586_c7_27df_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1591_c7_8fc5_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1597_c7_c945_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1602_c7_eec2_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1574_c7_bc8b_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1578_c7_7ba4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1597_c7_c945_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1602_c7_eec2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1582_c7_03ac_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1586_c7_27df_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1591_c7_8fc5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1597_c7_c945_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1591_c7_8fc5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1591_c7_8fc5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1591_c7_8fc5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1591_c7_8fc5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1591_c7_8fc5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1591_c7_8fc5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1591_c7_8fc5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1591_c7_8fc5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1591_c7_8fc5_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1574_c7_bc8b] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1574_c7_bc8b_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1574_c7_bc8b_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1574_c7_bc8b_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1574_c7_bc8b_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1574_c7_bc8b_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1574_c7_bc8b_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1574_c7_bc8b_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1574_c7_bc8b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1586_c7_27df] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1586_c7_27df_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1586_c7_27df_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1586_c7_27df_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1586_c7_27df_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1586_c7_27df_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1586_c7_27df_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1586_c7_27df_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1586_c7_27df_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1597_c7_c945] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1597_c7_c945_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1597_c7_c945_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1597_c7_c945_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1597_c7_c945_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1597_c7_c945_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1597_c7_c945_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1597_c7_c945_return_output := result_stack_value_MUX_uxn_opcodes_h_l1597_c7_c945_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1597_c7_c945] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1597_c7_c945_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1597_c7_c945_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1597_c7_c945_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1597_c7_c945_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1597_c7_c945_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1597_c7_c945_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1597_c7_c945_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1597_c7_c945_return_output;

     -- printf_uxn_opcodes_h_l1557_c3_e35f[uxn_opcodes_h_l1557_c3_e35f] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1557_c3_e35f_uxn_opcodes_h_l1557_c3_e35f_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1557_c3_e35f_uxn_opcodes_h_l1557_c3_e35f_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1597_c7_c945] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1597_c7_c945_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1597_c7_c945_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1597_c7_c945_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1597_c7_c945_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1597_c7_c945_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1597_c7_c945_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1597_c7_c945_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1597_c7_c945_return_output;

     -- MUX[uxn_opcodes_h_l1584_c32_5784] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1584_c32_5784_cond <= VAR_MUX_uxn_opcodes_h_l1584_c32_5784_cond;
     MUX_uxn_opcodes_h_l1584_c32_5784_iftrue <= VAR_MUX_uxn_opcodes_h_l1584_c32_5784_iftrue;
     MUX_uxn_opcodes_h_l1584_c32_5784_iffalse <= VAR_MUX_uxn_opcodes_h_l1584_c32_5784_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1584_c32_5784_return_output := MUX_uxn_opcodes_h_l1584_c32_5784_return_output;

     -- t16_MUX[uxn_opcodes_h_l1578_c7_7ba4] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1578_c7_7ba4_cond <= VAR_t16_MUX_uxn_opcodes_h_l1578_c7_7ba4_cond;
     t16_MUX_uxn_opcodes_h_l1578_c7_7ba4_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1578_c7_7ba4_iftrue;
     t16_MUX_uxn_opcodes_h_l1578_c7_7ba4_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1578_c7_7ba4_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1578_c7_7ba4_return_output := t16_MUX_uxn_opcodes_h_l1578_c7_7ba4_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1597_c7_c945] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1597_c7_c945_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1597_c7_c945_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1597_c7_c945_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1597_c7_c945_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1597_c7_c945_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1597_c7_c945_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1597_c7_c945_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1597_c7_c945_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1582_c7_03ac_iftrue := VAR_MUX_uxn_opcodes_h_l1584_c32_5784_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1591_c7_8fc5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1597_c7_c945_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1582_c7_03ac_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1586_c7_27df_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1591_c7_8fc5_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1597_c7_c945_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1568_c7_a645_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1574_c7_bc8b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1591_c7_8fc5_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1597_c7_c945_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1586_c7_27df_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1591_c7_8fc5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1591_c7_8fc5_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1597_c7_c945_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1574_c7_bc8b_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1578_c7_7ba4_return_output;
     -- t16_MUX[uxn_opcodes_h_l1574_c7_bc8b] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1574_c7_bc8b_cond <= VAR_t16_MUX_uxn_opcodes_h_l1574_c7_bc8b_cond;
     t16_MUX_uxn_opcodes_h_l1574_c7_bc8b_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1574_c7_bc8b_iftrue;
     t16_MUX_uxn_opcodes_h_l1574_c7_bc8b_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1574_c7_bc8b_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1574_c7_bc8b_return_output := t16_MUX_uxn_opcodes_h_l1574_c7_bc8b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1591_c7_8fc5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1591_c7_8fc5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1591_c7_8fc5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1591_c7_8fc5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1591_c7_8fc5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1591_c7_8fc5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1591_c7_8fc5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1591_c7_8fc5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1591_c7_8fc5_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1582_c7_03ac] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1582_c7_03ac_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1582_c7_03ac_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1582_c7_03ac_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1582_c7_03ac_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1582_c7_03ac_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1582_c7_03ac_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1582_c7_03ac_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1582_c7_03ac_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1591_c7_8fc5] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1591_c7_8fc5_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1591_c7_8fc5_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1591_c7_8fc5_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1591_c7_8fc5_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1591_c7_8fc5_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1591_c7_8fc5_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1591_c7_8fc5_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1591_c7_8fc5_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1568_c7_a645] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1568_c7_a645_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1568_c7_a645_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1568_c7_a645_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1568_c7_a645_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1568_c7_a645_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1568_c7_a645_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1568_c7_a645_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1568_c7_a645_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1591_c7_8fc5] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1591_c7_8fc5_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1591_c7_8fc5_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1591_c7_8fc5_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1591_c7_8fc5_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1591_c7_8fc5_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1591_c7_8fc5_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1591_c7_8fc5_return_output := result_stack_value_MUX_uxn_opcodes_h_l1591_c7_8fc5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1586_c7_27df] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1586_c7_27df_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1586_c7_27df_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1586_c7_27df_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1586_c7_27df_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1586_c7_27df_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1586_c7_27df_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1586_c7_27df_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1586_c7_27df_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1591_c7_8fc5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1591_c7_8fc5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1591_c7_8fc5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1591_c7_8fc5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1591_c7_8fc5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1591_c7_8fc5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1591_c7_8fc5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1591_c7_8fc5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1591_c7_8fc5_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1582_c7_03ac] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1582_c7_03ac_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1582_c7_03ac_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1582_c7_03ac_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1582_c7_03ac_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1582_c7_03ac_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1582_c7_03ac_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1582_c7_03ac_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1582_c7_03ac_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1586_c7_27df_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1591_c7_8fc5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1578_c7_7ba4_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1582_c7_03ac_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1586_c7_27df_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1591_c7_8fc5_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1564_c7_f76d_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1568_c7_a645_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1586_c7_27df_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1591_c7_8fc5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_7ba4_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1582_c7_03ac_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_03ac_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1586_c7_27df_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1586_c7_27df_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1591_c7_8fc5_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1568_c7_a645_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1574_c7_bc8b_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1586_c7_27df] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1586_c7_27df_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1586_c7_27df_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1586_c7_27df_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1586_c7_27df_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1586_c7_27df_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1586_c7_27df_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1586_c7_27df_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1586_c7_27df_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1586_c7_27df] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1586_c7_27df_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1586_c7_27df_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1586_c7_27df_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1586_c7_27df_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1586_c7_27df_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1586_c7_27df_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1586_c7_27df_return_output := result_stack_value_MUX_uxn_opcodes_h_l1586_c7_27df_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1578_c7_7ba4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_7ba4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_7ba4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_7ba4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_7ba4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_7ba4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_7ba4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_7ba4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_7ba4_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1586_c7_27df] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1586_c7_27df_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1586_c7_27df_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1586_c7_27df_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1586_c7_27df_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1586_c7_27df_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1586_c7_27df_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1586_c7_27df_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1586_c7_27df_return_output;

     -- t16_MUX[uxn_opcodes_h_l1568_c7_a645] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1568_c7_a645_cond <= VAR_t16_MUX_uxn_opcodes_h_l1568_c7_a645_cond;
     t16_MUX_uxn_opcodes_h_l1568_c7_a645_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1568_c7_a645_iftrue;
     t16_MUX_uxn_opcodes_h_l1568_c7_a645_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1568_c7_a645_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1568_c7_a645_return_output := t16_MUX_uxn_opcodes_h_l1568_c7_a645_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1586_c7_27df] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1586_c7_27df_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1586_c7_27df_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1586_c7_27df_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1586_c7_27df_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1586_c7_27df_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1586_c7_27df_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1586_c7_27df_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1586_c7_27df_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1564_c7_f76d] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1564_c7_f76d_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1564_c7_f76d_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1564_c7_f76d_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1564_c7_f76d_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1564_c7_f76d_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1564_c7_f76d_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1564_c7_f76d_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1564_c7_f76d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1578_c7_7ba4] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1578_c7_7ba4_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1578_c7_7ba4_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1578_c7_7ba4_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1578_c7_7ba4_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1578_c7_7ba4_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1578_c7_7ba4_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1578_c7_7ba4_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1578_c7_7ba4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1582_c7_03ac] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_03ac_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_03ac_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_03ac_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_03ac_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_03ac_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_03ac_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_03ac_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_03ac_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_03ac_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1586_c7_27df_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_bc8b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1578_c7_7ba4_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1582_c7_03ac_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1586_c7_27df_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1556_c2_3377_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1564_c7_f76d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_03ac_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1586_c7_27df_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_bc8b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1578_c7_7ba4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_7ba4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_03ac_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1582_c7_03ac_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1586_c7_27df_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1564_c7_f76d_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1568_c7_a645_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1582_c7_03ac] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_03ac_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_03ac_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_03ac_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_03ac_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_03ac_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_03ac_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_03ac_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_03ac_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1574_c7_bc8b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_bc8b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_bc8b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_bc8b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_bc8b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_bc8b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_bc8b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_bc8b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_bc8b_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1582_c7_03ac] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1582_c7_03ac_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1582_c7_03ac_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1582_c7_03ac_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1582_c7_03ac_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1582_c7_03ac_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1582_c7_03ac_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1582_c7_03ac_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1582_c7_03ac_return_output;

     -- t16_MUX[uxn_opcodes_h_l1564_c7_f76d] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1564_c7_f76d_cond <= VAR_t16_MUX_uxn_opcodes_h_l1564_c7_f76d_cond;
     t16_MUX_uxn_opcodes_h_l1564_c7_f76d_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1564_c7_f76d_iftrue;
     t16_MUX_uxn_opcodes_h_l1564_c7_f76d_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1564_c7_f76d_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1564_c7_f76d_return_output := t16_MUX_uxn_opcodes_h_l1564_c7_f76d_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1556_c2_3377] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1556_c2_3377_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1556_c2_3377_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1556_c2_3377_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1556_c2_3377_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1556_c2_3377_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1556_c2_3377_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1556_c2_3377_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1556_c2_3377_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1574_c7_bc8b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_bc8b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_bc8b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_bc8b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_bc8b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_bc8b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_bc8b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_bc8b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_bc8b_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1582_c7_03ac] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1582_c7_03ac_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1582_c7_03ac_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1582_c7_03ac_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1582_c7_03ac_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1582_c7_03ac_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1582_c7_03ac_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1582_c7_03ac_return_output := result_stack_value_MUX_uxn_opcodes_h_l1582_c7_03ac_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1582_c7_03ac] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_03ac_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_03ac_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_03ac_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_03ac_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_03ac_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_03ac_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_03ac_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_03ac_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1578_c7_7ba4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_7ba4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_7ba4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_7ba4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_7ba4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_7ba4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_7ba4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_7ba4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_7ba4_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_7ba4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_03ac_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_a645_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_bc8b_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1578_c7_7ba4_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1582_c7_03ac_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_7ba4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_03ac_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_a645_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1574_c7_bc8b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_bc8b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_7ba4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1578_c7_7ba4_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1582_c7_03ac_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1556_c2_3377_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1564_c7_f76d_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1578_c7_7ba4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_7ba4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_7ba4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_7ba4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_7ba4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_7ba4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_7ba4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_7ba4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_7ba4_return_output;

     -- t16_MUX[uxn_opcodes_h_l1556_c2_3377] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1556_c2_3377_cond <= VAR_t16_MUX_uxn_opcodes_h_l1556_c2_3377_cond;
     t16_MUX_uxn_opcodes_h_l1556_c2_3377_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1556_c2_3377_iftrue;
     t16_MUX_uxn_opcodes_h_l1556_c2_3377_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1556_c2_3377_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1556_c2_3377_return_output := t16_MUX_uxn_opcodes_h_l1556_c2_3377_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1568_c7_a645] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_a645_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_a645_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_a645_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_a645_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_a645_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_a645_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_a645_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_a645_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1578_c7_7ba4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_7ba4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_7ba4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_7ba4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_7ba4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_7ba4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_7ba4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_7ba4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_7ba4_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1578_c7_7ba4] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1578_c7_7ba4_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1578_c7_7ba4_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1578_c7_7ba4_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1578_c7_7ba4_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1578_c7_7ba4_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1578_c7_7ba4_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1578_c7_7ba4_return_output := result_stack_value_MUX_uxn_opcodes_h_l1578_c7_7ba4_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1568_c7_a645] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_a645_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_a645_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_a645_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_a645_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_a645_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_a645_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_a645_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_a645_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1574_c7_bc8b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_bc8b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_bc8b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_bc8b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_bc8b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_bc8b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_bc8b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_bc8b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_bc8b_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1578_c7_7ba4] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1578_c7_7ba4_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1578_c7_7ba4_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1578_c7_7ba4_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1578_c7_7ba4_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1578_c7_7ba4_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1578_c7_7ba4_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1578_c7_7ba4_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1578_c7_7ba4_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_bc8b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_7ba4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1564_c7_f76d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_a645_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1574_c7_bc8b_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1578_c7_7ba4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_bc8b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_7ba4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1564_c7_f76d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_a645_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_a645_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_bc8b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1574_c7_bc8b_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1578_c7_7ba4_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1556_c2_3377_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1574_c7_bc8b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_bc8b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_bc8b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_bc8b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_bc8b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_bc8b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_bc8b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_bc8b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_bc8b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1564_c7_f76d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1564_c7_f76d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1564_c7_f76d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1564_c7_f76d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1564_c7_f76d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1564_c7_f76d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1564_c7_f76d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1564_c7_f76d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1564_c7_f76d_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1574_c7_bc8b] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1574_c7_bc8b_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1574_c7_bc8b_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1574_c7_bc8b_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1574_c7_bc8b_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1574_c7_bc8b_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1574_c7_bc8b_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1574_c7_bc8b_return_output := result_stack_value_MUX_uxn_opcodes_h_l1574_c7_bc8b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1574_c7_bc8b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_bc8b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_bc8b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_bc8b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_bc8b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_bc8b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_bc8b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_bc8b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_bc8b_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1574_c7_bc8b] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1574_c7_bc8b_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1574_c7_bc8b_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1574_c7_bc8b_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1574_c7_bc8b_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1574_c7_bc8b_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1574_c7_bc8b_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1574_c7_bc8b_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1574_c7_bc8b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1564_c7_f76d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1564_c7_f76d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1564_c7_f76d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1564_c7_f76d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1564_c7_f76d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1564_c7_f76d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1564_c7_f76d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1564_c7_f76d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1564_c7_f76d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1568_c7_a645] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_a645_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_a645_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_a645_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_a645_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_a645_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_a645_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_a645_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_a645_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_a645_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_bc8b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1556_c2_3377_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1564_c7_f76d_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1568_c7_a645_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1574_c7_bc8b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_a645_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_bc8b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1556_c2_3377_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1564_c7_f76d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1564_c7_f76d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_a645_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1568_c7_a645_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1574_c7_bc8b_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1568_c7_a645] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1568_c7_a645_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1568_c7_a645_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1568_c7_a645_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1568_c7_a645_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1568_c7_a645_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1568_c7_a645_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1568_c7_a645_return_output := result_stack_value_MUX_uxn_opcodes_h_l1568_c7_a645_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1568_c7_a645] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1568_c7_a645_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1568_c7_a645_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1568_c7_a645_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1568_c7_a645_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1568_c7_a645_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1568_c7_a645_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1568_c7_a645_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1568_c7_a645_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1568_c7_a645] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_a645_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_a645_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_a645_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_a645_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_a645_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_a645_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_a645_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_a645_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1556_c2_3377] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1556_c2_3377_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1556_c2_3377_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1556_c2_3377_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1556_c2_3377_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1556_c2_3377_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1556_c2_3377_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1556_c2_3377_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1556_c2_3377_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1556_c2_3377] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1556_c2_3377_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1556_c2_3377_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1556_c2_3377_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1556_c2_3377_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1556_c2_3377_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1556_c2_3377_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1556_c2_3377_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1556_c2_3377_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1564_c7_f76d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1564_c7_f76d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1564_c7_f76d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1564_c7_f76d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1564_c7_f76d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1564_c7_f76d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1564_c7_f76d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1564_c7_f76d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1564_c7_f76d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1568_c7_a645] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_a645_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_a645_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_a645_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_a645_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_a645_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_a645_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_a645_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_a645_return_output;

     -- Submodule level 9
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1564_c7_f76d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_a645_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1564_c7_f76d_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1568_c7_a645_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1564_c7_f76d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_a645_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1556_c2_3377_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1564_c7_f76d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1564_c7_f76d_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1568_c7_a645_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1564_c7_f76d] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1564_c7_f76d_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1564_c7_f76d_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1564_c7_f76d_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1564_c7_f76d_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1564_c7_f76d_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1564_c7_f76d_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1564_c7_f76d_return_output := result_stack_value_MUX_uxn_opcodes_h_l1564_c7_f76d_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1564_c7_f76d] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1564_c7_f76d_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1564_c7_f76d_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1564_c7_f76d_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1564_c7_f76d_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1564_c7_f76d_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1564_c7_f76d_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1564_c7_f76d_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1564_c7_f76d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1564_c7_f76d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1564_c7_f76d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1564_c7_f76d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1564_c7_f76d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1564_c7_f76d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1564_c7_f76d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1564_c7_f76d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1564_c7_f76d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1564_c7_f76d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1556_c2_3377] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1556_c2_3377_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1556_c2_3377_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1556_c2_3377_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1556_c2_3377_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1556_c2_3377_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1556_c2_3377_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1556_c2_3377_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1556_c2_3377_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1564_c7_f76d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1564_c7_f76d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1564_c7_f76d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1564_c7_f76d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1564_c7_f76d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1564_c7_f76d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1564_c7_f76d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1564_c7_f76d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1564_c7_f76d_return_output;

     -- Submodule level 10
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1556_c2_3377_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1564_c7_f76d_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1556_c2_3377_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1564_c7_f76d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1556_c2_3377_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1564_c7_f76d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1556_c2_3377_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1564_c7_f76d_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1556_c2_3377] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1556_c2_3377_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1556_c2_3377_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1556_c2_3377_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1556_c2_3377_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1556_c2_3377_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1556_c2_3377_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1556_c2_3377_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1556_c2_3377_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1556_c2_3377] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1556_c2_3377_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1556_c2_3377_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1556_c2_3377_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1556_c2_3377_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1556_c2_3377_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1556_c2_3377_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1556_c2_3377_return_output := result_stack_value_MUX_uxn_opcodes_h_l1556_c2_3377_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1556_c2_3377] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1556_c2_3377_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1556_c2_3377_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1556_c2_3377_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1556_c2_3377_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1556_c2_3377_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1556_c2_3377_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1556_c2_3377_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1556_c2_3377_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1556_c2_3377] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1556_c2_3377_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1556_c2_3377_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1556_c2_3377_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1556_c2_3377_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1556_c2_3377_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1556_c2_3377_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1556_c2_3377_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1556_c2_3377_return_output;

     -- Submodule level 11
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_49dd_uxn_opcodes_h_l1552_l1608_DUPLICATE_a5ed LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_49dd_uxn_opcodes_h_l1552_l1608_DUPLICATE_a5ed_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_49dd(
     result,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1556_c2_3377_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1556_c2_3377_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1556_c2_3377_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1556_c2_3377_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1556_c2_3377_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1556_c2_3377_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1556_c2_3377_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1556_c2_3377_return_output);

     -- Submodule level 12
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_49dd_uxn_opcodes_h_l1552_l1608_DUPLICATE_a5ed_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_49dd_uxn_opcodes_h_l1552_l1608_DUPLICATE_a5ed_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
