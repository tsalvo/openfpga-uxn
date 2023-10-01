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
-- Submodules: 132
entity lda2_0CLK_084aa6da is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end lda2_0CLK_084aa6da;
architecture arch of lda2_0CLK_084aa6da is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal tmp16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_tmp16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l1067_c6_2789]
signal BIN_OP_EQ_uxn_opcodes_h_l1067_c6_2789_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1067_c6_2789_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1067_c6_2789_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1067_c1_43cf]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_43cf_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_43cf_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_43cf_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_43cf_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1067_c2_c1e6]
signal t16_MUX_uxn_opcodes_h_l1067_c2_c1e6_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1067_c2_c1e6_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1067_c2_c1e6_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1067_c2_c1e6_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1067_c2_c1e6]
signal tmp16_MUX_uxn_opcodes_h_l1067_c2_c1e6_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1067_c2_c1e6_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1067_c2_c1e6_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1067_c2_c1e6_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1067_c2_c1e6]
signal result_stack_value_MUX_uxn_opcodes_h_l1067_c2_c1e6_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1067_c2_c1e6_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1067_c2_c1e6_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1067_c2_c1e6_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1067_c2_c1e6]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1067_c2_c1e6_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1067_c2_c1e6_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1067_c2_c1e6_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1067_c2_c1e6_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1067_c2_c1e6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1067_c2_c1e6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1067_c2_c1e6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1067_c2_c1e6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1067_c2_c1e6_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1067_c2_c1e6]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1067_c2_c1e6_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1067_c2_c1e6_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1067_c2_c1e6_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1067_c2_c1e6_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1067_c2_c1e6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c2_c1e6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c2_c1e6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c2_c1e6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c2_c1e6_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1067_c2_c1e6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1067_c2_c1e6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1067_c2_c1e6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1067_c2_c1e6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1067_c2_c1e6_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1067_c2_c1e6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c2_c1e6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c2_c1e6_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c2_c1e6_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c2_c1e6_return_output : signed(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1067_c2_c1e6]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1067_c2_c1e6_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1067_c2_c1e6_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1067_c2_c1e6_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1067_c2_c1e6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1067_c2_c1e6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c2_c1e6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c2_c1e6_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c2_c1e6_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c2_c1e6_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1067_c2_c1e6]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1067_c2_c1e6_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1067_c2_c1e6_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1067_c2_c1e6_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1067_c2_c1e6_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1067_c2_c1e6]
signal result_ram_addr_MUX_uxn_opcodes_h_l1067_c2_c1e6_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1067_c2_c1e6_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1067_c2_c1e6_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1067_c2_c1e6_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l1068_c3_1b18[uxn_opcodes_h_l1068_c3_1b18]
signal printf_uxn_opcodes_h_l1068_c3_1b18_uxn_opcodes_h_l1068_c3_1b18_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1075_c11_932a]
signal BIN_OP_EQ_uxn_opcodes_h_l1075_c11_932a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1075_c11_932a_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1075_c11_932a_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1075_c7_9be3]
signal t16_MUX_uxn_opcodes_h_l1075_c7_9be3_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1075_c7_9be3_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1075_c7_9be3_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1075_c7_9be3_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1075_c7_9be3]
signal tmp16_MUX_uxn_opcodes_h_l1075_c7_9be3_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1075_c7_9be3_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1075_c7_9be3_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1075_c7_9be3_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1075_c7_9be3]
signal result_stack_value_MUX_uxn_opcodes_h_l1075_c7_9be3_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1075_c7_9be3_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1075_c7_9be3_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1075_c7_9be3_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1075_c7_9be3]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1075_c7_9be3_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1075_c7_9be3_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1075_c7_9be3_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1075_c7_9be3_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1075_c7_9be3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_9be3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_9be3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_9be3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_9be3_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1075_c7_9be3]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1075_c7_9be3_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1075_c7_9be3_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1075_c7_9be3_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1075_c7_9be3_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1075_c7_9be3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_9be3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_9be3_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_9be3_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_9be3_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1075_c7_9be3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_9be3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_9be3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_9be3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_9be3_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1075_c7_9be3]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_9be3_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_9be3_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_9be3_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_9be3_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1075_c7_9be3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_9be3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_9be3_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_9be3_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_9be3_return_output : signed(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1075_c7_9be3]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1075_c7_9be3_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1075_c7_9be3_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1075_c7_9be3_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1075_c7_9be3_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1075_c7_9be3]
signal result_ram_addr_MUX_uxn_opcodes_h_l1075_c7_9be3_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1075_c7_9be3_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1075_c7_9be3_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1075_c7_9be3_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1079_c11_03db]
signal BIN_OP_EQ_uxn_opcodes_h_l1079_c11_03db_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1079_c11_03db_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1079_c11_03db_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1079_c7_966d]
signal t16_MUX_uxn_opcodes_h_l1079_c7_966d_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1079_c7_966d_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1079_c7_966d_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1079_c7_966d_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1079_c7_966d]
signal tmp16_MUX_uxn_opcodes_h_l1079_c7_966d_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1079_c7_966d_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1079_c7_966d_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1079_c7_966d_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1079_c7_966d]
signal result_stack_value_MUX_uxn_opcodes_h_l1079_c7_966d_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1079_c7_966d_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1079_c7_966d_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1079_c7_966d_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1079_c7_966d]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1079_c7_966d_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1079_c7_966d_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1079_c7_966d_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1079_c7_966d_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1079_c7_966d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1079_c7_966d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1079_c7_966d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1079_c7_966d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1079_c7_966d_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1079_c7_966d]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1079_c7_966d_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1079_c7_966d_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1079_c7_966d_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1079_c7_966d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1079_c7_966d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_966d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_966d_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_966d_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_966d_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1079_c7_966d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_966d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_966d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_966d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_966d_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1079_c7_966d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1079_c7_966d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1079_c7_966d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1079_c7_966d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1079_c7_966d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1079_c7_966d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c7_966d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c7_966d_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c7_966d_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c7_966d_return_output : signed(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1079_c7_966d]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1079_c7_966d_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1079_c7_966d_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1079_c7_966d_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1079_c7_966d_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1079_c7_966d]
signal result_ram_addr_MUX_uxn_opcodes_h_l1079_c7_966d_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1079_c7_966d_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1079_c7_966d_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1079_c7_966d_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1081_c3_9353]
signal CONST_SL_8_uxn_opcodes_h_l1081_c3_9353_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1081_c3_9353_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1085_c11_2e2e]
signal BIN_OP_EQ_uxn_opcodes_h_l1085_c11_2e2e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1085_c11_2e2e_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1085_c11_2e2e_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1085_c7_6e9e]
signal t16_MUX_uxn_opcodes_h_l1085_c7_6e9e_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1085_c7_6e9e_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1085_c7_6e9e_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1085_c7_6e9e_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1085_c7_6e9e]
signal tmp16_MUX_uxn_opcodes_h_l1085_c7_6e9e_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1085_c7_6e9e_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1085_c7_6e9e_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1085_c7_6e9e_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1085_c7_6e9e]
signal result_stack_value_MUX_uxn_opcodes_h_l1085_c7_6e9e_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1085_c7_6e9e_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1085_c7_6e9e_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1085_c7_6e9e_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1085_c7_6e9e]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1085_c7_6e9e_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1085_c7_6e9e_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1085_c7_6e9e_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1085_c7_6e9e_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1085_c7_6e9e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1085_c7_6e9e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1085_c7_6e9e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1085_c7_6e9e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1085_c7_6e9e_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1085_c7_6e9e]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1085_c7_6e9e_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1085_c7_6e9e_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1085_c7_6e9e_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1085_c7_6e9e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1085_c7_6e9e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_6e9e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_6e9e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_6e9e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_6e9e_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1085_c7_6e9e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_6e9e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_6e9e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_6e9e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_6e9e_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1085_c7_6e9e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1085_c7_6e9e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1085_c7_6e9e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1085_c7_6e9e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1085_c7_6e9e_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1085_c7_6e9e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1085_c7_6e9e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1085_c7_6e9e_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1085_c7_6e9e_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1085_c7_6e9e_return_output : signed(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1085_c7_6e9e]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1085_c7_6e9e_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1085_c7_6e9e_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1085_c7_6e9e_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1085_c7_6e9e_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1085_c7_6e9e]
signal result_ram_addr_MUX_uxn_opcodes_h_l1085_c7_6e9e_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1085_c7_6e9e_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1085_c7_6e9e_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1085_c7_6e9e_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1089_c11_6aa7]
signal BIN_OP_EQ_uxn_opcodes_h_l1089_c11_6aa7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1089_c11_6aa7_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1089_c11_6aa7_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1089_c7_88c5]
signal t16_MUX_uxn_opcodes_h_l1089_c7_88c5_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1089_c7_88c5_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1089_c7_88c5_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1089_c7_88c5_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1089_c7_88c5]
signal tmp16_MUX_uxn_opcodes_h_l1089_c7_88c5_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1089_c7_88c5_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1089_c7_88c5_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1089_c7_88c5_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1089_c7_88c5]
signal result_stack_value_MUX_uxn_opcodes_h_l1089_c7_88c5_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1089_c7_88c5_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1089_c7_88c5_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1089_c7_88c5_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1089_c7_88c5]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1089_c7_88c5_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1089_c7_88c5_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1089_c7_88c5_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1089_c7_88c5_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1089_c7_88c5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_88c5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_88c5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_88c5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_88c5_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1089_c7_88c5]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1089_c7_88c5_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1089_c7_88c5_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1089_c7_88c5_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1089_c7_88c5_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1089_c7_88c5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_88c5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_88c5_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_88c5_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_88c5_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1089_c7_88c5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_88c5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_88c5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_88c5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_88c5_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1089_c7_88c5]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_88c5_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_88c5_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_88c5_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_88c5_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1089_c7_88c5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_88c5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_88c5_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_88c5_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_88c5_return_output : signed(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1089_c7_88c5]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1089_c7_88c5_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1089_c7_88c5_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1089_c7_88c5_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1089_c7_88c5_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1089_c7_88c5]
signal result_ram_addr_MUX_uxn_opcodes_h_l1089_c7_88c5_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1089_c7_88c5_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1089_c7_88c5_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1089_c7_88c5_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1090_c3_5926]
signal BIN_OP_OR_uxn_opcodes_h_l1090_c3_5926_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1090_c3_5926_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1090_c3_5926_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1093_c32_9e8c]
signal BIN_OP_AND_uxn_opcodes_h_l1093_c32_9e8c_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1093_c32_9e8c_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1093_c32_9e8c_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1093_c32_85c3]
signal BIN_OP_GT_uxn_opcodes_h_l1093_c32_85c3_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1093_c32_85c3_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1093_c32_85c3_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1093_c32_2aeb]
signal MUX_uxn_opcodes_h_l1093_c32_2aeb_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1093_c32_2aeb_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1093_c32_2aeb_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1093_c32_2aeb_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1095_c11_5cda]
signal BIN_OP_EQ_uxn_opcodes_h_l1095_c11_5cda_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1095_c11_5cda_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1095_c11_5cda_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1095_c7_927c]
signal tmp16_MUX_uxn_opcodes_h_l1095_c7_927c_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1095_c7_927c_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1095_c7_927c_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1095_c7_927c_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1095_c7_927c]
signal result_stack_value_MUX_uxn_opcodes_h_l1095_c7_927c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1095_c7_927c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1095_c7_927c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1095_c7_927c_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1095_c7_927c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1095_c7_927c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1095_c7_927c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1095_c7_927c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1095_c7_927c_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1095_c7_927c]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1095_c7_927c_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1095_c7_927c_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1095_c7_927c_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1095_c7_927c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1095_c7_927c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1095_c7_927c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1095_c7_927c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1095_c7_927c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1095_c7_927c_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1095_c7_927c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1095_c7_927c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1095_c7_927c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1095_c7_927c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1095_c7_927c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1095_c7_927c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1095_c7_927c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1095_c7_927c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1095_c7_927c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1095_c7_927c_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1095_c7_927c]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1095_c7_927c_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1095_c7_927c_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1095_c7_927c_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1095_c7_927c_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1095_c7_927c]
signal result_ram_addr_MUX_uxn_opcodes_h_l1095_c7_927c_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1095_c7_927c_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1095_c7_927c_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1095_c7_927c_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1101_c11_a3d0]
signal BIN_OP_EQ_uxn_opcodes_h_l1101_c11_a3d0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1101_c11_a3d0_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1101_c11_a3d0_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1101_c7_49dd]
signal tmp16_MUX_uxn_opcodes_h_l1101_c7_49dd_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1101_c7_49dd_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1101_c7_49dd_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1101_c7_49dd_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1101_c7_49dd]
signal result_stack_value_MUX_uxn_opcodes_h_l1101_c7_49dd_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1101_c7_49dd_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1101_c7_49dd_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1101_c7_49dd_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1101_c7_49dd]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_49dd_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_49dd_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_49dd_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_49dd_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1101_c7_49dd]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_49dd_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_49dd_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_49dd_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_49dd_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1101_c7_49dd]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_49dd_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_49dd_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_49dd_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_49dd_return_output : unsigned(7 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1101_c7_49dd]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1101_c7_49dd_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1101_c7_49dd_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1101_c7_49dd_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1101_c7_49dd_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1101_c7_49dd]
signal result_ram_addr_MUX_uxn_opcodes_h_l1101_c7_49dd_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1101_c7_49dd_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1101_c7_49dd_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1101_c7_49dd_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1105_c11_d791]
signal BIN_OP_EQ_uxn_opcodes_h_l1105_c11_d791_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1105_c11_d791_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1105_c11_d791_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1105_c7_0284]
signal tmp16_MUX_uxn_opcodes_h_l1105_c7_0284_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1105_c7_0284_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1105_c7_0284_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1105_c7_0284_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1105_c7_0284]
signal result_stack_value_MUX_uxn_opcodes_h_l1105_c7_0284_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1105_c7_0284_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1105_c7_0284_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1105_c7_0284_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1105_c7_0284]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1105_c7_0284_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1105_c7_0284_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1105_c7_0284_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1105_c7_0284_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1105_c7_0284]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1105_c7_0284_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1105_c7_0284_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1105_c7_0284_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1105_c7_0284_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1105_c7_0284]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1105_c7_0284_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1105_c7_0284_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1105_c7_0284_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1105_c7_0284_return_output : unsigned(7 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1105_c7_0284]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1105_c7_0284_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1105_c7_0284_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1105_c7_0284_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1105_c7_0284_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1105_c7_0284]
signal result_ram_addr_MUX_uxn_opcodes_h_l1105_c7_0284_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1105_c7_0284_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1105_c7_0284_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1105_c7_0284_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1107_c3_ccd0]
signal CONST_SL_8_uxn_opcodes_h_l1107_c3_ccd0_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1107_c3_ccd0_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1109_c21_f3e3]
signal BIN_OP_PLUS_uxn_opcodes_h_l1109_c21_f3e3_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1109_c21_f3e3_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1109_c21_f3e3_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1111_c11_9241]
signal BIN_OP_EQ_uxn_opcodes_h_l1111_c11_9241_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1111_c11_9241_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1111_c11_9241_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1111_c7_1154]
signal tmp16_MUX_uxn_opcodes_h_l1111_c7_1154_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1111_c7_1154_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1111_c7_1154_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1111_c7_1154_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1111_c7_1154]
signal result_stack_value_MUX_uxn_opcodes_h_l1111_c7_1154_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1111_c7_1154_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1111_c7_1154_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1111_c7_1154_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1111_c7_1154]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1111_c7_1154_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1111_c7_1154_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1111_c7_1154_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1111_c7_1154_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1111_c7_1154]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1111_c7_1154_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1111_c7_1154_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1111_c7_1154_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1111_c7_1154_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1111_c7_1154]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c7_1154_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c7_1154_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c7_1154_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c7_1154_return_output : unsigned(7 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1111_c7_1154]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1111_c7_1154_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1111_c7_1154_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1111_c7_1154_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1111_c7_1154_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1111_c7_1154]
signal result_ram_addr_MUX_uxn_opcodes_h_l1111_c7_1154_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1111_c7_1154_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1111_c7_1154_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1111_c7_1154_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1113_c21_3a4a]
signal BIN_OP_PLUS_uxn_opcodes_h_l1113_c21_3a4a_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1113_c21_3a4a_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1113_c21_3a4a_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1115_c11_ace2]
signal BIN_OP_EQ_uxn_opcodes_h_l1115_c11_ace2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1115_c11_ace2_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1115_c11_ace2_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1115_c7_2d8e]
signal tmp16_MUX_uxn_opcodes_h_l1115_c7_2d8e_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1115_c7_2d8e_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1115_c7_2d8e_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1115_c7_2d8e_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1115_c7_2d8e]
signal result_stack_value_MUX_uxn_opcodes_h_l1115_c7_2d8e_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1115_c7_2d8e_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1115_c7_2d8e_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1115_c7_2d8e_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1115_c7_2d8e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1115_c7_2d8e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1115_c7_2d8e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1115_c7_2d8e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1115_c7_2d8e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1115_c7_2d8e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1115_c7_2d8e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1115_c7_2d8e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1115_c7_2d8e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1115_c7_2d8e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1115_c7_2d8e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1115_c7_2d8e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1115_c7_2d8e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1115_c7_2d8e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1115_c7_2d8e_return_output : unsigned(7 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1115_c7_2d8e]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1115_c7_2d8e_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1115_c7_2d8e_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1115_c7_2d8e_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1115_c7_2d8e_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1116_c3_1305]
signal BIN_OP_OR_uxn_opcodes_h_l1116_c3_1305_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1116_c3_1305_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1116_c3_1305_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1122_c11_fdce]
signal BIN_OP_EQ_uxn_opcodes_h_l1122_c11_fdce_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1122_c11_fdce_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1122_c11_fdce_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1122_c7_f507]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1122_c7_f507_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1122_c7_f507_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1122_c7_f507_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1122_c7_f507_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1122_c7_f507]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1122_c7_f507_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1122_c7_f507_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1122_c7_f507_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1122_c7_f507_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1122_c7_f507]
signal result_stack_value_MUX_uxn_opcodes_h_l1122_c7_f507_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1122_c7_f507_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1122_c7_f507_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1122_c7_f507_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1122_c7_f507]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1122_c7_f507_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1122_c7_f507_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1122_c7_f507_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1122_c7_f507_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1125_c34_4b57]
signal CONST_SR_8_uxn_opcodes_h_l1125_c34_4b57_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1125_c34_4b57_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1127_c11_f5b0]
signal BIN_OP_EQ_uxn_opcodes_h_l1127_c11_f5b0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1127_c11_f5b0_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1127_c11_f5b0_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1127_c7_faac]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_faac_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_faac_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_faac_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_faac_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1127_c7_faac]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_faac_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_faac_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_faac_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_faac_return_output : unsigned(0 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_b1ca( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : signed;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned;
 ref_toks_10 : unsigned;
 ref_toks_11 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.stack_value := ref_toks_1;
      base.is_stack_read := ref_toks_2;
      base.is_stack_write := ref_toks_3;
      base.is_ram_read := ref_toks_4;
      base.is_sp_shift := ref_toks_5;
      base.is_opc_done := ref_toks_6;
      base.sp_relative_shift := ref_toks_7;
      base.is_ram_write := ref_toks_8;
      base.stack_address_sp_offset := ref_toks_9;
      base.is_stack_index_flipped := ref_toks_10;
      base.ram_addr := ref_toks_11;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1067_c6_2789
BIN_OP_EQ_uxn_opcodes_h_l1067_c6_2789 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1067_c6_2789_left,
BIN_OP_EQ_uxn_opcodes_h_l1067_c6_2789_right,
BIN_OP_EQ_uxn_opcodes_h_l1067_c6_2789_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_43cf
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_43cf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_43cf_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_43cf_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_43cf_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_43cf_return_output);

-- t16_MUX_uxn_opcodes_h_l1067_c2_c1e6
t16_MUX_uxn_opcodes_h_l1067_c2_c1e6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1067_c2_c1e6_cond,
t16_MUX_uxn_opcodes_h_l1067_c2_c1e6_iftrue,
t16_MUX_uxn_opcodes_h_l1067_c2_c1e6_iffalse,
t16_MUX_uxn_opcodes_h_l1067_c2_c1e6_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1067_c2_c1e6
tmp16_MUX_uxn_opcodes_h_l1067_c2_c1e6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1067_c2_c1e6_cond,
tmp16_MUX_uxn_opcodes_h_l1067_c2_c1e6_iftrue,
tmp16_MUX_uxn_opcodes_h_l1067_c2_c1e6_iffalse,
tmp16_MUX_uxn_opcodes_h_l1067_c2_c1e6_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1067_c2_c1e6
result_stack_value_MUX_uxn_opcodes_h_l1067_c2_c1e6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1067_c2_c1e6_cond,
result_stack_value_MUX_uxn_opcodes_h_l1067_c2_c1e6_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1067_c2_c1e6_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1067_c2_c1e6_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1067_c2_c1e6
result_is_stack_read_MUX_uxn_opcodes_h_l1067_c2_c1e6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1067_c2_c1e6_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1067_c2_c1e6_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1067_c2_c1e6_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1067_c2_c1e6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1067_c2_c1e6
result_is_stack_write_MUX_uxn_opcodes_h_l1067_c2_c1e6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1067_c2_c1e6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1067_c2_c1e6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1067_c2_c1e6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1067_c2_c1e6_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1067_c2_c1e6
result_is_ram_read_MUX_uxn_opcodes_h_l1067_c2_c1e6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1067_c2_c1e6_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1067_c2_c1e6_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1067_c2_c1e6_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1067_c2_c1e6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c2_c1e6
result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c2_c1e6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c2_c1e6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c2_c1e6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c2_c1e6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c2_c1e6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1067_c2_c1e6
result_is_opc_done_MUX_uxn_opcodes_h_l1067_c2_c1e6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1067_c2_c1e6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1067_c2_c1e6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1067_c2_c1e6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1067_c2_c1e6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c2_c1e6
result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c2_c1e6 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c2_c1e6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c2_c1e6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c2_c1e6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c2_c1e6_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1067_c2_c1e6
result_is_ram_write_MUX_uxn_opcodes_h_l1067_c2_c1e6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1067_c2_c1e6_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1067_c2_c1e6_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1067_c2_c1e6_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1067_c2_c1e6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c2_c1e6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c2_c1e6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c2_c1e6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c2_c1e6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c2_c1e6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c2_c1e6_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1067_c2_c1e6
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1067_c2_c1e6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1067_c2_c1e6_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1067_c2_c1e6_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1067_c2_c1e6_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1067_c2_c1e6_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1067_c2_c1e6
result_ram_addr_MUX_uxn_opcodes_h_l1067_c2_c1e6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1067_c2_c1e6_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1067_c2_c1e6_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1067_c2_c1e6_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1067_c2_c1e6_return_output);

