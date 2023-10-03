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
-- BIN_OP_EQ[uxn_opcodes_h_l1067_c6_7986]
signal BIN_OP_EQ_uxn_opcodes_h_l1067_c6_7986_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1067_c6_7986_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1067_c6_7986_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1067_c1_3536]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_3536_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_3536_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_3536_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_3536_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1067_c2_4eda]
signal tmp16_MUX_uxn_opcodes_h_l1067_c2_4eda_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1067_c2_4eda_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1067_c2_4eda_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1067_c2_4eda_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1067_c2_4eda]
signal t16_MUX_uxn_opcodes_h_l1067_c2_4eda_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1067_c2_4eda_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1067_c2_4eda_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1067_c2_4eda_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1067_c2_4eda]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1067_c2_4eda_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1067_c2_4eda_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1067_c2_4eda_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1067_c2_4eda_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1067_c2_4eda]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1067_c2_4eda_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1067_c2_4eda_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1067_c2_4eda_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1067_c2_4eda_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1067_c2_4eda]
signal result_ram_addr_MUX_uxn_opcodes_h_l1067_c2_4eda_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1067_c2_4eda_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1067_c2_4eda_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1067_c2_4eda_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1067_c2_4eda]
signal result_stack_value_MUX_uxn_opcodes_h_l1067_c2_4eda_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1067_c2_4eda_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1067_c2_4eda_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1067_c2_4eda_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1067_c2_4eda]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1067_c2_4eda_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1067_c2_4eda_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1067_c2_4eda_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1067_c2_4eda_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1067_c2_4eda]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1067_c2_4eda_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1067_c2_4eda_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1067_c2_4eda_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1067_c2_4eda_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1067_c2_4eda]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1067_c2_4eda_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1067_c2_4eda_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1067_c2_4eda_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1067_c2_4eda_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1067_c2_4eda]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c2_4eda_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c2_4eda_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c2_4eda_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c2_4eda_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1067_c2_4eda]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c2_4eda_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c2_4eda_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c2_4eda_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c2_4eda_return_output : signed(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1067_c2_4eda]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1067_c2_4eda_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1067_c2_4eda_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1067_c2_4eda_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1067_c2_4eda_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1067_c2_4eda]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c2_4eda_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c2_4eda_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c2_4eda_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c2_4eda_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l1068_c3_f6cc[uxn_opcodes_h_l1068_c3_f6cc]
signal printf_uxn_opcodes_h_l1068_c3_f6cc_uxn_opcodes_h_l1068_c3_f6cc_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1075_c11_aa55]
signal BIN_OP_EQ_uxn_opcodes_h_l1075_c11_aa55_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1075_c11_aa55_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1075_c11_aa55_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1075_c7_3b5b]
signal tmp16_MUX_uxn_opcodes_h_l1075_c7_3b5b_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1075_c7_3b5b_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1075_c7_3b5b_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1075_c7_3b5b_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1075_c7_3b5b]
signal t16_MUX_uxn_opcodes_h_l1075_c7_3b5b_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1075_c7_3b5b_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1075_c7_3b5b_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1075_c7_3b5b_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1075_c7_3b5b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_3b5b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_3b5b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_3b5b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_3b5b_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1075_c7_3b5b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_3b5b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_3b5b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_3b5b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_3b5b_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1075_c7_3b5b]
signal result_ram_addr_MUX_uxn_opcodes_h_l1075_c7_3b5b_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1075_c7_3b5b_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1075_c7_3b5b_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1075_c7_3b5b_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1075_c7_3b5b]
signal result_stack_value_MUX_uxn_opcodes_h_l1075_c7_3b5b_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1075_c7_3b5b_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1075_c7_3b5b_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1075_c7_3b5b_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1075_c7_3b5b]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1075_c7_3b5b_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1075_c7_3b5b_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1075_c7_3b5b_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1075_c7_3b5b_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1075_c7_3b5b]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1075_c7_3b5b_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1075_c7_3b5b_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1075_c7_3b5b_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1075_c7_3b5b_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1075_c7_3b5b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_3b5b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_3b5b_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_3b5b_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_3b5b_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1075_c7_3b5b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_3b5b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_3b5b_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_3b5b_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_3b5b_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1075_c7_3b5b]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1075_c7_3b5b_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1075_c7_3b5b_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1075_c7_3b5b_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1075_c7_3b5b_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1075_c7_3b5b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_3b5b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_3b5b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_3b5b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_3b5b_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1079_c11_1b35]
signal BIN_OP_EQ_uxn_opcodes_h_l1079_c11_1b35_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1079_c11_1b35_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1079_c11_1b35_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1079_c7_4047]
signal tmp16_MUX_uxn_opcodes_h_l1079_c7_4047_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1079_c7_4047_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1079_c7_4047_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1079_c7_4047_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1079_c7_4047]
signal t16_MUX_uxn_opcodes_h_l1079_c7_4047_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1079_c7_4047_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1079_c7_4047_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1079_c7_4047_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1079_c7_4047]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_4047_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_4047_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_4047_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_4047_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1079_c7_4047]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1079_c7_4047_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1079_c7_4047_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1079_c7_4047_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1079_c7_4047_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1079_c7_4047]
signal result_ram_addr_MUX_uxn_opcodes_h_l1079_c7_4047_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1079_c7_4047_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1079_c7_4047_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1079_c7_4047_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1079_c7_4047]
signal result_stack_value_MUX_uxn_opcodes_h_l1079_c7_4047_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1079_c7_4047_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1079_c7_4047_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1079_c7_4047_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1079_c7_4047]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1079_c7_4047_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1079_c7_4047_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1079_c7_4047_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1079_c7_4047_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1079_c7_4047]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1079_c7_4047_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1079_c7_4047_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1079_c7_4047_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1079_c7_4047_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1079_c7_4047]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c7_4047_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c7_4047_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c7_4047_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c7_4047_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1079_c7_4047]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_4047_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_4047_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_4047_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_4047_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1079_c7_4047]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1079_c7_4047_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1079_c7_4047_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1079_c7_4047_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1079_c7_4047_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1079_c7_4047]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1079_c7_4047_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1079_c7_4047_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1079_c7_4047_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1079_c7_4047_return_output : unsigned(0 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1081_c3_9b06]
signal CONST_SL_8_uxn_opcodes_h_l1081_c3_9b06_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1081_c3_9b06_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1085_c11_a067]
signal BIN_OP_EQ_uxn_opcodes_h_l1085_c11_a067_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1085_c11_a067_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1085_c11_a067_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1085_c7_e5d1]
signal tmp16_MUX_uxn_opcodes_h_l1085_c7_e5d1_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1085_c7_e5d1_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1085_c7_e5d1_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1085_c7_e5d1_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1085_c7_e5d1]
signal t16_MUX_uxn_opcodes_h_l1085_c7_e5d1_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1085_c7_e5d1_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1085_c7_e5d1_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1085_c7_e5d1_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1085_c7_e5d1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_e5d1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_e5d1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_e5d1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_e5d1_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1085_c7_e5d1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1085_c7_e5d1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1085_c7_e5d1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1085_c7_e5d1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1085_c7_e5d1_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1085_c7_e5d1]
signal result_ram_addr_MUX_uxn_opcodes_h_l1085_c7_e5d1_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1085_c7_e5d1_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1085_c7_e5d1_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1085_c7_e5d1_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1085_c7_e5d1]
signal result_stack_value_MUX_uxn_opcodes_h_l1085_c7_e5d1_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1085_c7_e5d1_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1085_c7_e5d1_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1085_c7_e5d1_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1085_c7_e5d1]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1085_c7_e5d1_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1085_c7_e5d1_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1085_c7_e5d1_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1085_c7_e5d1_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1085_c7_e5d1]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1085_c7_e5d1_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1085_c7_e5d1_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1085_c7_e5d1_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1085_c7_e5d1_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1085_c7_e5d1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1085_c7_e5d1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1085_c7_e5d1_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1085_c7_e5d1_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1085_c7_e5d1_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1085_c7_e5d1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_e5d1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_e5d1_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_e5d1_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_e5d1_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1085_c7_e5d1]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1085_c7_e5d1_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1085_c7_e5d1_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1085_c7_e5d1_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1085_c7_e5d1_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1085_c7_e5d1]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1085_c7_e5d1_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1085_c7_e5d1_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1085_c7_e5d1_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1085_c7_e5d1_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1089_c11_9705]
signal BIN_OP_EQ_uxn_opcodes_h_l1089_c11_9705_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1089_c11_9705_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1089_c11_9705_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1089_c7_f5d0]
signal tmp16_MUX_uxn_opcodes_h_l1089_c7_f5d0_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1089_c7_f5d0_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1089_c7_f5d0_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1089_c7_f5d0_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1089_c7_f5d0]
signal t16_MUX_uxn_opcodes_h_l1089_c7_f5d0_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1089_c7_f5d0_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1089_c7_f5d0_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1089_c7_f5d0_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1089_c7_f5d0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_f5d0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_f5d0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_f5d0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_f5d0_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1089_c7_f5d0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_f5d0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_f5d0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_f5d0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_f5d0_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1089_c7_f5d0]
signal result_ram_addr_MUX_uxn_opcodes_h_l1089_c7_f5d0_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1089_c7_f5d0_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1089_c7_f5d0_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1089_c7_f5d0_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1089_c7_f5d0]
signal result_stack_value_MUX_uxn_opcodes_h_l1089_c7_f5d0_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1089_c7_f5d0_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1089_c7_f5d0_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1089_c7_f5d0_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1089_c7_f5d0]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1089_c7_f5d0_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1089_c7_f5d0_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1089_c7_f5d0_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1089_c7_f5d0_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1089_c7_f5d0]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1089_c7_f5d0_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1089_c7_f5d0_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1089_c7_f5d0_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1089_c7_f5d0_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1089_c7_f5d0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_f5d0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_f5d0_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_f5d0_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_f5d0_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1089_c7_f5d0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_f5d0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_f5d0_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_f5d0_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_f5d0_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1089_c7_f5d0]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1089_c7_f5d0_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1089_c7_f5d0_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1089_c7_f5d0_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1089_c7_f5d0_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1089_c7_f5d0]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_f5d0_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_f5d0_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_f5d0_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_f5d0_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1090_c3_a0fc]
signal BIN_OP_OR_uxn_opcodes_h_l1090_c3_a0fc_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1090_c3_a0fc_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1090_c3_a0fc_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1093_c32_051b]
signal BIN_OP_AND_uxn_opcodes_h_l1093_c32_051b_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1093_c32_051b_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1093_c32_051b_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1093_c32_1100]
signal BIN_OP_GT_uxn_opcodes_h_l1093_c32_1100_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1093_c32_1100_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1093_c32_1100_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1093_c32_fb96]
signal MUX_uxn_opcodes_h_l1093_c32_fb96_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1093_c32_fb96_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1093_c32_fb96_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1093_c32_fb96_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1095_c11_d2a4]
signal BIN_OP_EQ_uxn_opcodes_h_l1095_c11_d2a4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1095_c11_d2a4_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1095_c11_d2a4_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1095_c7_d101]
signal tmp16_MUX_uxn_opcodes_h_l1095_c7_d101_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1095_c7_d101_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1095_c7_d101_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1095_c7_d101_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1095_c7_d101]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1095_c7_d101_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1095_c7_d101_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1095_c7_d101_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1095_c7_d101_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1095_c7_d101]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1095_c7_d101_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1095_c7_d101_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1095_c7_d101_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1095_c7_d101_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1095_c7_d101]
signal result_ram_addr_MUX_uxn_opcodes_h_l1095_c7_d101_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1095_c7_d101_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1095_c7_d101_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1095_c7_d101_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1095_c7_d101]
signal result_stack_value_MUX_uxn_opcodes_h_l1095_c7_d101_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1095_c7_d101_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1095_c7_d101_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1095_c7_d101_return_output : unsigned(7 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1095_c7_d101]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1095_c7_d101_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1095_c7_d101_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1095_c7_d101_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1095_c7_d101_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1095_c7_d101]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1095_c7_d101_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1095_c7_d101_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1095_c7_d101_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1095_c7_d101_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1095_c7_d101]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1095_c7_d101_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1095_c7_d101_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1095_c7_d101_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1095_c7_d101_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1095_c7_d101]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1095_c7_d101_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1095_c7_d101_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1095_c7_d101_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1095_c7_d101_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1101_c11_6767]
signal BIN_OP_EQ_uxn_opcodes_h_l1101_c11_6767_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1101_c11_6767_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1101_c11_6767_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1101_c7_3dd7]
signal tmp16_MUX_uxn_opcodes_h_l1101_c7_3dd7_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1101_c7_3dd7_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1101_c7_3dd7_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1101_c7_3dd7_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1101_c7_3dd7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_3dd7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_3dd7_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_3dd7_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_3dd7_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1101_c7_3dd7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_3dd7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_3dd7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_3dd7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_3dd7_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1101_c7_3dd7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_3dd7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_3dd7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_3dd7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_3dd7_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1101_c7_3dd7]
signal result_ram_addr_MUX_uxn_opcodes_h_l1101_c7_3dd7_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1101_c7_3dd7_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1101_c7_3dd7_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1101_c7_3dd7_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1101_c7_3dd7]
signal result_stack_value_MUX_uxn_opcodes_h_l1101_c7_3dd7_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1101_c7_3dd7_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1101_c7_3dd7_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1101_c7_3dd7_return_output : unsigned(7 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1101_c7_3dd7]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1101_c7_3dd7_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1101_c7_3dd7_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1101_c7_3dd7_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1101_c7_3dd7_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1105_c11_455e]
signal BIN_OP_EQ_uxn_opcodes_h_l1105_c11_455e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1105_c11_455e_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1105_c11_455e_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1105_c7_bf68]
signal tmp16_MUX_uxn_opcodes_h_l1105_c7_bf68_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1105_c7_bf68_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1105_c7_bf68_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1105_c7_bf68_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1105_c7_bf68]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1105_c7_bf68_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1105_c7_bf68_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1105_c7_bf68_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1105_c7_bf68_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1105_c7_bf68]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1105_c7_bf68_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1105_c7_bf68_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1105_c7_bf68_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1105_c7_bf68_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1105_c7_bf68]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1105_c7_bf68_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1105_c7_bf68_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1105_c7_bf68_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1105_c7_bf68_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1105_c7_bf68]
signal result_ram_addr_MUX_uxn_opcodes_h_l1105_c7_bf68_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1105_c7_bf68_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1105_c7_bf68_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1105_c7_bf68_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1105_c7_bf68]
signal result_stack_value_MUX_uxn_opcodes_h_l1105_c7_bf68_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1105_c7_bf68_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1105_c7_bf68_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1105_c7_bf68_return_output : unsigned(7 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1105_c7_bf68]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1105_c7_bf68_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1105_c7_bf68_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1105_c7_bf68_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1105_c7_bf68_return_output : unsigned(0 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1107_c3_0ab6]
signal CONST_SL_8_uxn_opcodes_h_l1107_c3_0ab6_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1107_c3_0ab6_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1109_c21_54f6]
signal BIN_OP_PLUS_uxn_opcodes_h_l1109_c21_54f6_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1109_c21_54f6_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1109_c21_54f6_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1111_c11_d305]
signal BIN_OP_EQ_uxn_opcodes_h_l1111_c11_d305_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1111_c11_d305_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1111_c11_d305_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1111_c7_fca7]
signal tmp16_MUX_uxn_opcodes_h_l1111_c7_fca7_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1111_c7_fca7_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1111_c7_fca7_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1111_c7_fca7_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1111_c7_fca7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c7_fca7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c7_fca7_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c7_fca7_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c7_fca7_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1111_c7_fca7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1111_c7_fca7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1111_c7_fca7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1111_c7_fca7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1111_c7_fca7_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1111_c7_fca7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1111_c7_fca7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1111_c7_fca7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1111_c7_fca7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1111_c7_fca7_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1111_c7_fca7]
signal result_ram_addr_MUX_uxn_opcodes_h_l1111_c7_fca7_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1111_c7_fca7_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1111_c7_fca7_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1111_c7_fca7_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1111_c7_fca7]
signal result_stack_value_MUX_uxn_opcodes_h_l1111_c7_fca7_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1111_c7_fca7_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1111_c7_fca7_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1111_c7_fca7_return_output : unsigned(7 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1111_c7_fca7]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1111_c7_fca7_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1111_c7_fca7_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1111_c7_fca7_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1111_c7_fca7_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1113_c21_64e4]
signal BIN_OP_PLUS_uxn_opcodes_h_l1113_c21_64e4_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1113_c21_64e4_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1113_c21_64e4_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1115_c11_ac27]
signal BIN_OP_EQ_uxn_opcodes_h_l1115_c11_ac27_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1115_c11_ac27_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1115_c11_ac27_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1115_c7_fe0f]
signal tmp16_MUX_uxn_opcodes_h_l1115_c7_fe0f_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1115_c7_fe0f_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1115_c7_fe0f_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1115_c7_fe0f_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1115_c7_fe0f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1115_c7_fe0f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1115_c7_fe0f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1115_c7_fe0f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1115_c7_fe0f_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1115_c7_fe0f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1115_c7_fe0f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1115_c7_fe0f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1115_c7_fe0f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1115_c7_fe0f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1115_c7_fe0f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1115_c7_fe0f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1115_c7_fe0f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1115_c7_fe0f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1115_c7_fe0f_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1115_c7_fe0f]
signal result_stack_value_MUX_uxn_opcodes_h_l1115_c7_fe0f_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1115_c7_fe0f_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1115_c7_fe0f_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1115_c7_fe0f_return_output : unsigned(7 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1115_c7_fe0f]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1115_c7_fe0f_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1115_c7_fe0f_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1115_c7_fe0f_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1115_c7_fe0f_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1116_c3_0882]
signal BIN_OP_OR_uxn_opcodes_h_l1116_c3_0882_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1116_c3_0882_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1116_c3_0882_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1122_c11_bfed]
signal BIN_OP_EQ_uxn_opcodes_h_l1122_c11_bfed_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1122_c11_bfed_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1122_c11_bfed_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1122_c7_f919]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1122_c7_f919_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1122_c7_f919_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1122_c7_f919_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1122_c7_f919_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1122_c7_f919]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1122_c7_f919_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1122_c7_f919_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1122_c7_f919_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1122_c7_f919_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1122_c7_f919]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1122_c7_f919_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1122_c7_f919_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1122_c7_f919_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1122_c7_f919_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1122_c7_f919]
signal result_stack_value_MUX_uxn_opcodes_h_l1122_c7_f919_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1122_c7_f919_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1122_c7_f919_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1122_c7_f919_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1125_c34_3bef]
signal CONST_SR_8_uxn_opcodes_h_l1125_c34_3bef_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1125_c34_3bef_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1127_c11_954b]
signal BIN_OP_EQ_uxn_opcodes_h_l1127_c11_954b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1127_c11_954b_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1127_c11_954b_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1127_c7_8968]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_8968_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_8968_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_8968_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_8968_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1127_c7_8968]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_8968_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_8968_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_8968_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_8968_return_output : unsigned(0 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_6002( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : signed;
 ref_toks_10 : unsigned;
 ref_toks_11 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_opc_done := ref_toks_1;
      base.is_stack_write := ref_toks_2;
      base.ram_addr := ref_toks_3;
      base.stack_value := ref_toks_4;
      base.is_stack_index_flipped := ref_toks_5;
      base.is_stack_read := ref_toks_6;
      base.is_ram_read := ref_toks_7;
      base.stack_address_sp_offset := ref_toks_8;
      base.sp_relative_shift := ref_toks_9;
      base.is_ram_write := ref_toks_10;
      base.is_sp_shift := ref_toks_11;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1067_c6_7986
BIN_OP_EQ_uxn_opcodes_h_l1067_c6_7986 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1067_c6_7986_left,
BIN_OP_EQ_uxn_opcodes_h_l1067_c6_7986_right,
BIN_OP_EQ_uxn_opcodes_h_l1067_c6_7986_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_3536
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_3536 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_3536_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_3536_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_3536_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_3536_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1067_c2_4eda
tmp16_MUX_uxn_opcodes_h_l1067_c2_4eda : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1067_c2_4eda_cond,
tmp16_MUX_uxn_opcodes_h_l1067_c2_4eda_iftrue,
tmp16_MUX_uxn_opcodes_h_l1067_c2_4eda_iffalse,
tmp16_MUX_uxn_opcodes_h_l1067_c2_4eda_return_output);

-- t16_MUX_uxn_opcodes_h_l1067_c2_4eda
t16_MUX_uxn_opcodes_h_l1067_c2_4eda : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1067_c2_4eda_cond,
t16_MUX_uxn_opcodes_h_l1067_c2_4eda_iftrue,
t16_MUX_uxn_opcodes_h_l1067_c2_4eda_iffalse,
t16_MUX_uxn_opcodes_h_l1067_c2_4eda_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1067_c2_4eda
result_is_opc_done_MUX_uxn_opcodes_h_l1067_c2_4eda : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1067_c2_4eda_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1067_c2_4eda_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1067_c2_4eda_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1067_c2_4eda_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1067_c2_4eda
result_is_stack_write_MUX_uxn_opcodes_h_l1067_c2_4eda : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1067_c2_4eda_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1067_c2_4eda_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1067_c2_4eda_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1067_c2_4eda_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1067_c2_4eda
result_ram_addr_MUX_uxn_opcodes_h_l1067_c2_4eda : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1067_c2_4eda_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1067_c2_4eda_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1067_c2_4eda_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1067_c2_4eda_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1067_c2_4eda
result_stack_value_MUX_uxn_opcodes_h_l1067_c2_4eda : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1067_c2_4eda_cond,
result_stack_value_MUX_uxn_opcodes_h_l1067_c2_4eda_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1067_c2_4eda_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1067_c2_4eda_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1067_c2_4eda
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1067_c2_4eda : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1067_c2_4eda_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1067_c2_4eda_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1067_c2_4eda_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1067_c2_4eda_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1067_c2_4eda
result_is_stack_read_MUX_uxn_opcodes_h_l1067_c2_4eda : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1067_c2_4eda_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1067_c2_4eda_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1067_c2_4eda_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1067_c2_4eda_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1067_c2_4eda
result_is_ram_read_MUX_uxn_opcodes_h_l1067_c2_4eda : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1067_c2_4eda_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1067_c2_4eda_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1067_c2_4eda_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1067_c2_4eda_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c2_4eda
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c2_4eda : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c2_4eda_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c2_4eda_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c2_4eda_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c2_4eda_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c2_4eda
result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c2_4eda : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c2_4eda_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c2_4eda_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c2_4eda_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c2_4eda_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1067_c2_4eda
result_is_ram_write_MUX_uxn_opcodes_h_l1067_c2_4eda : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1067_c2_4eda_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1067_c2_4eda_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1067_c2_4eda_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1067_c2_4eda_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c2_4eda
result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c2_4eda : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c2_4eda_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c2_4eda_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c2_4eda_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c2_4eda_return_output);

-- printf_uxn_opcodes_h_l1068_c3_f6cc_uxn_opcodes_h_l1068_c3_f6cc
printf_uxn_opcodes_h_l1068_c3_f6cc_uxn_opcodes_h_l1068_c3_f6cc : entity work.printf_uxn_opcodes_h_l1068_c3_f6cc_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1068_c3_f6cc_uxn_opcodes_h_l1068_c3_f6cc_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1075_c11_aa55
BIN_OP_EQ_uxn_opcodes_h_l1075_c11_aa55 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1075_c11_aa55_left,
BIN_OP_EQ_uxn_opcodes_h_l1075_c11_aa55_right,
BIN_OP_EQ_uxn_opcodes_h_l1075_c11_aa55_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1075_c7_3b5b
tmp16_MUX_uxn_opcodes_h_l1075_c7_3b5b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1075_c7_3b5b_cond,
tmp16_MUX_uxn_opcodes_h_l1075_c7_3b5b_iftrue,
tmp16_MUX_uxn_opcodes_h_l1075_c7_3b5b_iffalse,
tmp16_MUX_uxn_opcodes_h_l1075_c7_3b5b_return_output);

-- t16_MUX_uxn_opcodes_h_l1075_c7_3b5b
t16_MUX_uxn_opcodes_h_l1075_c7_3b5b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1075_c7_3b5b_cond,
t16_MUX_uxn_opcodes_h_l1075_c7_3b5b_iftrue,
t16_MUX_uxn_opcodes_h_l1075_c7_3b5b_iffalse,
t16_MUX_uxn_opcodes_h_l1075_c7_3b5b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_3b5b
result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_3b5b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_3b5b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_3b5b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_3b5b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_3b5b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_3b5b
result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_3b5b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_3b5b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_3b5b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_3b5b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_3b5b_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1075_c7_3b5b
result_ram_addr_MUX_uxn_opcodes_h_l1075_c7_3b5b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1075_c7_3b5b_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1075_c7_3b5b_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1075_c7_3b5b_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1075_c7_3b5b_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1075_c7_3b5b
result_stack_value_MUX_uxn_opcodes_h_l1075_c7_3b5b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1075_c7_3b5b_cond,
result_stack_value_MUX_uxn_opcodes_h_l1075_c7_3b5b_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1075_c7_3b5b_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1075_c7_3b5b_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1075_c7_3b5b
result_is_stack_read_MUX_uxn_opcodes_h_l1075_c7_3b5b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1075_c7_3b5b_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1075_c7_3b5b_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1075_c7_3b5b_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1075_c7_3b5b_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1075_c7_3b5b
result_is_ram_read_MUX_uxn_opcodes_h_l1075_c7_3b5b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1075_c7_3b5b_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1075_c7_3b5b_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1075_c7_3b5b_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1075_c7_3b5b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_3b5b
result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_3b5b : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_3b5b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_3b5b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_3b5b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_3b5b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_3b5b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_3b5b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_3b5b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_3b5b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_3b5b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_3b5b_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1075_c7_3b5b
result_is_ram_write_MUX_uxn_opcodes_h_l1075_c7_3b5b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1075_c7_3b5b_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1075_c7_3b5b_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1075_c7_3b5b_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1075_c7_3b5b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_3b5b
result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_3b5b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_3b5b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_3b5b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_3b5b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_3b5b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1079_c11_1b35
BIN_OP_EQ_uxn_opcodes_h_l1079_c11_1b35 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1079_c11_1b35_left,
BIN_OP_EQ_uxn_opcodes_h_l1079_c11_1b35_right,
BIN_OP_EQ_uxn_opcodes_h_l1079_c11_1b35_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1079_c7_4047
tmp16_MUX_uxn_opcodes_h_l1079_c7_4047 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1079_c7_4047_cond,
tmp16_MUX_uxn_opcodes_h_l1079_c7_4047_iftrue,
tmp16_MUX_uxn_opcodes_h_l1079_c7_4047_iffalse,
tmp16_MUX_uxn_opcodes_h_l1079_c7_4047_return_output);

-- t16_MUX_uxn_opcodes_h_l1079_c7_4047
t16_MUX_uxn_opcodes_h_l1079_c7_4047 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1079_c7_4047_cond,
t16_MUX_uxn_opcodes_h_l1079_c7_4047_iftrue,
t16_MUX_uxn_opcodes_h_l1079_c7_4047_iffalse,
t16_MUX_uxn_opcodes_h_l1079_c7_4047_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_4047
result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_4047 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_4047_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_4047_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_4047_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_4047_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1079_c7_4047
result_is_stack_write_MUX_uxn_opcodes_h_l1079_c7_4047 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1079_c7_4047_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1079_c7_4047_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1079_c7_4047_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1079_c7_4047_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1079_c7_4047
result_ram_addr_MUX_uxn_opcodes_h_l1079_c7_4047 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1079_c7_4047_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1079_c7_4047_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1079_c7_4047_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1079_c7_4047_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1079_c7_4047
result_stack_value_MUX_uxn_opcodes_h_l1079_c7_4047 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1079_c7_4047_cond,
result_stack_value_MUX_uxn_opcodes_h_l1079_c7_4047_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1079_c7_4047_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1079_c7_4047_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1079_c7_4047
result_is_stack_read_MUX_uxn_opcodes_h_l1079_c7_4047 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1079_c7_4047_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1079_c7_4047_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1079_c7_4047_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1079_c7_4047_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1079_c7_4047
result_is_ram_read_MUX_uxn_opcodes_h_l1079_c7_4047 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1079_c7_4047_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1079_c7_4047_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1079_c7_4047_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1079_c7_4047_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c7_4047
result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c7_4047 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c7_4047_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c7_4047_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c7_4047_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c7_4047_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_4047
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_4047 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_4047_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_4047_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_4047_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_4047_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1079_c7_4047
result_is_ram_write_MUX_uxn_opcodes_h_l1079_c7_4047 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1079_c7_4047_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1079_c7_4047_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1079_c7_4047_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1079_c7_4047_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1079_c7_4047
result_is_sp_shift_MUX_uxn_opcodes_h_l1079_c7_4047 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1079_c7_4047_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1079_c7_4047_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1079_c7_4047_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1079_c7_4047_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1081_c3_9b06
CONST_SL_8_uxn_opcodes_h_l1081_c3_9b06 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1081_c3_9b06_x,
CONST_SL_8_uxn_opcodes_h_l1081_c3_9b06_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1085_c11_a067
BIN_OP_EQ_uxn_opcodes_h_l1085_c11_a067 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1085_c11_a067_left,
BIN_OP_EQ_uxn_opcodes_h_l1085_c11_a067_right,
BIN_OP_EQ_uxn_opcodes_h_l1085_c11_a067_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1085_c7_e5d1
tmp16_MUX_uxn_opcodes_h_l1085_c7_e5d1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1085_c7_e5d1_cond,
tmp16_MUX_uxn_opcodes_h_l1085_c7_e5d1_iftrue,
tmp16_MUX_uxn_opcodes_h_l1085_c7_e5d1_iffalse,
tmp16_MUX_uxn_opcodes_h_l1085_c7_e5d1_return_output);