-- printf_uxn_opcodes_h_l1068_c3_1b18_uxn_opcodes_h_l1068_c3_1b18
printf_uxn_opcodes_h_l1068_c3_1b18_uxn_opcodes_h_l1068_c3_1b18 : entity work.printf_uxn_opcodes_h_l1068_c3_1b18_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1068_c3_1b18_uxn_opcodes_h_l1068_c3_1b18_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1075_c11_932a
BIN_OP_EQ_uxn_opcodes_h_l1075_c11_932a : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1075_c11_932a_left,
BIN_OP_EQ_uxn_opcodes_h_l1075_c11_932a_right,
BIN_OP_EQ_uxn_opcodes_h_l1075_c11_932a_return_output);

-- t16_MUX_uxn_opcodes_h_l1075_c7_9be3
t16_MUX_uxn_opcodes_h_l1075_c7_9be3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1075_c7_9be3_cond,
t16_MUX_uxn_opcodes_h_l1075_c7_9be3_iftrue,
t16_MUX_uxn_opcodes_h_l1075_c7_9be3_iffalse,
t16_MUX_uxn_opcodes_h_l1075_c7_9be3_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1075_c7_9be3
tmp16_MUX_uxn_opcodes_h_l1075_c7_9be3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1075_c7_9be3_cond,
tmp16_MUX_uxn_opcodes_h_l1075_c7_9be3_iftrue,
tmp16_MUX_uxn_opcodes_h_l1075_c7_9be3_iffalse,
tmp16_MUX_uxn_opcodes_h_l1075_c7_9be3_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1075_c7_9be3
result_stack_value_MUX_uxn_opcodes_h_l1075_c7_9be3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1075_c7_9be3_cond,
result_stack_value_MUX_uxn_opcodes_h_l1075_c7_9be3_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1075_c7_9be3_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1075_c7_9be3_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1075_c7_9be3
result_is_stack_read_MUX_uxn_opcodes_h_l1075_c7_9be3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1075_c7_9be3_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1075_c7_9be3_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1075_c7_9be3_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1075_c7_9be3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_9be3
result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_9be3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_9be3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_9be3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_9be3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_9be3_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1075_c7_9be3
result_is_ram_read_MUX_uxn_opcodes_h_l1075_c7_9be3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1075_c7_9be3_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1075_c7_9be3_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1075_c7_9be3_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1075_c7_9be3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_9be3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_9be3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_9be3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_9be3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_9be3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_9be3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_9be3
result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_9be3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_9be3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_9be3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_9be3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_9be3_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_9be3
result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_9be3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_9be3_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_9be3_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_9be3_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_9be3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_9be3
result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_9be3 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_9be3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_9be3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_9be3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_9be3_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1075_c7_9be3
result_is_ram_write_MUX_uxn_opcodes_h_l1075_c7_9be3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1075_c7_9be3_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1075_c7_9be3_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1075_c7_9be3_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1075_c7_9be3_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1075_c7_9be3
result_ram_addr_MUX_uxn_opcodes_h_l1075_c7_9be3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1075_c7_9be3_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1075_c7_9be3_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1075_c7_9be3_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1075_c7_9be3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1079_c11_03db
BIN_OP_EQ_uxn_opcodes_h_l1079_c11_03db : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1079_c11_03db_left,
BIN_OP_EQ_uxn_opcodes_h_l1079_c11_03db_right,
BIN_OP_EQ_uxn_opcodes_h_l1079_c11_03db_return_output);

-- t16_MUX_uxn_opcodes_h_l1079_c7_966d
t16_MUX_uxn_opcodes_h_l1079_c7_966d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1079_c7_966d_cond,
t16_MUX_uxn_opcodes_h_l1079_c7_966d_iftrue,
t16_MUX_uxn_opcodes_h_l1079_c7_966d_iffalse,
t16_MUX_uxn_opcodes_h_l1079_c7_966d_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1079_c7_966d
tmp16_MUX_uxn_opcodes_h_l1079_c7_966d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1079_c7_966d_cond,
tmp16_MUX_uxn_opcodes_h_l1079_c7_966d_iftrue,
tmp16_MUX_uxn_opcodes_h_l1079_c7_966d_iffalse,
tmp16_MUX_uxn_opcodes_h_l1079_c7_966d_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1079_c7_966d
result_stack_value_MUX_uxn_opcodes_h_l1079_c7_966d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1079_c7_966d_cond,
result_stack_value_MUX_uxn_opcodes_h_l1079_c7_966d_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1079_c7_966d_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1079_c7_966d_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1079_c7_966d
result_is_stack_read_MUX_uxn_opcodes_h_l1079_c7_966d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1079_c7_966d_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1079_c7_966d_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1079_c7_966d_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1079_c7_966d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1079_c7_966d
result_is_stack_write_MUX_uxn_opcodes_h_l1079_c7_966d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1079_c7_966d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1079_c7_966d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1079_c7_966d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1079_c7_966d_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1079_c7_966d
result_is_ram_read_MUX_uxn_opcodes_h_l1079_c7_966d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1079_c7_966d_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1079_c7_966d_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1079_c7_966d_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1079_c7_966d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_966d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_966d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_966d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_966d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_966d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_966d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_966d
result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_966d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_966d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_966d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_966d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_966d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1079_c7_966d
result_is_sp_shift_MUX_uxn_opcodes_h_l1079_c7_966d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1079_c7_966d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1079_c7_966d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1079_c7_966d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1079_c7_966d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c7_966d
result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c7_966d : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c7_966d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c7_966d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c7_966d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c7_966d_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1079_c7_966d
result_is_ram_write_MUX_uxn_opcodes_h_l1079_c7_966d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1079_c7_966d_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1079_c7_966d_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1079_c7_966d_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1079_c7_966d_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1079_c7_966d
result_ram_addr_MUX_uxn_opcodes_h_l1079_c7_966d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1079_c7_966d_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1079_c7_966d_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1079_c7_966d_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1079_c7_966d_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1081_c3_9353
CONST_SL_8_uxn_opcodes_h_l1081_c3_9353 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1081_c3_9353_x,
CONST_SL_8_uxn_opcodes_h_l1081_c3_9353_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1085_c11_2e2e
BIN_OP_EQ_uxn_opcodes_h_l1085_c11_2e2e : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1085_c11_2e2e_left,
BIN_OP_EQ_uxn_opcodes_h_l1085_c11_2e2e_right,
BIN_OP_EQ_uxn_opcodes_h_l1085_c11_2e2e_return_output);