-- t16_MUX_uxn_opcodes_h_l1085_c7_e5d1
t16_MUX_uxn_opcodes_h_l1085_c7_e5d1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1085_c7_e5d1_cond,
t16_MUX_uxn_opcodes_h_l1085_c7_e5d1_iftrue,
t16_MUX_uxn_opcodes_h_l1085_c7_e5d1_iffalse,
t16_MUX_uxn_opcodes_h_l1085_c7_e5d1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_e5d1
result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_e5d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_e5d1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_e5d1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_e5d1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_e5d1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1085_c7_e5d1
result_is_stack_write_MUX_uxn_opcodes_h_l1085_c7_e5d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1085_c7_e5d1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1085_c7_e5d1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1085_c7_e5d1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1085_c7_e5d1_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1085_c7_e5d1
result_ram_addr_MUX_uxn_opcodes_h_l1085_c7_e5d1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1085_c7_e5d1_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1085_c7_e5d1_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1085_c7_e5d1_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1085_c7_e5d1_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1085_c7_e5d1
result_stack_value_MUX_uxn_opcodes_h_l1085_c7_e5d1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1085_c7_e5d1_cond,
result_stack_value_MUX_uxn_opcodes_h_l1085_c7_e5d1_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1085_c7_e5d1_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1085_c7_e5d1_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1085_c7_e5d1
result_is_stack_read_MUX_uxn_opcodes_h_l1085_c7_e5d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1085_c7_e5d1_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1085_c7_e5d1_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1085_c7_e5d1_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1085_c7_e5d1_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1085_c7_e5d1
result_is_ram_read_MUX_uxn_opcodes_h_l1085_c7_e5d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1085_c7_e5d1_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1085_c7_e5d1_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1085_c7_e5d1_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1085_c7_e5d1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1085_c7_e5d1
result_sp_relative_shift_MUX_uxn_opcodes_h_l1085_c7_e5d1 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1085_c7_e5d1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1085_c7_e5d1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1085_c7_e5d1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1085_c7_e5d1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_e5d1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_e5d1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_e5d1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_e5d1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_e5d1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_e5d1_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1085_c7_e5d1
result_is_ram_write_MUX_uxn_opcodes_h_l1085_c7_e5d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1085_c7_e5d1_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1085_c7_e5d1_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1085_c7_e5d1_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1085_c7_e5d1_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1085_c7_e5d1
result_is_sp_shift_MUX_uxn_opcodes_h_l1085_c7_e5d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1085_c7_e5d1_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1085_c7_e5d1_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1085_c7_e5d1_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1085_c7_e5d1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1089_c11_9705
BIN_OP_EQ_uxn_opcodes_h_l1089_c11_9705 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1089_c11_9705_left,
BIN_OP_EQ_uxn_opcodes_h_l1089_c11_9705_right,
BIN_OP_EQ_uxn_opcodes_h_l1089_c11_9705_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1089_c7_f5d0
tmp16_MUX_uxn_opcodes_h_l1089_c7_f5d0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1089_c7_f5d0_cond,
tmp16_MUX_uxn_opcodes_h_l1089_c7_f5d0_iftrue,
tmp16_MUX_uxn_opcodes_h_l1089_c7_f5d0_iffalse,
tmp16_MUX_uxn_opcodes_h_l1089_c7_f5d0_return_output);

-- t16_MUX_uxn_opcodes_h_l1089_c7_f5d0
t16_MUX_uxn_opcodes_h_l1089_c7_f5d0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1089_c7_f5d0_cond,
t16_MUX_uxn_opcodes_h_l1089_c7_f5d0_iftrue,
t16_MUX_uxn_opcodes_h_l1089_c7_f5d0_iffalse,
t16_MUX_uxn_opcodes_h_l1089_c7_f5d0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_f5d0
result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_f5d0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_f5d0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_f5d0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_f5d0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_f5d0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_f5d0
result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_f5d0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_f5d0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_f5d0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_f5d0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_f5d0_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1089_c7_f5d0
result_ram_addr_MUX_uxn_opcodes_h_l1089_c7_f5d0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1089_c7_f5d0_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1089_c7_f5d0_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1089_c7_f5d0_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1089_c7_f5d0_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1089_c7_f5d0
result_stack_value_MUX_uxn_opcodes_h_l1089_c7_f5d0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1089_c7_f5d0_cond,
result_stack_value_MUX_uxn_opcodes_h_l1089_c7_f5d0_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1089_c7_f5d0_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1089_c7_f5d0_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1089_c7_f5d0
result_is_stack_read_MUX_uxn_opcodes_h_l1089_c7_f5d0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1089_c7_f5d0_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1089_c7_f5d0_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1089_c7_f5d0_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1089_c7_f5d0_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1089_c7_f5d0
result_is_ram_read_MUX_uxn_opcodes_h_l1089_c7_f5d0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1089_c7_f5d0_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1089_c7_f5d0_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1089_c7_f5d0_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1089_c7_f5d0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_f5d0
result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_f5d0 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_f5d0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_f5d0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_f5d0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_f5d0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_f5d0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_f5d0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_f5d0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_f5d0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_f5d0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_f5d0_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1089_c7_f5d0
result_is_ram_write_MUX_uxn_opcodes_h_l1089_c7_f5d0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1089_c7_f5d0_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1089_c7_f5d0_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1089_c7_f5d0_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1089_c7_f5d0_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_f5d0
result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_f5d0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_f5d0_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_f5d0_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_f5d0_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_f5d0_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1090_c3_a0fc
BIN_OP_OR_uxn_opcodes_h_l1090_c3_a0fc : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1090_c3_a0fc_left,
BIN_OP_OR_uxn_opcodes_h_l1090_c3_a0fc_right,
BIN_OP_OR_uxn_opcodes_h_l1090_c3_a0fc_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1093_c32_051b
BIN_OP_AND_uxn_opcodes_h_l1093_c32_051b : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1093_c32_051b_left,
BIN_OP_AND_uxn_opcodes_h_l1093_c32_051b_right,
BIN_OP_AND_uxn_opcodes_h_l1093_c32_051b_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1093_c32_1100
BIN_OP_GT_uxn_opcodes_h_l1093_c32_1100 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1093_c32_1100_left,
BIN_OP_GT_uxn_opcodes_h_l1093_c32_1100_right,
BIN_OP_GT_uxn_opcodes_h_l1093_c32_1100_return_output);

-- MUX_uxn_opcodes_h_l1093_c32_fb96
MUX_uxn_opcodes_h_l1093_c32_fb96 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1093_c32_fb96_cond,
MUX_uxn_opcodes_h_l1093_c32_fb96_iftrue,
MUX_uxn_opcodes_h_l1093_c32_fb96_iffalse,
MUX_uxn_opcodes_h_l1093_c32_fb96_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1095_c11_d2a4
BIN_OP_EQ_uxn_opcodes_h_l1095_c11_d2a4 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1095_c11_d2a4_left,
BIN_OP_EQ_uxn_opcodes_h_l1095_c11_d2a4_right,
BIN_OP_EQ_uxn_opcodes_h_l1095_c11_d2a4_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1095_c7_d101
tmp16_MUX_uxn_opcodes_h_l1095_c7_d101 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1095_c7_d101_cond,
tmp16_MUX_uxn_opcodes_h_l1095_c7_d101_iftrue,
tmp16_MUX_uxn_opcodes_h_l1095_c7_d101_iffalse,
tmp16_MUX_uxn_opcodes_h_l1095_c7_d101_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1095_c7_d101
result_is_opc_done_MUX_uxn_opcodes_h_l1095_c7_d101 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1095_c7_d101_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1095_c7_d101_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1095_c7_d101_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1095_c7_d101_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1095_c7_d101
result_is_stack_write_MUX_uxn_opcodes_h_l1095_c7_d101 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1095_c7_d101_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1095_c7_d101_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1095_c7_d101_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1095_c7_d101_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1095_c7_d101
result_ram_addr_MUX_uxn_opcodes_h_l1095_c7_d101 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1095_c7_d101_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1095_c7_d101_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1095_c7_d101_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1095_c7_d101_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1095_c7_d101
result_stack_value_MUX_uxn_opcodes_h_l1095_c7_d101 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1095_c7_d101_cond,
result_stack_value_MUX_uxn_opcodes_h_l1095_c7_d101_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1095_c7_d101_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1095_c7_d101_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1095_c7_d101
result_is_ram_read_MUX_uxn_opcodes_h_l1095_c7_d101 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1095_c7_d101_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1095_c7_d101_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1095_c7_d101_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1095_c7_d101_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1095_c7_d101
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1095_c7_d101 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1095_c7_d101_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1095_c7_d101_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1095_c7_d101_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1095_c7_d101_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1095_c7_d101
result_is_ram_write_MUX_uxn_opcodes_h_l1095_c7_d101 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1095_c7_d101_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1095_c7_d101_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1095_c7_d101_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1095_c7_d101_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1095_c7_d101
result_is_sp_shift_MUX_uxn_opcodes_h_l1095_c7_d101 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1095_c7_d101_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1095_c7_d101_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1095_c7_d101_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1095_c7_d101_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1101_c11_6767
BIN_OP_EQ_uxn_opcodes_h_l1101_c11_6767 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1101_c11_6767_left,
BIN_OP_EQ_uxn_opcodes_h_l1101_c11_6767_right,
BIN_OP_EQ_uxn_opcodes_h_l1101_c11_6767_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1101_c7_3dd7
tmp16_MUX_uxn_opcodes_h_l1101_c7_3dd7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1101_c7_3dd7_cond,
tmp16_MUX_uxn_opcodes_h_l1101_c7_3dd7_iftrue,
tmp16_MUX_uxn_opcodes_h_l1101_c7_3dd7_iffalse,
tmp16_MUX_uxn_opcodes_h_l1101_c7_3dd7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_3dd7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_3dd7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_3dd7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_3dd7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_3dd7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_3dd7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_3dd7
result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_3dd7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_3dd7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_3dd7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_3dd7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_3dd7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_3dd7
result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_3dd7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_3dd7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_3dd7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_3dd7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_3dd7_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1101_c7_3dd7
result_ram_addr_MUX_uxn_opcodes_h_l1101_c7_3dd7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1101_c7_3dd7_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1101_c7_3dd7_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1101_c7_3dd7_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1101_c7_3dd7_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1101_c7_3dd7
result_stack_value_MUX_uxn_opcodes_h_l1101_c7_3dd7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1101_c7_3dd7_cond,
result_stack_value_MUX_uxn_opcodes_h_l1101_c7_3dd7_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1101_c7_3dd7_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1101_c7_3dd7_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1101_c7_3dd7
result_is_ram_read_MUX_uxn_opcodes_h_l1101_c7_3dd7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1101_c7_3dd7_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1101_c7_3dd7_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1101_c7_3dd7_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1101_c7_3dd7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1105_c11_455e
BIN_OP_EQ_uxn_opcodes_h_l1105_c11_455e : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1105_c11_455e_left,
BIN_OP_EQ_uxn_opcodes_h_l1105_c11_455e_right,
BIN_OP_EQ_uxn_opcodes_h_l1105_c11_455e_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1105_c7_bf68
tmp16_MUX_uxn_opcodes_h_l1105_c7_bf68 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1105_c7_bf68_cond,
tmp16_MUX_uxn_opcodes_h_l1105_c7_bf68_iftrue,
tmp16_MUX_uxn_opcodes_h_l1105_c7_bf68_iffalse,
tmp16_MUX_uxn_opcodes_h_l1105_c7_bf68_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1105_c7_bf68
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1105_c7_bf68 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1105_c7_bf68_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1105_c7_bf68_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1105_c7_bf68_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1105_c7_bf68_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1105_c7_bf68
result_is_opc_done_MUX_uxn_opcodes_h_l1105_c7_bf68 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1105_c7_bf68_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1105_c7_bf68_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1105_c7_bf68_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1105_c7_bf68_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1105_c7_bf68
result_is_stack_write_MUX_uxn_opcodes_h_l1105_c7_bf68 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1105_c7_bf68_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1105_c7_bf68_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1105_c7_bf68_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1105_c7_bf68_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1105_c7_bf68
result_ram_addr_MUX_uxn_opcodes_h_l1105_c7_bf68 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1105_c7_bf68_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1105_c7_bf68_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1105_c7_bf68_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1105_c7_bf68_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1105_c7_bf68
result_stack_value_MUX_uxn_opcodes_h_l1105_c7_bf68 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1105_c7_bf68_cond,
result_stack_value_MUX_uxn_opcodes_h_l1105_c7_bf68_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1105_c7_bf68_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1105_c7_bf68_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1105_c7_bf68
result_is_ram_read_MUX_uxn_opcodes_h_l1105_c7_bf68 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1105_c7_bf68_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1105_c7_bf68_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1105_c7_bf68_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1105_c7_bf68_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1107_c3_0ab6
CONST_SL_8_uxn_opcodes_h_l1107_c3_0ab6 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1107_c3_0ab6_x,
CONST_SL_8_uxn_opcodes_h_l1107_c3_0ab6_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1109_c21_54f6
BIN_OP_PLUS_uxn_opcodes_h_l1109_c21_54f6 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1109_c21_54f6_left,
BIN_OP_PLUS_uxn_opcodes_h_l1109_c21_54f6_right,
BIN_OP_PLUS_uxn_opcodes_h_l1109_c21_54f6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1111_c11_d305
BIN_OP_EQ_uxn_opcodes_h_l1111_c11_d305 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1111_c11_d305_left,
BIN_OP_EQ_uxn_opcodes_h_l1111_c11_d305_right,
BIN_OP_EQ_uxn_opcodes_h_l1111_c11_d305_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1111_c7_fca7
tmp16_MUX_uxn_opcodes_h_l1111_c7_fca7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1111_c7_fca7_cond,
tmp16_MUX_uxn_opcodes_h_l1111_c7_fca7_iftrue,
tmp16_MUX_uxn_opcodes_h_l1111_c7_fca7_iffalse,
tmp16_MUX_uxn_opcodes_h_l1111_c7_fca7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c7_fca7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c7_fca7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c7_fca7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c7_fca7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c7_fca7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c7_fca7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1111_c7_fca7
result_is_opc_done_MUX_uxn_opcodes_h_l1111_c7_fca7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1111_c7_fca7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1111_c7_fca7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1111_c7_fca7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1111_c7_fca7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1111_c7_fca7
result_is_stack_write_MUX_uxn_opcodes_h_l1111_c7_fca7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1111_c7_fca7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1111_c7_fca7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1111_c7_fca7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1111_c7_fca7_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1111_c7_fca7
result_ram_addr_MUX_uxn_opcodes_h_l1111_c7_fca7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1111_c7_fca7_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1111_c7_fca7_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1111_c7_fca7_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1111_c7_fca7_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1111_c7_fca7
result_stack_value_MUX_uxn_opcodes_h_l1111_c7_fca7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1111_c7_fca7_cond,
result_stack_value_MUX_uxn_opcodes_h_l1111_c7_fca7_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1111_c7_fca7_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1111_c7_fca7_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1111_c7_fca7
result_is_ram_read_MUX_uxn_opcodes_h_l1111_c7_fca7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1111_c7_fca7_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1111_c7_fca7_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1111_c7_fca7_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1111_c7_fca7_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1113_c21_64e4
BIN_OP_PLUS_uxn_opcodes_h_l1113_c21_64e4 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1113_c21_64e4_left,
BIN_OP_PLUS_uxn_opcodes_h_l1113_c21_64e4_right,
BIN_OP_PLUS_uxn_opcodes_h_l1113_c21_64e4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1115_c11_ac27
BIN_OP_EQ_uxn_opcodes_h_l1115_c11_ac27 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1115_c11_ac27_left,
BIN_OP_EQ_uxn_opcodes_h_l1115_c11_ac27_right,
BIN_OP_EQ_uxn_opcodes_h_l1115_c11_ac27_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1115_c7_fe0f
tmp16_MUX_uxn_opcodes_h_l1115_c7_fe0f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1115_c7_fe0f_cond,
tmp16_MUX_uxn_opcodes_h_l1115_c7_fe0f_iftrue,
tmp16_MUX_uxn_opcodes_h_l1115_c7_fe0f_iffalse,
tmp16_MUX_uxn_opcodes_h_l1115_c7_fe0f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1115_c7_fe0f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1115_c7_fe0f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1115_c7_fe0f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1115_c7_fe0f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1115_c7_fe0f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1115_c7_fe0f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1115_c7_fe0f
result_is_opc_done_MUX_uxn_opcodes_h_l1115_c7_fe0f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1115_c7_fe0f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1115_c7_fe0f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1115_c7_fe0f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1115_c7_fe0f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1115_c7_fe0f
result_is_stack_write_MUX_uxn_opcodes_h_l1115_c7_fe0f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1115_c7_fe0f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1115_c7_fe0f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1115_c7_fe0f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1115_c7_fe0f_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1115_c7_fe0f
result_stack_value_MUX_uxn_opcodes_h_l1115_c7_fe0f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1115_c7_fe0f_cond,
result_stack_value_MUX_uxn_opcodes_h_l1115_c7_fe0f_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1115_c7_fe0f_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1115_c7_fe0f_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1115_c7_fe0f
result_is_ram_read_MUX_uxn_opcodes_h_l1115_c7_fe0f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1115_c7_fe0f_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1115_c7_fe0f_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1115_c7_fe0f_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1115_c7_fe0f_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1116_c3_0882
BIN_OP_OR_uxn_opcodes_h_l1116_c3_0882 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1116_c3_0882_left,
BIN_OP_OR_uxn_opcodes_h_l1116_c3_0882_right,
BIN_OP_OR_uxn_opcodes_h_l1116_c3_0882_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1122_c11_bfed
BIN_OP_EQ_uxn_opcodes_h_l1122_c11_bfed : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1122_c11_bfed_left,
BIN_OP_EQ_uxn_opcodes_h_l1122_c11_bfed_right,
BIN_OP_EQ_uxn_opcodes_h_l1122_c11_bfed_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1122_c7_f919
result_is_stack_write_MUX_uxn_opcodes_h_l1122_c7_f919 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1122_c7_f919_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1122_c7_f919_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1122_c7_f919_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1122_c7_f919_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1122_c7_f919
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1122_c7_f919 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1122_c7_f919_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1122_c7_f919_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1122_c7_f919_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1122_c7_f919_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1122_c7_f919
result_is_opc_done_MUX_uxn_opcodes_h_l1122_c7_f919 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1122_c7_f919_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1122_c7_f919_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1122_c7_f919_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1122_c7_f919_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1122_c7_f919
result_stack_value_MUX_uxn_opcodes_h_l1122_c7_f919 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1122_c7_f919_cond,
result_stack_value_MUX_uxn_opcodes_h_l1122_c7_f919_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1122_c7_f919_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1122_c7_f919_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1125_c34_3bef
CONST_SR_8_uxn_opcodes_h_l1125_c34_3bef : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1125_c34_3bef_x,
CONST_SR_8_uxn_opcodes_h_l1125_c34_3bef_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1127_c11_954b
BIN_OP_EQ_uxn_opcodes_h_l1127_c11_954b : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1127_c11_954b_left,
BIN_OP_EQ_uxn_opcodes_h_l1127_c11_954b_right,
BIN_OP_EQ_uxn_opcodes_h_l1127_c11_954b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_8968
result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_8968 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_8968_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_8968_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_8968_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_8968_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_8968
result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_8968 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_8968_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_8968_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_8968_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_8968_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1067_c6_7986_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_3536_return_output,
 tmp16_MUX_uxn_opcodes_h_l1067_c2_4eda_return_output,
 t16_MUX_uxn_opcodes_h_l1067_c2_4eda_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1067_c2_4eda_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1067_c2_4eda_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1067_c2_4eda_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1067_c2_4eda_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1067_c2_4eda_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1067_c2_4eda_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1067_c2_4eda_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c2_4eda_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c2_4eda_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1067_c2_4eda_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c2_4eda_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1075_c11_aa55_return_output,
 tmp16_MUX_uxn_opcodes_h_l1075_c7_3b5b_return_output,
 t16_MUX_uxn_opcodes_h_l1075_c7_3b5b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_3b5b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_3b5b_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1075_c7_3b5b_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1075_c7_3b5b_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1075_c7_3b5b_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1075_c7_3b5b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_3b5b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_3b5b_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1075_c7_3b5b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_3b5b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1079_c11_1b35_return_output,
 tmp16_MUX_uxn_opcodes_h_l1079_c7_4047_return_output,
 t16_MUX_uxn_opcodes_h_l1079_c7_4047_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_4047_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1079_c7_4047_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1079_c7_4047_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1079_c7_4047_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1079_c7_4047_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1079_c7_4047_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c7_4047_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_4047_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1079_c7_4047_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1079_c7_4047_return_output,
 CONST_SL_8_uxn_opcodes_h_l1081_c3_9b06_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1085_c11_a067_return_output,
 tmp16_MUX_uxn_opcodes_h_l1085_c7_e5d1_return_output,
 t16_MUX_uxn_opcodes_h_l1085_c7_e5d1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_e5d1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1085_c7_e5d1_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1085_c7_e5d1_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1085_c7_e5d1_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1085_c7_e5d1_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1085_c7_e5d1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1085_c7_e5d1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_e5d1_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1085_c7_e5d1_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1085_c7_e5d1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1089_c11_9705_return_output,
 tmp16_MUX_uxn_opcodes_h_l1089_c7_f5d0_return_output,
 t16_MUX_uxn_opcodes_h_l1089_c7_f5d0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_f5d0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_f5d0_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1089_c7_f5d0_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1089_c7_f5d0_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1089_c7_f5d0_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1089_c7_f5d0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_f5d0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_f5d0_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1089_c7_f5d0_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_f5d0_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1090_c3_a0fc_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1093_c32_051b_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1093_c32_1100_return_output,
 MUX_uxn_opcodes_h_l1093_c32_fb96_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1095_c11_d2a4_return_output,
 tmp16_MUX_uxn_opcodes_h_l1095_c7_d101_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1095_c7_d101_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1095_c7_d101_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1095_c7_d101_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1095_c7_d101_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1095_c7_d101_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1095_c7_d101_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1095_c7_d101_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1095_c7_d101_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1101_c11_6767_return_output,
 tmp16_MUX_uxn_opcodes_h_l1101_c7_3dd7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_3dd7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_3dd7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_3dd7_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1101_c7_3dd7_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1101_c7_3dd7_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1101_c7_3dd7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1105_c11_455e_return_output,
 tmp16_MUX_uxn_opcodes_h_l1105_c7_bf68_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1105_c7_bf68_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1105_c7_bf68_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1105_c7_bf68_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1105_c7_bf68_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1105_c7_bf68_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1105_c7_bf68_return_output,
 CONST_SL_8_uxn_opcodes_h_l1107_c3_0ab6_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1109_c21_54f6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1111_c11_d305_return_output,
 tmp16_MUX_uxn_opcodes_h_l1111_c7_fca7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c7_fca7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1111_c7_fca7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1111_c7_fca7_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1111_c7_fca7_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1111_c7_fca7_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1111_c7_fca7_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1113_c21_64e4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1115_c11_ac27_return_output,
 tmp16_MUX_uxn_opcodes_h_l1115_c7_fe0f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1115_c7_fe0f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1115_c7_fe0f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1115_c7_fe0f_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1115_c7_fe0f_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1115_c7_fe0f_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1116_c3_0882_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1122_c11_bfed_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1122_c7_f919_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1122_c7_f919_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1122_c7_f919_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1122_c7_f919_return_output,
 CONST_SR_8_uxn_opcodes_h_l1125_c34_3bef_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1127_c11_954b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_8968_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_8968_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c6_7986_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c6_7986_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c6_7986_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_3536_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_3536_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_3536_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_3536_iffalse : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1067_c2_4eda_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1067_c2_4eda_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1075_c7_3b5b_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1067_c2_4eda_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1067_c2_4eda_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1067_c2_4eda_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1067_c2_4eda_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1075_c7_3b5b_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1067_c2_4eda_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1067_c2_4eda_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1067_c2_4eda_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1067_c2_4eda_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_3b5b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1067_c2_4eda_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1067_c2_4eda_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1067_c2_4eda_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1067_c2_4eda_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_3b5b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1067_c2_4eda_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1067_c2_4eda_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1067_c2_4eda_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1067_c2_4eda_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1075_c7_3b5b_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1067_c2_4eda_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1067_c2_4eda_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1067_c2_4eda_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1067_c2_4eda_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1075_c7_3b5b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1067_c2_4eda_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1067_c2_4eda_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1067_c2_4eda_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1067_c2_4eda_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1067_c2_4eda_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1067_c2_4eda_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1067_c2_4eda_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1067_c2_4eda_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1067_c2_4eda_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1075_c7_3b5b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1067_c2_4eda_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1067_c2_4eda_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1067_c2_4eda_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1067_c2_4eda_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1075_c7_3b5b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1067_c2_4eda_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1067_c2_4eda_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c2_4eda_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1071_c3_a259 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c2_4eda_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_3b5b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c2_4eda_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c2_4eda_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c2_4eda_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c2_4eda_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_3b5b_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c2_4eda_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c2_4eda_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1067_c2_4eda_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1067_c2_4eda_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1075_c7_3b5b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1067_c2_4eda_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1067_c2_4eda_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c2_4eda_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c2_4eda_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_3b5b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c2_4eda_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c2_4eda_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1068_c3_f6cc_uxn_opcodes_h_l1068_c3_f6cc_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1075_c11_aa55_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1075_c11_aa55_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1075_c11_aa55_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1075_c7_3b5b_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1075_c7_3b5b_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1079_c7_4047_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1075_c7_3b5b_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1075_c7_3b5b_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1075_c7_3b5b_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1079_c7_4047_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1075_c7_3b5b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_3b5b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_3b5b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_4047_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_3b5b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_3b5b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_3b5b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1079_c7_4047_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_3b5b_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1075_c7_3b5b_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1075_c7_3b5b_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1079_c7_4047_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1075_c7_3b5b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1075_c7_3b5b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1075_c7_3b5b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1079_c7_4047_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1075_c7_3b5b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1075_c7_3b5b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1075_c7_3b5b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1079_c7_4047_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1075_c7_3b5b_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1075_c7_3b5b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1075_c7_3b5b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1079_c7_4047_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1075_c7_3b5b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_3b5b_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_3b5b_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c7_4047_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_3b5b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_3b5b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1077_c3_ef68 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_3b5b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_4047_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_3b5b_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1075_c7_3b5b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1075_c7_3b5b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1079_c7_4047_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1075_c7_3b5b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_3b5b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_3b5b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1079_c7_4047_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_3b5b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1079_c11_1b35_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1079_c11_1b35_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1079_c11_1b35_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1079_c7_4047_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1079_c7_4047_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1085_c7_e5d1_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1079_c7_4047_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1079_c7_4047_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1079_c7_4047_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1085_c7_e5d1_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1079_c7_4047_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_4047_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_4047_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_e5d1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_4047_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1079_c7_4047_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1079_c7_4047_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1085_c7_e5d1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1079_c7_4047_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1079_c7_4047_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1079_c7_4047_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1085_c7_e5d1_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1079_c7_4047_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1079_c7_4047_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1079_c7_4047_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1085_c7_e5d1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1079_c7_4047_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1079_c7_4047_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1079_c7_4047_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1085_c7_e5d1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1079_c7_4047_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1079_c7_4047_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1079_c7_4047_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1085_c7_e5d1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1079_c7_4047_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c7_4047_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c7_4047_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1085_c7_e5d1_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c7_4047_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_4047_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1083_c3_eb3d : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_4047_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_e5d1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_4047_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1079_c7_4047_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1079_c7_4047_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1085_c7_e5d1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1079_c7_4047_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1079_c7_4047_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1079_c7_4047_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1085_c7_e5d1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1079_c7_4047_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1081_c3_9b06_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1081_c3_9b06_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1085_c11_a067_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1085_c11_a067_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1085_c11_a067_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1085_c7_e5d1_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1085_c7_e5d1_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1089_c7_f5d0_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1085_c7_e5d1_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1085_c7_e5d1_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1085_c7_e5d1_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1089_c7_f5d0_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1085_c7_e5d1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_e5d1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_e5d1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_f5d0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_e5d1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1085_c7_e5d1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1085_c7_e5d1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_f5d0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1085_c7_e5d1_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1085_c7_e5d1_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1085_c7_e5d1_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1089_c7_f5d0_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1085_c7_e5d1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1085_c7_e5d1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1085_c7_e5d1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1089_c7_f5d0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1085_c7_e5d1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1085_c7_e5d1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1085_c7_e5d1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1089_c7_f5d0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1085_c7_e5d1_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1085_c7_e5d1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1085_c7_e5d1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1089_c7_f5d0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1085_c7_e5d1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1085_c7_e5d1_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1085_c7_e5d1_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_f5d0_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1085_c7_e5d1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_e5d1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1087_c3_3b1c : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_e5d1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_f5d0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_e5d1_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1085_c7_e5d1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1085_c7_e5d1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1089_c7_f5d0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1085_c7_e5d1_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1085_c7_e5d1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1085_c7_e5d1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_f5d0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1085_c7_e5d1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1089_c11_9705_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1089_c11_9705_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1089_c11_9705_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1089_c7_f5d0_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1089_c7_f5d0_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1095_c7_d101_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1089_c7_f5d0_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1089_c7_f5d0_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1089_c7_f5d0_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1089_c7_f5d0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_f5d0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_f5d0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1095_c7_d101_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_f5d0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_f5d0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_f5d0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1095_c7_d101_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_f5d0_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1089_c7_f5d0_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1089_c7_f5d0_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1095_c7_d101_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1089_c7_f5d0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1089_c7_f5d0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1089_c7_f5d0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1095_c7_d101_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1089_c7_f5d0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1089_c7_f5d0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1089_c7_f5d0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1089_c7_f5d0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1089_c7_f5d0_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1089_c7_f5d0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1089_c7_f5d0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1095_c7_d101_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1089_c7_f5d0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_f5d0_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_f5d0_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_f5d0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_f5d0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_f5d0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1095_c7_d101_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_f5d0_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1089_c7_f5d0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1089_c7_f5d0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1095_c7_d101_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1089_c7_f5d0_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_f5d0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_f5d0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1095_c7_d101_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_f5d0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1090_c3_a0fc_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1090_c3_a0fc_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1090_c3_a0fc_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1093_c32_fb96_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1093_c32_fb96_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1093_c32_fb96_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1093_c32_051b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1093_c32_051b_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1093_c32_051b_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1093_c32_1100_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1093_c32_1100_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1093_c32_1100_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1093_c32_fb96_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1095_c11_d2a4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1095_c11_d2a4_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1095_c11_d2a4_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1095_c7_d101_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1095_c7_d101_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1101_c7_3dd7_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1095_c7_d101_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1095_c7_d101_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1095_c7_d101_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_3dd7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1095_c7_d101_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1095_c7_d101_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1095_c7_d101_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_3dd7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1095_c7_d101_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1095_c7_d101_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1095_c7_d101_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1101_c7_3dd7_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1095_c7_d101_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1095_c7_d101_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1095_c7_d101_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1101_c7_3dd7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1095_c7_d101_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1095_c7_d101_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1095_c7_d101_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1101_c7_3dd7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1095_c7_d101_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1095_c7_d101_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1095_c7_d101_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_3dd7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1095_c7_d101_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1095_c7_d101_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1095_c7_d101_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1095_c7_d101_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1095_c7_d101_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1095_c7_d101_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1095_c7_d101_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1101_c11_6767_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1101_c11_6767_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1101_c11_6767_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1101_c7_3dd7_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1101_c7_3dd7_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1105_c7_bf68_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1101_c7_3dd7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_3dd7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_3dd7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1105_c7_bf68_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_3dd7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_3dd7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_3dd7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1105_c7_bf68_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_3dd7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_3dd7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_3dd7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1105_c7_bf68_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_3dd7_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1101_c7_3dd7_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1101_c7_3dd7_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1105_c7_bf68_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1101_c7_3dd7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1101_c7_3dd7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1101_c7_3dd7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1105_c7_bf68_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1101_c7_3dd7_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1101_c7_3dd7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1101_c7_3dd7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1105_c7_bf68_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1101_c7_3dd7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1105_c11_455e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1105_c11_455e_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1105_c11_455e_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1105_c7_bf68_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1105_c7_bf68_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1111_c7_fca7_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1105_c7_bf68_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1105_c7_bf68_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1105_c7_bf68_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c7_fca7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1105_c7_bf68_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1105_c7_bf68_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1105_c7_bf68_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1111_c7_fca7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1105_c7_bf68_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1105_c7_bf68_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1105_c7_bf68_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1111_c7_fca7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1105_c7_bf68_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1105_c7_bf68_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l1109_c3_04aa : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1105_c7_bf68_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1111_c7_fca7_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1105_c7_bf68_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1105_c7_bf68_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1105_c7_bf68_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1111_c7_fca7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1105_c7_bf68_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1105_c7_bf68_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1105_c7_bf68_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1111_c7_fca7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1105_c7_bf68_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1107_c3_0ab6_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1107_c3_0ab6_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1109_c21_54f6_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1109_c21_54f6_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1109_c21_54f6_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c11_d305_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c11_d305_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c11_d305_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1111_c7_fca7_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1111_c7_fca7_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1115_c7_fe0f_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1111_c7_fca7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c7_fca7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c7_fca7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1115_c7_fe0f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c7_fca7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1111_c7_fca7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1111_c7_fca7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1115_c7_fe0f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1111_c7_fca7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1111_c7_fca7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1111_c7_fca7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1115_c7_fe0f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1111_c7_fca7_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1111_c7_fca7_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l1113_c3_895b : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1111_c7_fca7_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1111_c7_fca7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1111_c7_fca7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1111_c7_fca7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1115_c7_fe0f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1111_c7_fca7_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1111_c7_fca7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1111_c7_fca7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1115_c7_fe0f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1111_c7_fca7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1113_c21_64e4_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1113_c21_64e4_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1113_c21_64e4_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1115_c11_ac27_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1115_c11_ac27_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1115_c11_ac27_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1115_c7_fe0f_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1115_c7_fe0f_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1115_c7_fe0f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1115_c7_fe0f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1119_c3_fd4a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1115_c7_fe0f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1122_c7_f919_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1115_c7_fe0f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1115_c7_fe0f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1115_c7_fe0f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1122_c7_f919_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1115_c7_fe0f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1115_c7_fe0f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1115_c7_fe0f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1122_c7_f919_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1115_c7_fe0f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1115_c7_fe0f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1115_c7_fe0f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1122_c7_f919_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1115_c7_fe0f_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1115_c7_fe0f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1115_c7_fe0f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1115_c7_fe0f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1116_c3_0882_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1116_c3_0882_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1116_c3_0882_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1120_c24_e091_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1122_c11_bfed_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1122_c11_bfed_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1122_c11_bfed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1122_c7_f919_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1122_c7_f919_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_8968_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1122_c7_f919_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1122_c7_f919_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1124_c3_b436 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1122_c7_f919_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1122_c7_f919_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1122_c7_f919_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1122_c7_f919_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_8968_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1122_c7_f919_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1122_c7_f919_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1122_c7_f919_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1122_c7_f919_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1125_c34_3bef_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1125_c34_3bef_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1125_c24_27fa_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1127_c11_954b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1127_c11_954b_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1127_c11_954b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_8968_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_8968_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_8968_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_8968_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_8968_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_8968_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1089_l1085_l1079_l1111_l1075_l1067_DUPLICATE_7795_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1095_l1089_l1122_l1085_l1079_l1111_l1075_l1105_l1067_l1101_DUPLICATE_51e5_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1089_l1085_l1115_l1079_l1075_l1067_DUPLICATE_ce48_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1089_l1085_l1079_l1075_l1067_DUPLICATE_9a58_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1095_l1089_l1085_l1079_l1075_l1067_DUPLICATE_d550_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1095_l1085_l1079_l1075_l1067_DUPLICATE_1262_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1095_l1127_l1089_l1122_l1085_l1115_l1079_l1111_l1075_l1105_l1101_DUPLICATE_81ce_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1095_l1127_l1089_l1085_l1079_l1111_l1075_l1105_l1101_DUPLICATE_7a7c_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1080_l1090_DUPLICATE_05bb_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1095_l1089_l1122_l1111_l1105_l1101_DUPLICATE_4bfa_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1106_l1116_DUPLICATE_2810_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6002_uxn_opcodes_h_l1132_l1063_DUPLICATE_5a1d_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1101_c11_6767_right := to_unsigned(6, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1067_c2_4eda_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1079_c11_1b35_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1127_c11_954b_right := to_unsigned(11, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1095_c11_d2a4_right := to_unsigned(5, 3);
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1111_c7_fca7_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1087_c3_3b1c := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_e5d1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1087_c3_3b1c;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1067_c2_4eda_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1109_c21_54f6_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_8968_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l1093_c32_fb96_iftrue := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1105_c11_455e_right := to_unsigned(7, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1115_c7_fe0f_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_3536_iffalse := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1079_c7_4047_iftrue := to_unsigned(1, 1);
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1095_c7_d101_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1122_c7_f919_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1089_c11_9705_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1077_c3_ef68 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_3b5b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1077_c3_ef68;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1085_c7_e5d1_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l1093_c32_1100_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1085_c11_a067_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1124_c3_b436 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1122_c7_f919_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1124_c3_b436;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1101_c7_3dd7_iftrue := to_unsigned(1, 1);
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1105_c7_bf68_iftrue := to_unsigned(1, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1095_c7_d101_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1093_c32_fb96_iffalse := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_BIN_OP_AND_uxn_opcodes_h_l1093_c32_051b_right := to_unsigned(128, 8);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1095_c7_d101_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1075_c11_aa55_right := to_unsigned(1, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1067_c2_4eda_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1115_c7_fe0f_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1113_c21_64e4_right := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_8968_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1119_c3_fd4a := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1115_c7_fe0f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1119_c3_fd4a;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1071_c3_a259 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c2_4eda_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1071_c3_a259;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1083_c3_eb3d := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_4047_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1083_c3_eb3d;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1089_c7_f5d0_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1075_c7_3b5b_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1115_c11_ac27_right := to_unsigned(9, 4);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_f5d0_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1067_c2_4eda_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c11_d305_right := to_unsigned(8, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1122_c11_bfed_right := to_unsigned(10, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c6_7986_right := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_3536_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1093_c32_051b_left := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c6_7986_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1075_c11_aa55_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1079_c11_1b35_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1085_c11_a067_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1089_c11_9705_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1095_c11_d2a4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1101_c11_6767_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1105_c11_455e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c11_d305_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1115_c11_ac27_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1122_c11_bfed_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1127_c11_954b_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1090_c3_a0fc_left := t16;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1109_c21_54f6_left := t16;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1113_c21_64e4_left := t16;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1095_c7_d101_iftrue := t16;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1101_c7_3dd7_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1067_c2_4eda_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1075_c7_3b5b_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1085_c7_e5d1_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1089_c7_f5d0_iffalse := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1116_c3_0882_left := tmp16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1125_c34_3bef_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1067_c2_4eda_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1075_c7_3b5b_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1079_c7_4047_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1085_c7_e5d1_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1089_c7_f5d0_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1095_c7_d101_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1101_c7_3dd7_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1111_c7_fca7_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1115_c7_fe0f_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l1079_c11_1b35] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1079_c11_1b35_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1079_c11_1b35_left;
     BIN_OP_EQ_uxn_opcodes_h_l1079_c11_1b35_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1079_c11_1b35_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1079_c11_1b35_return_output := BIN_OP_EQ_uxn_opcodes_h_l1079_c11_1b35_return_output;

     -- result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d[uxn_opcodes_h_l1089_c7_f5d0] LATENCY=0
     VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1089_c7_f5d0_return_output := result.is_stack_read;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1095_l1127_l1089_l1122_l1085_l1115_l1079_l1111_l1075_l1105_l1101_DUPLICATE_81ce LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1095_l1127_l1089_l1122_l1085_l1115_l1079_l1111_l1075_l1105_l1101_DUPLICATE_81ce_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1095_l1089_l1122_l1111_l1105_l1101_DUPLICATE_4bfa LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1095_l1089_l1122_l1111_l1105_l1101_DUPLICATE_4bfa_return_output := result.stack_address_sp_offset;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1067_c2_4eda] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1067_c2_4eda_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l1095_c11_d2a4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1095_c11_d2a4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1095_c11_d2a4_left;
     BIN_OP_EQ_uxn_opcodes_h_l1095_c11_d2a4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1095_c11_d2a4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1095_c11_d2a4_return_output := BIN_OP_EQ_uxn_opcodes_h_l1095_c11_d2a4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1075_c11_aa55] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1075_c11_aa55_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1075_c11_aa55_left;
     BIN_OP_EQ_uxn_opcodes_h_l1075_c11_aa55_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1075_c11_aa55_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1075_c11_aa55_return_output := BIN_OP_EQ_uxn_opcodes_h_l1075_c11_aa55_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1067_c6_7986] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1067_c6_7986_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c6_7986_left;
     BIN_OP_EQ_uxn_opcodes_h_l1067_c6_7986_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c6_7986_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c6_7986_return_output := BIN_OP_EQ_uxn_opcodes_h_l1067_c6_7986_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1122_c11_bfed] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1122_c11_bfed_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1122_c11_bfed_left;
     BIN_OP_EQ_uxn_opcodes_h_l1122_c11_bfed_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1122_c11_bfed_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1122_c11_bfed_return_output := BIN_OP_EQ_uxn_opcodes_h_l1122_c11_bfed_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1089_l1085_l1079_l1075_l1067_DUPLICATE_9a58 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1089_l1085_l1079_l1075_l1067_DUPLICATE_9a58_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1127_c11_954b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1127_c11_954b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1127_c11_954b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1127_c11_954b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1127_c11_954b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1127_c11_954b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1127_c11_954b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1115_c11_ac27] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1115_c11_ac27_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1115_c11_ac27_left;
     BIN_OP_EQ_uxn_opcodes_h_l1115_c11_ac27_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1115_c11_ac27_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1115_c11_ac27_return_output := BIN_OP_EQ_uxn_opcodes_h_l1115_c11_ac27_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1106_l1116_DUPLICATE_2810 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1106_l1116_DUPLICATE_2810_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1095_l1089_l1085_l1079_l1075_l1067_DUPLICATE_d550 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1095_l1089_l1085_l1079_l1075_l1067_DUPLICATE_d550_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1085_c11_a067] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1085_c11_a067_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1085_c11_a067_left;
     BIN_OP_EQ_uxn_opcodes_h_l1085_c11_a067_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1085_c11_a067_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1085_c11_a067_return_output := BIN_OP_EQ_uxn_opcodes_h_l1085_c11_a067_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1089_l1085_l1079_l1111_l1075_l1067_DUPLICATE_7795 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1089_l1085_l1079_l1111_l1075_l1067_DUPLICATE_7795_return_output := result.ram_addr;

     -- CONST_SR_8[uxn_opcodes_h_l1125_c34_3bef] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1125_c34_3bef_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1125_c34_3bef_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1125_c34_3bef_return_output := CONST_SR_8_uxn_opcodes_h_l1125_c34_3bef_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1089_c11_9705] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1089_c11_9705_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1089_c11_9705_left;
     BIN_OP_EQ_uxn_opcodes_h_l1089_c11_9705_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1089_c11_9705_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1089_c11_9705_return_output := BIN_OP_EQ_uxn_opcodes_h_l1089_c11_9705_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1111_c11_d305] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1111_c11_d305_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c11_d305_left;
     BIN_OP_EQ_uxn_opcodes_h_l1111_c11_d305_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c11_d305_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c11_d305_return_output := BIN_OP_EQ_uxn_opcodes_h_l1111_c11_d305_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l1093_c32_051b] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1093_c32_051b_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1093_c32_051b_left;
     BIN_OP_AND_uxn_opcodes_h_l1093_c32_051b_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1093_c32_051b_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1093_c32_051b_return_output := BIN_OP_AND_uxn_opcodes_h_l1093_c32_051b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1105_c11_455e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1105_c11_455e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1105_c11_455e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1105_c11_455e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1105_c11_455e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1105_c11_455e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1105_c11_455e_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1113_c21_64e4] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1113_c21_64e4_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1113_c21_64e4_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1113_c21_64e4_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1113_c21_64e4_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1113_c21_64e4_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1113_c21_64e4_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1095_l1085_l1079_l1075_l1067_DUPLICATE_1262 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1095_l1085_l1079_l1075_l1067_DUPLICATE_1262_return_output := result.is_sp_shift;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1080_l1090_DUPLICATE_05bb LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1080_l1090_DUPLICATE_05bb_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1095_l1127_l1089_l1085_l1079_l1111_l1075_l1105_l1101_DUPLICATE_7a7c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1095_l1127_l1089_l1085_l1079_l1111_l1075_l1105_l1101_DUPLICATE_7a7c_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1101_c11_6767] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1101_c11_6767_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1101_c11_6767_left;
     BIN_OP_EQ_uxn_opcodes_h_l1101_c11_6767_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1101_c11_6767_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1101_c11_6767_return_output := BIN_OP_EQ_uxn_opcodes_h_l1101_c11_6767_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1089_l1085_l1115_l1079_l1075_l1067_DUPLICATE_ce48 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1089_l1085_l1115_l1079_l1075_l1067_DUPLICATE_ce48_return_output := result.is_ram_read;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1095_l1089_l1122_l1085_l1079_l1111_l1075_l1105_l1067_l1101_DUPLICATE_51e5 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1095_l1089_l1122_l1085_l1079_l1111_l1075_l1105_l1067_l1101_DUPLICATE_51e5_return_output := result.stack_value;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1109_c21_54f6] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1109_c21_54f6_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1109_c21_54f6_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1109_c21_54f6_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1109_c21_54f6_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1109_c21_54f6_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1109_c21_54f6_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1093_c32_1100_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1093_c32_051b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_3536_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c6_7986_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1067_c2_4eda_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c6_7986_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1067_c2_4eda_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c6_7986_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1067_c2_4eda_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c6_7986_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c2_4eda_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c6_7986_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1067_c2_4eda_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c6_7986_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1067_c2_4eda_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c6_7986_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1067_c2_4eda_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c6_7986_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1067_c2_4eda_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c6_7986_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c2_4eda_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c6_7986_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c2_4eda_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c6_7986_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1067_c2_4eda_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c6_7986_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1067_c2_4eda_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c6_7986_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1067_c2_4eda_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c6_7986_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_3b5b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1075_c11_aa55_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1075_c7_3b5b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1075_c11_aa55_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1075_c7_3b5b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1075_c11_aa55_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_3b5b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1075_c11_aa55_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1075_c7_3b5b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1075_c11_aa55_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_3b5b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1075_c11_aa55_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1075_c7_3b5b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1075_c11_aa55_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_3b5b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1075_c11_aa55_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_3b5b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1075_c11_aa55_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1075_c7_3b5b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1075_c11_aa55_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1075_c7_3b5b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1075_c11_aa55_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1075_c7_3b5b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1075_c11_aa55_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_4047_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1079_c11_1b35_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1079_c7_4047_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1079_c11_1b35_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1079_c7_4047_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1079_c11_1b35_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1079_c7_4047_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1079_c11_1b35_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1079_c7_4047_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1079_c11_1b35_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1079_c7_4047_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1079_c11_1b35_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1079_c7_4047_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1079_c11_1b35_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c7_4047_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1079_c11_1b35_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_4047_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1079_c11_1b35_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1079_c7_4047_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1079_c11_1b35_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1079_c7_4047_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1079_c11_1b35_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1079_c7_4047_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1079_c11_1b35_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_e5d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1085_c11_a067_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1085_c7_e5d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1085_c11_a067_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1085_c7_e5d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1085_c11_a067_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1085_c7_e5d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1085_c11_a067_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1085_c7_e5d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1085_c11_a067_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1085_c7_e5d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1085_c11_a067_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1085_c7_e5d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1085_c11_a067_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1085_c7_e5d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1085_c11_a067_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_e5d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1085_c11_a067_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1085_c7_e5d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1085_c11_a067_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1085_c7_e5d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1085_c11_a067_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1085_c7_e5d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1085_c11_a067_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_f5d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1089_c11_9705_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1089_c7_f5d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1089_c11_9705_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1089_c7_f5d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1089_c11_9705_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_f5d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1089_c11_9705_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1089_c7_f5d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1089_c11_9705_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_f5d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1089_c11_9705_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1089_c7_f5d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1089_c11_9705_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_f5d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1089_c11_9705_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_f5d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1089_c11_9705_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1089_c7_f5d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1089_c11_9705_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1089_c7_f5d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1089_c11_9705_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1089_c7_f5d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1089_c11_9705_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1095_c7_d101_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1095_c11_d2a4_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1095_c7_d101_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1095_c11_d2a4_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1095_c7_d101_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1095_c11_d2a4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1095_c7_d101_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1095_c11_d2a4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1095_c7_d101_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1095_c11_d2a4_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1095_c7_d101_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1095_c11_d2a4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1095_c7_d101_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1095_c11_d2a4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1095_c7_d101_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1095_c11_d2a4_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1095_c7_d101_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1095_c11_d2a4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_3dd7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1101_c11_6767_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1101_c7_3dd7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1101_c11_6767_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_3dd7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1101_c11_6767_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1101_c7_3dd7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1101_c11_6767_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_3dd7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1101_c11_6767_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1101_c7_3dd7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1101_c11_6767_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1101_c7_3dd7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1101_c11_6767_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1105_c7_bf68_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1105_c11_455e_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1105_c7_bf68_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1105_c11_455e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1105_c7_bf68_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1105_c11_455e_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1105_c7_bf68_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1105_c11_455e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1105_c7_bf68_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1105_c11_455e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1105_c7_bf68_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1105_c11_455e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1105_c7_bf68_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1105_c11_455e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1111_c7_fca7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c11_d305_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1111_c7_fca7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c11_d305_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1111_c7_fca7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c11_d305_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1111_c7_fca7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c11_d305_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c7_fca7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c11_d305_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1111_c7_fca7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c11_d305_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1111_c7_fca7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c11_d305_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1115_c7_fe0f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1115_c11_ac27_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1115_c7_fe0f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1115_c11_ac27_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1115_c7_fe0f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1115_c11_ac27_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1115_c7_fe0f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1115_c11_ac27_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1115_c7_fe0f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1115_c11_ac27_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1115_c7_fe0f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1115_c11_ac27_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1122_c7_f919_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1122_c11_bfed_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1122_c7_f919_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1122_c11_bfed_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1122_c7_f919_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1122_c11_bfed_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1122_c7_f919_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1122_c11_bfed_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_8968_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1127_c11_954b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_8968_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1127_c11_954b_return_output;
     VAR_result_ram_addr_uxn_opcodes_h_l1109_c3_04aa := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1109_c21_54f6_return_output, 16);
     VAR_result_ram_addr_uxn_opcodes_h_l1113_c3_895b := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1113_c21_64e4_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l1090_c3_a0fc_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1080_l1090_DUPLICATE_05bb_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1081_c3_9b06_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1080_l1090_DUPLICATE_05bb_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1116_c3_0882_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1106_l1116_DUPLICATE_2810_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1107_c3_0ab6_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1106_l1116_DUPLICATE_2810_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c2_4eda_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1089_l1085_l1079_l1075_l1067_DUPLICATE_9a58_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_3b5b_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1089_l1085_l1079_l1075_l1067_DUPLICATE_9a58_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c7_4047_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1089_l1085_l1079_l1075_l1067_DUPLICATE_9a58_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1085_c7_e5d1_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1089_l1085_l1079_l1075_l1067_DUPLICATE_9a58_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_f5d0_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1089_l1085_l1079_l1075_l1067_DUPLICATE_9a58_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1067_c2_4eda_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1089_l1085_l1079_l1111_l1075_l1067_DUPLICATE_7795_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1075_c7_3b5b_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1089_l1085_l1079_l1111_l1075_l1067_DUPLICATE_7795_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1079_c7_4047_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1089_l1085_l1079_l1111_l1075_l1067_DUPLICATE_7795_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1085_c7_e5d1_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1089_l1085_l1079_l1111_l1075_l1067_DUPLICATE_7795_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1089_c7_f5d0_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1089_l1085_l1079_l1111_l1075_l1067_DUPLICATE_7795_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1111_c7_fca7_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1089_l1085_l1079_l1111_l1075_l1067_DUPLICATE_7795_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_3b5b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1095_l1127_l1089_l1122_l1085_l1115_l1079_l1111_l1075_l1105_l1101_DUPLICATE_81ce_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_4047_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1095_l1127_l1089_l1122_l1085_l1115_l1079_l1111_l1075_l1105_l1101_DUPLICATE_81ce_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_e5d1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1095_l1127_l1089_l1122_l1085_l1115_l1079_l1111_l1075_l1105_l1101_DUPLICATE_81ce_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_f5d0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1095_l1127_l1089_l1122_l1085_l1115_l1079_l1111_l1075_l1105_l1101_DUPLICATE_81ce_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1095_c7_d101_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1095_l1127_l1089_l1122_l1085_l1115_l1079_l1111_l1075_l1105_l1101_DUPLICATE_81ce_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_3dd7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1095_l1127_l1089_l1122_l1085_l1115_l1079_l1111_l1075_l1105_l1101_DUPLICATE_81ce_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1105_c7_bf68_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1095_l1127_l1089_l1122_l1085_l1115_l1079_l1111_l1075_l1105_l1101_DUPLICATE_81ce_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1111_c7_fca7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1095_l1127_l1089_l1122_l1085_l1115_l1079_l1111_l1075_l1105_l1101_DUPLICATE_81ce_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1115_c7_fe0f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1095_l1127_l1089_l1122_l1085_l1115_l1079_l1111_l1075_l1105_l1101_DUPLICATE_81ce_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1122_c7_f919_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1095_l1127_l1089_l1122_l1085_l1115_l1079_l1111_l1075_l1105_l1101_DUPLICATE_81ce_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_8968_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1095_l1127_l1089_l1122_l1085_l1115_l1079_l1111_l1075_l1105_l1101_DUPLICATE_81ce_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1067_c2_4eda_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1089_l1085_l1115_l1079_l1075_l1067_DUPLICATE_ce48_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1075_c7_3b5b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1089_l1085_l1115_l1079_l1075_l1067_DUPLICATE_ce48_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1079_c7_4047_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1089_l1085_l1115_l1079_l1075_l1067_DUPLICATE_ce48_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1085_c7_e5d1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1089_l1085_l1115_l1079_l1075_l1067_DUPLICATE_ce48_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1089_c7_f5d0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1089_l1085_l1115_l1079_l1075_l1067_DUPLICATE_ce48_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1115_c7_fe0f_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1089_l1085_l1115_l1079_l1075_l1067_DUPLICATE_ce48_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1067_c2_4eda_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1095_l1089_l1085_l1079_l1075_l1067_DUPLICATE_d550_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1075_c7_3b5b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1095_l1089_l1085_l1079_l1075_l1067_DUPLICATE_d550_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1079_c7_4047_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1095_l1089_l1085_l1079_l1075_l1067_DUPLICATE_d550_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1085_c7_e5d1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1095_l1089_l1085_l1079_l1075_l1067_DUPLICATE_d550_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1089_c7_f5d0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1095_l1089_l1085_l1079_l1075_l1067_DUPLICATE_d550_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1095_c7_d101_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1095_l1089_l1085_l1079_l1075_l1067_DUPLICATE_d550_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c2_4eda_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1095_l1085_l1079_l1075_l1067_DUPLICATE_1262_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_3b5b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1095_l1085_l1079_l1075_l1067_DUPLICATE_1262_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1079_c7_4047_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1095_l1085_l1079_l1075_l1067_DUPLICATE_1262_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1085_c7_e5d1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1095_l1085_l1079_l1075_l1067_DUPLICATE_1262_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1095_c7_d101_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1095_l1085_l1079_l1075_l1067_DUPLICATE_1262_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_3b5b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1095_l1127_l1089_l1085_l1079_l1111_l1075_l1105_l1101_DUPLICATE_7a7c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1079_c7_4047_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1095_l1127_l1089_l1085_l1079_l1111_l1075_l1105_l1101_DUPLICATE_7a7c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1085_c7_e5d1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1095_l1127_l1089_l1085_l1079_l1111_l1075_l1105_l1101_DUPLICATE_7a7c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_f5d0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1095_l1127_l1089_l1085_l1079_l1111_l1075_l1105_l1101_DUPLICATE_7a7c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1095_c7_d101_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1095_l1127_l1089_l1085_l1079_l1111_l1075_l1105_l1101_DUPLICATE_7a7c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_3dd7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1095_l1127_l1089_l1085_l1079_l1111_l1075_l1105_l1101_DUPLICATE_7a7c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1105_c7_bf68_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1095_l1127_l1089_l1085_l1079_l1111_l1075_l1105_l1101_DUPLICATE_7a7c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1111_c7_fca7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1095_l1127_l1089_l1085_l1079_l1111_l1075_l1105_l1101_DUPLICATE_7a7c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_8968_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1095_l1127_l1089_l1085_l1079_l1111_l1075_l1105_l1101_DUPLICATE_7a7c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_f5d0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1095_l1089_l1122_l1111_l1105_l1101_DUPLICATE_4bfa_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1095_c7_d101_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1095_l1089_l1122_l1111_l1105_l1101_DUPLICATE_4bfa_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_3dd7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1095_l1089_l1122_l1111_l1105_l1101_DUPLICATE_4bfa_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1105_c7_bf68_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1095_l1089_l1122_l1111_l1105_l1101_DUPLICATE_4bfa_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c7_fca7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1095_l1089_l1122_l1111_l1105_l1101_DUPLICATE_4bfa_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1122_c7_f919_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1095_l1089_l1122_l1111_l1105_l1101_DUPLICATE_4bfa_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1067_c2_4eda_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1095_l1089_l1122_l1085_l1079_l1111_l1075_l1105_l1067_l1101_DUPLICATE_51e5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1075_c7_3b5b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1095_l1089_l1122_l1085_l1079_l1111_l1075_l1105_l1067_l1101_DUPLICATE_51e5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1079_c7_4047_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1095_l1089_l1122_l1085_l1079_l1111_l1075_l1105_l1067_l1101_DUPLICATE_51e5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1085_c7_e5d1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1095_l1089_l1122_l1085_l1079_l1111_l1075_l1105_l1067_l1101_DUPLICATE_51e5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1089_c7_f5d0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1095_l1089_l1122_l1085_l1079_l1111_l1075_l1105_l1067_l1101_DUPLICATE_51e5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1095_c7_d101_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1095_l1089_l1122_l1085_l1079_l1111_l1075_l1105_l1067_l1101_DUPLICATE_51e5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1101_c7_3dd7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1095_l1089_l1122_l1085_l1079_l1111_l1075_l1105_l1067_l1101_DUPLICATE_51e5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1105_c7_bf68_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1095_l1089_l1122_l1085_l1079_l1111_l1075_l1105_l1067_l1101_DUPLICATE_51e5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1111_c7_fca7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1095_l1089_l1122_l1085_l1079_l1111_l1075_l1105_l1067_l1101_DUPLICATE_51e5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1122_c7_f919_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1095_l1089_l1122_l1085_l1079_l1111_l1075_l1105_l1067_l1101_DUPLICATE_51e5_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1067_c2_4eda_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1067_c2_4eda_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1089_c7_f5d0_iffalse := VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1089_c7_f5d0_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1105_c7_bf68_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l1109_c3_04aa;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1111_c7_fca7_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l1113_c3_895b;
     -- CAST_TO_uint8_t[uxn_opcodes_h_l1125_c24_27fa] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1125_c24_27fa_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1125_c34_3bef_return_output);

     -- BIN_OP_GT[uxn_opcodes_h_l1093_c32_1100] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1093_c32_1100_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1093_c32_1100_left;
     BIN_OP_GT_uxn_opcodes_h_l1093_c32_1100_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1093_c32_1100_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1093_c32_1100_return_output := BIN_OP_GT_uxn_opcodes_h_l1093_c32_1100_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l1081_c3_9b06] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1081_c3_9b06_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1081_c3_9b06_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1081_c3_9b06_return_output := CONST_SL_8_uxn_opcodes_h_l1081_c3_9b06_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1067_c1_3536] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_3536_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_3536_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_3536_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_3536_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_3536_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_3536_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_3536_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_3536_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1122_c7_f919] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1122_c7_f919_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1122_c7_f919_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1122_c7_f919_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1122_c7_f919_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1122_c7_f919_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1122_c7_f919_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1122_c7_f919_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1122_c7_f919_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l1107_c3_0ab6] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1107_c3_0ab6_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1107_c3_0ab6_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1107_c3_0ab6_return_output := CONST_SL_8_uxn_opcodes_h_l1107_c3_0ab6_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1090_c3_a0fc] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1090_c3_a0fc_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1090_c3_a0fc_left;
     BIN_OP_OR_uxn_opcodes_h_l1090_c3_a0fc_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1090_c3_a0fc_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1090_c3_a0fc_return_output := BIN_OP_OR_uxn_opcodes_h_l1090_c3_a0fc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1127_c7_8968] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_8968_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_8968_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_8968_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_8968_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_8968_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_8968_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_8968_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_8968_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1111_c7_fca7] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1111_c7_fca7_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1111_c7_fca7_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1111_c7_fca7_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1111_c7_fca7_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1111_c7_fca7_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1111_c7_fca7_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1111_c7_fca7_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1111_c7_fca7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1127_c7_8968] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_8968_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_8968_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_8968_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_8968_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_8968_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_8968_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_8968_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_8968_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1095_c7_d101] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1095_c7_d101_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1095_c7_d101_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1095_c7_d101_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1095_c7_d101_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1095_c7_d101_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1095_c7_d101_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1095_c7_d101_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1095_c7_d101_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1067_c2_4eda] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1067_c2_4eda_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1067_c2_4eda_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1067_c2_4eda_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1067_c2_4eda_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1067_c2_4eda_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1067_c2_4eda_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1067_c2_4eda_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1067_c2_4eda_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1089_c7_f5d0] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1089_c7_f5d0_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1089_c7_f5d0_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1089_c7_f5d0_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1089_c7_f5d0_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1089_c7_f5d0_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1089_c7_f5d0_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1089_c7_f5d0_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1089_c7_f5d0_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1095_c7_d101] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1095_c7_d101_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1095_c7_d101_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1095_c7_d101_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1095_c7_d101_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1095_c7_d101_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1095_c7_d101_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1095_c7_d101_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1095_c7_d101_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1116_c3_0882] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1116_c3_0882_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1116_c3_0882_left;
     BIN_OP_OR_uxn_opcodes_h_l1116_c3_0882_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1116_c3_0882_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1116_c3_0882_return_output := BIN_OP_OR_uxn_opcodes_h_l1116_c3_0882_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1115_c7_fe0f] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1115_c7_fe0f_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1115_c7_fe0f_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1115_c7_fe0f_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1115_c7_fe0f_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1115_c7_fe0f_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1115_c7_fe0f_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1115_c7_fe0f_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1115_c7_fe0f_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1093_c32_fb96_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1093_c32_1100_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1089_c7_f5d0_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1090_c3_a0fc_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1115_c7_fe0f_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1116_c3_0882_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1122_c7_f919_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1125_c24_27fa_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1079_c7_4047_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1081_c3_9b06_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1105_c7_bf68_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1107_c3_0ab6_return_output;
     VAR_printf_uxn_opcodes_h_l1068_c3_f6cc_uxn_opcodes_h_l1068_c3_f6cc_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_3536_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1122_c7_f919_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_8968_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1111_c7_fca7_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1115_c7_fe0f_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1089_c7_f5d0_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1095_c7_d101_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_f5d0_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1095_c7_d101_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1085_c7_e5d1_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1089_c7_f5d0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1122_c7_f919_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_8968_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1105_c7_bf68_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1111_c7_fca7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1115_c7_fe0f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1122_c7_f919_return_output;
     -- printf_uxn_opcodes_h_l1068_c3_f6cc[uxn_opcodes_h_l1068_c3_f6cc] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1068_c3_f6cc_uxn_opcodes_h_l1068_c3_f6cc_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1068_c3_f6cc_uxn_opcodes_h_l1068_c3_f6cc_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1089_c7_f5d0] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_f5d0_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_f5d0_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_f5d0_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_f5d0_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_f5d0_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_f5d0_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_f5d0_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_f5d0_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1122_c7_f919] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1122_c7_f919_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1122_c7_f919_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1122_c7_f919_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1122_c7_f919_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1122_c7_f919_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1122_c7_f919_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1122_c7_f919_return_output := result_stack_value_MUX_uxn_opcodes_h_l1122_c7_f919_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1089_c7_f5d0] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1089_c7_f5d0_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1089_c7_f5d0_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1089_c7_f5d0_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1089_c7_f5d0_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1089_c7_f5d0_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1089_c7_f5d0_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1089_c7_f5d0_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1089_c7_f5d0_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1111_c7_fca7] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1111_c7_fca7_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1111_c7_fca7_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1111_c7_fca7_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1111_c7_fca7_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1111_c7_fca7_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1111_c7_fca7_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1111_c7_fca7_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1111_c7_fca7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1115_c7_fe0f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1115_c7_fe0f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1115_c7_fe0f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1115_c7_fe0f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1115_c7_fe0f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1115_c7_fe0f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1115_c7_fe0f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1115_c7_fe0f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1115_c7_fe0f_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1120_c24_e091] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1120_c24_e091_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_OR_uxn_opcodes_h_l1116_c3_0882_return_output);

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1122_c7_f919] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1122_c7_f919_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1122_c7_f919_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1122_c7_f919_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1122_c7_f919_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1122_c7_f919_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1122_c7_f919_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1122_c7_f919_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1122_c7_f919_return_output;

     -- t16_MUX[uxn_opcodes_h_l1089_c7_f5d0] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1089_c7_f5d0_cond <= VAR_t16_MUX_uxn_opcodes_h_l1089_c7_f5d0_cond;
     t16_MUX_uxn_opcodes_h_l1089_c7_f5d0_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1089_c7_f5d0_iftrue;
     t16_MUX_uxn_opcodes_h_l1089_c7_f5d0_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1089_c7_f5d0_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1089_c7_f5d0_return_output := t16_MUX_uxn_opcodes_h_l1089_c7_f5d0_return_output;

     -- MUX[uxn_opcodes_h_l1093_c32_fb96] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1093_c32_fb96_cond <= VAR_MUX_uxn_opcodes_h_l1093_c32_fb96_cond;
     MUX_uxn_opcodes_h_l1093_c32_fb96_iftrue <= VAR_MUX_uxn_opcodes_h_l1093_c32_fb96_iftrue;
     MUX_uxn_opcodes_h_l1093_c32_fb96_iffalse <= VAR_MUX_uxn_opcodes_h_l1093_c32_fb96_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1093_c32_fb96_return_output := MUX_uxn_opcodes_h_l1093_c32_fb96_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1115_c7_fe0f] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1115_c7_fe0f_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1115_c7_fe0f_cond;
     tmp16_MUX_uxn_opcodes_h_l1115_c7_fe0f_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1115_c7_fe0f_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1115_c7_fe0f_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1115_c7_fe0f_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1115_c7_fe0f_return_output := tmp16_MUX_uxn_opcodes_h_l1115_c7_fe0f_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1085_c7_e5d1] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1085_c7_e5d1_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1085_c7_e5d1_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1085_c7_e5d1_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1085_c7_e5d1_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1085_c7_e5d1_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1085_c7_e5d1_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1085_c7_e5d1_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1085_c7_e5d1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1122_c7_f919] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1122_c7_f919_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1122_c7_f919_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1122_c7_f919_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1122_c7_f919_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1122_c7_f919_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1122_c7_f919_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1122_c7_f919_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1122_c7_f919_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1105_c7_bf68] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1105_c7_bf68_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1105_c7_bf68_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1105_c7_bf68_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1105_c7_bf68_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1105_c7_bf68_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1105_c7_bf68_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1105_c7_bf68_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1105_c7_bf68_return_output;

     -- Submodule level 3
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1115_c7_fe0f_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1120_c24_e091_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_f5d0_iftrue := VAR_MUX_uxn_opcodes_h_l1093_c32_fb96_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1115_c7_fe0f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1122_c7_f919_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1105_c7_bf68_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1111_c7_fca7_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1085_c7_e5d1_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1089_c7_f5d0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1085_c7_e5d1_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1089_c7_f5d0_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1079_c7_4047_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1085_c7_e5d1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1115_c7_fe0f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1122_c7_f919_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1101_c7_3dd7_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1105_c7_bf68_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c7_fca7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1115_c7_fe0f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1115_c7_fe0f_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1122_c7_f919_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1085_c7_e5d1_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1089_c7_f5d0_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1111_c7_fca7_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1115_c7_fe0f_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l1085_c7_e5d1] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1085_c7_e5d1_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1085_c7_e5d1_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1085_c7_e5d1_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1085_c7_e5d1_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1085_c7_e5d1_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1085_c7_e5d1_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1085_c7_e5d1_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1085_c7_e5d1_return_output;

     -- t16_MUX[uxn_opcodes_h_l1085_c7_e5d1] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1085_c7_e5d1_cond <= VAR_t16_MUX_uxn_opcodes_h_l1085_c7_e5d1_cond;
     t16_MUX_uxn_opcodes_h_l1085_c7_e5d1_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1085_c7_e5d1_iftrue;
     t16_MUX_uxn_opcodes_h_l1085_c7_e5d1_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1085_c7_e5d1_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1085_c7_e5d1_return_output := t16_MUX_uxn_opcodes_h_l1085_c7_e5d1_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1115_c7_fe0f] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1115_c7_fe0f_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1115_c7_fe0f_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1115_c7_fe0f_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1115_c7_fe0f_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1115_c7_fe0f_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1115_c7_fe0f_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1115_c7_fe0f_return_output := result_stack_value_MUX_uxn_opcodes_h_l1115_c7_fe0f_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1111_c7_fca7] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1111_c7_fca7_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1111_c7_fca7_cond;
     tmp16_MUX_uxn_opcodes_h_l1111_c7_fca7_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1111_c7_fca7_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1111_c7_fca7_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1111_c7_fca7_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1111_c7_fca7_return_output := tmp16_MUX_uxn_opcodes_h_l1111_c7_fca7_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1105_c7_bf68] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1105_c7_bf68_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1105_c7_bf68_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1105_c7_bf68_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1105_c7_bf68_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1105_c7_bf68_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1105_c7_bf68_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1105_c7_bf68_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1105_c7_bf68_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1085_c7_e5d1] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1085_c7_e5d1_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1085_c7_e5d1_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1085_c7_e5d1_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1085_c7_e5d1_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1085_c7_e5d1_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1085_c7_e5d1_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1085_c7_e5d1_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1085_c7_e5d1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1115_c7_fe0f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1115_c7_fe0f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1115_c7_fe0f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1115_c7_fe0f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1115_c7_fe0f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1115_c7_fe0f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1115_c7_fe0f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1115_c7_fe0f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1115_c7_fe0f_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1079_c7_4047] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1079_c7_4047_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1079_c7_4047_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1079_c7_4047_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1079_c7_4047_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1079_c7_4047_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1079_c7_4047_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1079_c7_4047_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1079_c7_4047_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1089_c7_f5d0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_f5d0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_f5d0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_f5d0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_f5d0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_f5d0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_f5d0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_f5d0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_f5d0_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1101_c7_3dd7] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1101_c7_3dd7_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1101_c7_3dd7_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1101_c7_3dd7_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1101_c7_3dd7_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1101_c7_3dd7_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1101_c7_3dd7_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1101_c7_3dd7_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1101_c7_3dd7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1115_c7_fe0f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1115_c7_fe0f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1115_c7_fe0f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1115_c7_fe0f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1115_c7_fe0f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1115_c7_fe0f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1115_c7_fe0f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1115_c7_fe0f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1115_c7_fe0f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1111_c7_fca7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c7_fca7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c7_fca7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c7_fca7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c7_fca7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c7_fca7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c7_fca7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c7_fca7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c7_fca7_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1111_c7_fca7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1115_c7_fe0f_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1101_c7_3dd7_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1105_c7_bf68_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1079_c7_4047_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1085_c7_e5d1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1079_c7_4047_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1085_c7_e5d1_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1075_c7_3b5b_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1079_c7_4047_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1111_c7_fca7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1115_c7_fe0f_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1095_c7_d101_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1101_c7_3dd7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1085_c7_e5d1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1089_c7_f5d0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1105_c7_bf68_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c7_fca7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1111_c7_fca7_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1115_c7_fe0f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1079_c7_4047_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1085_c7_e5d1_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1105_c7_bf68_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1111_c7_fca7_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l1079_c7_4047] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1079_c7_4047_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1079_c7_4047_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1079_c7_4047_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1079_c7_4047_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1079_c7_4047_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1079_c7_4047_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1079_c7_4047_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1079_c7_4047_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1105_c7_bf68] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1105_c7_bf68_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1105_c7_bf68_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1105_c7_bf68_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1105_c7_bf68_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1105_c7_bf68_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1105_c7_bf68_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1105_c7_bf68_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1105_c7_bf68_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1085_c7_e5d1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1085_c7_e5d1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1085_c7_e5d1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1085_c7_e5d1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1085_c7_e5d1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1085_c7_e5d1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1085_c7_e5d1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1085_c7_e5d1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1085_c7_e5d1_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1111_c7_fca7] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1111_c7_fca7_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1111_c7_fca7_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1111_c7_fca7_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1111_c7_fca7_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1111_c7_fca7_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1111_c7_fca7_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1111_c7_fca7_return_output := result_stack_value_MUX_uxn_opcodes_h_l1111_c7_fca7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1111_c7_fca7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1111_c7_fca7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1111_c7_fca7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1111_c7_fca7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1111_c7_fca7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1111_c7_fca7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1111_c7_fca7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1111_c7_fca7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1111_c7_fca7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1111_c7_fca7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1111_c7_fca7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1111_c7_fca7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1111_c7_fca7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1111_c7_fca7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1111_c7_fca7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1111_c7_fca7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1111_c7_fca7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1111_c7_fca7_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1079_c7_4047] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1079_c7_4047_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1079_c7_4047_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1079_c7_4047_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1079_c7_4047_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1079_c7_4047_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1079_c7_4047_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1079_c7_4047_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1079_c7_4047_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1105_c7_bf68] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1105_c7_bf68_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1105_c7_bf68_cond;
     tmp16_MUX_uxn_opcodes_h_l1105_c7_bf68_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1105_c7_bf68_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1105_c7_bf68_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1105_c7_bf68_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1105_c7_bf68_return_output := tmp16_MUX_uxn_opcodes_h_l1105_c7_bf68_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1075_c7_3b5b] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1075_c7_3b5b_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1075_c7_3b5b_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1075_c7_3b5b_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1075_c7_3b5b_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1075_c7_3b5b_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1075_c7_3b5b_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1075_c7_3b5b_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1075_c7_3b5b_return_output;

     -- t16_MUX[uxn_opcodes_h_l1079_c7_4047] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1079_c7_4047_cond <= VAR_t16_MUX_uxn_opcodes_h_l1079_c7_4047_cond;
     t16_MUX_uxn_opcodes_h_l1079_c7_4047_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1079_c7_4047_iftrue;
     t16_MUX_uxn_opcodes_h_l1079_c7_4047_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1079_c7_4047_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1079_c7_4047_return_output := t16_MUX_uxn_opcodes_h_l1079_c7_4047_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1095_c7_d101] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1095_c7_d101_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1095_c7_d101_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1095_c7_d101_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1095_c7_d101_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1095_c7_d101_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1095_c7_d101_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1095_c7_d101_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1095_c7_d101_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1101_c7_3dd7] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1101_c7_3dd7_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1101_c7_3dd7_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1101_c7_3dd7_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1101_c7_3dd7_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1101_c7_3dd7_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1101_c7_3dd7_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1101_c7_3dd7_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1101_c7_3dd7_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1105_c7_bf68_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1111_c7_fca7_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1095_c7_d101_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1101_c7_3dd7_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1075_c7_3b5b_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1079_c7_4047_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_3b5b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1079_c7_4047_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1067_c2_4eda_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1075_c7_3b5b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1105_c7_bf68_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1111_c7_fca7_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1089_c7_f5d0_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1095_c7_d101_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c7_4047_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1085_c7_e5d1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_3dd7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1105_c7_bf68_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1105_c7_bf68_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1111_c7_fca7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1075_c7_3b5b_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1079_c7_4047_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1101_c7_3dd7_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1105_c7_bf68_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1075_c7_3b5b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_3b5b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_3b5b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_3b5b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_3b5b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_3b5b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_3b5b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_3b5b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_3b5b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1079_c7_4047] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c7_4047_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c7_4047_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c7_4047_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c7_4047_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c7_4047_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c7_4047_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c7_4047_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c7_4047_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1101_c7_3dd7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_3dd7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_3dd7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_3dd7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_3dd7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_3dd7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_3dd7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_3dd7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_3dd7_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1105_c7_bf68] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1105_c7_bf68_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1105_c7_bf68_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1105_c7_bf68_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1105_c7_bf68_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1105_c7_bf68_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1105_c7_bf68_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1105_c7_bf68_return_output := result_stack_value_MUX_uxn_opcodes_h_l1105_c7_bf68_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1095_c7_d101] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1095_c7_d101_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1095_c7_d101_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1095_c7_d101_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1095_c7_d101_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1095_c7_d101_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1095_c7_d101_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1095_c7_d101_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1095_c7_d101_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1067_c2_4eda] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1067_c2_4eda_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1067_c2_4eda_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1067_c2_4eda_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1067_c2_4eda_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1067_c2_4eda_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1067_c2_4eda_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1067_c2_4eda_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1067_c2_4eda_return_output;

     -- t16_MUX[uxn_opcodes_h_l1075_c7_3b5b] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1075_c7_3b5b_cond <= VAR_t16_MUX_uxn_opcodes_h_l1075_c7_3b5b_cond;
     t16_MUX_uxn_opcodes_h_l1075_c7_3b5b_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1075_c7_3b5b_iftrue;
     t16_MUX_uxn_opcodes_h_l1075_c7_3b5b_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1075_c7_3b5b_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1075_c7_3b5b_return_output := t16_MUX_uxn_opcodes_h_l1075_c7_3b5b_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1101_c7_3dd7] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1101_c7_3dd7_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1101_c7_3dd7_cond;
     tmp16_MUX_uxn_opcodes_h_l1101_c7_3dd7_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1101_c7_3dd7_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1101_c7_3dd7_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1101_c7_3dd7_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1101_c7_3dd7_return_output := tmp16_MUX_uxn_opcodes_h_l1101_c7_3dd7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1105_c7_bf68] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1105_c7_bf68_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1105_c7_bf68_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1105_c7_bf68_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1105_c7_bf68_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1105_c7_bf68_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1105_c7_bf68_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1105_c7_bf68_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1105_c7_bf68_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1075_c7_3b5b] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1075_c7_3b5b_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1075_c7_3b5b_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1075_c7_3b5b_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1075_c7_3b5b_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1075_c7_3b5b_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1075_c7_3b5b_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1075_c7_3b5b_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1075_c7_3b5b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1105_c7_bf68] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1105_c7_bf68_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1105_c7_bf68_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1105_c7_bf68_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1105_c7_bf68_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1105_c7_bf68_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1105_c7_bf68_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1105_c7_bf68_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1105_c7_bf68_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1089_c7_f5d0] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1089_c7_f5d0_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1089_c7_f5d0_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1089_c7_f5d0_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1089_c7_f5d0_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1089_c7_f5d0_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1089_c7_f5d0_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1089_c7_f5d0_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1089_c7_f5d0_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_3dd7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1105_c7_bf68_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1089_c7_f5d0_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1095_c7_d101_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1067_c2_4eda_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1075_c7_3b5b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c2_4eda_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_3b5b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_3dd7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1105_c7_bf68_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1085_c7_e5d1_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1089_c7_f5d0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_3b5b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c7_4047_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1095_c7_d101_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_3dd7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1101_c7_3dd7_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1105_c7_bf68_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1067_c2_4eda_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1075_c7_3b5b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1095_c7_d101_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1101_c7_3dd7_return_output;
     -- result_is_ram_read_MUX[uxn_opcodes_h_l1089_c7_f5d0] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1089_c7_f5d0_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1089_c7_f5d0_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1089_c7_f5d0_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1089_c7_f5d0_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1089_c7_f5d0_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1089_c7_f5d0_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1089_c7_f5d0_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1089_c7_f5d0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1075_c7_3b5b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_3b5b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_3b5b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_3b5b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_3b5b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_3b5b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_3b5b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_3b5b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_3b5b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1067_c2_4eda] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c2_4eda_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c2_4eda_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c2_4eda_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c2_4eda_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c2_4eda_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c2_4eda_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c2_4eda_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c2_4eda_return_output;

     -- t16_MUX[uxn_opcodes_h_l1067_c2_4eda] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1067_c2_4eda_cond <= VAR_t16_MUX_uxn_opcodes_h_l1067_c2_4eda_cond;
     t16_MUX_uxn_opcodes_h_l1067_c2_4eda_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1067_c2_4eda_iftrue;
     t16_MUX_uxn_opcodes_h_l1067_c2_4eda_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1067_c2_4eda_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1067_c2_4eda_return_output := t16_MUX_uxn_opcodes_h_l1067_c2_4eda_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1101_c7_3dd7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_3dd7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_3dd7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_3dd7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_3dd7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_3dd7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_3dd7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_3dd7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_3dd7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1095_c7_d101] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1095_c7_d101_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1095_c7_d101_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1095_c7_d101_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1095_c7_d101_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1095_c7_d101_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1095_c7_d101_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1095_c7_d101_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1095_c7_d101_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1095_c7_d101] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1095_c7_d101_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1095_c7_d101_cond;
     tmp16_MUX_uxn_opcodes_h_l1095_c7_d101_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1095_c7_d101_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1095_c7_d101_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1095_c7_d101_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1095_c7_d101_return_output := tmp16_MUX_uxn_opcodes_h_l1095_c7_d101_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1101_c7_3dd7] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1101_c7_3dd7_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1101_c7_3dd7_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1101_c7_3dd7_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1101_c7_3dd7_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1101_c7_3dd7_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1101_c7_3dd7_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1101_c7_3dd7_return_output := result_stack_value_MUX_uxn_opcodes_h_l1101_c7_3dd7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1101_c7_3dd7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_3dd7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_3dd7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_3dd7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_3dd7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_3dd7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_3dd7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_3dd7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_3dd7_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1067_c2_4eda] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1067_c2_4eda_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1067_c2_4eda_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1067_c2_4eda_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1067_c2_4eda_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1067_c2_4eda_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1067_c2_4eda_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1067_c2_4eda_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1067_c2_4eda_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1085_c7_e5d1] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1085_c7_e5d1_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1085_c7_e5d1_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1085_c7_e5d1_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1085_c7_e5d1_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1085_c7_e5d1_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1085_c7_e5d1_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1085_c7_e5d1_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1085_c7_e5d1_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1095_c7_d101_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_3dd7_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1085_c7_e5d1_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1089_c7_f5d0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1095_c7_d101_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_3dd7_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1079_c7_4047_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1085_c7_e5d1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c2_4eda_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_3b5b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_f5d0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1095_c7_d101_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1095_c7_d101_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1101_c7_3dd7_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1067_c2_4eda_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1089_c7_f5d0_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1095_c7_d101_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1095_c7_d101] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1095_c7_d101_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1095_c7_d101_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1095_c7_d101_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1095_c7_d101_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1095_c7_d101_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1095_c7_d101_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1095_c7_d101_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1095_c7_d101_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1079_c7_4047] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1079_c7_4047_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1079_c7_4047_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1079_c7_4047_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1079_c7_4047_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1079_c7_4047_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1079_c7_4047_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1079_c7_4047_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1079_c7_4047_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1095_c7_d101] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1095_c7_d101_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1095_c7_d101_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1095_c7_d101_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1095_c7_d101_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1095_c7_d101_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1095_c7_d101_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1095_c7_d101_return_output := result_stack_value_MUX_uxn_opcodes_h_l1095_c7_d101_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1067_c2_4eda] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c2_4eda_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c2_4eda_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c2_4eda_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c2_4eda_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c2_4eda_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c2_4eda_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c2_4eda_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c2_4eda_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1095_c7_d101] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1095_c7_d101_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1095_c7_d101_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1095_c7_d101_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1095_c7_d101_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1095_c7_d101_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1095_c7_d101_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1095_c7_d101_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1095_c7_d101_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1085_c7_e5d1] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1085_c7_e5d1_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1085_c7_e5d1_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1085_c7_e5d1_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1085_c7_e5d1_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1085_c7_e5d1_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1085_c7_e5d1_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1085_c7_e5d1_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1085_c7_e5d1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1089_c7_f5d0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_f5d0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_f5d0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_f5d0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_f5d0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_f5d0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_f5d0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_f5d0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_f5d0_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1089_c7_f5d0] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1089_c7_f5d0_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1089_c7_f5d0_cond;
     tmp16_MUX_uxn_opcodes_h_l1089_c7_f5d0_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1089_c7_f5d0_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1089_c7_f5d0_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1089_c7_f5d0_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1089_c7_f5d0_return_output := tmp16_MUX_uxn_opcodes_h_l1089_c7_f5d0_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_f5d0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1095_c7_d101_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1079_c7_4047_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1085_c7_e5d1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_f5d0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1095_c7_d101_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1075_c7_3b5b_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1079_c7_4047_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_e5d1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1089_c7_f5d0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1089_c7_f5d0_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1095_c7_d101_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1085_c7_e5d1_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1089_c7_f5d0_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1085_c7_e5d1] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1085_c7_e5d1_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1085_c7_e5d1_cond;
     tmp16_MUX_uxn_opcodes_h_l1085_c7_e5d1_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1085_c7_e5d1_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1085_c7_e5d1_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1085_c7_e5d1_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1085_c7_e5d1_return_output := tmp16_MUX_uxn_opcodes_h_l1085_c7_e5d1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1089_c7_f5d0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_f5d0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_f5d0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_f5d0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_f5d0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_f5d0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_f5d0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_f5d0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_f5d0_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1089_c7_f5d0] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1089_c7_f5d0_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1089_c7_f5d0_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1089_c7_f5d0_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1089_c7_f5d0_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1089_c7_f5d0_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1089_c7_f5d0_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1089_c7_f5d0_return_output := result_stack_value_MUX_uxn_opcodes_h_l1089_c7_f5d0_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1075_c7_3b5b] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1075_c7_3b5b_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1075_c7_3b5b_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1075_c7_3b5b_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1075_c7_3b5b_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1075_c7_3b5b_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1075_c7_3b5b_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1075_c7_3b5b_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1075_c7_3b5b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1089_c7_f5d0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_f5d0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_f5d0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_f5d0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_f5d0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_f5d0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_f5d0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_f5d0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_f5d0_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1079_c7_4047] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1079_c7_4047_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1079_c7_4047_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1079_c7_4047_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1079_c7_4047_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1079_c7_4047_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1079_c7_4047_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1079_c7_4047_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1079_c7_4047_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1085_c7_e5d1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_e5d1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_e5d1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_e5d1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_e5d1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_e5d1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_e5d1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_e5d1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_e5d1_return_output;

     -- Submodule level 9
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_e5d1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1089_c7_f5d0_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1075_c7_3b5b_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1079_c7_4047_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1085_c7_e5d1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1089_c7_f5d0_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1067_c2_4eda_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1075_c7_3b5b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_4047_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1085_c7_e5d1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1085_c7_e5d1_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1089_c7_f5d0_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1079_c7_4047_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1085_c7_e5d1_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1079_c7_4047] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_4047_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_4047_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_4047_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_4047_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_4047_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_4047_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_4047_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_4047_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1075_c7_3b5b] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1075_c7_3b5b_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1075_c7_3b5b_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1075_c7_3b5b_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1075_c7_3b5b_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1075_c7_3b5b_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1075_c7_3b5b_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1075_c7_3b5b_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1075_c7_3b5b_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1067_c2_4eda] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1067_c2_4eda_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1067_c2_4eda_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1067_c2_4eda_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1067_c2_4eda_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1067_c2_4eda_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1067_c2_4eda_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1067_c2_4eda_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1067_c2_4eda_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1085_c7_e5d1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1085_c7_e5d1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1085_c7_e5d1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1085_c7_e5d1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1085_c7_e5d1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1085_c7_e5d1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1085_c7_e5d1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1085_c7_e5d1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1085_c7_e5d1_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1079_c7_4047] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1079_c7_4047_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1079_c7_4047_cond;
     tmp16_MUX_uxn_opcodes_h_l1079_c7_4047_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1079_c7_4047_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1079_c7_4047_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1079_c7_4047_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1079_c7_4047_return_output := tmp16_MUX_uxn_opcodes_h_l1079_c7_4047_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1085_c7_e5d1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_e5d1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_e5d1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_e5d1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_e5d1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_e5d1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_e5d1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_e5d1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_e5d1_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1085_c7_e5d1] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1085_c7_e5d1_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1085_c7_e5d1_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1085_c7_e5d1_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1085_c7_e5d1_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1085_c7_e5d1_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1085_c7_e5d1_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1085_c7_e5d1_return_output := result_stack_value_MUX_uxn_opcodes_h_l1085_c7_e5d1_return_output;

     -- Submodule level 10
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_4047_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1085_c7_e5d1_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1067_c2_4eda_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1075_c7_3b5b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1079_c7_4047_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1085_c7_e5d1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_3b5b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_4047_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1079_c7_4047_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1085_c7_e5d1_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1075_c7_3b5b_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1079_c7_4047_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1079_c7_4047] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1079_c7_4047_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1079_c7_4047_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1079_c7_4047_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1079_c7_4047_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1079_c7_4047_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1079_c7_4047_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1079_c7_4047_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1079_c7_4047_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1079_c7_4047] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_4047_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_4047_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_4047_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_4047_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_4047_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_4047_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_4047_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_4047_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1079_c7_4047] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1079_c7_4047_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1079_c7_4047_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1079_c7_4047_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1079_c7_4047_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1079_c7_4047_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1079_c7_4047_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1079_c7_4047_return_output := result_stack_value_MUX_uxn_opcodes_h_l1079_c7_4047_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1067_c2_4eda] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1067_c2_4eda_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1067_c2_4eda_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1067_c2_4eda_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1067_c2_4eda_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1067_c2_4eda_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1067_c2_4eda_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1067_c2_4eda_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1067_c2_4eda_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1075_c7_3b5b] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1075_c7_3b5b_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1075_c7_3b5b_cond;
     tmp16_MUX_uxn_opcodes_h_l1075_c7_3b5b_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1075_c7_3b5b_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1075_c7_3b5b_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1075_c7_3b5b_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1075_c7_3b5b_return_output := tmp16_MUX_uxn_opcodes_h_l1075_c7_3b5b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1075_c7_3b5b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_3b5b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_3b5b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_3b5b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_3b5b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_3b5b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_3b5b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_3b5b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_3b5b_return_output;

     -- Submodule level 11
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_3b5b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_4047_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_3b5b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1079_c7_4047_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c2_4eda_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_3b5b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1075_c7_3b5b_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1079_c7_4047_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1067_c2_4eda_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1075_c7_3b5b_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1067_c2_4eda] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1067_c2_4eda_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1067_c2_4eda_cond;
     tmp16_MUX_uxn_opcodes_h_l1067_c2_4eda_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1067_c2_4eda_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1067_c2_4eda_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1067_c2_4eda_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1067_c2_4eda_return_output := tmp16_MUX_uxn_opcodes_h_l1067_c2_4eda_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1075_c7_3b5b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_3b5b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_3b5b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_3b5b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_3b5b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_3b5b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_3b5b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_3b5b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_3b5b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1067_c2_4eda] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c2_4eda_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c2_4eda_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c2_4eda_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c2_4eda_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c2_4eda_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c2_4eda_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c2_4eda_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c2_4eda_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1075_c7_3b5b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_3b5b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_3b5b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_3b5b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_3b5b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_3b5b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_3b5b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_3b5b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_3b5b_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1075_c7_3b5b] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1075_c7_3b5b_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1075_c7_3b5b_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1075_c7_3b5b_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1075_c7_3b5b_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1075_c7_3b5b_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1075_c7_3b5b_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1075_c7_3b5b_return_output := result_stack_value_MUX_uxn_opcodes_h_l1075_c7_3b5b_return_output;

     -- Submodule level 12
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1067_c2_4eda_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_3b5b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1067_c2_4eda_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_3b5b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1067_c2_4eda_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1075_c7_3b5b_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l1067_c2_4eda_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1067_c2_4eda] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1067_c2_4eda_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1067_c2_4eda_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1067_c2_4eda_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1067_c2_4eda_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1067_c2_4eda_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1067_c2_4eda_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1067_c2_4eda_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1067_c2_4eda_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1067_c2_4eda] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1067_c2_4eda_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1067_c2_4eda_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1067_c2_4eda_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1067_c2_4eda_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1067_c2_4eda_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1067_c2_4eda_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1067_c2_4eda_return_output := result_stack_value_MUX_uxn_opcodes_h_l1067_c2_4eda_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1067_c2_4eda] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1067_c2_4eda_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1067_c2_4eda_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1067_c2_4eda_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1067_c2_4eda_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1067_c2_4eda_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1067_c2_4eda_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1067_c2_4eda_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1067_c2_4eda_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_6002_uxn_opcodes_h_l1132_l1063_DUPLICATE_5a1d LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6002_uxn_opcodes_h_l1132_l1063_DUPLICATE_5a1d_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_6002(
     result,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1067_c2_4eda_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1067_c2_4eda_return_output,
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1067_c2_4eda_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1067_c2_4eda_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1067_c2_4eda_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1067_c2_4eda_return_output,
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1067_c2_4eda_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c2_4eda_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c2_4eda_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1067_c2_4eda_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c2_4eda_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6002_uxn_opcodes_h_l1132_l1063_DUPLICATE_5a1d_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6002_uxn_opcodes_h_l1132_l1063_DUPLICATE_5a1d_return_output;
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