-- t16_MUX_uxn_opcodes_h_l1085_c7_6e9e
t16_MUX_uxn_opcodes_h_l1085_c7_6e9e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1085_c7_6e9e_cond,
t16_MUX_uxn_opcodes_h_l1085_c7_6e9e_iftrue,
t16_MUX_uxn_opcodes_h_l1085_c7_6e9e_iffalse,
t16_MUX_uxn_opcodes_h_l1085_c7_6e9e_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1085_c7_6e9e
tmp16_MUX_uxn_opcodes_h_l1085_c7_6e9e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1085_c7_6e9e_cond,
tmp16_MUX_uxn_opcodes_h_l1085_c7_6e9e_iftrue,
tmp16_MUX_uxn_opcodes_h_l1085_c7_6e9e_iffalse,
tmp16_MUX_uxn_opcodes_h_l1085_c7_6e9e_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1085_c7_6e9e
result_stack_value_MUX_uxn_opcodes_h_l1085_c7_6e9e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1085_c7_6e9e_cond,
result_stack_value_MUX_uxn_opcodes_h_l1085_c7_6e9e_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1085_c7_6e9e_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1085_c7_6e9e_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1085_c7_6e9e
result_is_stack_read_MUX_uxn_opcodes_h_l1085_c7_6e9e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1085_c7_6e9e_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1085_c7_6e9e_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1085_c7_6e9e_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1085_c7_6e9e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1085_c7_6e9e
result_is_stack_write_MUX_uxn_opcodes_h_l1085_c7_6e9e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1085_c7_6e9e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1085_c7_6e9e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1085_c7_6e9e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1085_c7_6e9e_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1085_c7_6e9e
result_is_ram_read_MUX_uxn_opcodes_h_l1085_c7_6e9e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1085_c7_6e9e_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1085_c7_6e9e_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1085_c7_6e9e_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1085_c7_6e9e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_6e9e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_6e9e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_6e9e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_6e9e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_6e9e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_6e9e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_6e9e
result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_6e9e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_6e9e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_6e9e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_6e9e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_6e9e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1085_c7_6e9e
result_is_sp_shift_MUX_uxn_opcodes_h_l1085_c7_6e9e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1085_c7_6e9e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1085_c7_6e9e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1085_c7_6e9e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1085_c7_6e9e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1085_c7_6e9e
result_sp_relative_shift_MUX_uxn_opcodes_h_l1085_c7_6e9e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1085_c7_6e9e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1085_c7_6e9e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1085_c7_6e9e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1085_c7_6e9e_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1085_c7_6e9e
result_is_ram_write_MUX_uxn_opcodes_h_l1085_c7_6e9e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1085_c7_6e9e_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1085_c7_6e9e_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1085_c7_6e9e_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1085_c7_6e9e_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1085_c7_6e9e
result_ram_addr_MUX_uxn_opcodes_h_l1085_c7_6e9e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1085_c7_6e9e_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1085_c7_6e9e_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1085_c7_6e9e_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1085_c7_6e9e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1089_c11_6aa7
BIN_OP_EQ_uxn_opcodes_h_l1089_c11_6aa7 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1089_c11_6aa7_left,
BIN_OP_EQ_uxn_opcodes_h_l1089_c11_6aa7_right,
BIN_OP_EQ_uxn_opcodes_h_l1089_c11_6aa7_return_output);

-- t16_MUX_uxn_opcodes_h_l1089_c7_88c5
t16_MUX_uxn_opcodes_h_l1089_c7_88c5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1089_c7_88c5_cond,
t16_MUX_uxn_opcodes_h_l1089_c7_88c5_iftrue,
t16_MUX_uxn_opcodes_h_l1089_c7_88c5_iffalse,
t16_MUX_uxn_opcodes_h_l1089_c7_88c5_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1089_c7_88c5
tmp16_MUX_uxn_opcodes_h_l1089_c7_88c5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1089_c7_88c5_cond,
tmp16_MUX_uxn_opcodes_h_l1089_c7_88c5_iftrue,
tmp16_MUX_uxn_opcodes_h_l1089_c7_88c5_iffalse,
tmp16_MUX_uxn_opcodes_h_l1089_c7_88c5_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1089_c7_88c5
result_stack_value_MUX_uxn_opcodes_h_l1089_c7_88c5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1089_c7_88c5_cond,
result_stack_value_MUX_uxn_opcodes_h_l1089_c7_88c5_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1089_c7_88c5_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1089_c7_88c5_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1089_c7_88c5
result_is_stack_read_MUX_uxn_opcodes_h_l1089_c7_88c5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1089_c7_88c5_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1089_c7_88c5_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1089_c7_88c5_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1089_c7_88c5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_88c5
result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_88c5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_88c5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_88c5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_88c5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_88c5_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1089_c7_88c5
result_is_ram_read_MUX_uxn_opcodes_h_l1089_c7_88c5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1089_c7_88c5_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1089_c7_88c5_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1089_c7_88c5_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1089_c7_88c5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_88c5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_88c5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_88c5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_88c5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_88c5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_88c5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_88c5
result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_88c5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_88c5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_88c5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_88c5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_88c5_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_88c5
result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_88c5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_88c5_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_88c5_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_88c5_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_88c5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_88c5
result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_88c5 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_88c5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_88c5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_88c5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_88c5_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1089_c7_88c5
result_is_ram_write_MUX_uxn_opcodes_h_l1089_c7_88c5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1089_c7_88c5_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1089_c7_88c5_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1089_c7_88c5_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1089_c7_88c5_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1089_c7_88c5
result_ram_addr_MUX_uxn_opcodes_h_l1089_c7_88c5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1089_c7_88c5_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1089_c7_88c5_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1089_c7_88c5_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1089_c7_88c5_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1090_c3_5926
BIN_OP_OR_uxn_opcodes_h_l1090_c3_5926 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1090_c3_5926_left,
BIN_OP_OR_uxn_opcodes_h_l1090_c3_5926_right,
BIN_OP_OR_uxn_opcodes_h_l1090_c3_5926_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1093_c32_9e8c
BIN_OP_AND_uxn_opcodes_h_l1093_c32_9e8c : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1093_c32_9e8c_left,
BIN_OP_AND_uxn_opcodes_h_l1093_c32_9e8c_right,
BIN_OP_AND_uxn_opcodes_h_l1093_c32_9e8c_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1093_c32_85c3
BIN_OP_GT_uxn_opcodes_h_l1093_c32_85c3 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1093_c32_85c3_left,
BIN_OP_GT_uxn_opcodes_h_l1093_c32_85c3_right,
BIN_OP_GT_uxn_opcodes_h_l1093_c32_85c3_return_output);

-- MUX_uxn_opcodes_h_l1093_c32_2aeb
MUX_uxn_opcodes_h_l1093_c32_2aeb : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1093_c32_2aeb_cond,
MUX_uxn_opcodes_h_l1093_c32_2aeb_iftrue,
MUX_uxn_opcodes_h_l1093_c32_2aeb_iffalse,
MUX_uxn_opcodes_h_l1093_c32_2aeb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1095_c11_5cda
BIN_OP_EQ_uxn_opcodes_h_l1095_c11_5cda : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1095_c11_5cda_left,
BIN_OP_EQ_uxn_opcodes_h_l1095_c11_5cda_right,
BIN_OP_EQ_uxn_opcodes_h_l1095_c11_5cda_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1095_c7_927c
tmp16_MUX_uxn_opcodes_h_l1095_c7_927c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1095_c7_927c_cond,
tmp16_MUX_uxn_opcodes_h_l1095_c7_927c_iftrue,
tmp16_MUX_uxn_opcodes_h_l1095_c7_927c_iffalse,
tmp16_MUX_uxn_opcodes_h_l1095_c7_927c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1095_c7_927c
result_stack_value_MUX_uxn_opcodes_h_l1095_c7_927c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1095_c7_927c_cond,
result_stack_value_MUX_uxn_opcodes_h_l1095_c7_927c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1095_c7_927c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1095_c7_927c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1095_c7_927c
result_is_stack_write_MUX_uxn_opcodes_h_l1095_c7_927c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1095_c7_927c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1095_c7_927c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1095_c7_927c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1095_c7_927c_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1095_c7_927c
result_is_ram_read_MUX_uxn_opcodes_h_l1095_c7_927c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1095_c7_927c_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1095_c7_927c_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1095_c7_927c_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1095_c7_927c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1095_c7_927c
result_is_opc_done_MUX_uxn_opcodes_h_l1095_c7_927c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1095_c7_927c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1095_c7_927c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1095_c7_927c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1095_c7_927c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1095_c7_927c
result_is_sp_shift_MUX_uxn_opcodes_h_l1095_c7_927c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1095_c7_927c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1095_c7_927c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1095_c7_927c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1095_c7_927c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1095_c7_927c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1095_c7_927c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1095_c7_927c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1095_c7_927c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1095_c7_927c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1095_c7_927c_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1095_c7_927c
result_is_ram_write_MUX_uxn_opcodes_h_l1095_c7_927c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1095_c7_927c_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1095_c7_927c_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1095_c7_927c_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1095_c7_927c_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1095_c7_927c
result_ram_addr_MUX_uxn_opcodes_h_l1095_c7_927c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1095_c7_927c_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1095_c7_927c_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1095_c7_927c_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1095_c7_927c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1101_c11_a3d0
BIN_OP_EQ_uxn_opcodes_h_l1101_c11_a3d0 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1101_c11_a3d0_left,
BIN_OP_EQ_uxn_opcodes_h_l1101_c11_a3d0_right,
BIN_OP_EQ_uxn_opcodes_h_l1101_c11_a3d0_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1101_c7_49dd
tmp16_MUX_uxn_opcodes_h_l1101_c7_49dd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1101_c7_49dd_cond,
tmp16_MUX_uxn_opcodes_h_l1101_c7_49dd_iftrue,
tmp16_MUX_uxn_opcodes_h_l1101_c7_49dd_iffalse,
tmp16_MUX_uxn_opcodes_h_l1101_c7_49dd_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1101_c7_49dd
result_stack_value_MUX_uxn_opcodes_h_l1101_c7_49dd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1101_c7_49dd_cond,
result_stack_value_MUX_uxn_opcodes_h_l1101_c7_49dd_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1101_c7_49dd_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1101_c7_49dd_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_49dd
result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_49dd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_49dd_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_49dd_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_49dd_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_49dd_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_49dd
result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_49dd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_49dd_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_49dd_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_49dd_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_49dd_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_49dd
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_49dd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_49dd_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_49dd_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_49dd_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_49dd_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1101_c7_49dd
result_is_ram_read_MUX_uxn_opcodes_h_l1101_c7_49dd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1101_c7_49dd_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1101_c7_49dd_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1101_c7_49dd_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1101_c7_49dd_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1101_c7_49dd
result_ram_addr_MUX_uxn_opcodes_h_l1101_c7_49dd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1101_c7_49dd_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1101_c7_49dd_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1101_c7_49dd_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1101_c7_49dd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1105_c11_d791
BIN_OP_EQ_uxn_opcodes_h_l1105_c11_d791 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1105_c11_d791_left,
BIN_OP_EQ_uxn_opcodes_h_l1105_c11_d791_right,
BIN_OP_EQ_uxn_opcodes_h_l1105_c11_d791_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1105_c7_0284
tmp16_MUX_uxn_opcodes_h_l1105_c7_0284 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1105_c7_0284_cond,
tmp16_MUX_uxn_opcodes_h_l1105_c7_0284_iftrue,
tmp16_MUX_uxn_opcodes_h_l1105_c7_0284_iffalse,
tmp16_MUX_uxn_opcodes_h_l1105_c7_0284_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1105_c7_0284
result_stack_value_MUX_uxn_opcodes_h_l1105_c7_0284 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1105_c7_0284_cond,
result_stack_value_MUX_uxn_opcodes_h_l1105_c7_0284_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1105_c7_0284_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1105_c7_0284_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1105_c7_0284
result_is_stack_write_MUX_uxn_opcodes_h_l1105_c7_0284 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1105_c7_0284_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1105_c7_0284_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1105_c7_0284_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1105_c7_0284_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1105_c7_0284
result_is_opc_done_MUX_uxn_opcodes_h_l1105_c7_0284 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1105_c7_0284_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1105_c7_0284_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1105_c7_0284_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1105_c7_0284_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1105_c7_0284
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1105_c7_0284 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1105_c7_0284_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1105_c7_0284_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1105_c7_0284_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1105_c7_0284_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1105_c7_0284
result_is_ram_read_MUX_uxn_opcodes_h_l1105_c7_0284 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1105_c7_0284_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1105_c7_0284_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1105_c7_0284_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1105_c7_0284_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1105_c7_0284
result_ram_addr_MUX_uxn_opcodes_h_l1105_c7_0284 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1105_c7_0284_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1105_c7_0284_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1105_c7_0284_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1105_c7_0284_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1107_c3_ccd0
CONST_SL_8_uxn_opcodes_h_l1107_c3_ccd0 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1107_c3_ccd0_x,
CONST_SL_8_uxn_opcodes_h_l1107_c3_ccd0_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1109_c21_f3e3
BIN_OP_PLUS_uxn_opcodes_h_l1109_c21_f3e3 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1109_c21_f3e3_left,
BIN_OP_PLUS_uxn_opcodes_h_l1109_c21_f3e3_right,
BIN_OP_PLUS_uxn_opcodes_h_l1109_c21_f3e3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1111_c11_9241
BIN_OP_EQ_uxn_opcodes_h_l1111_c11_9241 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1111_c11_9241_left,
BIN_OP_EQ_uxn_opcodes_h_l1111_c11_9241_right,
BIN_OP_EQ_uxn_opcodes_h_l1111_c11_9241_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1111_c7_1154
tmp16_MUX_uxn_opcodes_h_l1111_c7_1154 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1111_c7_1154_cond,
tmp16_MUX_uxn_opcodes_h_l1111_c7_1154_iftrue,
tmp16_MUX_uxn_opcodes_h_l1111_c7_1154_iffalse,
tmp16_MUX_uxn_opcodes_h_l1111_c7_1154_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1111_c7_1154
result_stack_value_MUX_uxn_opcodes_h_l1111_c7_1154 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1111_c7_1154_cond,
result_stack_value_MUX_uxn_opcodes_h_l1111_c7_1154_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1111_c7_1154_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1111_c7_1154_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1111_c7_1154
result_is_stack_write_MUX_uxn_opcodes_h_l1111_c7_1154 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1111_c7_1154_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1111_c7_1154_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1111_c7_1154_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1111_c7_1154_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1111_c7_1154
result_is_opc_done_MUX_uxn_opcodes_h_l1111_c7_1154 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1111_c7_1154_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1111_c7_1154_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1111_c7_1154_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1111_c7_1154_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c7_1154
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c7_1154 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c7_1154_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c7_1154_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c7_1154_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c7_1154_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1111_c7_1154
result_is_ram_read_MUX_uxn_opcodes_h_l1111_c7_1154 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1111_c7_1154_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1111_c7_1154_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1111_c7_1154_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1111_c7_1154_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1111_c7_1154
result_ram_addr_MUX_uxn_opcodes_h_l1111_c7_1154 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1111_c7_1154_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1111_c7_1154_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1111_c7_1154_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1111_c7_1154_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1113_c21_3a4a
BIN_OP_PLUS_uxn_opcodes_h_l1113_c21_3a4a : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1113_c21_3a4a_left,
BIN_OP_PLUS_uxn_opcodes_h_l1113_c21_3a4a_right,
BIN_OP_PLUS_uxn_opcodes_h_l1113_c21_3a4a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1115_c11_ace2
BIN_OP_EQ_uxn_opcodes_h_l1115_c11_ace2 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1115_c11_ace2_left,
BIN_OP_EQ_uxn_opcodes_h_l1115_c11_ace2_right,
BIN_OP_EQ_uxn_opcodes_h_l1115_c11_ace2_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1115_c7_2d8e
tmp16_MUX_uxn_opcodes_h_l1115_c7_2d8e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1115_c7_2d8e_cond,
tmp16_MUX_uxn_opcodes_h_l1115_c7_2d8e_iftrue,
tmp16_MUX_uxn_opcodes_h_l1115_c7_2d8e_iffalse,
tmp16_MUX_uxn_opcodes_h_l1115_c7_2d8e_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1115_c7_2d8e
result_stack_value_MUX_uxn_opcodes_h_l1115_c7_2d8e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1115_c7_2d8e_cond,
result_stack_value_MUX_uxn_opcodes_h_l1115_c7_2d8e_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1115_c7_2d8e_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1115_c7_2d8e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1115_c7_2d8e
result_is_stack_write_MUX_uxn_opcodes_h_l1115_c7_2d8e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1115_c7_2d8e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1115_c7_2d8e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1115_c7_2d8e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1115_c7_2d8e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1115_c7_2d8e
result_is_opc_done_MUX_uxn_opcodes_h_l1115_c7_2d8e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1115_c7_2d8e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1115_c7_2d8e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1115_c7_2d8e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1115_c7_2d8e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1115_c7_2d8e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1115_c7_2d8e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1115_c7_2d8e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1115_c7_2d8e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1115_c7_2d8e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1115_c7_2d8e_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1115_c7_2d8e
result_is_ram_read_MUX_uxn_opcodes_h_l1115_c7_2d8e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1115_c7_2d8e_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1115_c7_2d8e_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1115_c7_2d8e_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1115_c7_2d8e_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1116_c3_1305
BIN_OP_OR_uxn_opcodes_h_l1116_c3_1305 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1116_c3_1305_left,
BIN_OP_OR_uxn_opcodes_h_l1116_c3_1305_right,
BIN_OP_OR_uxn_opcodes_h_l1116_c3_1305_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1122_c11_fdce
BIN_OP_EQ_uxn_opcodes_h_l1122_c11_fdce : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1122_c11_fdce_left,
BIN_OP_EQ_uxn_opcodes_h_l1122_c11_fdce_right,
BIN_OP_EQ_uxn_opcodes_h_l1122_c11_fdce_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1122_c7_f507
result_is_opc_done_MUX_uxn_opcodes_h_l1122_c7_f507 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1122_c7_f507_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1122_c7_f507_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1122_c7_f507_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1122_c7_f507_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1122_c7_f507
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1122_c7_f507 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1122_c7_f507_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1122_c7_f507_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1122_c7_f507_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1122_c7_f507_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1122_c7_f507
result_stack_value_MUX_uxn_opcodes_h_l1122_c7_f507 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1122_c7_f507_cond,
result_stack_value_MUX_uxn_opcodes_h_l1122_c7_f507_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1122_c7_f507_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1122_c7_f507_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1122_c7_f507
result_is_stack_write_MUX_uxn_opcodes_h_l1122_c7_f507 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1122_c7_f507_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1122_c7_f507_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1122_c7_f507_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1122_c7_f507_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1125_c34_4b57
CONST_SR_8_uxn_opcodes_h_l1125_c34_4b57 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1125_c34_4b57_x,
CONST_SR_8_uxn_opcodes_h_l1125_c34_4b57_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1127_c11_f5b0
BIN_OP_EQ_uxn_opcodes_h_l1127_c11_f5b0 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1127_c11_f5b0_left,
BIN_OP_EQ_uxn_opcodes_h_l1127_c11_f5b0_right,
BIN_OP_EQ_uxn_opcodes_h_l1127_c11_f5b0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_faac
result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_faac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_faac_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_faac_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_faac_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_faac_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_faac
result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_faac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_faac_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_faac_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_faac_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_faac_return_output);



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
 tmp16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1067_c6_2789_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_43cf_return_output,
 t16_MUX_uxn_opcodes_h_l1067_c2_c1e6_return_output,
 tmp16_MUX_uxn_opcodes_h_l1067_c2_c1e6_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1067_c2_c1e6_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1067_c2_c1e6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1067_c2_c1e6_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1067_c2_c1e6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c2_c1e6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1067_c2_c1e6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c2_c1e6_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1067_c2_c1e6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c2_c1e6_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1067_c2_c1e6_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1067_c2_c1e6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1075_c11_932a_return_output,
 t16_MUX_uxn_opcodes_h_l1075_c7_9be3_return_output,
 tmp16_MUX_uxn_opcodes_h_l1075_c7_9be3_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1075_c7_9be3_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1075_c7_9be3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_9be3_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1075_c7_9be3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_9be3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_9be3_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_9be3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_9be3_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1075_c7_9be3_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1075_c7_9be3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1079_c11_03db_return_output,
 t16_MUX_uxn_opcodes_h_l1079_c7_966d_return_output,
 tmp16_MUX_uxn_opcodes_h_l1079_c7_966d_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1079_c7_966d_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1079_c7_966d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1079_c7_966d_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1079_c7_966d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_966d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_966d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1079_c7_966d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c7_966d_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1079_c7_966d_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1079_c7_966d_return_output,
 CONST_SL_8_uxn_opcodes_h_l1081_c3_9353_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1085_c11_2e2e_return_output,
 t16_MUX_uxn_opcodes_h_l1085_c7_6e9e_return_output,
 tmp16_MUX_uxn_opcodes_h_l1085_c7_6e9e_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1085_c7_6e9e_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1085_c7_6e9e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1085_c7_6e9e_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1085_c7_6e9e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_6e9e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_6e9e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1085_c7_6e9e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1085_c7_6e9e_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1085_c7_6e9e_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1085_c7_6e9e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1089_c11_6aa7_return_output,
 t16_MUX_uxn_opcodes_h_l1089_c7_88c5_return_output,
 tmp16_MUX_uxn_opcodes_h_l1089_c7_88c5_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1089_c7_88c5_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1089_c7_88c5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_88c5_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1089_c7_88c5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_88c5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_88c5_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_88c5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_88c5_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1089_c7_88c5_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1089_c7_88c5_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1090_c3_5926_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1093_c32_9e8c_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1093_c32_85c3_return_output,
 MUX_uxn_opcodes_h_l1093_c32_2aeb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1095_c11_5cda_return_output,
 tmp16_MUX_uxn_opcodes_h_l1095_c7_927c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1095_c7_927c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1095_c7_927c_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1095_c7_927c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1095_c7_927c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1095_c7_927c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1095_c7_927c_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1095_c7_927c_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1095_c7_927c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1101_c11_a3d0_return_output,
 tmp16_MUX_uxn_opcodes_h_l1101_c7_49dd_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1101_c7_49dd_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_49dd_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_49dd_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_49dd_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1101_c7_49dd_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1101_c7_49dd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1105_c11_d791_return_output,
 tmp16_MUX_uxn_opcodes_h_l1105_c7_0284_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1105_c7_0284_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1105_c7_0284_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1105_c7_0284_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1105_c7_0284_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1105_c7_0284_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1105_c7_0284_return_output,
 CONST_SL_8_uxn_opcodes_h_l1107_c3_ccd0_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1109_c21_f3e3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1111_c11_9241_return_output,
 tmp16_MUX_uxn_opcodes_h_l1111_c7_1154_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1111_c7_1154_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1111_c7_1154_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1111_c7_1154_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c7_1154_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1111_c7_1154_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1111_c7_1154_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1113_c21_3a4a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1115_c11_ace2_return_output,
 tmp16_MUX_uxn_opcodes_h_l1115_c7_2d8e_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1115_c7_2d8e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1115_c7_2d8e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1115_c7_2d8e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1115_c7_2d8e_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1115_c7_2d8e_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1116_c3_1305_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1122_c11_fdce_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1122_c7_f507_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1122_c7_f507_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1122_c7_f507_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1122_c7_f507_return_output,
 CONST_SR_8_uxn_opcodes_h_l1125_c34_4b57_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1127_c11_f5b0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_faac_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_faac_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c6_2789_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c6_2789_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c6_2789_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_43cf_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_43cf_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_43cf_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_43cf_iffalse : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1067_c2_c1e6_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1067_c2_c1e6_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1075_c7_9be3_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1067_c2_c1e6_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1067_c2_c1e6_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1067_c2_c1e6_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1067_c2_c1e6_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1075_c7_9be3_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1067_c2_c1e6_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1067_c2_c1e6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1067_c2_c1e6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1067_c2_c1e6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1075_c7_9be3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1067_c2_c1e6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1067_c2_c1e6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1067_c2_c1e6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1067_c2_c1e6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1075_c7_9be3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1067_c2_c1e6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1067_c2_c1e6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1067_c2_c1e6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1067_c2_c1e6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_9be3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1067_c2_c1e6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1067_c2_c1e6_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1067_c2_c1e6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1067_c2_c1e6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1075_c7_9be3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1067_c2_c1e6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1067_c2_c1e6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c2_c1e6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c2_c1e6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_9be3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c2_c1e6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c2_c1e6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1067_c2_c1e6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1067_c2_c1e6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_9be3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1067_c2_c1e6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1067_c2_c1e6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c2_c1e6_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c2_c1e6_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_9be3_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c2_c1e6_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c2_c1e6_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1067_c2_c1e6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1067_c2_c1e6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1075_c7_9be3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1067_c2_c1e6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1067_c2_c1e6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c2_c1e6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1071_c3_6a86 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c2_c1e6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_9be3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c2_c1e6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c2_c1e6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1067_c2_c1e6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1067_c2_c1e6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1067_c2_c1e6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1067_c2_c1e6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1067_c2_c1e6_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1067_c2_c1e6_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1067_c2_c1e6_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1075_c7_9be3_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1067_c2_c1e6_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1067_c2_c1e6_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1068_c3_1b18_uxn_opcodes_h_l1068_c3_1b18_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1075_c11_932a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1075_c11_932a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1075_c11_932a_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1075_c7_9be3_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1075_c7_9be3_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1079_c7_966d_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1075_c7_9be3_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1075_c7_9be3_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1075_c7_9be3_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1079_c7_966d_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1075_c7_9be3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1075_c7_9be3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1075_c7_9be3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1079_c7_966d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1075_c7_9be3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1075_c7_9be3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1075_c7_9be3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1079_c7_966d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1075_c7_9be3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_9be3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_9be3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1079_c7_966d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_9be3_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1075_c7_9be3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1075_c7_9be3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1079_c7_966d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1075_c7_9be3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_9be3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1077_c3_a7ba : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_9be3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_966d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_9be3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_9be3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_9be3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_966d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_9be3_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_9be3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_9be3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1079_c7_966d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_9be3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_9be3_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_9be3_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c7_966d_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_9be3_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1075_c7_9be3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1075_c7_9be3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1079_c7_966d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1075_c7_9be3_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1075_c7_9be3_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1075_c7_9be3_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1079_c7_966d_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1075_c7_9be3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1079_c11_03db_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1079_c11_03db_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1079_c11_03db_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1079_c7_966d_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1079_c7_966d_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1085_c7_6e9e_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1079_c7_966d_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1079_c7_966d_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1079_c7_966d_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1085_c7_6e9e_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1079_c7_966d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1079_c7_966d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1079_c7_966d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1085_c7_6e9e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1079_c7_966d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1079_c7_966d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1079_c7_966d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1085_c7_6e9e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1079_c7_966d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1079_c7_966d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1079_c7_966d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1085_c7_6e9e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1079_c7_966d_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1079_c7_966d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1079_c7_966d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1085_c7_6e9e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1079_c7_966d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_966d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1083_c3_482b : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_966d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_6e9e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_966d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_966d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_966d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_6e9e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_966d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1079_c7_966d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1079_c7_966d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1085_c7_6e9e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1079_c7_966d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c7_966d_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c7_966d_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1085_c7_6e9e_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c7_966d_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1079_c7_966d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1079_c7_966d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1085_c7_6e9e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1079_c7_966d_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1079_c7_966d_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1079_c7_966d_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1085_c7_6e9e_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1079_c7_966d_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1081_c3_9353_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1081_c3_9353_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1085_c11_2e2e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1085_c11_2e2e_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1085_c11_2e2e_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1085_c7_6e9e_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1085_c7_6e9e_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1089_c7_88c5_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1085_c7_6e9e_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1085_c7_6e9e_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1085_c7_6e9e_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1089_c7_88c5_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1085_c7_6e9e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1085_c7_6e9e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1085_c7_6e9e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1089_c7_88c5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1085_c7_6e9e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1085_c7_6e9e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1085_c7_6e9e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1089_c7_88c5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1085_c7_6e9e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1085_c7_6e9e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1085_c7_6e9e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_88c5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1085_c7_6e9e_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1085_c7_6e9e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1085_c7_6e9e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1089_c7_88c5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1085_c7_6e9e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_6e9e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1087_c3_7b18 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_6e9e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_88c5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_6e9e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_6e9e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_6e9e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_88c5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_6e9e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1085_c7_6e9e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1085_c7_6e9e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_88c5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1085_c7_6e9e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1085_c7_6e9e_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1085_c7_6e9e_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_88c5_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1085_c7_6e9e_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1085_c7_6e9e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1085_c7_6e9e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1089_c7_88c5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1085_c7_6e9e_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1085_c7_6e9e_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1085_c7_6e9e_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1089_c7_88c5_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1085_c7_6e9e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1089_c11_6aa7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1089_c11_6aa7_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1089_c11_6aa7_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1089_c7_88c5_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1089_c7_88c5_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1089_c7_88c5_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1089_c7_88c5_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1089_c7_88c5_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1095_c7_927c_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1089_c7_88c5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1089_c7_88c5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1089_c7_88c5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1095_c7_927c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1089_c7_88c5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1089_c7_88c5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1089_c7_88c5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1089_c7_88c5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1089_c7_88c5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_88c5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_88c5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1095_c7_927c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_88c5_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1089_c7_88c5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1089_c7_88c5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1095_c7_927c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1089_c7_88c5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_88c5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_88c5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1095_c7_927c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_88c5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_88c5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_88c5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1095_c7_927c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_88c5_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_88c5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_88c5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1095_c7_927c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_88c5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_88c5_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_88c5_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_88c5_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1089_c7_88c5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1089_c7_88c5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1095_c7_927c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1089_c7_88c5_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1089_c7_88c5_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1089_c7_88c5_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1095_c7_927c_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1089_c7_88c5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1090_c3_5926_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1090_c3_5926_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1090_c3_5926_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1093_c32_2aeb_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1093_c32_2aeb_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1093_c32_2aeb_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1093_c32_9e8c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1093_c32_9e8c_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1093_c32_9e8c_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1093_c32_85c3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1093_c32_85c3_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1093_c32_85c3_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1093_c32_2aeb_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1095_c11_5cda_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1095_c11_5cda_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1095_c11_5cda_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1095_c7_927c_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1095_c7_927c_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1101_c7_49dd_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1095_c7_927c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1095_c7_927c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1095_c7_927c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1101_c7_49dd_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1095_c7_927c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1095_c7_927c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1095_c7_927c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_49dd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1095_c7_927c_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1095_c7_927c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1095_c7_927c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1101_c7_49dd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1095_c7_927c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1095_c7_927c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1095_c7_927c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_49dd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1095_c7_927c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1095_c7_927c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1095_c7_927c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1095_c7_927c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1095_c7_927c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1095_c7_927c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_49dd_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1095_c7_927c_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1095_c7_927c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1095_c7_927c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1095_c7_927c_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1095_c7_927c_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1095_c7_927c_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1101_c7_49dd_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1095_c7_927c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1101_c11_a3d0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1101_c11_a3d0_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1101_c11_a3d0_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1101_c7_49dd_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1101_c7_49dd_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1105_c7_0284_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1101_c7_49dd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1101_c7_49dd_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1101_c7_49dd_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1105_c7_0284_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1101_c7_49dd_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_49dd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_49dd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1105_c7_0284_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_49dd_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_49dd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_49dd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1105_c7_0284_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_49dd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_49dd_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_49dd_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1105_c7_0284_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_49dd_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1101_c7_49dd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1101_c7_49dd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1105_c7_0284_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1101_c7_49dd_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1101_c7_49dd_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1101_c7_49dd_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1105_c7_0284_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1101_c7_49dd_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1105_c11_d791_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1105_c11_d791_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1105_c11_d791_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1105_c7_0284_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1105_c7_0284_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1111_c7_1154_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1105_c7_0284_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1105_c7_0284_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1105_c7_0284_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1111_c7_1154_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1105_c7_0284_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1105_c7_0284_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1105_c7_0284_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1111_c7_1154_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1105_c7_0284_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1105_c7_0284_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1105_c7_0284_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1111_c7_1154_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1105_c7_0284_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1105_c7_0284_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1105_c7_0284_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c7_1154_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1105_c7_0284_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1105_c7_0284_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1105_c7_0284_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1111_c7_1154_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1105_c7_0284_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1105_c7_0284_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l1109_c3_2e01 : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1105_c7_0284_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1111_c7_1154_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1105_c7_0284_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1107_c3_ccd0_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1107_c3_ccd0_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1109_c21_f3e3_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1109_c21_f3e3_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1109_c21_f3e3_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c11_9241_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c11_9241_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c11_9241_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1111_c7_1154_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1111_c7_1154_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1115_c7_2d8e_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1111_c7_1154_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1111_c7_1154_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1111_c7_1154_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1115_c7_2d8e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1111_c7_1154_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1111_c7_1154_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1111_c7_1154_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1115_c7_2d8e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1111_c7_1154_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1111_c7_1154_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1111_c7_1154_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1115_c7_2d8e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1111_c7_1154_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c7_1154_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c7_1154_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1115_c7_2d8e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c7_1154_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1111_c7_1154_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1111_c7_1154_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1115_c7_2d8e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1111_c7_1154_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1111_c7_1154_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l1113_c3_725d : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1111_c7_1154_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1111_c7_1154_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1113_c21_3a4a_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1113_c21_3a4a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1113_c21_3a4a_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1115_c11_ace2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1115_c11_ace2_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1115_c11_ace2_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1115_c7_2d8e_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1115_c7_2d8e_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1115_c7_2d8e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1115_c7_2d8e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1115_c7_2d8e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1122_c7_f507_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1115_c7_2d8e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1115_c7_2d8e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1115_c7_2d8e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1122_c7_f507_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1115_c7_2d8e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1115_c7_2d8e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1115_c7_2d8e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1122_c7_f507_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1115_c7_2d8e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1115_c7_2d8e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1119_c3_4544 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1115_c7_2d8e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1122_c7_f507_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1115_c7_2d8e_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1115_c7_2d8e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1115_c7_2d8e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1115_c7_2d8e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1116_c3_1305_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1116_c3_1305_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1116_c3_1305_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1120_c24_d832_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1122_c11_fdce_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1122_c11_fdce_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1122_c11_fdce_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1122_c7_f507_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1122_c7_f507_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_faac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1122_c7_f507_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1122_c7_f507_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1124_c3_b71b : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1122_c7_f507_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1122_c7_f507_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1122_c7_f507_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1122_c7_f507_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1122_c7_f507_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1122_c7_f507_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1122_c7_f507_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_faac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1122_c7_f507_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1125_c34_4b57_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1125_c34_4b57_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1125_c24_ccf4_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1127_c11_f5b0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1127_c11_f5b0_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1127_c11_f5b0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_faac_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_faac_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_faac_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_faac_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_faac_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_faac_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1085_l1111_l1089_l1122_l1095_l1067_l1075_l1101_l1079_l1105_DUPLICATE_4b5e_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1085_l1089_l1067_l1075_l1115_l1079_DUPLICATE_289a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1085_l1095_l1067_l1075_l1079_DUPLICATE_f0ef_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1085_l1089_l1067_l1075_l1079_DUPLICATE_e339_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1085_l1089_l1095_l1067_l1075_l1079_DUPLICATE_dbaa_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1085_l1111_l1089_l1067_l1075_l1079_DUPLICATE_88e8_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1085_l1111_l1089_l1127_l1095_l1075_l1101_l1079_l1105_DUPLICATE_8124_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1085_l1111_l1089_l1122_l1127_l1095_l1075_l1115_l1101_l1079_l1105_DUPLICATE_b135_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1090_l1080_DUPLICATE_a6e7_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1111_l1089_l1122_l1095_l1101_l1105_DUPLICATE_73fe_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1116_l1106_DUPLICATE_c418_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b1ca_uxn_opcodes_h_l1132_l1063_DUPLICATE_8b12_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_tmp16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_tmp16 := tmp16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1085_c11_2e2e_right := to_unsigned(3, 2);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1067_c2_c1e6_iftrue := to_unsigned(1, 1);
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1105_c7_0284_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1095_c11_5cda_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1122_c11_fdce_right := to_unsigned(10, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1089_c11_6aa7_right := to_unsigned(4, 3);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1085_c7_6e9e_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1105_c11_d791_right := to_unsigned(7, 3);
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1101_c7_49dd_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l1093_c32_9e8c_right := to_unsigned(128, 8);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1067_c2_c1e6_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1127_c11_f5b0_right := to_unsigned(11, 4);
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1115_c7_2d8e_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1079_c11_03db_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1115_c11_ace2_right := to_unsigned(9, 4);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_88c5_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l1093_c32_2aeb_iftrue := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1067_c2_c1e6_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1093_c32_2aeb_iffalse := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1113_c21_3a4a_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_faac_iftrue := to_unsigned(1, 1);
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1111_c7_1154_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1115_c7_2d8e_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1075_c11_932a_right := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_faac_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1122_c7_f507_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1087_c3_7b18 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_6e9e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1087_c3_7b18;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1101_c11_a3d0_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c6_2789_right := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1095_c7_927c_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1075_c7_9be3_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l1093_c32_85c3_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1124_c3_b71b := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1122_c7_f507_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1124_c3_b71b;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1071_c3_6a86 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c2_c1e6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1071_c3_6a86;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1109_c21_f3e3_right := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1067_c2_c1e6_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_43cf_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1119_c3_4544 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1115_c7_2d8e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1119_c3_4544;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c11_9241_right := to_unsigned(8, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1083_c3_482b := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_966d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1083_c3_482b;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1089_c7_88c5_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1095_c7_927c_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1079_c7_966d_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1077_c3_a7ba := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_9be3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1077_c3_a7ba;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1095_c7_927c_iftrue := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_43cf_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1093_c32_9e8c_left := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c6_2789_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1075_c11_932a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1079_c11_03db_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1085_c11_2e2e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1089_c11_6aa7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1095_c11_5cda_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1101_c11_a3d0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1105_c11_d791_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c11_9241_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1115_c11_ace2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1122_c11_fdce_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1127_c11_f5b0_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1090_c3_5926_left := t16;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1109_c21_f3e3_left := t16;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1113_c21_3a4a_left := t16;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1095_c7_927c_iftrue := t16;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1101_c7_49dd_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1067_c2_c1e6_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1075_c7_9be3_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1085_c7_6e9e_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1089_c7_88c5_iffalse := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1116_c3_1305_left := tmp16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1125_c34_4b57_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1067_c2_c1e6_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1075_c7_9be3_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1079_c7_966d_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1085_c7_6e9e_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1089_c7_88c5_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1095_c7_927c_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1101_c7_49dd_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1111_c7_1154_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1115_c7_2d8e_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l1127_c11_f5b0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1127_c11_f5b0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1127_c11_f5b0_left;
     BIN_OP_EQ_uxn_opcodes_h_l1127_c11_f5b0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1127_c11_f5b0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1127_c11_f5b0_return_output := BIN_OP_EQ_uxn_opcodes_h_l1127_c11_f5b0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1067_c6_2789] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1067_c6_2789_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c6_2789_left;
     BIN_OP_EQ_uxn_opcodes_h_l1067_c6_2789_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c6_2789_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c6_2789_return_output := BIN_OP_EQ_uxn_opcodes_h_l1067_c6_2789_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1085_l1089_l1067_l1075_l1079_DUPLICATE_e339 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1085_l1089_l1067_l1075_l1079_DUPLICATE_e339_return_output := result.sp_relative_shift;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1109_c21_f3e3] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1109_c21_f3e3_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1109_c21_f3e3_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1109_c21_f3e3_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1109_c21_f3e3_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1109_c21_f3e3_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1109_c21_f3e3_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1116_l1106_DUPLICATE_c418 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1116_l1106_DUPLICATE_c418_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1085_l1111_l1089_l1122_l1127_l1095_l1075_l1115_l1101_l1079_l1105_DUPLICATE_b135 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1085_l1111_l1089_l1122_l1127_l1095_l1075_l1115_l1101_l1079_l1105_DUPLICATE_b135_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1111_l1089_l1122_l1095_l1101_l1105_DUPLICATE_73fe LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1111_l1089_l1122_l1095_l1101_l1105_DUPLICATE_73fe_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1079_c11_03db] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1079_c11_03db_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1079_c11_03db_left;
     BIN_OP_EQ_uxn_opcodes_h_l1079_c11_03db_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1079_c11_03db_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1079_c11_03db_return_output := BIN_OP_EQ_uxn_opcodes_h_l1079_c11_03db_return_output;

     -- result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d[uxn_opcodes_h_l1089_c7_88c5] LATENCY=0
     VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1089_c7_88c5_return_output := result.is_stack_read;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1090_l1080_DUPLICATE_a6e7 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1090_l1080_DUPLICATE_a6e7_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1122_c11_fdce] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1122_c11_fdce_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1122_c11_fdce_left;
     BIN_OP_EQ_uxn_opcodes_h_l1122_c11_fdce_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1122_c11_fdce_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1122_c11_fdce_return_output := BIN_OP_EQ_uxn_opcodes_h_l1122_c11_fdce_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l1125_c34_4b57] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1125_c34_4b57_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1125_c34_4b57_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1125_c34_4b57_return_output := CONST_SR_8_uxn_opcodes_h_l1125_c34_4b57_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1095_c11_5cda] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1095_c11_5cda_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1095_c11_5cda_left;
     BIN_OP_EQ_uxn_opcodes_h_l1095_c11_5cda_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1095_c11_5cda_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1095_c11_5cda_return_output := BIN_OP_EQ_uxn_opcodes_h_l1095_c11_5cda_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1075_c11_932a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1075_c11_932a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1075_c11_932a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1075_c11_932a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1075_c11_932a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1075_c11_932a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1075_c11_932a_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1067_c2_c1e6] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1067_c2_c1e6_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1085_l1089_l1095_l1067_l1075_l1079_DUPLICATE_dbaa LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1085_l1089_l1095_l1067_l1075_l1079_DUPLICATE_dbaa_return_output := result.is_ram_write;

     -- CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1085_l1111_l1089_l1067_l1075_l1079_DUPLICATE_88e8 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1085_l1111_l1089_l1067_l1075_l1079_DUPLICATE_88e8_return_output := result.ram_addr;

     -- BIN_OP_EQ[uxn_opcodes_h_l1105_c11_d791] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1105_c11_d791_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1105_c11_d791_left;
     BIN_OP_EQ_uxn_opcodes_h_l1105_c11_d791_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1105_c11_d791_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1105_c11_d791_return_output := BIN_OP_EQ_uxn_opcodes_h_l1105_c11_d791_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1101_c11_a3d0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1101_c11_a3d0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1101_c11_a3d0_left;
     BIN_OP_EQ_uxn_opcodes_h_l1101_c11_a3d0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1101_c11_a3d0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1101_c11_a3d0_return_output := BIN_OP_EQ_uxn_opcodes_h_l1101_c11_a3d0_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1113_c21_3a4a] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1113_c21_3a4a_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1113_c21_3a4a_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1113_c21_3a4a_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1113_c21_3a4a_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1113_c21_3a4a_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1113_c21_3a4a_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1085_l1089_l1067_l1075_l1115_l1079_DUPLICATE_289a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1085_l1089_l1067_l1075_l1115_l1079_DUPLICATE_289a_return_output := result.is_ram_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l1085_c11_2e2e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1085_c11_2e2e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1085_c11_2e2e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1085_c11_2e2e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1085_c11_2e2e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1085_c11_2e2e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1085_c11_2e2e_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l1093_c32_9e8c] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1093_c32_9e8c_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1093_c32_9e8c_left;
     BIN_OP_AND_uxn_opcodes_h_l1093_c32_9e8c_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1093_c32_9e8c_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1093_c32_9e8c_return_output := BIN_OP_AND_uxn_opcodes_h_l1093_c32_9e8c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1089_c11_6aa7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1089_c11_6aa7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1089_c11_6aa7_left;
     BIN_OP_EQ_uxn_opcodes_h_l1089_c11_6aa7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1089_c11_6aa7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1089_c11_6aa7_return_output := BIN_OP_EQ_uxn_opcodes_h_l1089_c11_6aa7_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1085_l1111_l1089_l1122_l1095_l1067_l1075_l1101_l1079_l1105_DUPLICATE_4b5e LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1085_l1111_l1089_l1122_l1095_l1067_l1075_l1101_l1079_l1105_DUPLICATE_4b5e_return_output := result.stack_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1085_l1111_l1089_l1127_l1095_l1075_l1101_l1079_l1105_DUPLICATE_8124 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1085_l1111_l1089_l1127_l1095_l1075_l1101_l1079_l1105_DUPLICATE_8124_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1085_l1095_l1067_l1075_l1079_DUPLICATE_f0ef LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1085_l1095_l1067_l1075_l1079_DUPLICATE_f0ef_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1111_c11_9241] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1111_c11_9241_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c11_9241_left;
     BIN_OP_EQ_uxn_opcodes_h_l1111_c11_9241_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c11_9241_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c11_9241_return_output := BIN_OP_EQ_uxn_opcodes_h_l1111_c11_9241_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1115_c11_ace2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1115_c11_ace2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1115_c11_ace2_left;
     BIN_OP_EQ_uxn_opcodes_h_l1115_c11_ace2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1115_c11_ace2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1115_c11_ace2_return_output := BIN_OP_EQ_uxn_opcodes_h_l1115_c11_ace2_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1093_c32_85c3_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1093_c32_9e8c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_43cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c6_2789_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1067_c2_c1e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c6_2789_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1067_c2_c1e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c6_2789_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1067_c2_c1e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c6_2789_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c2_c1e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c6_2789_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1067_c2_c1e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c6_2789_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1067_c2_c1e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c6_2789_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1067_c2_c1e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c6_2789_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1067_c2_c1e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c6_2789_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c2_c1e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c6_2789_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c2_c1e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c6_2789_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1067_c2_c1e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c6_2789_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1067_c2_c1e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c6_2789_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1067_c2_c1e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c6_2789_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_9be3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1075_c11_932a_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1075_c7_9be3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1075_c11_932a_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1075_c7_9be3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1075_c11_932a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_9be3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1075_c11_932a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1075_c7_9be3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1075_c11_932a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_9be3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1075_c11_932a_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1075_c7_9be3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1075_c11_932a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_9be3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1075_c11_932a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_9be3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1075_c11_932a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1075_c7_9be3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1075_c11_932a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1075_c7_9be3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1075_c11_932a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1075_c7_9be3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1075_c11_932a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_966d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1079_c11_03db_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1079_c7_966d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1079_c11_03db_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1079_c7_966d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1079_c11_03db_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1079_c7_966d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1079_c11_03db_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1079_c7_966d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1079_c11_03db_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1079_c7_966d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1079_c11_03db_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1079_c7_966d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1079_c11_03db_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c7_966d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1079_c11_03db_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_966d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1079_c11_03db_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1079_c7_966d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1079_c11_03db_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1079_c7_966d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1079_c11_03db_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1079_c7_966d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1079_c11_03db_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_6e9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1085_c11_2e2e_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1085_c7_6e9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1085_c11_2e2e_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1085_c7_6e9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1085_c11_2e2e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1085_c7_6e9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1085_c11_2e2e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1085_c7_6e9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1085_c11_2e2e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1085_c7_6e9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1085_c11_2e2e_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1085_c7_6e9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1085_c11_2e2e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1085_c7_6e9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1085_c11_2e2e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_6e9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1085_c11_2e2e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1085_c7_6e9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1085_c11_2e2e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1085_c7_6e9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1085_c11_2e2e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1085_c7_6e9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1085_c11_2e2e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_88c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1089_c11_6aa7_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1089_c7_88c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1089_c11_6aa7_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1089_c7_88c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1089_c11_6aa7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_88c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1089_c11_6aa7_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1089_c7_88c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1089_c11_6aa7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_88c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1089_c11_6aa7_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1089_c7_88c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1089_c11_6aa7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_88c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1089_c11_6aa7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_88c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1089_c11_6aa7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1089_c7_88c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1089_c11_6aa7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1089_c7_88c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1089_c11_6aa7_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1089_c7_88c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1089_c11_6aa7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1095_c7_927c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1095_c11_5cda_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1095_c7_927c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1095_c11_5cda_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1095_c7_927c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1095_c11_5cda_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1095_c7_927c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1095_c11_5cda_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1095_c7_927c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1095_c11_5cda_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1095_c7_927c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1095_c11_5cda_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1095_c7_927c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1095_c11_5cda_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1095_c7_927c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1095_c11_5cda_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1095_c7_927c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1095_c11_5cda_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_49dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1101_c11_a3d0_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1101_c7_49dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1101_c11_a3d0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_49dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1101_c11_a3d0_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1101_c7_49dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1101_c11_a3d0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_49dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1101_c11_a3d0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1101_c7_49dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1101_c11_a3d0_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1101_c7_49dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1101_c11_a3d0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1105_c7_0284_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1105_c11_d791_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1105_c7_0284_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1105_c11_d791_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1105_c7_0284_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1105_c11_d791_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1105_c7_0284_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1105_c11_d791_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1105_c7_0284_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1105_c11_d791_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1105_c7_0284_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1105_c11_d791_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1105_c7_0284_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1105_c11_d791_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1111_c7_1154_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c11_9241_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1111_c7_1154_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c11_9241_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1111_c7_1154_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c11_9241_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1111_c7_1154_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c11_9241_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c7_1154_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c11_9241_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1111_c7_1154_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c11_9241_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1111_c7_1154_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c11_9241_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1115_c7_2d8e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1115_c11_ace2_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1115_c7_2d8e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1115_c11_ace2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1115_c7_2d8e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1115_c11_ace2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1115_c7_2d8e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1115_c11_ace2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1115_c7_2d8e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1115_c11_ace2_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1115_c7_2d8e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1115_c11_ace2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1122_c7_f507_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1122_c11_fdce_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1122_c7_f507_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1122_c11_fdce_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1122_c7_f507_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1122_c11_fdce_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1122_c7_f507_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1122_c11_fdce_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_faac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1127_c11_f5b0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_faac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1127_c11_f5b0_return_output;
     VAR_result_ram_addr_uxn_opcodes_h_l1109_c3_2e01 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1109_c21_f3e3_return_output, 16);
     VAR_result_ram_addr_uxn_opcodes_h_l1113_c3_725d := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1113_c21_3a4a_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l1090_c3_5926_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1090_l1080_DUPLICATE_a6e7_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1081_c3_9353_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1090_l1080_DUPLICATE_a6e7_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1116_c3_1305_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1116_l1106_DUPLICATE_c418_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1107_c3_ccd0_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1116_l1106_DUPLICATE_c418_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c2_c1e6_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1085_l1089_l1067_l1075_l1079_DUPLICATE_e339_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_9be3_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1085_l1089_l1067_l1075_l1079_DUPLICATE_e339_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c7_966d_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1085_l1089_l1067_l1075_l1079_DUPLICATE_e339_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1085_c7_6e9e_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1085_l1089_l1067_l1075_l1079_DUPLICATE_e339_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_88c5_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1085_l1089_l1067_l1075_l1079_DUPLICATE_e339_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1067_c2_c1e6_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1085_l1111_l1089_l1067_l1075_l1079_DUPLICATE_88e8_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1075_c7_9be3_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1085_l1111_l1089_l1067_l1075_l1079_DUPLICATE_88e8_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1079_c7_966d_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1085_l1111_l1089_l1067_l1075_l1079_DUPLICATE_88e8_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1085_c7_6e9e_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1085_l1111_l1089_l1067_l1075_l1079_DUPLICATE_88e8_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1089_c7_88c5_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1085_l1111_l1089_l1067_l1075_l1079_DUPLICATE_88e8_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1111_c7_1154_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1085_l1111_l1089_l1067_l1075_l1079_DUPLICATE_88e8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_9be3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1085_l1111_l1089_l1122_l1127_l1095_l1075_l1115_l1101_l1079_l1105_DUPLICATE_b135_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_966d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1085_l1111_l1089_l1122_l1127_l1095_l1075_l1115_l1101_l1079_l1105_DUPLICATE_b135_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_6e9e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1085_l1111_l1089_l1122_l1127_l1095_l1075_l1115_l1101_l1079_l1105_DUPLICATE_b135_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_88c5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1085_l1111_l1089_l1122_l1127_l1095_l1075_l1115_l1101_l1079_l1105_DUPLICATE_b135_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1095_c7_927c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1085_l1111_l1089_l1122_l1127_l1095_l1075_l1115_l1101_l1079_l1105_DUPLICATE_b135_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_49dd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1085_l1111_l1089_l1122_l1127_l1095_l1075_l1115_l1101_l1079_l1105_DUPLICATE_b135_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1105_c7_0284_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1085_l1111_l1089_l1122_l1127_l1095_l1075_l1115_l1101_l1079_l1105_DUPLICATE_b135_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1111_c7_1154_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1085_l1111_l1089_l1122_l1127_l1095_l1075_l1115_l1101_l1079_l1105_DUPLICATE_b135_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1115_c7_2d8e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1085_l1111_l1089_l1122_l1127_l1095_l1075_l1115_l1101_l1079_l1105_DUPLICATE_b135_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1122_c7_f507_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1085_l1111_l1089_l1122_l1127_l1095_l1075_l1115_l1101_l1079_l1105_DUPLICATE_b135_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_faac_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1085_l1111_l1089_l1122_l1127_l1095_l1075_l1115_l1101_l1079_l1105_DUPLICATE_b135_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1067_c2_c1e6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1085_l1089_l1067_l1075_l1115_l1079_DUPLICATE_289a_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1075_c7_9be3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1085_l1089_l1067_l1075_l1115_l1079_DUPLICATE_289a_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1079_c7_966d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1085_l1089_l1067_l1075_l1115_l1079_DUPLICATE_289a_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1085_c7_6e9e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1085_l1089_l1067_l1075_l1115_l1079_DUPLICATE_289a_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1089_c7_88c5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1085_l1089_l1067_l1075_l1115_l1079_DUPLICATE_289a_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1115_c7_2d8e_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1085_l1089_l1067_l1075_l1115_l1079_DUPLICATE_289a_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1067_c2_c1e6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1085_l1089_l1095_l1067_l1075_l1079_DUPLICATE_dbaa_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1075_c7_9be3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1085_l1089_l1095_l1067_l1075_l1079_DUPLICATE_dbaa_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1079_c7_966d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1085_l1089_l1095_l1067_l1075_l1079_DUPLICATE_dbaa_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1085_c7_6e9e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1085_l1089_l1095_l1067_l1075_l1079_DUPLICATE_dbaa_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1089_c7_88c5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1085_l1089_l1095_l1067_l1075_l1079_DUPLICATE_dbaa_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1095_c7_927c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1085_l1089_l1095_l1067_l1075_l1079_DUPLICATE_dbaa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c2_c1e6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1085_l1095_l1067_l1075_l1079_DUPLICATE_f0ef_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_9be3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1085_l1095_l1067_l1075_l1079_DUPLICATE_f0ef_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1079_c7_966d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1085_l1095_l1067_l1075_l1079_DUPLICATE_f0ef_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1085_c7_6e9e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1085_l1095_l1067_l1075_l1079_DUPLICATE_f0ef_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1095_c7_927c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1085_l1095_l1067_l1075_l1079_DUPLICATE_f0ef_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_9be3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1085_l1111_l1089_l1127_l1095_l1075_l1101_l1079_l1105_DUPLICATE_8124_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1079_c7_966d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1085_l1111_l1089_l1127_l1095_l1075_l1101_l1079_l1105_DUPLICATE_8124_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1085_c7_6e9e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1085_l1111_l1089_l1127_l1095_l1075_l1101_l1079_l1105_DUPLICATE_8124_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_88c5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1085_l1111_l1089_l1127_l1095_l1075_l1101_l1079_l1105_DUPLICATE_8124_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1095_c7_927c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1085_l1111_l1089_l1127_l1095_l1075_l1101_l1079_l1105_DUPLICATE_8124_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_49dd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1085_l1111_l1089_l1127_l1095_l1075_l1101_l1079_l1105_DUPLICATE_8124_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1105_c7_0284_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1085_l1111_l1089_l1127_l1095_l1075_l1101_l1079_l1105_DUPLICATE_8124_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1111_c7_1154_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1085_l1111_l1089_l1127_l1095_l1075_l1101_l1079_l1105_DUPLICATE_8124_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_faac_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1085_l1111_l1089_l1127_l1095_l1075_l1101_l1079_l1105_DUPLICATE_8124_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_88c5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1111_l1089_l1122_l1095_l1101_l1105_DUPLICATE_73fe_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1095_c7_927c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1111_l1089_l1122_l1095_l1101_l1105_DUPLICATE_73fe_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_49dd_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1111_l1089_l1122_l1095_l1101_l1105_DUPLICATE_73fe_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1105_c7_0284_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1111_l1089_l1122_l1095_l1101_l1105_DUPLICATE_73fe_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c7_1154_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1111_l1089_l1122_l1095_l1101_l1105_DUPLICATE_73fe_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1122_c7_f507_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1111_l1089_l1122_l1095_l1101_l1105_DUPLICATE_73fe_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1067_c2_c1e6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1085_l1111_l1089_l1122_l1095_l1067_l1075_l1101_l1079_l1105_DUPLICATE_4b5e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1075_c7_9be3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1085_l1111_l1089_l1122_l1095_l1067_l1075_l1101_l1079_l1105_DUPLICATE_4b5e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1079_c7_966d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1085_l1111_l1089_l1122_l1095_l1067_l1075_l1101_l1079_l1105_DUPLICATE_4b5e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1085_c7_6e9e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1085_l1111_l1089_l1122_l1095_l1067_l1075_l1101_l1079_l1105_DUPLICATE_4b5e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1089_c7_88c5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1085_l1111_l1089_l1122_l1095_l1067_l1075_l1101_l1079_l1105_DUPLICATE_4b5e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1095_c7_927c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1085_l1111_l1089_l1122_l1095_l1067_l1075_l1101_l1079_l1105_DUPLICATE_4b5e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1101_c7_49dd_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1085_l1111_l1089_l1122_l1095_l1067_l1075_l1101_l1079_l1105_DUPLICATE_4b5e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1105_c7_0284_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1085_l1111_l1089_l1122_l1095_l1067_l1075_l1101_l1079_l1105_DUPLICATE_4b5e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1111_c7_1154_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1085_l1111_l1089_l1122_l1095_l1067_l1075_l1101_l1079_l1105_DUPLICATE_4b5e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1122_c7_f507_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1085_l1111_l1089_l1122_l1095_l1067_l1075_l1101_l1079_l1105_DUPLICATE_4b5e_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1067_c2_c1e6_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1067_c2_c1e6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1089_c7_88c5_iffalse := VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1089_c7_88c5_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1105_c7_0284_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l1109_c3_2e01;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1111_c7_1154_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l1113_c3_725d;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1095_c7_927c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1095_c7_927c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1095_c7_927c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1095_c7_927c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1095_c7_927c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1095_c7_927c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1095_c7_927c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1095_c7_927c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1095_c7_927c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1127_c7_faac] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_faac_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_faac_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_faac_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_faac_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_faac_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_faac_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_faac_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_faac_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1093_c32_85c3] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1093_c32_85c3_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1093_c32_85c3_left;
     BIN_OP_GT_uxn_opcodes_h_l1093_c32_85c3_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1093_c32_85c3_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1093_c32_85c3_return_output := BIN_OP_GT_uxn_opcodes_h_l1093_c32_85c3_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l1107_c3_ccd0] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1107_c3_ccd0_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1107_c3_ccd0_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1107_c3_ccd0_return_output := CONST_SL_8_uxn_opcodes_h_l1107_c3_ccd0_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1090_c3_5926] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1090_c3_5926_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1090_c3_5926_left;
     BIN_OP_OR_uxn_opcodes_h_l1090_c3_5926_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1090_c3_5926_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1090_c3_5926_return_output := BIN_OP_OR_uxn_opcodes_h_l1090_c3_5926_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1116_c3_1305] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1116_c3_1305_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1116_c3_1305_left;
     BIN_OP_OR_uxn_opcodes_h_l1116_c3_1305_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1116_c3_1305_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1116_c3_1305_return_output := BIN_OP_OR_uxn_opcodes_h_l1116_c3_1305_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l1081_c3_9353] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1081_c3_9353_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1081_c3_9353_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1081_c3_9353_return_output := CONST_SL_8_uxn_opcodes_h_l1081_c3_9353_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1089_c7_88c5] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1089_c7_88c5_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1089_c7_88c5_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1089_c7_88c5_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1089_c7_88c5_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1089_c7_88c5_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1089_c7_88c5_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1089_c7_88c5_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1089_c7_88c5_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1067_c1_43cf] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_43cf_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_43cf_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_43cf_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_43cf_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_43cf_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_43cf_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_43cf_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_43cf_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1111_c7_1154] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1111_c7_1154_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1111_c7_1154_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1111_c7_1154_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1111_c7_1154_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1111_c7_1154_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1111_c7_1154_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1111_c7_1154_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1111_c7_1154_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1127_c7_faac] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_faac_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_faac_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_faac_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_faac_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_faac_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_faac_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_faac_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_faac_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1095_c7_927c] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1095_c7_927c_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1095_c7_927c_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1095_c7_927c_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1095_c7_927c_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1095_c7_927c_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1095_c7_927c_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1095_c7_927c_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1095_c7_927c_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1125_c24_ccf4] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1125_c24_ccf4_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1125_c34_4b57_return_output);

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1115_c7_2d8e] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1115_c7_2d8e_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1115_c7_2d8e_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1115_c7_2d8e_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1115_c7_2d8e_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1115_c7_2d8e_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1115_c7_2d8e_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1115_c7_2d8e_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1115_c7_2d8e_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1067_c2_c1e6] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1067_c2_c1e6_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1067_c2_c1e6_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1067_c2_c1e6_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1067_c2_c1e6_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1067_c2_c1e6_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1067_c2_c1e6_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1067_c2_c1e6_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1067_c2_c1e6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1122_c7_f507] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1122_c7_f507_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1122_c7_f507_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1122_c7_f507_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1122_c7_f507_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1122_c7_f507_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1122_c7_f507_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1122_c7_f507_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1122_c7_f507_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1093_c32_2aeb_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1093_c32_85c3_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1089_c7_88c5_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1090_c3_5926_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1115_c7_2d8e_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1116_c3_1305_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1122_c7_f507_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1125_c24_ccf4_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1079_c7_966d_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1081_c3_9353_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1105_c7_0284_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1107_c3_ccd0_return_output;
     VAR_printf_uxn_opcodes_h_l1068_c3_1b18_uxn_opcodes_h_l1068_c3_1b18_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_43cf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1122_c7_f507_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_faac_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1111_c7_1154_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1115_c7_2d8e_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1089_c7_88c5_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1095_c7_927c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_88c5_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1095_c7_927c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1085_c7_6e9e_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1089_c7_88c5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1122_c7_f507_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_faac_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1105_c7_0284_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1111_c7_1154_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1115_c7_2d8e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1122_c7_f507_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1122_c7_f507] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1122_c7_f507_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1122_c7_f507_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1122_c7_f507_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1122_c7_f507_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1122_c7_f507_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1122_c7_f507_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1122_c7_f507_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1122_c7_f507_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1115_c7_2d8e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1115_c7_2d8e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1115_c7_2d8e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1115_c7_2d8e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1115_c7_2d8e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1115_c7_2d8e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1115_c7_2d8e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1115_c7_2d8e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1115_c7_2d8e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1089_c7_88c5] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_88c5_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_88c5_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_88c5_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_88c5_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_88c5_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_88c5_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_88c5_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_88c5_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1089_c7_88c5] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1089_c7_88c5_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1089_c7_88c5_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1089_c7_88c5_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1089_c7_88c5_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1089_c7_88c5_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1089_c7_88c5_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1089_c7_88c5_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1089_c7_88c5_return_output;

     -- MUX[uxn_opcodes_h_l1093_c32_2aeb] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1093_c32_2aeb_cond <= VAR_MUX_uxn_opcodes_h_l1093_c32_2aeb_cond;
     MUX_uxn_opcodes_h_l1093_c32_2aeb_iftrue <= VAR_MUX_uxn_opcodes_h_l1093_c32_2aeb_iftrue;
     MUX_uxn_opcodes_h_l1093_c32_2aeb_iffalse <= VAR_MUX_uxn_opcodes_h_l1093_c32_2aeb_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1093_c32_2aeb_return_output := MUX_uxn_opcodes_h_l1093_c32_2aeb_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1120_c24_d832] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1120_c24_d832_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_OR_uxn_opcodes_h_l1116_c3_1305_return_output);

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1111_c7_1154] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1111_c7_1154_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1111_c7_1154_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1111_c7_1154_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1111_c7_1154_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1111_c7_1154_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1111_c7_1154_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1111_c7_1154_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1111_c7_1154_return_output;

     -- printf_uxn_opcodes_h_l1068_c3_1b18[uxn_opcodes_h_l1068_c3_1b18] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1068_c3_1b18_uxn_opcodes_h_l1068_c3_1b18_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1068_c3_1b18_uxn_opcodes_h_l1068_c3_1b18_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1085_c7_6e9e] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1085_c7_6e9e_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1085_c7_6e9e_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1085_c7_6e9e_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1085_c7_6e9e_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1085_c7_6e9e_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1085_c7_6e9e_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1085_c7_6e9e_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1085_c7_6e9e_return_output;

     -- t16_MUX[uxn_opcodes_h_l1089_c7_88c5] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1089_c7_88c5_cond <= VAR_t16_MUX_uxn_opcodes_h_l1089_c7_88c5_cond;
     t16_MUX_uxn_opcodes_h_l1089_c7_88c5_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1089_c7_88c5_iftrue;
     t16_MUX_uxn_opcodes_h_l1089_c7_88c5_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1089_c7_88c5_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1089_c7_88c5_return_output := t16_MUX_uxn_opcodes_h_l1089_c7_88c5_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1122_c7_f507] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1122_c7_f507_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1122_c7_f507_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1122_c7_f507_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1122_c7_f507_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1122_c7_f507_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1122_c7_f507_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1122_c7_f507_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1122_c7_f507_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1115_c7_2d8e] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1115_c7_2d8e_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1115_c7_2d8e_cond;
     tmp16_MUX_uxn_opcodes_h_l1115_c7_2d8e_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1115_c7_2d8e_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1115_c7_2d8e_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1115_c7_2d8e_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1115_c7_2d8e_return_output := tmp16_MUX_uxn_opcodes_h_l1115_c7_2d8e_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1105_c7_0284] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1105_c7_0284_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1105_c7_0284_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1105_c7_0284_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1105_c7_0284_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1105_c7_0284_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1105_c7_0284_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1105_c7_0284_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1105_c7_0284_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1122_c7_f507] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1122_c7_f507_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1122_c7_f507_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1122_c7_f507_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1122_c7_f507_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1122_c7_f507_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1122_c7_f507_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1122_c7_f507_return_output := result_stack_value_MUX_uxn_opcodes_h_l1122_c7_f507_return_output;

     -- Submodule level 3
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1115_c7_2d8e_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1120_c24_d832_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_88c5_iftrue := VAR_MUX_uxn_opcodes_h_l1093_c32_2aeb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1115_c7_2d8e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1122_c7_f507_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1105_c7_0284_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1111_c7_1154_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1085_c7_6e9e_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1089_c7_88c5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1085_c7_6e9e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_88c5_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1079_c7_966d_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1085_c7_6e9e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1115_c7_2d8e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1122_c7_f507_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1101_c7_49dd_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1105_c7_0284_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c7_1154_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1115_c7_2d8e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1115_c7_2d8e_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1122_c7_f507_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1085_c7_6e9e_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1089_c7_88c5_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1111_c7_1154_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1115_c7_2d8e_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l1085_c7_6e9e] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1085_c7_6e9e_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1085_c7_6e9e_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1085_c7_6e9e_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1085_c7_6e9e_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1085_c7_6e9e_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1085_c7_6e9e_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1085_c7_6e9e_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1085_c7_6e9e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1085_c7_6e9e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1085_c7_6e9e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1085_c7_6e9e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1085_c7_6e9e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1085_c7_6e9e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1085_c7_6e9e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1085_c7_6e9e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1085_c7_6e9e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1085_c7_6e9e_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1111_c7_1154] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1111_c7_1154_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1111_c7_1154_cond;
     tmp16_MUX_uxn_opcodes_h_l1111_c7_1154_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1111_c7_1154_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1111_c7_1154_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1111_c7_1154_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1111_c7_1154_return_output := tmp16_MUX_uxn_opcodes_h_l1111_c7_1154_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1079_c7_966d] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1079_c7_966d_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1079_c7_966d_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1079_c7_966d_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1079_c7_966d_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1079_c7_966d_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1079_c7_966d_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1079_c7_966d_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1079_c7_966d_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1105_c7_0284] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1105_c7_0284_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1105_c7_0284_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1105_c7_0284_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1105_c7_0284_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1105_c7_0284_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1105_c7_0284_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1105_c7_0284_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1105_c7_0284_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1115_c7_2d8e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1115_c7_2d8e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1115_c7_2d8e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1115_c7_2d8e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1115_c7_2d8e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1115_c7_2d8e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1115_c7_2d8e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1115_c7_2d8e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1115_c7_2d8e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1089_c7_88c5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_88c5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_88c5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_88c5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_88c5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_88c5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_88c5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_88c5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_88c5_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1115_c7_2d8e] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1115_c7_2d8e_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1115_c7_2d8e_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1115_c7_2d8e_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1115_c7_2d8e_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1115_c7_2d8e_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1115_c7_2d8e_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1115_c7_2d8e_return_output := result_stack_value_MUX_uxn_opcodes_h_l1115_c7_2d8e_return_output;

     -- t16_MUX[uxn_opcodes_h_l1085_c7_6e9e] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1085_c7_6e9e_cond <= VAR_t16_MUX_uxn_opcodes_h_l1085_c7_6e9e_cond;
     t16_MUX_uxn_opcodes_h_l1085_c7_6e9e_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1085_c7_6e9e_iftrue;
     t16_MUX_uxn_opcodes_h_l1085_c7_6e9e_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1085_c7_6e9e_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1085_c7_6e9e_return_output := t16_MUX_uxn_opcodes_h_l1085_c7_6e9e_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1101_c7_49dd] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1101_c7_49dd_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1101_c7_49dd_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1101_c7_49dd_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1101_c7_49dd_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1101_c7_49dd_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1101_c7_49dd_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1101_c7_49dd_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1101_c7_49dd_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1111_c7_1154] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c7_1154_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c7_1154_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c7_1154_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c7_1154_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c7_1154_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c7_1154_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c7_1154_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c7_1154_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1115_c7_2d8e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1115_c7_2d8e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1115_c7_2d8e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1115_c7_2d8e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1115_c7_2d8e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1115_c7_2d8e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1115_c7_2d8e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1115_c7_2d8e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1115_c7_2d8e_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1111_c7_1154_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1115_c7_2d8e_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1101_c7_49dd_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1105_c7_0284_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1079_c7_966d_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1085_c7_6e9e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1079_c7_966d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1085_c7_6e9e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1075_c7_9be3_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1079_c7_966d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1111_c7_1154_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1115_c7_2d8e_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1095_c7_927c_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1101_c7_49dd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1085_c7_6e9e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_88c5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1105_c7_0284_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c7_1154_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1111_c7_1154_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1115_c7_2d8e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1079_c7_966d_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1085_c7_6e9e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1105_c7_0284_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1111_c7_1154_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1111_c7_1154] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1111_c7_1154_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1111_c7_1154_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1111_c7_1154_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1111_c7_1154_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1111_c7_1154_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1111_c7_1154_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1111_c7_1154_return_output := result_stack_value_MUX_uxn_opcodes_h_l1111_c7_1154_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1101_c7_49dd] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1101_c7_49dd_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1101_c7_49dd_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1101_c7_49dd_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1101_c7_49dd_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1101_c7_49dd_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1101_c7_49dd_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1101_c7_49dd_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1101_c7_49dd_return_output;

     -- t16_MUX[uxn_opcodes_h_l1079_c7_966d] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1079_c7_966d_cond <= VAR_t16_MUX_uxn_opcodes_h_l1079_c7_966d_cond;
     t16_MUX_uxn_opcodes_h_l1079_c7_966d_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1079_c7_966d_iftrue;
     t16_MUX_uxn_opcodes_h_l1079_c7_966d_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1079_c7_966d_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1079_c7_966d_return_output := t16_MUX_uxn_opcodes_h_l1079_c7_966d_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1079_c7_966d] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1079_c7_966d_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1079_c7_966d_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1079_c7_966d_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1079_c7_966d_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1079_c7_966d_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1079_c7_966d_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1079_c7_966d_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1079_c7_966d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1085_c7_6e9e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1085_c7_6e9e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1085_c7_6e9e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1085_c7_6e9e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1085_c7_6e9e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1085_c7_6e9e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1085_c7_6e9e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1085_c7_6e9e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1085_c7_6e9e_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1095_c7_927c] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1095_c7_927c_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1095_c7_927c_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1095_c7_927c_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1095_c7_927c_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1095_c7_927c_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1095_c7_927c_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1095_c7_927c_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1095_c7_927c_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1075_c7_9be3] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1075_c7_9be3_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1075_c7_9be3_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1075_c7_9be3_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1075_c7_9be3_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1075_c7_9be3_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1075_c7_9be3_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1075_c7_9be3_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1075_c7_9be3_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1079_c7_966d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1079_c7_966d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1079_c7_966d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1079_c7_966d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1079_c7_966d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1079_c7_966d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1079_c7_966d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1079_c7_966d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1079_c7_966d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1105_c7_0284] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1105_c7_0284_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1105_c7_0284_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1105_c7_0284_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1105_c7_0284_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1105_c7_0284_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1105_c7_0284_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1105_c7_0284_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1105_c7_0284_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1111_c7_1154] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1111_c7_1154_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1111_c7_1154_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1111_c7_1154_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1111_c7_1154_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1111_c7_1154_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1111_c7_1154_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1111_c7_1154_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1111_c7_1154_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1111_c7_1154] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1111_c7_1154_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1111_c7_1154_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1111_c7_1154_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1111_c7_1154_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1111_c7_1154_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1111_c7_1154_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1111_c7_1154_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1111_c7_1154_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1105_c7_0284] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1105_c7_0284_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1105_c7_0284_cond;
     tmp16_MUX_uxn_opcodes_h_l1105_c7_0284_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1105_c7_0284_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1105_c7_0284_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1105_c7_0284_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1105_c7_0284_return_output := tmp16_MUX_uxn_opcodes_h_l1105_c7_0284_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1105_c7_0284_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1111_c7_1154_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1095_c7_927c_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1101_c7_49dd_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1075_c7_9be3_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1079_c7_966d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_9be3_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1079_c7_966d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1067_c2_c1e6_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1075_c7_9be3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1105_c7_0284_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1111_c7_1154_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1089_c7_88c5_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1095_c7_927c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c7_966d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1085_c7_6e9e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_49dd_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1105_c7_0284_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1105_c7_0284_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1111_c7_1154_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1075_c7_9be3_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1079_c7_966d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1101_c7_49dd_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1105_c7_0284_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1105_c7_0284] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1105_c7_0284_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1105_c7_0284_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1105_c7_0284_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1105_c7_0284_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1105_c7_0284_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1105_c7_0284_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1105_c7_0284_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1105_c7_0284_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1075_c7_9be3] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1075_c7_9be3_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1075_c7_9be3_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1075_c7_9be3_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1075_c7_9be3_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1075_c7_9be3_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1075_c7_9be3_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1075_c7_9be3_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1075_c7_9be3_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1067_c2_c1e6] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1067_c2_c1e6_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1067_c2_c1e6_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1067_c2_c1e6_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1067_c2_c1e6_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1067_c2_c1e6_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1067_c2_c1e6_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1067_c2_c1e6_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1067_c2_c1e6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1101_c7_49dd] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_49dd_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_49dd_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_49dd_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_49dd_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_49dd_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_49dd_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_49dd_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_49dd_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1105_c7_0284] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1105_c7_0284_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1105_c7_0284_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1105_c7_0284_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1105_c7_0284_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1105_c7_0284_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1105_c7_0284_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1105_c7_0284_return_output := result_stack_value_MUX_uxn_opcodes_h_l1105_c7_0284_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1075_c7_9be3] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_9be3_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_9be3_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_9be3_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_9be3_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_9be3_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_9be3_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_9be3_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_9be3_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1089_c7_88c5] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1089_c7_88c5_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1089_c7_88c5_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1089_c7_88c5_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1089_c7_88c5_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1089_c7_88c5_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1089_c7_88c5_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1089_c7_88c5_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1089_c7_88c5_return_output;

     -- t16_MUX[uxn_opcodes_h_l1075_c7_9be3] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1075_c7_9be3_cond <= VAR_t16_MUX_uxn_opcodes_h_l1075_c7_9be3_cond;
     t16_MUX_uxn_opcodes_h_l1075_c7_9be3_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1075_c7_9be3_iftrue;
     t16_MUX_uxn_opcodes_h_l1075_c7_9be3_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1075_c7_9be3_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1075_c7_9be3_return_output := t16_MUX_uxn_opcodes_h_l1075_c7_9be3_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1095_c7_927c] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1095_c7_927c_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1095_c7_927c_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1095_c7_927c_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1095_c7_927c_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1095_c7_927c_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1095_c7_927c_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1095_c7_927c_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1095_c7_927c_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1101_c7_49dd] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1101_c7_49dd_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1101_c7_49dd_cond;
     tmp16_MUX_uxn_opcodes_h_l1101_c7_49dd_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1101_c7_49dd_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1101_c7_49dd_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1101_c7_49dd_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1101_c7_49dd_return_output := tmp16_MUX_uxn_opcodes_h_l1101_c7_49dd_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1105_c7_0284] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1105_c7_0284_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1105_c7_0284_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1105_c7_0284_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1105_c7_0284_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1105_c7_0284_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1105_c7_0284_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1105_c7_0284_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1105_c7_0284_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1079_c7_966d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c7_966d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c7_966d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c7_966d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c7_966d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c7_966d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c7_966d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c7_966d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c7_966d_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_49dd_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1105_c7_0284_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1089_c7_88c5_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1095_c7_927c_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1067_c2_c1e6_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1075_c7_9be3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c2_c1e6_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_9be3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_49dd_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1105_c7_0284_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1085_c7_6e9e_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1089_c7_88c5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_9be3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c7_966d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1095_c7_927c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_49dd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1101_c7_49dd_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1105_c7_0284_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1067_c2_c1e6_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1075_c7_9be3_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1095_c7_927c_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1101_c7_49dd_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1095_c7_927c] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1095_c7_927c_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1095_c7_927c_cond;
     tmp16_MUX_uxn_opcodes_h_l1095_c7_927c_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1095_c7_927c_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1095_c7_927c_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1095_c7_927c_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1095_c7_927c_return_output := tmp16_MUX_uxn_opcodes_h_l1095_c7_927c_return_output;

     -- t16_MUX[uxn_opcodes_h_l1067_c2_c1e6] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1067_c2_c1e6_cond <= VAR_t16_MUX_uxn_opcodes_h_l1067_c2_c1e6_cond;
     t16_MUX_uxn_opcodes_h_l1067_c2_c1e6_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1067_c2_c1e6_iftrue;
     t16_MUX_uxn_opcodes_h_l1067_c2_c1e6_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1067_c2_c1e6_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1067_c2_c1e6_return_output := t16_MUX_uxn_opcodes_h_l1067_c2_c1e6_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1089_c7_88c5] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1089_c7_88c5_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1089_c7_88c5_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1089_c7_88c5_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1089_c7_88c5_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1089_c7_88c5_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1089_c7_88c5_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1089_c7_88c5_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1089_c7_88c5_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1075_c7_9be3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_9be3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_9be3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_9be3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_9be3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_9be3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_9be3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_9be3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_9be3_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1067_c2_c1e6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c2_c1e6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c2_c1e6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c2_c1e6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c2_c1e6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c2_c1e6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c2_c1e6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c2_c1e6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c2_c1e6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1101_c7_49dd] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_49dd_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_49dd_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_49dd_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_49dd_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_49dd_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_49dd_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_49dd_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_49dd_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1101_c7_49dd] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_49dd_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_49dd_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_49dd_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_49dd_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_49dd_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_49dd_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_49dd_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_49dd_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1101_c7_49dd] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1101_c7_49dd_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1101_c7_49dd_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1101_c7_49dd_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1101_c7_49dd_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1101_c7_49dd_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1101_c7_49dd_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1101_c7_49dd_return_output := result_stack_value_MUX_uxn_opcodes_h_l1101_c7_49dd_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1095_c7_927c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1095_c7_927c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1095_c7_927c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1095_c7_927c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1095_c7_927c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1095_c7_927c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1095_c7_927c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1095_c7_927c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1095_c7_927c_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1067_c2_c1e6] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1067_c2_c1e6_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1067_c2_c1e6_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1067_c2_c1e6_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1067_c2_c1e6_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1067_c2_c1e6_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1067_c2_c1e6_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1067_c2_c1e6_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1067_c2_c1e6_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1085_c7_6e9e] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1085_c7_6e9e_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1085_c7_6e9e_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1085_c7_6e9e_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1085_c7_6e9e_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1085_c7_6e9e_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1085_c7_6e9e_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1085_c7_6e9e_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1085_c7_6e9e_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1095_c7_927c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_49dd_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1085_c7_6e9e_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1089_c7_88c5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1095_c7_927c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_49dd_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1079_c7_966d_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1085_c7_6e9e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c2_c1e6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_9be3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_88c5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1095_c7_927c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1095_c7_927c_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1101_c7_49dd_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1067_c2_c1e6_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1089_c7_88c5_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1095_c7_927c_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1089_c7_88c5] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1089_c7_88c5_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1089_c7_88c5_cond;
     tmp16_MUX_uxn_opcodes_h_l1089_c7_88c5_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1089_c7_88c5_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1089_c7_88c5_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1089_c7_88c5_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1089_c7_88c5_return_output := tmp16_MUX_uxn_opcodes_h_l1089_c7_88c5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1089_c7_88c5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_88c5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_88c5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_88c5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_88c5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_88c5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_88c5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_88c5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_88c5_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1079_c7_966d] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1079_c7_966d_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1079_c7_966d_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1079_c7_966d_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1079_c7_966d_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1079_c7_966d_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1079_c7_966d_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1079_c7_966d_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1079_c7_966d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1067_c2_c1e6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c2_c1e6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c2_c1e6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c2_c1e6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c2_c1e6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c2_c1e6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c2_c1e6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c2_c1e6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c2_c1e6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1095_c7_927c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1095_c7_927c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1095_c7_927c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1095_c7_927c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1095_c7_927c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1095_c7_927c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1095_c7_927c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1095_c7_927c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1095_c7_927c_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1095_c7_927c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1095_c7_927c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1095_c7_927c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1095_c7_927c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1095_c7_927c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1095_c7_927c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1095_c7_927c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1095_c7_927c_return_output := result_stack_value_MUX_uxn_opcodes_h_l1095_c7_927c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1095_c7_927c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1095_c7_927c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1095_c7_927c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1095_c7_927c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1095_c7_927c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1095_c7_927c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1095_c7_927c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1095_c7_927c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1095_c7_927c_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1085_c7_6e9e] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1085_c7_6e9e_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1085_c7_6e9e_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1085_c7_6e9e_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1085_c7_6e9e_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1085_c7_6e9e_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1085_c7_6e9e_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1085_c7_6e9e_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1085_c7_6e9e_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_88c5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1095_c7_927c_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1079_c7_966d_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1085_c7_6e9e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_88c5_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1095_c7_927c_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1075_c7_9be3_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1079_c7_966d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_6e9e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_88c5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1089_c7_88c5_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1095_c7_927c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1085_c7_6e9e_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1089_c7_88c5_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1089_c7_88c5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_88c5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_88c5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_88c5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_88c5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_88c5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_88c5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_88c5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_88c5_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1085_c7_6e9e] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1085_c7_6e9e_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1085_c7_6e9e_cond;
     tmp16_MUX_uxn_opcodes_h_l1085_c7_6e9e_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1085_c7_6e9e_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1085_c7_6e9e_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1085_c7_6e9e_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1085_c7_6e9e_return_output := tmp16_MUX_uxn_opcodes_h_l1085_c7_6e9e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1089_c7_88c5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_88c5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_88c5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_88c5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_88c5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_88c5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_88c5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_88c5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_88c5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1085_c7_6e9e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_6e9e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_6e9e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_6e9e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_6e9e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_6e9e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_6e9e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_6e9e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_6e9e_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1075_c7_9be3] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1075_c7_9be3_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1075_c7_9be3_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1075_c7_9be3_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1075_c7_9be3_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1075_c7_9be3_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1075_c7_9be3_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1075_c7_9be3_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1075_c7_9be3_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1089_c7_88c5] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1089_c7_88c5_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1089_c7_88c5_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1089_c7_88c5_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1089_c7_88c5_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1089_c7_88c5_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1089_c7_88c5_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1089_c7_88c5_return_output := result_stack_value_MUX_uxn_opcodes_h_l1089_c7_88c5_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1079_c7_966d] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1079_c7_966d_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1079_c7_966d_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1079_c7_966d_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1079_c7_966d_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1079_c7_966d_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1079_c7_966d_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1079_c7_966d_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1079_c7_966d_return_output;

     -- Submodule level 9
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_6e9e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_88c5_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1075_c7_9be3_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1079_c7_966d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1085_c7_6e9e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_88c5_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1067_c2_c1e6_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1075_c7_9be3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_966d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_6e9e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1085_c7_6e9e_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1089_c7_88c5_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1079_c7_966d_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1085_c7_6e9e_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1079_c7_966d] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1079_c7_966d_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1079_c7_966d_cond;
     tmp16_MUX_uxn_opcodes_h_l1079_c7_966d_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1079_c7_966d_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1079_c7_966d_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1079_c7_966d_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1079_c7_966d_return_output := tmp16_MUX_uxn_opcodes_h_l1079_c7_966d_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1085_c7_6e9e] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1085_c7_6e9e_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1085_c7_6e9e_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1085_c7_6e9e_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1085_c7_6e9e_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1085_c7_6e9e_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1085_c7_6e9e_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1085_c7_6e9e_return_output := result_stack_value_MUX_uxn_opcodes_h_l1085_c7_6e9e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1085_c7_6e9e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1085_c7_6e9e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1085_c7_6e9e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1085_c7_6e9e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1085_c7_6e9e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1085_c7_6e9e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1085_c7_6e9e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1085_c7_6e9e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1085_c7_6e9e_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1067_c2_c1e6] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1067_c2_c1e6_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1067_c2_c1e6_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1067_c2_c1e6_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1067_c2_c1e6_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1067_c2_c1e6_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1067_c2_c1e6_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1067_c2_c1e6_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1067_c2_c1e6_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1075_c7_9be3] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1075_c7_9be3_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1075_c7_9be3_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1075_c7_9be3_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1075_c7_9be3_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1075_c7_9be3_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1075_c7_9be3_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1075_c7_9be3_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1075_c7_9be3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1085_c7_6e9e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_6e9e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_6e9e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_6e9e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_6e9e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_6e9e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_6e9e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_6e9e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_6e9e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1079_c7_966d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_966d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_966d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_966d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_966d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_966d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_966d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_966d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_966d_return_output;

     -- Submodule level 10
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_966d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_6e9e_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1067_c2_c1e6_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1075_c7_9be3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1079_c7_966d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1085_c7_6e9e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_9be3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_966d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1079_c7_966d_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1085_c7_6e9e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1075_c7_9be3_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1079_c7_966d_return_output;
     -- result_is_ram_read_MUX[uxn_opcodes_h_l1067_c2_c1e6] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1067_c2_c1e6_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1067_c2_c1e6_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1067_c2_c1e6_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1067_c2_c1e6_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1067_c2_c1e6_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1067_c2_c1e6_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1067_c2_c1e6_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1067_c2_c1e6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1075_c7_9be3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_9be3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_9be3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_9be3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_9be3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_9be3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_9be3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_9be3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_9be3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1079_c7_966d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1079_c7_966d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1079_c7_966d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1079_c7_966d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1079_c7_966d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1079_c7_966d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1079_c7_966d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1079_c7_966d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1079_c7_966d_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1075_c7_9be3] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1075_c7_9be3_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1075_c7_9be3_cond;
     tmp16_MUX_uxn_opcodes_h_l1075_c7_9be3_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1075_c7_9be3_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1075_c7_9be3_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1075_c7_9be3_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1075_c7_9be3_return_output := tmp16_MUX_uxn_opcodes_h_l1075_c7_9be3_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1079_c7_966d] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1079_c7_966d_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1079_c7_966d_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1079_c7_966d_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1079_c7_966d_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1079_c7_966d_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1079_c7_966d_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1079_c7_966d_return_output := result_stack_value_MUX_uxn_opcodes_h_l1079_c7_966d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1079_c7_966d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_966d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_966d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_966d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_966d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_966d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_966d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_966d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_966d_return_output;

     -- Submodule level 11
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_9be3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_966d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_9be3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1079_c7_966d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c2_c1e6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_9be3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1075_c7_9be3_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1079_c7_966d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1067_c2_c1e6_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1075_c7_9be3_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1075_c7_9be3] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1075_c7_9be3_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1075_c7_9be3_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1075_c7_9be3_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1075_c7_9be3_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1075_c7_9be3_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1075_c7_9be3_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1075_c7_9be3_return_output := result_stack_value_MUX_uxn_opcodes_h_l1075_c7_9be3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1075_c7_9be3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_9be3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_9be3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_9be3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_9be3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_9be3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_9be3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_9be3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_9be3_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1067_c2_c1e6] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1067_c2_c1e6_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1067_c2_c1e6_cond;
     tmp16_MUX_uxn_opcodes_h_l1067_c2_c1e6_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1067_c2_c1e6_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1067_c2_c1e6_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1067_c2_c1e6_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1067_c2_c1e6_return_output := tmp16_MUX_uxn_opcodes_h_l1067_c2_c1e6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1067_c2_c1e6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c2_c1e6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c2_c1e6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c2_c1e6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c2_c1e6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c2_c1e6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c2_c1e6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c2_c1e6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c2_c1e6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1075_c7_9be3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_9be3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_9be3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_9be3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_9be3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_9be3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_9be3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_9be3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_9be3_return_output;

     -- Submodule level 12
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1067_c2_c1e6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_9be3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1067_c2_c1e6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_9be3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1067_c2_c1e6_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1075_c7_9be3_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l1067_c2_c1e6_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1067_c2_c1e6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1067_c2_c1e6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1067_c2_c1e6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1067_c2_c1e6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1067_c2_c1e6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1067_c2_c1e6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1067_c2_c1e6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1067_c2_c1e6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1067_c2_c1e6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1067_c2_c1e6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1067_c2_c1e6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1067_c2_c1e6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1067_c2_c1e6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1067_c2_c1e6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1067_c2_c1e6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1067_c2_c1e6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1067_c2_c1e6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1067_c2_c1e6_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1067_c2_c1e6] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1067_c2_c1e6_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1067_c2_c1e6_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1067_c2_c1e6_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1067_c2_c1e6_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1067_c2_c1e6_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1067_c2_c1e6_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1067_c2_c1e6_return_output := result_stack_value_MUX_uxn_opcodes_h_l1067_c2_c1e6_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_b1ca_uxn_opcodes_h_l1132_l1063_DUPLICATE_8b12 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b1ca_uxn_opcodes_h_l1132_l1063_DUPLICATE_8b12_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_b1ca(
     result,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1067_c2_c1e6_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1067_c2_c1e6_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1067_c2_c1e6_return_output,
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1067_c2_c1e6_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c2_c1e6_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1067_c2_c1e6_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c2_c1e6_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1067_c2_c1e6_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c2_c1e6_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1067_c2_c1e6_return_output,
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1067_c2_c1e6_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b1ca_uxn_opcodes_h_l1132_l1063_DUPLICATE_8b12_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b1ca_uxn_opcodes_h_l1132_l1063_DUPLICATE_8b12_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_tmp16 <= REG_VAR_tmp16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     tmp16 <= REG_COMB_tmp16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
