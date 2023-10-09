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
-- Submodules: 117
entity lda2_0CLK_c305f5e7 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end lda2_0CLK_c305f5e7;
architecture arch of lda2_0CLK_c305f5e7 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1995_c6_4cda]
signal BIN_OP_EQ_uxn_opcodes_h_l1995_c6_4cda_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1995_c6_4cda_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1995_c6_4cda_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1995_c1_d6eb]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1995_c1_d6eb_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1995_c1_d6eb_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1995_c1_d6eb_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1995_c1_d6eb_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1995_c2_7197]
signal t16_MUX_uxn_opcodes_h_l1995_c2_7197_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1995_c2_7197_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1995_c2_7197_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1995_c2_7197_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1995_c2_7197]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1995_c2_7197_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1995_c2_7197_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1995_c2_7197_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1995_c2_7197_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1995_c2_7197]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1995_c2_7197_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1995_c2_7197_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1995_c2_7197_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1995_c2_7197_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1995_c2_7197]
signal result_stack_value_MUX_uxn_opcodes_h_l1995_c2_7197_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1995_c2_7197_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1995_c2_7197_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1995_c2_7197_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1995_c2_7197]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1995_c2_7197_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1995_c2_7197_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1995_c2_7197_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1995_c2_7197_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1995_c2_7197]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1995_c2_7197_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1995_c2_7197_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1995_c2_7197_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1995_c2_7197_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1995_c2_7197]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1995_c2_7197_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1995_c2_7197_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1995_c2_7197_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1995_c2_7197_return_output : unsigned(7 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1995_c2_7197]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1995_c2_7197_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1995_c2_7197_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1995_c2_7197_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1995_c2_7197_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1995_c2_7197]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1995_c2_7197_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1995_c2_7197_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1995_c2_7197_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1995_c2_7197_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1995_c2_7197]
signal result_ram_addr_MUX_uxn_opcodes_h_l1995_c2_7197_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1995_c2_7197_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1995_c2_7197_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1995_c2_7197_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1995_c2_7197]
signal tmp16_MUX_uxn_opcodes_h_l1995_c2_7197_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1995_c2_7197_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1995_c2_7197_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1995_c2_7197_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l1996_c3_0914[uxn_opcodes_h_l1996_c3_0914]
signal printf_uxn_opcodes_h_l1996_c3_0914_uxn_opcodes_h_l1996_c3_0914_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2001_c11_36e4]
signal BIN_OP_EQ_uxn_opcodes_h_l2001_c11_36e4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2001_c11_36e4_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2001_c11_36e4_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2001_c7_05d6]
signal t16_MUX_uxn_opcodes_h_l2001_c7_05d6_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2001_c7_05d6_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2001_c7_05d6_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2001_c7_05d6_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2001_c7_05d6]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2001_c7_05d6_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2001_c7_05d6_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2001_c7_05d6_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2001_c7_05d6_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2001_c7_05d6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2001_c7_05d6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2001_c7_05d6_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2001_c7_05d6_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2001_c7_05d6_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2001_c7_05d6]
signal result_stack_value_MUX_uxn_opcodes_h_l2001_c7_05d6_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2001_c7_05d6_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2001_c7_05d6_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2001_c7_05d6_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2001_c7_05d6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2001_c7_05d6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2001_c7_05d6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2001_c7_05d6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2001_c7_05d6_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2001_c7_05d6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2001_c7_05d6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2001_c7_05d6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2001_c7_05d6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2001_c7_05d6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2001_c7_05d6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2001_c7_05d6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2001_c7_05d6_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2001_c7_05d6_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2001_c7_05d6_return_output : unsigned(7 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l2001_c7_05d6]
signal result_is_ram_read_MUX_uxn_opcodes_h_l2001_c7_05d6_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l2001_c7_05d6_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l2001_c7_05d6_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l2001_c7_05d6_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2001_c7_05d6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2001_c7_05d6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2001_c7_05d6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2001_c7_05d6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2001_c7_05d6_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l2001_c7_05d6]
signal result_ram_addr_MUX_uxn_opcodes_h_l2001_c7_05d6_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2001_c7_05d6_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2001_c7_05d6_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2001_c7_05d6_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2001_c7_05d6]
signal tmp16_MUX_uxn_opcodes_h_l2001_c7_05d6_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2001_c7_05d6_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2001_c7_05d6_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2001_c7_05d6_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2004_c11_d549]
signal BIN_OP_EQ_uxn_opcodes_h_l2004_c11_d549_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2004_c11_d549_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2004_c11_d549_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2004_c7_840d]
signal t16_MUX_uxn_opcodes_h_l2004_c7_840d_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2004_c7_840d_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2004_c7_840d_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2004_c7_840d_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2004_c7_840d]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2004_c7_840d_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2004_c7_840d_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2004_c7_840d_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2004_c7_840d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2004_c7_840d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c7_840d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c7_840d_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c7_840d_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c7_840d_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2004_c7_840d]
signal result_stack_value_MUX_uxn_opcodes_h_l2004_c7_840d_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2004_c7_840d_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2004_c7_840d_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2004_c7_840d_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2004_c7_840d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2004_c7_840d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2004_c7_840d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2004_c7_840d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2004_c7_840d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2004_c7_840d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2004_c7_840d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2004_c7_840d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2004_c7_840d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2004_c7_840d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2004_c7_840d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c7_840d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c7_840d_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c7_840d_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c7_840d_return_output : unsigned(7 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l2004_c7_840d]
signal result_is_ram_read_MUX_uxn_opcodes_h_l2004_c7_840d_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l2004_c7_840d_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l2004_c7_840d_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l2004_c7_840d_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2004_c7_840d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2004_c7_840d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2004_c7_840d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2004_c7_840d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2004_c7_840d_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l2004_c7_840d]
signal result_ram_addr_MUX_uxn_opcodes_h_l2004_c7_840d_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2004_c7_840d_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2004_c7_840d_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2004_c7_840d_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2004_c7_840d]
signal tmp16_MUX_uxn_opcodes_h_l2004_c7_840d_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2004_c7_840d_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2004_c7_840d_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2004_c7_840d_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l2006_c3_4568]
signal CONST_SL_8_uxn_opcodes_h_l2006_c3_4568_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l2006_c3_4568_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2009_c11_072d]
signal BIN_OP_EQ_uxn_opcodes_h_l2009_c11_072d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2009_c11_072d_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2009_c11_072d_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2009_c7_5d16]
signal t16_MUX_uxn_opcodes_h_l2009_c7_5d16_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2009_c7_5d16_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2009_c7_5d16_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2009_c7_5d16_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2009_c7_5d16]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2009_c7_5d16_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2009_c7_5d16_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2009_c7_5d16_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2009_c7_5d16_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2009_c7_5d16]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2009_c7_5d16_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2009_c7_5d16_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2009_c7_5d16_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2009_c7_5d16_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2009_c7_5d16]
signal result_stack_value_MUX_uxn_opcodes_h_l2009_c7_5d16_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2009_c7_5d16_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2009_c7_5d16_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2009_c7_5d16_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2009_c7_5d16]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2009_c7_5d16_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2009_c7_5d16_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2009_c7_5d16_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2009_c7_5d16_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2009_c7_5d16]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2009_c7_5d16_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2009_c7_5d16_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2009_c7_5d16_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2009_c7_5d16_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2009_c7_5d16]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2009_c7_5d16_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2009_c7_5d16_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2009_c7_5d16_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2009_c7_5d16_return_output : unsigned(7 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l2009_c7_5d16]
signal result_is_ram_read_MUX_uxn_opcodes_h_l2009_c7_5d16_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l2009_c7_5d16_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l2009_c7_5d16_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l2009_c7_5d16_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2009_c7_5d16]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2009_c7_5d16_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2009_c7_5d16_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2009_c7_5d16_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2009_c7_5d16_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l2009_c7_5d16]
signal result_ram_addr_MUX_uxn_opcodes_h_l2009_c7_5d16_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2009_c7_5d16_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2009_c7_5d16_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2009_c7_5d16_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2009_c7_5d16]
signal tmp16_MUX_uxn_opcodes_h_l2009_c7_5d16_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2009_c7_5d16_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2009_c7_5d16_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2009_c7_5d16_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2012_c11_6579]
signal BIN_OP_EQ_uxn_opcodes_h_l2012_c11_6579_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2012_c11_6579_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2012_c11_6579_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2012_c7_26ab]
signal t16_MUX_uxn_opcodes_h_l2012_c7_26ab_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2012_c7_26ab_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2012_c7_26ab_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2012_c7_26ab_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2012_c7_26ab]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2012_c7_26ab_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2012_c7_26ab_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2012_c7_26ab_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2012_c7_26ab_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2012_c7_26ab]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2012_c7_26ab_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2012_c7_26ab_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2012_c7_26ab_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2012_c7_26ab_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2012_c7_26ab]
signal result_stack_value_MUX_uxn_opcodes_h_l2012_c7_26ab_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2012_c7_26ab_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2012_c7_26ab_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2012_c7_26ab_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2012_c7_26ab]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2012_c7_26ab_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2012_c7_26ab_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2012_c7_26ab_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2012_c7_26ab_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2012_c7_26ab]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2012_c7_26ab_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2012_c7_26ab_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2012_c7_26ab_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2012_c7_26ab_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2012_c7_26ab]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2012_c7_26ab_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2012_c7_26ab_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2012_c7_26ab_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2012_c7_26ab_return_output : unsigned(7 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l2012_c7_26ab]
signal result_is_ram_read_MUX_uxn_opcodes_h_l2012_c7_26ab_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l2012_c7_26ab_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l2012_c7_26ab_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l2012_c7_26ab_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2012_c7_26ab]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2012_c7_26ab_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2012_c7_26ab_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2012_c7_26ab_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2012_c7_26ab_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l2012_c7_26ab]
signal result_ram_addr_MUX_uxn_opcodes_h_l2012_c7_26ab_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2012_c7_26ab_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2012_c7_26ab_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2012_c7_26ab_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2012_c7_26ab]
signal tmp16_MUX_uxn_opcodes_h_l2012_c7_26ab_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2012_c7_26ab_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2012_c7_26ab_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2012_c7_26ab_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2013_c3_9c46]
signal BIN_OP_OR_uxn_opcodes_h_l2013_c3_9c46_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2013_c3_9c46_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2013_c3_9c46_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2016_c32_6953]
signal BIN_OP_AND_uxn_opcodes_h_l2016_c32_6953_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2016_c32_6953_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2016_c32_6953_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l2016_c32_99f1]
signal BIN_OP_GT_uxn_opcodes_h_l2016_c32_99f1_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2016_c32_99f1_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2016_c32_99f1_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2016_c32_65df]
signal MUX_uxn_opcodes_h_l2016_c32_65df_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2016_c32_65df_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2016_c32_65df_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2016_c32_65df_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2020_c11_a520]
signal BIN_OP_EQ_uxn_opcodes_h_l2020_c11_a520_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2020_c11_a520_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2020_c11_a520_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l2020_c7_aa50]
signal result_ram_addr_MUX_uxn_opcodes_h_l2020_c7_aa50_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2020_c7_aa50_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2020_c7_aa50_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2020_c7_aa50_return_output : unsigned(15 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l2020_c7_aa50]
signal result_is_ram_read_MUX_uxn_opcodes_h_l2020_c7_aa50_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l2020_c7_aa50_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l2020_c7_aa50_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l2020_c7_aa50_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2020_c7_aa50]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2020_c7_aa50_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2020_c7_aa50_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2020_c7_aa50_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2020_c7_aa50_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2020_c7_aa50]
signal result_stack_value_MUX_uxn_opcodes_h_l2020_c7_aa50_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2020_c7_aa50_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2020_c7_aa50_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2020_c7_aa50_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2020_c7_aa50]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_aa50_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_aa50_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_aa50_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_aa50_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2020_c7_aa50]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_aa50_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_aa50_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_aa50_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_aa50_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2020_c7_aa50]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_aa50_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_aa50_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_aa50_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_aa50_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2020_c7_aa50]
signal tmp16_MUX_uxn_opcodes_h_l2020_c7_aa50_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2020_c7_aa50_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2020_c7_aa50_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2020_c7_aa50_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2024_c11_e5ca]
signal BIN_OP_EQ_uxn_opcodes_h_l2024_c11_e5ca_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2024_c11_e5ca_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2024_c11_e5ca_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l2024_c7_c97c]
signal result_ram_addr_MUX_uxn_opcodes_h_l2024_c7_c97c_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2024_c7_c97c_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2024_c7_c97c_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2024_c7_c97c_return_output : unsigned(15 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l2024_c7_c97c]
signal result_is_ram_read_MUX_uxn_opcodes_h_l2024_c7_c97c_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l2024_c7_c97c_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l2024_c7_c97c_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l2024_c7_c97c_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2024_c7_c97c]
signal result_stack_value_MUX_uxn_opcodes_h_l2024_c7_c97c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2024_c7_c97c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2024_c7_c97c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2024_c7_c97c_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2024_c7_c97c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2024_c7_c97c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2024_c7_c97c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2024_c7_c97c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2024_c7_c97c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2024_c7_c97c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2024_c7_c97c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2024_c7_c97c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2024_c7_c97c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2024_c7_c97c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2024_c7_c97c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2024_c7_c97c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2024_c7_c97c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2024_c7_c97c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2024_c7_c97c_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2024_c7_c97c]
signal tmp16_MUX_uxn_opcodes_h_l2024_c7_c97c_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2024_c7_c97c_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2024_c7_c97c_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2024_c7_c97c_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l2026_c3_6ae7]
signal CONST_SL_8_uxn_opcodes_h_l2026_c3_6ae7_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l2026_c3_6ae7_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l2027_c21_6819]
signal BIN_OP_PLUS_uxn_opcodes_h_l2027_c21_6819_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2027_c21_6819_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2027_c21_6819_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2029_c11_ef50]
signal BIN_OP_EQ_uxn_opcodes_h_l2029_c11_ef50_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2029_c11_ef50_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2029_c11_ef50_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l2029_c7_a4f0]
signal result_ram_addr_MUX_uxn_opcodes_h_l2029_c7_a4f0_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2029_c7_a4f0_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2029_c7_a4f0_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2029_c7_a4f0_return_output : unsigned(15 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l2029_c7_a4f0]
signal result_is_ram_read_MUX_uxn_opcodes_h_l2029_c7_a4f0_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l2029_c7_a4f0_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l2029_c7_a4f0_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l2029_c7_a4f0_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2029_c7_a4f0]
signal result_stack_value_MUX_uxn_opcodes_h_l2029_c7_a4f0_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2029_c7_a4f0_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2029_c7_a4f0_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2029_c7_a4f0_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2029_c7_a4f0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_a4f0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_a4f0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_a4f0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_a4f0_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2029_c7_a4f0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_a4f0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_a4f0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_a4f0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_a4f0_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2029_c7_a4f0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_a4f0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_a4f0_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_a4f0_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_a4f0_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2029_c7_a4f0]
signal tmp16_MUX_uxn_opcodes_h_l2029_c7_a4f0_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2029_c7_a4f0_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2029_c7_a4f0_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2029_c7_a4f0_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l2030_c21_81c1]
signal BIN_OP_PLUS_uxn_opcodes_h_l2030_c21_81c1_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2030_c21_81c1_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2030_c21_81c1_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2032_c11_cd47]
signal BIN_OP_EQ_uxn_opcodes_h_l2032_c11_cd47_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2032_c11_cd47_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2032_c11_cd47_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l2032_c7_bb70]
signal result_is_ram_read_MUX_uxn_opcodes_h_l2032_c7_bb70_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l2032_c7_bb70_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l2032_c7_bb70_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l2032_c7_bb70_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2032_c7_bb70]
signal result_stack_value_MUX_uxn_opcodes_h_l2032_c7_bb70_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2032_c7_bb70_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2032_c7_bb70_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2032_c7_bb70_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2032_c7_bb70]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2032_c7_bb70_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2032_c7_bb70_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2032_c7_bb70_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2032_c7_bb70_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2032_c7_bb70]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2032_c7_bb70_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2032_c7_bb70_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2032_c7_bb70_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2032_c7_bb70_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2032_c7_bb70]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2032_c7_bb70_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2032_c7_bb70_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2032_c7_bb70_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2032_c7_bb70_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2032_c7_bb70]
signal tmp16_MUX_uxn_opcodes_h_l2032_c7_bb70_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2032_c7_bb70_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2032_c7_bb70_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2032_c7_bb70_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2033_c3_7fd7]
signal BIN_OP_OR_uxn_opcodes_h_l2033_c3_7fd7_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2033_c3_7fd7_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2033_c3_7fd7_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2039_c11_f283]
signal BIN_OP_EQ_uxn_opcodes_h_l2039_c11_f283_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2039_c11_f283_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2039_c11_f283_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2039_c7_dda1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2039_c7_dda1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2039_c7_dda1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2039_c7_dda1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2039_c7_dda1_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2039_c7_dda1]
signal result_stack_value_MUX_uxn_opcodes_h_l2039_c7_dda1_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2039_c7_dda1_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2039_c7_dda1_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2039_c7_dda1_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2039_c7_dda1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2039_c7_dda1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2039_c7_dda1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2039_c7_dda1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2039_c7_dda1_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2039_c7_dda1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2039_c7_dda1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2039_c7_dda1_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2039_c7_dda1_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2039_c7_dda1_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2041_c34_e1d2]
signal CONST_SR_8_uxn_opcodes_h_l2041_c34_e1d2_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2041_c34_e1d2_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2043_c11_307d]
signal BIN_OP_EQ_uxn_opcodes_h_l2043_c11_307d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2043_c11_307d_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2043_c11_307d_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2043_c7_3b7a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2043_c7_3b7a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2043_c7_3b7a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2043_c7_3b7a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2043_c7_3b7a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2043_c7_3b7a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2043_c7_3b7a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2043_c7_3b7a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2043_c7_3b7a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2043_c7_3b7a_return_output : unsigned(0 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_c22c( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : signed;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_stack_read := ref_toks_1;
      base.sp_relative_shift := ref_toks_2;
      base.stack_value := ref_toks_3;
      base.is_sp_shift := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.stack_address_sp_offset := ref_toks_6;
      base.is_ram_read := ref_toks_7;
      base.is_stack_write := ref_toks_8;
      base.ram_addr := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1995_c6_4cda
BIN_OP_EQ_uxn_opcodes_h_l1995_c6_4cda : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1995_c6_4cda_left,
BIN_OP_EQ_uxn_opcodes_h_l1995_c6_4cda_right,
BIN_OP_EQ_uxn_opcodes_h_l1995_c6_4cda_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1995_c1_d6eb
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1995_c1_d6eb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1995_c1_d6eb_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1995_c1_d6eb_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1995_c1_d6eb_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1995_c1_d6eb_return_output);

-- t16_MUX_uxn_opcodes_h_l1995_c2_7197
t16_MUX_uxn_opcodes_h_l1995_c2_7197 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1995_c2_7197_cond,
t16_MUX_uxn_opcodes_h_l1995_c2_7197_iftrue,
t16_MUX_uxn_opcodes_h_l1995_c2_7197_iffalse,
t16_MUX_uxn_opcodes_h_l1995_c2_7197_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1995_c2_7197
result_is_stack_read_MUX_uxn_opcodes_h_l1995_c2_7197 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1995_c2_7197_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1995_c2_7197_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1995_c2_7197_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1995_c2_7197_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1995_c2_7197
result_sp_relative_shift_MUX_uxn_opcodes_h_l1995_c2_7197 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1995_c2_7197_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1995_c2_7197_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1995_c2_7197_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1995_c2_7197_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1995_c2_7197
result_stack_value_MUX_uxn_opcodes_h_l1995_c2_7197 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1995_c2_7197_cond,
result_stack_value_MUX_uxn_opcodes_h_l1995_c2_7197_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1995_c2_7197_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1995_c2_7197_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1995_c2_7197
result_is_sp_shift_MUX_uxn_opcodes_h_l1995_c2_7197 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1995_c2_7197_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1995_c2_7197_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1995_c2_7197_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1995_c2_7197_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1995_c2_7197
result_is_opc_done_MUX_uxn_opcodes_h_l1995_c2_7197 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1995_c2_7197_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1995_c2_7197_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1995_c2_7197_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1995_c2_7197_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1995_c2_7197
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1995_c2_7197 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1995_c2_7197_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1995_c2_7197_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1995_c2_7197_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1995_c2_7197_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1995_c2_7197
result_is_ram_read_MUX_uxn_opcodes_h_l1995_c2_7197 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1995_c2_7197_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1995_c2_7197_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1995_c2_7197_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1995_c2_7197_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1995_c2_7197
result_is_stack_write_MUX_uxn_opcodes_h_l1995_c2_7197 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1995_c2_7197_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1995_c2_7197_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1995_c2_7197_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1995_c2_7197_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1995_c2_7197
result_ram_addr_MUX_uxn_opcodes_h_l1995_c2_7197 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1995_c2_7197_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1995_c2_7197_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1995_c2_7197_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1995_c2_7197_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1995_c2_7197
tmp16_MUX_uxn_opcodes_h_l1995_c2_7197 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1995_c2_7197_cond,
tmp16_MUX_uxn_opcodes_h_l1995_c2_7197_iftrue,
tmp16_MUX_uxn_opcodes_h_l1995_c2_7197_iffalse,
tmp16_MUX_uxn_opcodes_h_l1995_c2_7197_return_output);

-- printf_uxn_opcodes_h_l1996_c3_0914_uxn_opcodes_h_l1996_c3_0914
printf_uxn_opcodes_h_l1996_c3_0914_uxn_opcodes_h_l1996_c3_0914 : entity work.printf_uxn_opcodes_h_l1996_c3_0914_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1996_c3_0914_uxn_opcodes_h_l1996_c3_0914_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2001_c11_36e4
BIN_OP_EQ_uxn_opcodes_h_l2001_c11_36e4 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2001_c11_36e4_left,
BIN_OP_EQ_uxn_opcodes_h_l2001_c11_36e4_right,
BIN_OP_EQ_uxn_opcodes_h_l2001_c11_36e4_return_output);

-- t16_MUX_uxn_opcodes_h_l2001_c7_05d6
t16_MUX_uxn_opcodes_h_l2001_c7_05d6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2001_c7_05d6_cond,
t16_MUX_uxn_opcodes_h_l2001_c7_05d6_iftrue,
t16_MUX_uxn_opcodes_h_l2001_c7_05d6_iffalse,
t16_MUX_uxn_opcodes_h_l2001_c7_05d6_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2001_c7_05d6
result_is_stack_read_MUX_uxn_opcodes_h_l2001_c7_05d6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2001_c7_05d6_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2001_c7_05d6_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2001_c7_05d6_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2001_c7_05d6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2001_c7_05d6
result_sp_relative_shift_MUX_uxn_opcodes_h_l2001_c7_05d6 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2001_c7_05d6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2001_c7_05d6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2001_c7_05d6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2001_c7_05d6_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2001_c7_05d6
result_stack_value_MUX_uxn_opcodes_h_l2001_c7_05d6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2001_c7_05d6_cond,
result_stack_value_MUX_uxn_opcodes_h_l2001_c7_05d6_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2001_c7_05d6_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2001_c7_05d6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2001_c7_05d6
result_is_sp_shift_MUX_uxn_opcodes_h_l2001_c7_05d6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2001_c7_05d6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2001_c7_05d6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2001_c7_05d6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2001_c7_05d6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2001_c7_05d6
result_is_opc_done_MUX_uxn_opcodes_h_l2001_c7_05d6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2001_c7_05d6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2001_c7_05d6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2001_c7_05d6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2001_c7_05d6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2001_c7_05d6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2001_c7_05d6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2001_c7_05d6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2001_c7_05d6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2001_c7_05d6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2001_c7_05d6_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l2001_c7_05d6
result_is_ram_read_MUX_uxn_opcodes_h_l2001_c7_05d6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l2001_c7_05d6_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l2001_c7_05d6_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l2001_c7_05d6_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l2001_c7_05d6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2001_c7_05d6
result_is_stack_write_MUX_uxn_opcodes_h_l2001_c7_05d6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2001_c7_05d6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2001_c7_05d6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2001_c7_05d6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2001_c7_05d6_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l2001_c7_05d6
result_ram_addr_MUX_uxn_opcodes_h_l2001_c7_05d6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l2001_c7_05d6_cond,
result_ram_addr_MUX_uxn_opcodes_h_l2001_c7_05d6_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l2001_c7_05d6_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l2001_c7_05d6_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2001_c7_05d6
tmp16_MUX_uxn_opcodes_h_l2001_c7_05d6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2001_c7_05d6_cond,
tmp16_MUX_uxn_opcodes_h_l2001_c7_05d6_iftrue,
tmp16_MUX_uxn_opcodes_h_l2001_c7_05d6_iffalse,
tmp16_MUX_uxn_opcodes_h_l2001_c7_05d6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2004_c11_d549
BIN_OP_EQ_uxn_opcodes_h_l2004_c11_d549 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2004_c11_d549_left,
BIN_OP_EQ_uxn_opcodes_h_l2004_c11_d549_right,
BIN_OP_EQ_uxn_opcodes_h_l2004_c11_d549_return_output);

-- t16_MUX_uxn_opcodes_h_l2004_c7_840d
t16_MUX_uxn_opcodes_h_l2004_c7_840d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2004_c7_840d_cond,
t16_MUX_uxn_opcodes_h_l2004_c7_840d_iftrue,
t16_MUX_uxn_opcodes_h_l2004_c7_840d_iffalse,
t16_MUX_uxn_opcodes_h_l2004_c7_840d_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2004_c7_840d
result_is_stack_read_MUX_uxn_opcodes_h_l2004_c7_840d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2004_c7_840d_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2004_c7_840d_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2004_c7_840d_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2004_c7_840d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c7_840d
result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c7_840d : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c7_840d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c7_840d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c7_840d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c7_840d_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2004_c7_840d
result_stack_value_MUX_uxn_opcodes_h_l2004_c7_840d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2004_c7_840d_cond,
result_stack_value_MUX_uxn_opcodes_h_l2004_c7_840d_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2004_c7_840d_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2004_c7_840d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2004_c7_840d
result_is_sp_shift_MUX_uxn_opcodes_h_l2004_c7_840d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2004_c7_840d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2004_c7_840d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2004_c7_840d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2004_c7_840d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2004_c7_840d
result_is_opc_done_MUX_uxn_opcodes_h_l2004_c7_840d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2004_c7_840d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2004_c7_840d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2004_c7_840d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2004_c7_840d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c7_840d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c7_840d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c7_840d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c7_840d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c7_840d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c7_840d_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l2004_c7_840d
result_is_ram_read_MUX_uxn_opcodes_h_l2004_c7_840d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l2004_c7_840d_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l2004_c7_840d_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l2004_c7_840d_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l2004_c7_840d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2004_c7_840d
result_is_stack_write_MUX_uxn_opcodes_h_l2004_c7_840d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2004_c7_840d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2004_c7_840d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2004_c7_840d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2004_c7_840d_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l2004_c7_840d
result_ram_addr_MUX_uxn_opcodes_h_l2004_c7_840d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l2004_c7_840d_cond,
result_ram_addr_MUX_uxn_opcodes_h_l2004_c7_840d_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l2004_c7_840d_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l2004_c7_840d_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2004_c7_840d
tmp16_MUX_uxn_opcodes_h_l2004_c7_840d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2004_c7_840d_cond,
tmp16_MUX_uxn_opcodes_h_l2004_c7_840d_iftrue,
tmp16_MUX_uxn_opcodes_h_l2004_c7_840d_iffalse,
tmp16_MUX_uxn_opcodes_h_l2004_c7_840d_return_output);

-- CONST_SL_8_uxn_opcodes_h_l2006_c3_4568
CONST_SL_8_uxn_opcodes_h_l2006_c3_4568 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l2006_c3_4568_x,
CONST_SL_8_uxn_opcodes_h_l2006_c3_4568_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2009_c11_072d
BIN_OP_EQ_uxn_opcodes_h_l2009_c11_072d : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2009_c11_072d_left,
BIN_OP_EQ_uxn_opcodes_h_l2009_c11_072d_right,
BIN_OP_EQ_uxn_opcodes_h_l2009_c11_072d_return_output);

-- t16_MUX_uxn_opcodes_h_l2009_c7_5d16
t16_MUX_uxn_opcodes_h_l2009_c7_5d16 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2009_c7_5d16_cond,
t16_MUX_uxn_opcodes_h_l2009_c7_5d16_iftrue,
t16_MUX_uxn_opcodes_h_l2009_c7_5d16_iffalse,
t16_MUX_uxn_opcodes_h_l2009_c7_5d16_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2009_c7_5d16
result_is_stack_read_MUX_uxn_opcodes_h_l2009_c7_5d16 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2009_c7_5d16_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2009_c7_5d16_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2009_c7_5d16_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2009_c7_5d16_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2009_c7_5d16
result_sp_relative_shift_MUX_uxn_opcodes_h_l2009_c7_5d16 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2009_c7_5d16_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2009_c7_5d16_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2009_c7_5d16_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2009_c7_5d16_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2009_c7_5d16
result_stack_value_MUX_uxn_opcodes_h_l2009_c7_5d16 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2009_c7_5d16_cond,
result_stack_value_MUX_uxn_opcodes_h_l2009_c7_5d16_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2009_c7_5d16_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2009_c7_5d16_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2009_c7_5d16
result_is_sp_shift_MUX_uxn_opcodes_h_l2009_c7_5d16 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2009_c7_5d16_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2009_c7_5d16_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2009_c7_5d16_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2009_c7_5d16_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2009_c7_5d16
result_is_opc_done_MUX_uxn_opcodes_h_l2009_c7_5d16 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2009_c7_5d16_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2009_c7_5d16_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2009_c7_5d16_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2009_c7_5d16_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2009_c7_5d16
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2009_c7_5d16 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2009_c7_5d16_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2009_c7_5d16_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2009_c7_5d16_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2009_c7_5d16_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l2009_c7_5d16
result_is_ram_read_MUX_uxn_opcodes_h_l2009_c7_5d16 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l2009_c7_5d16_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l2009_c7_5d16_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l2009_c7_5d16_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l2009_c7_5d16_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2009_c7_5d16
result_is_stack_write_MUX_uxn_opcodes_h_l2009_c7_5d16 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2009_c7_5d16_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2009_c7_5d16_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2009_c7_5d16_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2009_c7_5d16_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l2009_c7_5d16
result_ram_addr_MUX_uxn_opcodes_h_l2009_c7_5d16 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l2009_c7_5d16_cond,
result_ram_addr_MUX_uxn_opcodes_h_l2009_c7_5d16_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l2009_c7_5d16_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l2009_c7_5d16_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2009_c7_5d16
tmp16_MUX_uxn_opcodes_h_l2009_c7_5d16 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2009_c7_5d16_cond,
tmp16_MUX_uxn_opcodes_h_l2009_c7_5d16_iftrue,
tmp16_MUX_uxn_opcodes_h_l2009_c7_5d16_iffalse,
tmp16_MUX_uxn_opcodes_h_l2009_c7_5d16_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2012_c11_6579
BIN_OP_EQ_uxn_opcodes_h_l2012_c11_6579 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2012_c11_6579_left,
BIN_OP_EQ_uxn_opcodes_h_l2012_c11_6579_right,
BIN_OP_EQ_uxn_opcodes_h_l2012_c11_6579_return_output);

-- t16_MUX_uxn_opcodes_h_l2012_c7_26ab
t16_MUX_uxn_opcodes_h_l2012_c7_26ab : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2012_c7_26ab_cond,
t16_MUX_uxn_opcodes_h_l2012_c7_26ab_iftrue,
t16_MUX_uxn_opcodes_h_l2012_c7_26ab_iffalse,
t16_MUX_uxn_opcodes_h_l2012_c7_26ab_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2012_c7_26ab
result_is_stack_read_MUX_uxn_opcodes_h_l2012_c7_26ab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2012_c7_26ab_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2012_c7_26ab_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2012_c7_26ab_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2012_c7_26ab_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2012_c7_26ab
result_sp_relative_shift_MUX_uxn_opcodes_h_l2012_c7_26ab : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2012_c7_26ab_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2012_c7_26ab_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2012_c7_26ab_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2012_c7_26ab_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2012_c7_26ab
result_stack_value_MUX_uxn_opcodes_h_l2012_c7_26ab : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2012_c7_26ab_cond,
result_stack_value_MUX_uxn_opcodes_h_l2012_c7_26ab_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2012_c7_26ab_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2012_c7_26ab_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2012_c7_26ab
result_is_sp_shift_MUX_uxn_opcodes_h_l2012_c7_26ab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2012_c7_26ab_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2012_c7_26ab_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2012_c7_26ab_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2012_c7_26ab_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2012_c7_26ab
result_is_opc_done_MUX_uxn_opcodes_h_l2012_c7_26ab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2012_c7_26ab_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2012_c7_26ab_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2012_c7_26ab_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2012_c7_26ab_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2012_c7_26ab
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2012_c7_26ab : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2012_c7_26ab_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2012_c7_26ab_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2012_c7_26ab_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2012_c7_26ab_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l2012_c7_26ab
result_is_ram_read_MUX_uxn_opcodes_h_l2012_c7_26ab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l2012_c7_26ab_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l2012_c7_26ab_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l2012_c7_26ab_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l2012_c7_26ab_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2012_c7_26ab
result_is_stack_write_MUX_uxn_opcodes_h_l2012_c7_26ab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2012_c7_26ab_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2012_c7_26ab_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2012_c7_26ab_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2012_c7_26ab_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l2012_c7_26ab
result_ram_addr_MUX_uxn_opcodes_h_l2012_c7_26ab : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l2012_c7_26ab_cond,
result_ram_addr_MUX_uxn_opcodes_h_l2012_c7_26ab_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l2012_c7_26ab_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l2012_c7_26ab_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2012_c7_26ab
tmp16_MUX_uxn_opcodes_h_l2012_c7_26ab : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2012_c7_26ab_cond,
tmp16_MUX_uxn_opcodes_h_l2012_c7_26ab_iftrue,
tmp16_MUX_uxn_opcodes_h_l2012_c7_26ab_iffalse,
tmp16_MUX_uxn_opcodes_h_l2012_c7_26ab_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2013_c3_9c46
BIN_OP_OR_uxn_opcodes_h_l2013_c3_9c46 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2013_c3_9c46_left,
BIN_OP_OR_uxn_opcodes_h_l2013_c3_9c46_right,
BIN_OP_OR_uxn_opcodes_h_l2013_c3_9c46_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2016_c32_6953
BIN_OP_AND_uxn_opcodes_h_l2016_c32_6953 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2016_c32_6953_left,
BIN_OP_AND_uxn_opcodes_h_l2016_c32_6953_right,
BIN_OP_AND_uxn_opcodes_h_l2016_c32_6953_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l2016_c32_99f1
BIN_OP_GT_uxn_opcodes_h_l2016_c32_99f1 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l2016_c32_99f1_left,
BIN_OP_GT_uxn_opcodes_h_l2016_c32_99f1_right,
BIN_OP_GT_uxn_opcodes_h_l2016_c32_99f1_return_output);

-- MUX_uxn_opcodes_h_l2016_c32_65df
MUX_uxn_opcodes_h_l2016_c32_65df : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2016_c32_65df_cond,
MUX_uxn_opcodes_h_l2016_c32_65df_iftrue,
MUX_uxn_opcodes_h_l2016_c32_65df_iffalse,
MUX_uxn_opcodes_h_l2016_c32_65df_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2020_c11_a520
BIN_OP_EQ_uxn_opcodes_h_l2020_c11_a520 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2020_c11_a520_left,
BIN_OP_EQ_uxn_opcodes_h_l2020_c11_a520_right,
BIN_OP_EQ_uxn_opcodes_h_l2020_c11_a520_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l2020_c7_aa50
result_ram_addr_MUX_uxn_opcodes_h_l2020_c7_aa50 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l2020_c7_aa50_cond,
result_ram_addr_MUX_uxn_opcodes_h_l2020_c7_aa50_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l2020_c7_aa50_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l2020_c7_aa50_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l2020_c7_aa50
result_is_ram_read_MUX_uxn_opcodes_h_l2020_c7_aa50 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l2020_c7_aa50_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l2020_c7_aa50_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l2020_c7_aa50_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l2020_c7_aa50_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2020_c7_aa50
result_is_sp_shift_MUX_uxn_opcodes_h_l2020_c7_aa50 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2020_c7_aa50_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2020_c7_aa50_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2020_c7_aa50_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2020_c7_aa50_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2020_c7_aa50
result_stack_value_MUX_uxn_opcodes_h_l2020_c7_aa50 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2020_c7_aa50_cond,
result_stack_value_MUX_uxn_opcodes_h_l2020_c7_aa50_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2020_c7_aa50_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2020_c7_aa50_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_aa50
result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_aa50 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_aa50_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_aa50_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_aa50_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_aa50_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_aa50
result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_aa50 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_aa50_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_aa50_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_aa50_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_aa50_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_aa50
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_aa50 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_aa50_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_aa50_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_aa50_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_aa50_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2020_c7_aa50
tmp16_MUX_uxn_opcodes_h_l2020_c7_aa50 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2020_c7_aa50_cond,
tmp16_MUX_uxn_opcodes_h_l2020_c7_aa50_iftrue,
tmp16_MUX_uxn_opcodes_h_l2020_c7_aa50_iffalse,
tmp16_MUX_uxn_opcodes_h_l2020_c7_aa50_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2024_c11_e5ca
BIN_OP_EQ_uxn_opcodes_h_l2024_c11_e5ca : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2024_c11_e5ca_left,
BIN_OP_EQ_uxn_opcodes_h_l2024_c11_e5ca_right,
BIN_OP_EQ_uxn_opcodes_h_l2024_c11_e5ca_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l2024_c7_c97c
result_ram_addr_MUX_uxn_opcodes_h_l2024_c7_c97c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l2024_c7_c97c_cond,
result_ram_addr_MUX_uxn_opcodes_h_l2024_c7_c97c_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l2024_c7_c97c_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l2024_c7_c97c_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l2024_c7_c97c
result_is_ram_read_MUX_uxn_opcodes_h_l2024_c7_c97c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l2024_c7_c97c_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l2024_c7_c97c_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l2024_c7_c97c_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l2024_c7_c97c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2024_c7_c97c
result_stack_value_MUX_uxn_opcodes_h_l2024_c7_c97c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2024_c7_c97c_cond,
result_stack_value_MUX_uxn_opcodes_h_l2024_c7_c97c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2024_c7_c97c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2024_c7_c97c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2024_c7_c97c
result_is_stack_write_MUX_uxn_opcodes_h_l2024_c7_c97c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2024_c7_c97c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2024_c7_c97c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2024_c7_c97c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2024_c7_c97c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2024_c7_c97c
result_is_opc_done_MUX_uxn_opcodes_h_l2024_c7_c97c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2024_c7_c97c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2024_c7_c97c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2024_c7_c97c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2024_c7_c97c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2024_c7_c97c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2024_c7_c97c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2024_c7_c97c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2024_c7_c97c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2024_c7_c97c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2024_c7_c97c_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2024_c7_c97c
tmp16_MUX_uxn_opcodes_h_l2024_c7_c97c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2024_c7_c97c_cond,
tmp16_MUX_uxn_opcodes_h_l2024_c7_c97c_iftrue,
tmp16_MUX_uxn_opcodes_h_l2024_c7_c97c_iffalse,
tmp16_MUX_uxn_opcodes_h_l2024_c7_c97c_return_output);

-- CONST_SL_8_uxn_opcodes_h_l2026_c3_6ae7
CONST_SL_8_uxn_opcodes_h_l2026_c3_6ae7 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l2026_c3_6ae7_x,
CONST_SL_8_uxn_opcodes_h_l2026_c3_6ae7_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l2027_c21_6819
BIN_OP_PLUS_uxn_opcodes_h_l2027_c21_6819 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l2027_c21_6819_left,
BIN_OP_PLUS_uxn_opcodes_h_l2027_c21_6819_right,
BIN_OP_PLUS_uxn_opcodes_h_l2027_c21_6819_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2029_c11_ef50
BIN_OP_EQ_uxn_opcodes_h_l2029_c11_ef50 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2029_c11_ef50_left,
BIN_OP_EQ_uxn_opcodes_h_l2029_c11_ef50_right,
BIN_OP_EQ_uxn_opcodes_h_l2029_c11_ef50_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l2029_c7_a4f0
result_ram_addr_MUX_uxn_opcodes_h_l2029_c7_a4f0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l2029_c7_a4f0_cond,
result_ram_addr_MUX_uxn_opcodes_h_l2029_c7_a4f0_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l2029_c7_a4f0_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l2029_c7_a4f0_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l2029_c7_a4f0
result_is_ram_read_MUX_uxn_opcodes_h_l2029_c7_a4f0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l2029_c7_a4f0_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l2029_c7_a4f0_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l2029_c7_a4f0_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l2029_c7_a4f0_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2029_c7_a4f0
result_stack_value_MUX_uxn_opcodes_h_l2029_c7_a4f0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2029_c7_a4f0_cond,
result_stack_value_MUX_uxn_opcodes_h_l2029_c7_a4f0_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2029_c7_a4f0_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2029_c7_a4f0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_a4f0
result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_a4f0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_a4f0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_a4f0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_a4f0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_a4f0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_a4f0
result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_a4f0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_a4f0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_a4f0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_a4f0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_a4f0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_a4f0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_a4f0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_a4f0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_a4f0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_a4f0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_a4f0_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2029_c7_a4f0
tmp16_MUX_uxn_opcodes_h_l2029_c7_a4f0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2029_c7_a4f0_cond,
tmp16_MUX_uxn_opcodes_h_l2029_c7_a4f0_iftrue,
tmp16_MUX_uxn_opcodes_h_l2029_c7_a4f0_iffalse,
tmp16_MUX_uxn_opcodes_h_l2029_c7_a4f0_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l2030_c21_81c1
BIN_OP_PLUS_uxn_opcodes_h_l2030_c21_81c1 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l2030_c21_81c1_left,
BIN_OP_PLUS_uxn_opcodes_h_l2030_c21_81c1_right,
BIN_OP_PLUS_uxn_opcodes_h_l2030_c21_81c1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2032_c11_cd47
BIN_OP_EQ_uxn_opcodes_h_l2032_c11_cd47 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2032_c11_cd47_left,
BIN_OP_EQ_uxn_opcodes_h_l2032_c11_cd47_right,
BIN_OP_EQ_uxn_opcodes_h_l2032_c11_cd47_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l2032_c7_bb70
result_is_ram_read_MUX_uxn_opcodes_h_l2032_c7_bb70 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l2032_c7_bb70_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l2032_c7_bb70_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l2032_c7_bb70_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l2032_c7_bb70_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2032_c7_bb70
result_stack_value_MUX_uxn_opcodes_h_l2032_c7_bb70 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2032_c7_bb70_cond,
result_stack_value_MUX_uxn_opcodes_h_l2032_c7_bb70_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2032_c7_bb70_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2032_c7_bb70_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2032_c7_bb70
result_is_stack_write_MUX_uxn_opcodes_h_l2032_c7_bb70 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2032_c7_bb70_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2032_c7_bb70_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2032_c7_bb70_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2032_c7_bb70_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2032_c7_bb70
result_is_opc_done_MUX_uxn_opcodes_h_l2032_c7_bb70 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2032_c7_bb70_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2032_c7_bb70_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2032_c7_bb70_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2032_c7_bb70_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2032_c7_bb70
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2032_c7_bb70 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2032_c7_bb70_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2032_c7_bb70_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2032_c7_bb70_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2032_c7_bb70_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2032_c7_bb70
tmp16_MUX_uxn_opcodes_h_l2032_c7_bb70 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2032_c7_bb70_cond,
tmp16_MUX_uxn_opcodes_h_l2032_c7_bb70_iftrue,
tmp16_MUX_uxn_opcodes_h_l2032_c7_bb70_iffalse,
tmp16_MUX_uxn_opcodes_h_l2032_c7_bb70_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2033_c3_7fd7
BIN_OP_OR_uxn_opcodes_h_l2033_c3_7fd7 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2033_c3_7fd7_left,
BIN_OP_OR_uxn_opcodes_h_l2033_c3_7fd7_right,
BIN_OP_OR_uxn_opcodes_h_l2033_c3_7fd7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2039_c11_f283
BIN_OP_EQ_uxn_opcodes_h_l2039_c11_f283 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2039_c11_f283_left,
BIN_OP_EQ_uxn_opcodes_h_l2039_c11_f283_right,
BIN_OP_EQ_uxn_opcodes_h_l2039_c11_f283_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2039_c7_dda1
result_is_stack_write_MUX_uxn_opcodes_h_l2039_c7_dda1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2039_c7_dda1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2039_c7_dda1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2039_c7_dda1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2039_c7_dda1_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2039_c7_dda1
result_stack_value_MUX_uxn_opcodes_h_l2039_c7_dda1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2039_c7_dda1_cond,
result_stack_value_MUX_uxn_opcodes_h_l2039_c7_dda1_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2039_c7_dda1_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2039_c7_dda1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2039_c7_dda1
result_is_opc_done_MUX_uxn_opcodes_h_l2039_c7_dda1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2039_c7_dda1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2039_c7_dda1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2039_c7_dda1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2039_c7_dda1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2039_c7_dda1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2039_c7_dda1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2039_c7_dda1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2039_c7_dda1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2039_c7_dda1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2039_c7_dda1_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2041_c34_e1d2
CONST_SR_8_uxn_opcodes_h_l2041_c34_e1d2 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2041_c34_e1d2_x,
CONST_SR_8_uxn_opcodes_h_l2041_c34_e1d2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2043_c11_307d
BIN_OP_EQ_uxn_opcodes_h_l2043_c11_307d : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2043_c11_307d_left,
BIN_OP_EQ_uxn_opcodes_h_l2043_c11_307d_right,
BIN_OP_EQ_uxn_opcodes_h_l2043_c11_307d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2043_c7_3b7a
result_is_stack_write_MUX_uxn_opcodes_h_l2043_c7_3b7a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2043_c7_3b7a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2043_c7_3b7a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2043_c7_3b7a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2043_c7_3b7a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2043_c7_3b7a
result_is_opc_done_MUX_uxn_opcodes_h_l2043_c7_3b7a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2043_c7_3b7a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2043_c7_3b7a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2043_c7_3b7a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2043_c7_3b7a_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 previous_ram_read,
 -- Registers
 t16,
 tmp16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1995_c6_4cda_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1995_c1_d6eb_return_output,
 t16_MUX_uxn_opcodes_h_l1995_c2_7197_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1995_c2_7197_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1995_c2_7197_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1995_c2_7197_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1995_c2_7197_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1995_c2_7197_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1995_c2_7197_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1995_c2_7197_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1995_c2_7197_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1995_c2_7197_return_output,
 tmp16_MUX_uxn_opcodes_h_l1995_c2_7197_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2001_c11_36e4_return_output,
 t16_MUX_uxn_opcodes_h_l2001_c7_05d6_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2001_c7_05d6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2001_c7_05d6_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2001_c7_05d6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2001_c7_05d6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2001_c7_05d6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2001_c7_05d6_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l2001_c7_05d6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2001_c7_05d6_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l2001_c7_05d6_return_output,
 tmp16_MUX_uxn_opcodes_h_l2001_c7_05d6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2004_c11_d549_return_output,
 t16_MUX_uxn_opcodes_h_l2004_c7_840d_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2004_c7_840d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c7_840d_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2004_c7_840d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2004_c7_840d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2004_c7_840d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c7_840d_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l2004_c7_840d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2004_c7_840d_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l2004_c7_840d_return_output,
 tmp16_MUX_uxn_opcodes_h_l2004_c7_840d_return_output,
 CONST_SL_8_uxn_opcodes_h_l2006_c3_4568_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2009_c11_072d_return_output,
 t16_MUX_uxn_opcodes_h_l2009_c7_5d16_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2009_c7_5d16_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2009_c7_5d16_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2009_c7_5d16_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2009_c7_5d16_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2009_c7_5d16_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2009_c7_5d16_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l2009_c7_5d16_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2009_c7_5d16_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l2009_c7_5d16_return_output,
 tmp16_MUX_uxn_opcodes_h_l2009_c7_5d16_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2012_c11_6579_return_output,
 t16_MUX_uxn_opcodes_h_l2012_c7_26ab_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2012_c7_26ab_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2012_c7_26ab_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2012_c7_26ab_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2012_c7_26ab_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2012_c7_26ab_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2012_c7_26ab_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l2012_c7_26ab_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2012_c7_26ab_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l2012_c7_26ab_return_output,
 tmp16_MUX_uxn_opcodes_h_l2012_c7_26ab_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2013_c3_9c46_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2016_c32_6953_return_output,
 BIN_OP_GT_uxn_opcodes_h_l2016_c32_99f1_return_output,
 MUX_uxn_opcodes_h_l2016_c32_65df_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2020_c11_a520_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l2020_c7_aa50_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l2020_c7_aa50_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2020_c7_aa50_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2020_c7_aa50_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_aa50_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_aa50_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_aa50_return_output,
 tmp16_MUX_uxn_opcodes_h_l2020_c7_aa50_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2024_c11_e5ca_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l2024_c7_c97c_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l2024_c7_c97c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2024_c7_c97c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2024_c7_c97c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2024_c7_c97c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2024_c7_c97c_return_output,
 tmp16_MUX_uxn_opcodes_h_l2024_c7_c97c_return_output,
 CONST_SL_8_uxn_opcodes_h_l2026_c3_6ae7_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l2027_c21_6819_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2029_c11_ef50_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l2029_c7_a4f0_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l2029_c7_a4f0_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2029_c7_a4f0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_a4f0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_a4f0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_a4f0_return_output,
 tmp16_MUX_uxn_opcodes_h_l2029_c7_a4f0_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l2030_c21_81c1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2032_c11_cd47_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l2032_c7_bb70_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2032_c7_bb70_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2032_c7_bb70_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2032_c7_bb70_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2032_c7_bb70_return_output,
 tmp16_MUX_uxn_opcodes_h_l2032_c7_bb70_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2033_c3_7fd7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2039_c11_f283_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2039_c7_dda1_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2039_c7_dda1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2039_c7_dda1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2039_c7_dda1_return_output,
 CONST_SR_8_uxn_opcodes_h_l2041_c34_e1d2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2043_c11_307d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2043_c7_3b7a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2043_c7_3b7a_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1995_c6_4cda_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1995_c6_4cda_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1995_c6_4cda_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1995_c1_d6eb_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1995_c1_d6eb_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1995_c1_d6eb_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1995_c1_d6eb_iffalse : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1995_c2_7197_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1995_c2_7197_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2001_c7_05d6_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1995_c2_7197_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1995_c2_7197_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1995_c2_7197_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1995_c2_7197_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2001_c7_05d6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1995_c2_7197_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1995_c2_7197_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1995_c2_7197_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1995_c2_7197_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2001_c7_05d6_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1995_c2_7197_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1995_c2_7197_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1995_c2_7197_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1995_c2_7197_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2001_c7_05d6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1995_c2_7197_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1995_c2_7197_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1995_c2_7197_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1995_c2_7197_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2001_c7_05d6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1995_c2_7197_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1995_c2_7197_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1995_c2_7197_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1995_c2_7197_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2001_c7_05d6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1995_c2_7197_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1995_c2_7197_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1995_c2_7197_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1998_c3_f205 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1995_c2_7197_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2001_c7_05d6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1995_c2_7197_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1995_c2_7197_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1995_c2_7197_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1995_c2_7197_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2001_c7_05d6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1995_c2_7197_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1995_c2_7197_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1995_c2_7197_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1995_c2_7197_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2001_c7_05d6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1995_c2_7197_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1995_c2_7197_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1995_c2_7197_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1995_c2_7197_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2001_c7_05d6_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1995_c2_7197_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1995_c2_7197_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1995_c2_7197_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1995_c2_7197_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2001_c7_05d6_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1995_c2_7197_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1995_c2_7197_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1996_c3_0914_uxn_opcodes_h_l1996_c3_0914_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2001_c11_36e4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2001_c11_36e4_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2001_c11_36e4_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2001_c7_05d6_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2001_c7_05d6_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2004_c7_840d_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2001_c7_05d6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2001_c7_05d6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2001_c7_05d6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2004_c7_840d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2001_c7_05d6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2001_c7_05d6_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2001_c7_05d6_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c7_840d_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2001_c7_05d6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2001_c7_05d6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2001_c7_05d6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2004_c7_840d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2001_c7_05d6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2001_c7_05d6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2001_c7_05d6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2004_c7_840d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2001_c7_05d6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2001_c7_05d6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2001_c7_05d6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2004_c7_840d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2001_c7_05d6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2001_c7_05d6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2002_c3_1697 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2001_c7_05d6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c7_840d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2001_c7_05d6_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2001_c7_05d6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2001_c7_05d6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2004_c7_840d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2001_c7_05d6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2001_c7_05d6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2001_c7_05d6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2004_c7_840d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2001_c7_05d6_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2001_c7_05d6_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2001_c7_05d6_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2004_c7_840d_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2001_c7_05d6_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2001_c7_05d6_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2001_c7_05d6_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2004_c7_840d_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2001_c7_05d6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c11_d549_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c11_d549_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c11_d549_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2004_c7_840d_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2004_c7_840d_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2009_c7_5d16_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2004_c7_840d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2004_c7_840d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2004_c7_840d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2009_c7_5d16_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2004_c7_840d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c7_840d_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c7_840d_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2009_c7_5d16_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c7_840d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2004_c7_840d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2004_c7_840d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2009_c7_5d16_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2004_c7_840d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2004_c7_840d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2004_c7_840d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2009_c7_5d16_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2004_c7_840d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2004_c7_840d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2004_c7_840d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2009_c7_5d16_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2004_c7_840d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c7_840d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2007_c3_24d0 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c7_840d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2009_c7_5d16_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c7_840d_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2004_c7_840d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2004_c7_840d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2009_c7_5d16_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2004_c7_840d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2004_c7_840d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2004_c7_840d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2009_c7_5d16_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2004_c7_840d_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2004_c7_840d_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2004_c7_840d_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2009_c7_5d16_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2004_c7_840d_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2004_c7_840d_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2004_c7_840d_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2009_c7_5d16_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2004_c7_840d_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2006_c3_4568_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2006_c3_4568_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2009_c11_072d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2009_c11_072d_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2009_c11_072d_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2009_c7_5d16_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2009_c7_5d16_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2012_c7_26ab_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2009_c7_5d16_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2009_c7_5d16_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2009_c7_5d16_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2012_c7_26ab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2009_c7_5d16_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2009_c7_5d16_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2009_c7_5d16_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2012_c7_26ab_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2009_c7_5d16_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2009_c7_5d16_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2009_c7_5d16_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2012_c7_26ab_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2009_c7_5d16_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2009_c7_5d16_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2009_c7_5d16_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2012_c7_26ab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2009_c7_5d16_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2009_c7_5d16_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2009_c7_5d16_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2012_c7_26ab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2009_c7_5d16_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2009_c7_5d16_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2010_c3_f8b8 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2009_c7_5d16_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2012_c7_26ab_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2009_c7_5d16_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2009_c7_5d16_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2009_c7_5d16_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2012_c7_26ab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2009_c7_5d16_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2009_c7_5d16_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2009_c7_5d16_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2012_c7_26ab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2009_c7_5d16_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2009_c7_5d16_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2009_c7_5d16_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2012_c7_26ab_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2009_c7_5d16_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2009_c7_5d16_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2009_c7_5d16_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2012_c7_26ab_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2009_c7_5d16_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2012_c11_6579_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2012_c11_6579_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2012_c11_6579_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2012_c7_26ab_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2012_c7_26ab_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2012_c7_26ab_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2012_c7_26ab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2012_c7_26ab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2012_c7_26ab_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2012_c7_26ab_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2012_c7_26ab_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2012_c7_26ab_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2012_c7_26ab_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2012_c7_26ab_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2020_c7_aa50_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2012_c7_26ab_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2012_c7_26ab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2012_c7_26ab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2020_c7_aa50_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2012_c7_26ab_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2012_c7_26ab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2012_c7_26ab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_aa50_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2012_c7_26ab_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2012_c7_26ab_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2012_c7_26ab_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_aa50_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2012_c7_26ab_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2012_c7_26ab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2012_c7_26ab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2020_c7_aa50_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2012_c7_26ab_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2012_c7_26ab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2012_c7_26ab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_aa50_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2012_c7_26ab_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2012_c7_26ab_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2012_c7_26ab_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2020_c7_aa50_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2012_c7_26ab_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2012_c7_26ab_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2012_c7_26ab_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2020_c7_aa50_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2012_c7_26ab_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2013_c3_9c46_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2013_c3_9c46_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2013_c3_9c46_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2016_c32_65df_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2016_c32_65df_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2016_c32_65df_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2016_c32_6953_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2016_c32_6953_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2016_c32_6953_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2016_c32_99f1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2016_c32_99f1_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2016_c32_99f1_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2016_c32_65df_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_a520_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_a520_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_a520_return_output : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2020_c7_aa50_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2020_c7_aa50_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2024_c7_c97c_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2020_c7_aa50_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2020_c7_aa50_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2020_c7_aa50_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2024_c7_c97c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2020_c7_aa50_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2020_c7_aa50_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2020_c7_aa50_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2020_c7_aa50_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2020_c7_aa50_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2020_c7_aa50_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2024_c7_c97c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2020_c7_aa50_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_aa50_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_aa50_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2024_c7_c97c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_aa50_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_aa50_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_aa50_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2024_c7_c97c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_aa50_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_aa50_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_aa50_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2024_c7_c97c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_aa50_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2020_c7_aa50_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2020_c7_aa50_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2024_c7_c97c_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2020_c7_aa50_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2024_c11_e5ca_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2024_c11_e5ca_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2024_c11_e5ca_return_output : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2024_c7_c97c_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l2027_c3_0008 : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2024_c7_c97c_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2029_c7_a4f0_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2024_c7_c97c_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2024_c7_c97c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2024_c7_c97c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2029_c7_a4f0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2024_c7_c97c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2024_c7_c97c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2024_c7_c97c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2029_c7_a4f0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2024_c7_c97c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2024_c7_c97c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2024_c7_c97c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_a4f0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2024_c7_c97c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2024_c7_c97c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2024_c7_c97c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_a4f0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2024_c7_c97c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2024_c7_c97c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2024_c7_c97c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_a4f0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2024_c7_c97c_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2024_c7_c97c_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2024_c7_c97c_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2029_c7_a4f0_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2024_c7_c97c_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2026_c3_6ae7_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2026_c3_6ae7_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2027_c21_6819_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2027_c21_6819_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2027_c21_6819_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_ef50_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_ef50_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_ef50_return_output : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2029_c7_a4f0_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l2030_c3_0035 : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2029_c7_a4f0_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2029_c7_a4f0_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2029_c7_a4f0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2029_c7_a4f0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2032_c7_bb70_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2029_c7_a4f0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2029_c7_a4f0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2029_c7_a4f0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2032_c7_bb70_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2029_c7_a4f0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_a4f0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_a4f0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2032_c7_bb70_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_a4f0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_a4f0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_a4f0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2032_c7_bb70_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_a4f0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_a4f0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_a4f0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2032_c7_bb70_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_a4f0_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2029_c7_a4f0_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2029_c7_a4f0_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2032_c7_bb70_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2029_c7_a4f0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2030_c21_81c1_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2030_c21_81c1_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2030_c21_81c1_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2032_c11_cd47_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2032_c11_cd47_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2032_c11_cd47_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2032_c7_bb70_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2032_c7_bb70_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2032_c7_bb70_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2032_c7_bb70_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2032_c7_bb70_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2039_c7_dda1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2032_c7_bb70_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2032_c7_bb70_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2032_c7_bb70_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2039_c7_dda1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2032_c7_bb70_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2032_c7_bb70_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2032_c7_bb70_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2039_c7_dda1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2032_c7_bb70_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2032_c7_bb70_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2036_c3_0a15 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2032_c7_bb70_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2039_c7_dda1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2032_c7_bb70_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2032_c7_bb70_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2032_c7_bb70_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2032_c7_bb70_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2033_c3_7fd7_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2033_c3_7fd7_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2033_c3_7fd7_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2037_c24_8bc5_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2039_c11_f283_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2039_c11_f283_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2039_c11_f283_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2039_c7_dda1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2039_c7_dda1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2043_c7_3b7a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2039_c7_dda1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2039_c7_dda1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2039_c7_dda1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2039_c7_dda1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2039_c7_dda1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2039_c7_dda1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2043_c7_3b7a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2039_c7_dda1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2039_c7_dda1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2040_c3_3fba : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2039_c7_dda1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2039_c7_dda1_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2041_c34_e1d2_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2041_c34_e1d2_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2041_c24_2544_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2043_c11_307d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2043_c11_307d_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2043_c11_307d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2043_c7_3b7a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2043_c7_3b7a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2043_c7_3b7a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2043_c7_3b7a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2043_c7_3b7a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2043_c7_3b7a_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2012_l2009_l2004_l2001_l1995_DUPLICATE_c27e_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2012_l2009_l2039_l2004_l2001_l2029_l1995_l2024_l2020_DUPLICATE_63b0_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2009_l2004_l2001_l1995_l2020_DUPLICATE_33a0_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l2009_l2004_l2032_l2001_l2029_l1995_l2024_l2020_DUPLICATE_eecc_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2012_l2043_l2009_l2039_l2004_l2001_l2029_l1995_l2024_l2020_DUPLICATE_611c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2009_l2004_l2001_l2029_l1995_DUPLICATE_8c9a_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2001_l2012_l2004_l2009_DUPLICATE_dd44_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2012_l2043_l2009_l2039_l2004_l2032_l2001_l2029_l2024_l2020_DUPLICATE_bd02_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2013_l2005_DUPLICATE_9b4e_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2012_l2039_l2029_l2024_l2020_DUPLICATE_0554_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2025_l2033_DUPLICATE_f522_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c22c_uxn_opcodes_h_l2048_l1991_DUPLICATE_90a9_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c11_d549_right := to_unsigned(2, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2032_c7_bb70_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2043_c7_3b7a_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1995_c1_d6eb_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2002_c3_1697 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2001_c7_05d6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2002_c3_1697;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2032_c7_bb70_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l2016_c32_99f1_right := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1995_c2_7197_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2016_c32_6953_right := to_unsigned(128, 8);
     VAR_MUX_uxn_opcodes_h_l2016_c32_65df_iftrue := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2012_c7_26ab_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1998_c3_f205 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1995_c2_7197_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1998_c3_f205;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2009_c11_072d_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2043_c11_307d_right := to_unsigned(10, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2010_c3_f8b8 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2009_c7_5d16_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2010_c3_f8b8;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1995_c2_7197_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2039_c11_f283_right := to_unsigned(9, 4);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2043_c7_3b7a_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2036_c3_0a15 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2032_c7_bb70_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2036_c3_0a15;
     VAR_MUX_uxn_opcodes_h_l2016_c32_65df_iffalse := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2012_c7_26ab_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2027_c21_6819_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2040_c3_3fba := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2039_c7_dda1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2040_c3_3fba;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2007_c3_24d0 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c7_840d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2007_c3_24d0;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2012_c11_6579_right := to_unsigned(4, 3);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2030_c21_81c1_right := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2020_c7_aa50_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_ef50_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2024_c11_e5ca_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2001_c11_36e4_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2032_c11_cd47_right := to_unsigned(8, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_a520_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1995_c6_4cda_right := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2012_c7_26ab_iftrue := to_unsigned(1, 1);

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
     VAR_previous_ram_read := previous_ram_read;

     -- Submodule level 0
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1995_c1_d6eb_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2016_c32_6953_left := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1995_c6_4cda_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2001_c11_36e4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c11_d549_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2009_c11_072d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2012_c11_6579_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_a520_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2024_c11_e5ca_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_ef50_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2032_c11_cd47_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2039_c11_f283_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2043_c11_307d_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2013_c3_9c46_left := t16;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2027_c21_6819_left := t16;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2030_c21_81c1_left := t16;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2020_c7_aa50_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1995_c2_7197_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2001_c7_05d6_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2009_c7_5d16_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2012_c7_26ab_iffalse := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2033_c3_7fd7_left := tmp16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2041_c34_e1d2_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1995_c2_7197_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2001_c7_05d6_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2004_c7_840d_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2009_c7_5d16_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2012_c7_26ab_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2020_c7_aa50_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2029_c7_a4f0_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2032_c7_bb70_iffalse := tmp16;
     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2012_l2009_l2004_l2001_l1995_DUPLICATE_c27e LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2012_l2009_l2004_l2001_l1995_DUPLICATE_c27e_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2009_l2004_l2001_l2029_l1995_DUPLICATE_8c9a LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2009_l2004_l2001_l2029_l1995_DUPLICATE_8c9a_return_output := result.ram_addr;

     -- BIN_OP_PLUS[uxn_opcodes_h_l2030_c21_81c1] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l2030_c21_81c1_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2030_c21_81c1_left;
     BIN_OP_PLUS_uxn_opcodes_h_l2030_c21_81c1_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2030_c21_81c1_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2030_c21_81c1_return_output := BIN_OP_PLUS_uxn_opcodes_h_l2030_c21_81c1_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l2027_c21_6819] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l2027_c21_6819_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2027_c21_6819_left;
     BIN_OP_PLUS_uxn_opcodes_h_l2027_c21_6819_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2027_c21_6819_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2027_c21_6819_return_output := BIN_OP_PLUS_uxn_opcodes_h_l2027_c21_6819_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l2009_l2004_l2032_l2001_l2029_l1995_l2024_l2020_DUPLICATE_eecc LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l2009_l2004_l2032_l2001_l2029_l1995_l2024_l2020_DUPLICATE_eecc_return_output := result.is_ram_read;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2009_l2004_l2001_l1995_l2020_DUPLICATE_33a0 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2009_l2004_l2001_l1995_l2020_DUPLICATE_33a0_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2029_c11_ef50] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2029_c11_ef50_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_ef50_left;
     BIN_OP_EQ_uxn_opcodes_h_l2029_c11_ef50_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_ef50_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_ef50_return_output := BIN_OP_EQ_uxn_opcodes_h_l2029_c11_ef50_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2012_l2043_l2009_l2039_l2004_l2001_l2029_l1995_l2024_l2020_DUPLICATE_611c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2012_l2043_l2009_l2039_l2004_l2001_l2029_l1995_l2024_l2020_DUPLICATE_611c_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2012_c11_6579] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2012_c11_6579_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2012_c11_6579_left;
     BIN_OP_EQ_uxn_opcodes_h_l2012_c11_6579_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2012_c11_6579_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2012_c11_6579_return_output := BIN_OP_EQ_uxn_opcodes_h_l2012_c11_6579_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2025_l2033_DUPLICATE_f522 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2025_l2033_DUPLICATE_f522_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- BIN_OP_AND[uxn_opcodes_h_l2016_c32_6953] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2016_c32_6953_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2016_c32_6953_left;
     BIN_OP_AND_uxn_opcodes_h_l2016_c32_6953_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2016_c32_6953_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2016_c32_6953_return_output := BIN_OP_AND_uxn_opcodes_h_l2016_c32_6953_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2024_c11_e5ca] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2024_c11_e5ca_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2024_c11_e5ca_left;
     BIN_OP_EQ_uxn_opcodes_h_l2024_c11_e5ca_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2024_c11_e5ca_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2024_c11_e5ca_return_output := BIN_OP_EQ_uxn_opcodes_h_l2024_c11_e5ca_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1995_c6_4cda] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1995_c6_4cda_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1995_c6_4cda_left;
     BIN_OP_EQ_uxn_opcodes_h_l1995_c6_4cda_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1995_c6_4cda_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1995_c6_4cda_return_output := BIN_OP_EQ_uxn_opcodes_h_l1995_c6_4cda_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2004_c11_d549] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2004_c11_d549_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c11_d549_left;
     BIN_OP_EQ_uxn_opcodes_h_l2004_c11_d549_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c11_d549_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c11_d549_return_output := BIN_OP_EQ_uxn_opcodes_h_l2004_c11_d549_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2013_l2005_DUPLICATE_9b4e LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2013_l2005_DUPLICATE_9b4e_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2012_l2043_l2009_l2039_l2004_l2032_l2001_l2029_l2024_l2020_DUPLICATE_bd02 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2012_l2043_l2009_l2039_l2004_l2032_l2001_l2029_l2024_l2020_DUPLICATE_bd02_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l2001_c11_36e4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2001_c11_36e4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2001_c11_36e4_left;
     BIN_OP_EQ_uxn_opcodes_h_l2001_c11_36e4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2001_c11_36e4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2001_c11_36e4_return_output := BIN_OP_EQ_uxn_opcodes_h_l2001_c11_36e4_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2012_l2039_l2029_l2024_l2020_DUPLICATE_0554 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2012_l2039_l2029_l2024_l2020_DUPLICATE_0554_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2032_c11_cd47] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2032_c11_cd47_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2032_c11_cd47_left;
     BIN_OP_EQ_uxn_opcodes_h_l2032_c11_cd47_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2032_c11_cd47_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2032_c11_cd47_return_output := BIN_OP_EQ_uxn_opcodes_h_l2032_c11_cd47_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l2041_c34_e1d2] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2041_c34_e1d2_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2041_c34_e1d2_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2041_c34_e1d2_return_output := CONST_SR_8_uxn_opcodes_h_l2041_c34_e1d2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2009_c11_072d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2009_c11_072d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2009_c11_072d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2009_c11_072d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2009_c11_072d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2009_c11_072d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2009_c11_072d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2039_c11_f283] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2039_c11_f283_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2039_c11_f283_left;
     BIN_OP_EQ_uxn_opcodes_h_l2039_c11_f283_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2039_c11_f283_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2039_c11_f283_return_output := BIN_OP_EQ_uxn_opcodes_h_l2039_c11_f283_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2043_c11_307d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2043_c11_307d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2043_c11_307d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2043_c11_307d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2043_c11_307d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2043_c11_307d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2043_c11_307d_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2001_l2012_l2004_l2009_DUPLICATE_dd44 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2001_l2012_l2004_l2009_DUPLICATE_dd44_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l2020_c11_a520] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2020_c11_a520_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_a520_left;
     BIN_OP_EQ_uxn_opcodes_h_l2020_c11_a520_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_a520_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_a520_return_output := BIN_OP_EQ_uxn_opcodes_h_l2020_c11_a520_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2012_l2009_l2039_l2004_l2001_l2029_l1995_l2024_l2020_DUPLICATE_63b0 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2012_l2009_l2039_l2004_l2001_l2029_l1995_l2024_l2020_DUPLICATE_63b0_return_output := result.stack_value;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l2016_c32_99f1_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2016_c32_6953_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1995_c1_d6eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1995_c6_4cda_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1995_c2_7197_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1995_c6_4cda_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1995_c2_7197_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1995_c6_4cda_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1995_c2_7197_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1995_c6_4cda_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1995_c2_7197_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1995_c6_4cda_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1995_c2_7197_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1995_c6_4cda_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1995_c2_7197_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1995_c6_4cda_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1995_c2_7197_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1995_c6_4cda_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1995_c2_7197_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1995_c6_4cda_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1995_c2_7197_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1995_c6_4cda_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1995_c2_7197_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1995_c6_4cda_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1995_c2_7197_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1995_c6_4cda_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2001_c7_05d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2001_c11_36e4_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2001_c7_05d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2001_c11_36e4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2001_c7_05d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2001_c11_36e4_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2001_c7_05d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2001_c11_36e4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2001_c7_05d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2001_c11_36e4_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2001_c7_05d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2001_c11_36e4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2001_c7_05d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2001_c11_36e4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2001_c7_05d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2001_c11_36e4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2001_c7_05d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2001_c11_36e4_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2001_c7_05d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2001_c11_36e4_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2001_c7_05d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2001_c11_36e4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2004_c7_840d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c11_d549_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2004_c7_840d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c11_d549_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2004_c7_840d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c11_d549_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2004_c7_840d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c11_d549_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2004_c7_840d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c11_d549_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2004_c7_840d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c11_d549_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c7_840d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c11_d549_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c7_840d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c11_d549_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2004_c7_840d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c11_d549_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2004_c7_840d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c11_d549_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2004_c7_840d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c11_d549_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2009_c7_5d16_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2009_c11_072d_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2009_c7_5d16_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2009_c11_072d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2009_c7_5d16_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2009_c11_072d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2009_c7_5d16_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2009_c11_072d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2009_c7_5d16_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2009_c11_072d_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2009_c7_5d16_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2009_c11_072d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2009_c7_5d16_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2009_c11_072d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2009_c7_5d16_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2009_c11_072d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2009_c7_5d16_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2009_c11_072d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2009_c7_5d16_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2009_c11_072d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2009_c7_5d16_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2009_c11_072d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2012_c7_26ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2012_c11_6579_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2012_c7_26ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2012_c11_6579_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2012_c7_26ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2012_c11_6579_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2012_c7_26ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2012_c11_6579_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2012_c7_26ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2012_c11_6579_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2012_c7_26ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2012_c11_6579_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2012_c7_26ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2012_c11_6579_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2012_c7_26ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2012_c11_6579_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2012_c7_26ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2012_c11_6579_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2012_c7_26ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2012_c11_6579_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2012_c7_26ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2012_c11_6579_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_aa50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_a520_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2020_c7_aa50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_a520_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2020_c7_aa50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_a520_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_aa50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_a520_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2020_c7_aa50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_a520_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_aa50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_a520_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2020_c7_aa50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_a520_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2020_c7_aa50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_a520_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2024_c7_c97c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2024_c11_e5ca_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2024_c7_c97c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2024_c11_e5ca_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2024_c7_c97c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2024_c11_e5ca_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2024_c7_c97c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2024_c11_e5ca_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2024_c7_c97c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2024_c11_e5ca_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2024_c7_c97c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2024_c11_e5ca_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2024_c7_c97c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2024_c11_e5ca_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_a4f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_ef50_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2029_c7_a4f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_ef50_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_a4f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_ef50_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2029_c7_a4f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_ef50_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_a4f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_ef50_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2029_c7_a4f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_ef50_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2029_c7_a4f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_ef50_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2032_c7_bb70_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2032_c11_cd47_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2032_c7_bb70_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2032_c11_cd47_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2032_c7_bb70_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2032_c11_cd47_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2032_c7_bb70_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2032_c11_cd47_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2032_c7_bb70_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2032_c11_cd47_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2032_c7_bb70_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2032_c11_cd47_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2039_c7_dda1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2039_c11_f283_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2039_c7_dda1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2039_c11_f283_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2039_c7_dda1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2039_c11_f283_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2039_c7_dda1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2039_c11_f283_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2043_c7_3b7a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2043_c11_307d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2043_c7_3b7a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2043_c11_307d_return_output;
     VAR_result_ram_addr_uxn_opcodes_h_l2027_c3_0008 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l2027_c21_6819_return_output, 16);
     VAR_result_ram_addr_uxn_opcodes_h_l2030_c3_0035 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l2030_c21_81c1_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l2013_c3_9c46_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2013_l2005_DUPLICATE_9b4e_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l2006_c3_4568_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2013_l2005_DUPLICATE_9b4e_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2033_c3_7fd7_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2025_l2033_DUPLICATE_f522_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l2026_c3_6ae7_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2025_l2033_DUPLICATE_f522_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1995_c2_7197_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2012_l2009_l2004_l2001_l1995_DUPLICATE_c27e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2001_c7_05d6_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2012_l2009_l2004_l2001_l1995_DUPLICATE_c27e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c7_840d_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2012_l2009_l2004_l2001_l1995_DUPLICATE_c27e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2009_c7_5d16_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2012_l2009_l2004_l2001_l1995_DUPLICATE_c27e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2012_c7_26ab_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2012_l2009_l2004_l2001_l1995_DUPLICATE_c27e_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1995_c2_7197_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2009_l2004_l2001_l2029_l1995_DUPLICATE_8c9a_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2001_c7_05d6_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2009_l2004_l2001_l2029_l1995_DUPLICATE_8c9a_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2004_c7_840d_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2009_l2004_l2001_l2029_l1995_DUPLICATE_8c9a_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2009_c7_5d16_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2009_l2004_l2001_l2029_l1995_DUPLICATE_8c9a_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2029_c7_a4f0_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2009_l2004_l2001_l2029_l1995_DUPLICATE_8c9a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2001_c7_05d6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2012_l2043_l2009_l2039_l2004_l2032_l2001_l2029_l2024_l2020_DUPLICATE_bd02_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2004_c7_840d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2012_l2043_l2009_l2039_l2004_l2032_l2001_l2029_l2024_l2020_DUPLICATE_bd02_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2009_c7_5d16_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2012_l2043_l2009_l2039_l2004_l2032_l2001_l2029_l2024_l2020_DUPLICATE_bd02_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2012_c7_26ab_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2012_l2043_l2009_l2039_l2004_l2032_l2001_l2029_l2024_l2020_DUPLICATE_bd02_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_aa50_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2012_l2043_l2009_l2039_l2004_l2032_l2001_l2029_l2024_l2020_DUPLICATE_bd02_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2024_c7_c97c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2012_l2043_l2009_l2039_l2004_l2032_l2001_l2029_l2024_l2020_DUPLICATE_bd02_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_a4f0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2012_l2043_l2009_l2039_l2004_l2032_l2001_l2029_l2024_l2020_DUPLICATE_bd02_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2032_c7_bb70_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2012_l2043_l2009_l2039_l2004_l2032_l2001_l2029_l2024_l2020_DUPLICATE_bd02_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2039_c7_dda1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2012_l2043_l2009_l2039_l2004_l2032_l2001_l2029_l2024_l2020_DUPLICATE_bd02_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2043_c7_3b7a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2012_l2043_l2009_l2039_l2004_l2032_l2001_l2029_l2024_l2020_DUPLICATE_bd02_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1995_c2_7197_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l2009_l2004_l2032_l2001_l2029_l1995_l2024_l2020_DUPLICATE_eecc_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2001_c7_05d6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l2009_l2004_l2032_l2001_l2029_l1995_l2024_l2020_DUPLICATE_eecc_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2004_c7_840d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l2009_l2004_l2032_l2001_l2029_l1995_l2024_l2020_DUPLICATE_eecc_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2009_c7_5d16_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l2009_l2004_l2032_l2001_l2029_l1995_l2024_l2020_DUPLICATE_eecc_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2020_c7_aa50_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l2009_l2004_l2032_l2001_l2029_l1995_l2024_l2020_DUPLICATE_eecc_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2024_c7_c97c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l2009_l2004_l2032_l2001_l2029_l1995_l2024_l2020_DUPLICATE_eecc_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2029_c7_a4f0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l2009_l2004_l2032_l2001_l2029_l1995_l2024_l2020_DUPLICATE_eecc_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2032_c7_bb70_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l2009_l2004_l2032_l2001_l2029_l1995_l2024_l2020_DUPLICATE_eecc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1995_c2_7197_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2009_l2004_l2001_l1995_l2020_DUPLICATE_33a0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2001_c7_05d6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2009_l2004_l2001_l1995_l2020_DUPLICATE_33a0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2004_c7_840d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2009_l2004_l2001_l1995_l2020_DUPLICATE_33a0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2009_c7_5d16_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2009_l2004_l2001_l1995_l2020_DUPLICATE_33a0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2020_c7_aa50_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2009_l2004_l2001_l1995_l2020_DUPLICATE_33a0_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2001_c7_05d6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2001_l2012_l2004_l2009_DUPLICATE_dd44_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2004_c7_840d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2001_l2012_l2004_l2009_DUPLICATE_dd44_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2009_c7_5d16_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2001_l2012_l2004_l2009_DUPLICATE_dd44_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2012_c7_26ab_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2001_l2012_l2004_l2009_DUPLICATE_dd44_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1995_c2_7197_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2012_l2043_l2009_l2039_l2004_l2001_l2029_l1995_l2024_l2020_DUPLICATE_611c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2001_c7_05d6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2012_l2043_l2009_l2039_l2004_l2001_l2029_l1995_l2024_l2020_DUPLICATE_611c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2004_c7_840d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2012_l2043_l2009_l2039_l2004_l2001_l2029_l1995_l2024_l2020_DUPLICATE_611c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2009_c7_5d16_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2012_l2043_l2009_l2039_l2004_l2001_l2029_l1995_l2024_l2020_DUPLICATE_611c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2012_c7_26ab_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2012_l2043_l2009_l2039_l2004_l2001_l2029_l1995_l2024_l2020_DUPLICATE_611c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_aa50_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2012_l2043_l2009_l2039_l2004_l2001_l2029_l1995_l2024_l2020_DUPLICATE_611c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2024_c7_c97c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2012_l2043_l2009_l2039_l2004_l2001_l2029_l1995_l2024_l2020_DUPLICATE_611c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_a4f0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2012_l2043_l2009_l2039_l2004_l2001_l2029_l1995_l2024_l2020_DUPLICATE_611c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2039_c7_dda1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2012_l2043_l2009_l2039_l2004_l2001_l2029_l1995_l2024_l2020_DUPLICATE_611c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2043_c7_3b7a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2012_l2043_l2009_l2039_l2004_l2001_l2029_l1995_l2024_l2020_DUPLICATE_611c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2012_c7_26ab_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2012_l2039_l2029_l2024_l2020_DUPLICATE_0554_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_aa50_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2012_l2039_l2029_l2024_l2020_DUPLICATE_0554_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2024_c7_c97c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2012_l2039_l2029_l2024_l2020_DUPLICATE_0554_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_a4f0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2012_l2039_l2029_l2024_l2020_DUPLICATE_0554_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2039_c7_dda1_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2012_l2039_l2029_l2024_l2020_DUPLICATE_0554_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1995_c2_7197_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2012_l2009_l2039_l2004_l2001_l2029_l1995_l2024_l2020_DUPLICATE_63b0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2001_c7_05d6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2012_l2009_l2039_l2004_l2001_l2029_l1995_l2024_l2020_DUPLICATE_63b0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2004_c7_840d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2012_l2009_l2039_l2004_l2001_l2029_l1995_l2024_l2020_DUPLICATE_63b0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2009_c7_5d16_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2012_l2009_l2039_l2004_l2001_l2029_l1995_l2024_l2020_DUPLICATE_63b0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2012_c7_26ab_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2012_l2009_l2039_l2004_l2001_l2029_l1995_l2024_l2020_DUPLICATE_63b0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2020_c7_aa50_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2012_l2009_l2039_l2004_l2001_l2029_l1995_l2024_l2020_DUPLICATE_63b0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2024_c7_c97c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2012_l2009_l2039_l2004_l2001_l2029_l1995_l2024_l2020_DUPLICATE_63b0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2029_c7_a4f0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2012_l2009_l2039_l2004_l2001_l2029_l1995_l2024_l2020_DUPLICATE_63b0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2039_c7_dda1_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2012_l2009_l2039_l2004_l2001_l2029_l1995_l2024_l2020_DUPLICATE_63b0_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2024_c7_c97c_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l2027_c3_0008;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2029_c7_a4f0_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l2030_c3_0035;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l2012_c7_26ab] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2012_c7_26ab_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2012_c7_26ab_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2012_c7_26ab_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2012_c7_26ab_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2012_c7_26ab_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2012_c7_26ab_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2012_c7_26ab_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2012_c7_26ab_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2039_c7_dda1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2039_c7_dda1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2039_c7_dda1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2039_c7_dda1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2039_c7_dda1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2039_c7_dda1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2039_c7_dda1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2039_c7_dda1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2039_c7_dda1_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2033_c3_7fd7] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2033_c3_7fd7_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2033_c3_7fd7_left;
     BIN_OP_OR_uxn_opcodes_h_l2033_c3_7fd7_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2033_c3_7fd7_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2033_c3_7fd7_return_output := BIN_OP_OR_uxn_opcodes_h_l2033_c3_7fd7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2043_c7_3b7a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2043_c7_3b7a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2043_c7_3b7a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2043_c7_3b7a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2043_c7_3b7a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2043_c7_3b7a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2043_c7_3b7a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2043_c7_3b7a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2043_c7_3b7a_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l2032_c7_bb70] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l2032_c7_bb70_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2032_c7_bb70_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l2032_c7_bb70_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2032_c7_bb70_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l2032_c7_bb70_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2032_c7_bb70_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2032_c7_bb70_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l2032_c7_bb70_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l2026_c3_6ae7] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l2026_c3_6ae7_x <= VAR_CONST_SL_8_uxn_opcodes_h_l2026_c3_6ae7_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l2026_c3_6ae7_return_output := CONST_SL_8_uxn_opcodes_h_l2026_c3_6ae7_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l2016_c32_99f1] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l2016_c32_99f1_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l2016_c32_99f1_left;
     BIN_OP_GT_uxn_opcodes_h_l2016_c32_99f1_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l2016_c32_99f1_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l2016_c32_99f1_return_output := BIN_OP_GT_uxn_opcodes_h_l2016_c32_99f1_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l2006_c3_4568] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l2006_c3_4568_x <= VAR_CONST_SL_8_uxn_opcodes_h_l2006_c3_4568_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l2006_c3_4568_return_output := CONST_SL_8_uxn_opcodes_h_l2006_c3_4568_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2043_c7_3b7a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2043_c7_3b7a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2043_c7_3b7a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2043_c7_3b7a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2043_c7_3b7a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2043_c7_3b7a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2043_c7_3b7a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2043_c7_3b7a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2043_c7_3b7a_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2041_c24_2544] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2041_c24_2544_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2041_c34_e1d2_return_output);

     -- result_ram_addr_MUX[uxn_opcodes_h_l2029_c7_a4f0] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l2029_c7_a4f0_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2029_c7_a4f0_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l2029_c7_a4f0_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2029_c7_a4f0_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l2029_c7_a4f0_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2029_c7_a4f0_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2029_c7_a4f0_return_output := result_ram_addr_MUX_uxn_opcodes_h_l2029_c7_a4f0_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2013_c3_9c46] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2013_c3_9c46_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2013_c3_9c46_left;
     BIN_OP_OR_uxn_opcodes_h_l2013_c3_9c46_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2013_c3_9c46_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2013_c3_9c46_return_output := BIN_OP_OR_uxn_opcodes_h_l2013_c3_9c46_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1995_c1_d6eb] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1995_c1_d6eb_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1995_c1_d6eb_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1995_c1_d6eb_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1995_c1_d6eb_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1995_c1_d6eb_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1995_c1_d6eb_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1995_c1_d6eb_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1995_c1_d6eb_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2020_c7_aa50] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2020_c7_aa50_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2020_c7_aa50_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2020_c7_aa50_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2020_c7_aa50_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2020_c7_aa50_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2020_c7_aa50_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2020_c7_aa50_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2020_c7_aa50_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l2016_c32_65df_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l2016_c32_99f1_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2012_c7_26ab_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2013_c3_9c46_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2012_c7_26ab_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2013_c3_9c46_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2032_c7_bb70_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2033_c3_7fd7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2039_c7_dda1_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2041_c24_2544_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2004_c7_840d_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l2006_c3_4568_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2024_c7_c97c_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l2026_c3_6ae7_return_output;
     VAR_printf_uxn_opcodes_h_l1996_c3_0914_uxn_opcodes_h_l1996_c3_0914_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1995_c1_d6eb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2039_c7_dda1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2043_c7_3b7a_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2029_c7_a4f0_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2032_c7_bb70_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2012_c7_26ab_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2020_c7_aa50_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2009_c7_5d16_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2012_c7_26ab_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2039_c7_dda1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2043_c7_3b7a_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2024_c7_c97c_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l2029_c7_a4f0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2032_c7_bb70_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2039_c7_dda1_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2039_c7_dda1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2039_c7_dda1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2039_c7_dda1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2039_c7_dda1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2039_c7_dda1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2039_c7_dda1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2039_c7_dda1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2039_c7_dda1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2039_c7_dda1_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2012_c7_26ab] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2012_c7_26ab_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2012_c7_26ab_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2012_c7_26ab_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2012_c7_26ab_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2012_c7_26ab_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2012_c7_26ab_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2012_c7_26ab_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2012_c7_26ab_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2032_c7_bb70] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2032_c7_bb70_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2032_c7_bb70_cond;
     tmp16_MUX_uxn_opcodes_h_l2032_c7_bb70_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2032_c7_bb70_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2032_c7_bb70_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2032_c7_bb70_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2032_c7_bb70_return_output := tmp16_MUX_uxn_opcodes_h_l2032_c7_bb70_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2039_c7_dda1] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2039_c7_dda1_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2039_c7_dda1_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2039_c7_dda1_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2039_c7_dda1_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2039_c7_dda1_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2039_c7_dda1_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2039_c7_dda1_return_output := result_stack_value_MUX_uxn_opcodes_h_l2039_c7_dda1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2032_c7_bb70] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2032_c7_bb70_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2032_c7_bb70_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2032_c7_bb70_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2032_c7_bb70_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2032_c7_bb70_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2032_c7_bb70_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2032_c7_bb70_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2032_c7_bb70_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l2029_c7_a4f0] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l2029_c7_a4f0_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2029_c7_a4f0_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l2029_c7_a4f0_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2029_c7_a4f0_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l2029_c7_a4f0_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2029_c7_a4f0_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2029_c7_a4f0_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l2029_c7_a4f0_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2037_c24_8bc5] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2037_c24_8bc5_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_OR_uxn_opcodes_h_l2033_c3_7fd7_return_output);

     -- printf_uxn_opcodes_h_l1996_c3_0914[uxn_opcodes_h_l1996_c3_0914] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1996_c3_0914_uxn_opcodes_h_l1996_c3_0914_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1996_c3_0914_uxn_opcodes_h_l1996_c3_0914_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_ram_addr_MUX[uxn_opcodes_h_l2024_c7_c97c] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l2024_c7_c97c_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2024_c7_c97c_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l2024_c7_c97c_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2024_c7_c97c_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l2024_c7_c97c_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2024_c7_c97c_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2024_c7_c97c_return_output := result_ram_addr_MUX_uxn_opcodes_h_l2024_c7_c97c_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2009_c7_5d16] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2009_c7_5d16_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2009_c7_5d16_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2009_c7_5d16_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2009_c7_5d16_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2009_c7_5d16_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2009_c7_5d16_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2009_c7_5d16_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2009_c7_5d16_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2039_c7_dda1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2039_c7_dda1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2039_c7_dda1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2039_c7_dda1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2039_c7_dda1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2039_c7_dda1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2039_c7_dda1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2039_c7_dda1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2039_c7_dda1_return_output;

     -- MUX[uxn_opcodes_h_l2016_c32_65df] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2016_c32_65df_cond <= VAR_MUX_uxn_opcodes_h_l2016_c32_65df_cond;
     MUX_uxn_opcodes_h_l2016_c32_65df_iftrue <= VAR_MUX_uxn_opcodes_h_l2016_c32_65df_iftrue;
     MUX_uxn_opcodes_h_l2016_c32_65df_iffalse <= VAR_MUX_uxn_opcodes_h_l2016_c32_65df_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2016_c32_65df_return_output := MUX_uxn_opcodes_h_l2016_c32_65df_return_output;

     -- t16_MUX[uxn_opcodes_h_l2012_c7_26ab] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2012_c7_26ab_cond <= VAR_t16_MUX_uxn_opcodes_h_l2012_c7_26ab_cond;
     t16_MUX_uxn_opcodes_h_l2012_c7_26ab_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2012_c7_26ab_iftrue;
     t16_MUX_uxn_opcodes_h_l2012_c7_26ab_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2012_c7_26ab_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2012_c7_26ab_return_output := t16_MUX_uxn_opcodes_h_l2012_c7_26ab_return_output;

     -- Submodule level 3
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2032_c7_bb70_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2037_c24_8bc5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2012_c7_26ab_iftrue := VAR_MUX_uxn_opcodes_h_l2016_c32_65df_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2032_c7_bb70_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2039_c7_dda1_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2024_c7_c97c_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2029_c7_a4f0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2009_c7_5d16_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2012_c7_26ab_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2004_c7_840d_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2009_c7_5d16_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2032_c7_bb70_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2039_c7_dda1_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2020_c7_aa50_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l2024_c7_c97c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_a4f0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2032_c7_bb70_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2032_c7_bb70_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2039_c7_dda1_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2009_c7_5d16_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2012_c7_26ab_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2029_c7_a4f0_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2032_c7_bb70_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2029_c7_a4f0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_a4f0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_a4f0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_a4f0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_a4f0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_a4f0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_a4f0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_a4f0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_a4f0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2032_c7_bb70] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2032_c7_bb70_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2032_c7_bb70_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2032_c7_bb70_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2032_c7_bb70_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2032_c7_bb70_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2032_c7_bb70_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2032_c7_bb70_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2032_c7_bb70_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2032_c7_bb70] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2032_c7_bb70_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2032_c7_bb70_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2032_c7_bb70_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2032_c7_bb70_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2032_c7_bb70_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2032_c7_bb70_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2032_c7_bb70_return_output := result_stack_value_MUX_uxn_opcodes_h_l2032_c7_bb70_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l2024_c7_c97c] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l2024_c7_c97c_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2024_c7_c97c_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l2024_c7_c97c_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2024_c7_c97c_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l2024_c7_c97c_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2024_c7_c97c_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2024_c7_c97c_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l2024_c7_c97c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2012_c7_26ab] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2012_c7_26ab_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2012_c7_26ab_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2012_c7_26ab_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2012_c7_26ab_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2012_c7_26ab_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2012_c7_26ab_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2012_c7_26ab_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2012_c7_26ab_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2009_c7_5d16] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2009_c7_5d16_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2009_c7_5d16_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2009_c7_5d16_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2009_c7_5d16_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2009_c7_5d16_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2009_c7_5d16_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2009_c7_5d16_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2009_c7_5d16_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2004_c7_840d] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2004_c7_840d_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2004_c7_840d_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2004_c7_840d_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2004_c7_840d_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2004_c7_840d_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2004_c7_840d_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2004_c7_840d_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2004_c7_840d_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l2020_c7_aa50] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l2020_c7_aa50_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2020_c7_aa50_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l2020_c7_aa50_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2020_c7_aa50_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l2020_c7_aa50_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2020_c7_aa50_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2020_c7_aa50_return_output := result_ram_addr_MUX_uxn_opcodes_h_l2020_c7_aa50_return_output;

     -- t16_MUX[uxn_opcodes_h_l2009_c7_5d16] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2009_c7_5d16_cond <= VAR_t16_MUX_uxn_opcodes_h_l2009_c7_5d16_cond;
     t16_MUX_uxn_opcodes_h_l2009_c7_5d16_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2009_c7_5d16_iftrue;
     t16_MUX_uxn_opcodes_h_l2009_c7_5d16_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2009_c7_5d16_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2009_c7_5d16_return_output := t16_MUX_uxn_opcodes_h_l2009_c7_5d16_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2032_c7_bb70] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2032_c7_bb70_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2032_c7_bb70_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2032_c7_bb70_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2032_c7_bb70_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2032_c7_bb70_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2032_c7_bb70_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2032_c7_bb70_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2032_c7_bb70_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2029_c7_a4f0] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2029_c7_a4f0_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2029_c7_a4f0_cond;
     tmp16_MUX_uxn_opcodes_h_l2029_c7_a4f0_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2029_c7_a4f0_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2029_c7_a4f0_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2029_c7_a4f0_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2029_c7_a4f0_return_output := tmp16_MUX_uxn_opcodes_h_l2029_c7_a4f0_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_a4f0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2032_c7_bb70_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2020_c7_aa50_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2024_c7_c97c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2004_c7_840d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2009_c7_5d16_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2001_c7_05d6_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2004_c7_840d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_a4f0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2032_c7_bb70_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2012_c7_26ab_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l2020_c7_aa50_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2009_c7_5d16_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2012_c7_26ab_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2024_c7_c97c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_a4f0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2029_c7_a4f0_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2032_c7_bb70_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2004_c7_840d_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2009_c7_5d16_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2024_c7_c97c_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2029_c7_a4f0_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l2024_c7_c97c] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2024_c7_c97c_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2024_c7_c97c_cond;
     tmp16_MUX_uxn_opcodes_h_l2024_c7_c97c_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2024_c7_c97c_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2024_c7_c97c_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2024_c7_c97c_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2024_c7_c97c_return_output := tmp16_MUX_uxn_opcodes_h_l2024_c7_c97c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2029_c7_a4f0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_a4f0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_a4f0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_a4f0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_a4f0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_a4f0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_a4f0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_a4f0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_a4f0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2009_c7_5d16] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2009_c7_5d16_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2009_c7_5d16_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2009_c7_5d16_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2009_c7_5d16_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2009_c7_5d16_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2009_c7_5d16_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2009_c7_5d16_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2009_c7_5d16_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l2012_c7_26ab] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l2012_c7_26ab_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2012_c7_26ab_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l2012_c7_26ab_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2012_c7_26ab_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l2012_c7_26ab_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2012_c7_26ab_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2012_c7_26ab_return_output := result_ram_addr_MUX_uxn_opcodes_h_l2012_c7_26ab_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2029_c7_a4f0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_a4f0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_a4f0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_a4f0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_a4f0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_a4f0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_a4f0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_a4f0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_a4f0_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2001_c7_05d6] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2001_c7_05d6_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2001_c7_05d6_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2001_c7_05d6_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2001_c7_05d6_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2001_c7_05d6_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2001_c7_05d6_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2001_c7_05d6_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2001_c7_05d6_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l2020_c7_aa50] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l2020_c7_aa50_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2020_c7_aa50_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l2020_c7_aa50_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2020_c7_aa50_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l2020_c7_aa50_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2020_c7_aa50_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2020_c7_aa50_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l2020_c7_aa50_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2024_c7_c97c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2024_c7_c97c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2024_c7_c97c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2024_c7_c97c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2024_c7_c97c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2024_c7_c97c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2024_c7_c97c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2024_c7_c97c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2024_c7_c97c_return_output;

     -- t16_MUX[uxn_opcodes_h_l2004_c7_840d] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2004_c7_840d_cond <= VAR_t16_MUX_uxn_opcodes_h_l2004_c7_840d_cond;
     t16_MUX_uxn_opcodes_h_l2004_c7_840d_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2004_c7_840d_iftrue;
     t16_MUX_uxn_opcodes_h_l2004_c7_840d_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2004_c7_840d_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2004_c7_840d_return_output := t16_MUX_uxn_opcodes_h_l2004_c7_840d_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2029_c7_a4f0] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2029_c7_a4f0_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2029_c7_a4f0_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2029_c7_a4f0_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2029_c7_a4f0_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2029_c7_a4f0_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2029_c7_a4f0_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2029_c7_a4f0_return_output := result_stack_value_MUX_uxn_opcodes_h_l2029_c7_a4f0_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2004_c7_840d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2004_c7_840d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2004_c7_840d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2004_c7_840d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2004_c7_840d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2004_c7_840d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2004_c7_840d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2004_c7_840d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2004_c7_840d_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2024_c7_c97c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_a4f0_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2012_c7_26ab_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2020_c7_aa50_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2001_c7_05d6_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2004_c7_840d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1995_c2_7197_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2001_c7_05d6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2024_c7_c97c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_a4f0_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2009_c7_5d16_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l2012_c7_26ab_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c7_840d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2009_c7_5d16_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_aa50_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2024_c7_c97c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2024_c7_c97c_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2029_c7_a4f0_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2001_c7_05d6_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2004_c7_840d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2020_c7_aa50_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2024_c7_c97c_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2001_c7_05d6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2001_c7_05d6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2001_c7_05d6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2001_c7_05d6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2001_c7_05d6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2001_c7_05d6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2001_c7_05d6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2001_c7_05d6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2001_c7_05d6_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1995_c2_7197] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1995_c2_7197_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1995_c2_7197_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1995_c2_7197_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1995_c2_7197_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1995_c2_7197_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1995_c2_7197_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1995_c2_7197_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1995_c2_7197_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l2012_c7_26ab] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l2012_c7_26ab_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2012_c7_26ab_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l2012_c7_26ab_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2012_c7_26ab_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l2012_c7_26ab_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2012_c7_26ab_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2012_c7_26ab_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l2012_c7_26ab_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l2009_c7_5d16] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l2009_c7_5d16_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2009_c7_5d16_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l2009_c7_5d16_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2009_c7_5d16_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l2009_c7_5d16_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2009_c7_5d16_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2009_c7_5d16_return_output := result_ram_addr_MUX_uxn_opcodes_h_l2009_c7_5d16_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2004_c7_840d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c7_840d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c7_840d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c7_840d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c7_840d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c7_840d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c7_840d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c7_840d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c7_840d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2020_c7_aa50] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_aa50_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_aa50_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_aa50_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_aa50_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_aa50_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_aa50_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_aa50_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_aa50_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2024_c7_c97c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2024_c7_c97c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2024_c7_c97c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2024_c7_c97c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2024_c7_c97c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2024_c7_c97c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2024_c7_c97c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2024_c7_c97c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2024_c7_c97c_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2024_c7_c97c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2024_c7_c97c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2024_c7_c97c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2024_c7_c97c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2024_c7_c97c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2024_c7_c97c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2024_c7_c97c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2024_c7_c97c_return_output := result_stack_value_MUX_uxn_opcodes_h_l2024_c7_c97c_return_output;

     -- t16_MUX[uxn_opcodes_h_l2001_c7_05d6] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2001_c7_05d6_cond <= VAR_t16_MUX_uxn_opcodes_h_l2001_c7_05d6_cond;
     t16_MUX_uxn_opcodes_h_l2001_c7_05d6_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2001_c7_05d6_iftrue;
     t16_MUX_uxn_opcodes_h_l2001_c7_05d6_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2001_c7_05d6_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2001_c7_05d6_return_output := t16_MUX_uxn_opcodes_h_l2001_c7_05d6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2024_c7_c97c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2024_c7_c97c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2024_c7_c97c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2024_c7_c97c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2024_c7_c97c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2024_c7_c97c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2024_c7_c97c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2024_c7_c97c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2024_c7_c97c_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2020_c7_aa50] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2020_c7_aa50_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2020_c7_aa50_cond;
     tmp16_MUX_uxn_opcodes_h_l2020_c7_aa50_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2020_c7_aa50_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2020_c7_aa50_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2020_c7_aa50_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2020_c7_aa50_return_output := tmp16_MUX_uxn_opcodes_h_l2020_c7_aa50_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_aa50_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2024_c7_c97c_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2009_c7_5d16_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2012_c7_26ab_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1995_c2_7197_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2001_c7_05d6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_aa50_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2024_c7_c97c_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2004_c7_840d_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l2009_c7_5d16_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2001_c7_05d6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c7_840d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2012_c7_26ab_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_aa50_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2020_c7_aa50_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2024_c7_c97c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1995_c2_7197_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2001_c7_05d6_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2012_c7_26ab_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2020_c7_aa50_return_output;
     -- result_is_ram_read_MUX[uxn_opcodes_h_l2009_c7_5d16] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l2009_c7_5d16_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2009_c7_5d16_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l2009_c7_5d16_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2009_c7_5d16_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l2009_c7_5d16_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2009_c7_5d16_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2009_c7_5d16_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l2009_c7_5d16_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l2004_c7_840d] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l2004_c7_840d_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2004_c7_840d_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l2004_c7_840d_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2004_c7_840d_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l2004_c7_840d_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2004_c7_840d_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2004_c7_840d_return_output := result_ram_addr_MUX_uxn_opcodes_h_l2004_c7_840d_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2012_c7_26ab] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2012_c7_26ab_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2012_c7_26ab_cond;
     tmp16_MUX_uxn_opcodes_h_l2012_c7_26ab_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2012_c7_26ab_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2012_c7_26ab_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2012_c7_26ab_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2012_c7_26ab_return_output := tmp16_MUX_uxn_opcodes_h_l2012_c7_26ab_return_output;

     -- t16_MUX[uxn_opcodes_h_l1995_c2_7197] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1995_c2_7197_cond <= VAR_t16_MUX_uxn_opcodes_h_l1995_c2_7197_cond;
     t16_MUX_uxn_opcodes_h_l1995_c2_7197_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1995_c2_7197_iftrue;
     t16_MUX_uxn_opcodes_h_l1995_c2_7197_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1995_c2_7197_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1995_c2_7197_return_output := t16_MUX_uxn_opcodes_h_l1995_c2_7197_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2012_c7_26ab] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2012_c7_26ab_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2012_c7_26ab_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2012_c7_26ab_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2012_c7_26ab_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2012_c7_26ab_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2012_c7_26ab_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2012_c7_26ab_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2012_c7_26ab_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2020_c7_aa50] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_aa50_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_aa50_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_aa50_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_aa50_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_aa50_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_aa50_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_aa50_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_aa50_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2001_c7_05d6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2001_c7_05d6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2001_c7_05d6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2001_c7_05d6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2001_c7_05d6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2001_c7_05d6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2001_c7_05d6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2001_c7_05d6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2001_c7_05d6_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1995_c2_7197] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1995_c2_7197_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1995_c2_7197_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1995_c2_7197_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1995_c2_7197_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1995_c2_7197_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1995_c2_7197_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1995_c2_7197_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1995_c2_7197_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2020_c7_aa50] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_aa50_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_aa50_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_aa50_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_aa50_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_aa50_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_aa50_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_aa50_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_aa50_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2020_c7_aa50] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2020_c7_aa50_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2020_c7_aa50_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2020_c7_aa50_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2020_c7_aa50_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2020_c7_aa50_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2020_c7_aa50_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2020_c7_aa50_return_output := result_stack_value_MUX_uxn_opcodes_h_l2020_c7_aa50_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2012_c7_26ab_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_aa50_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2004_c7_840d_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2009_c7_5d16_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2012_c7_26ab_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_aa50_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2001_c7_05d6_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l2004_c7_840d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1995_c2_7197_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2001_c7_05d6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2009_c7_5d16_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2012_c7_26ab_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2012_c7_26ab_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2020_c7_aa50_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1995_c2_7197_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2009_c7_5d16_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2012_c7_26ab_return_output;
     -- result_is_ram_read_MUX[uxn_opcodes_h_l2004_c7_840d] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l2004_c7_840d_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2004_c7_840d_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l2004_c7_840d_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2004_c7_840d_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l2004_c7_840d_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2004_c7_840d_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2004_c7_840d_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l2004_c7_840d_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2009_c7_5d16] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2009_c7_5d16_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2009_c7_5d16_cond;
     tmp16_MUX_uxn_opcodes_h_l2009_c7_5d16_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2009_c7_5d16_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2009_c7_5d16_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2009_c7_5d16_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2009_c7_5d16_return_output := tmp16_MUX_uxn_opcodes_h_l2009_c7_5d16_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2009_c7_5d16] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2009_c7_5d16_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2009_c7_5d16_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2009_c7_5d16_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2009_c7_5d16_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2009_c7_5d16_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2009_c7_5d16_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2009_c7_5d16_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2009_c7_5d16_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1995_c2_7197] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1995_c2_7197_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1995_c2_7197_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1995_c2_7197_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1995_c2_7197_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1995_c2_7197_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1995_c2_7197_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1995_c2_7197_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1995_c2_7197_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l2001_c7_05d6] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l2001_c7_05d6_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2001_c7_05d6_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l2001_c7_05d6_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2001_c7_05d6_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l2001_c7_05d6_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2001_c7_05d6_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2001_c7_05d6_return_output := result_ram_addr_MUX_uxn_opcodes_h_l2001_c7_05d6_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2012_c7_26ab] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2012_c7_26ab_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2012_c7_26ab_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2012_c7_26ab_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2012_c7_26ab_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2012_c7_26ab_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2012_c7_26ab_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2012_c7_26ab_return_output := result_stack_value_MUX_uxn_opcodes_h_l2012_c7_26ab_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2012_c7_26ab] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2012_c7_26ab_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2012_c7_26ab_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2012_c7_26ab_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2012_c7_26ab_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2012_c7_26ab_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2012_c7_26ab_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2012_c7_26ab_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2012_c7_26ab_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2012_c7_26ab] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2012_c7_26ab_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2012_c7_26ab_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2012_c7_26ab_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2012_c7_26ab_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2012_c7_26ab_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2012_c7_26ab_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2012_c7_26ab_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2012_c7_26ab_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2009_c7_5d16_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2012_c7_26ab_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2001_c7_05d6_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2004_c7_840d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2009_c7_5d16_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2012_c7_26ab_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1995_c2_7197_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l2001_c7_05d6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c7_840d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2009_c7_5d16_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2009_c7_5d16_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2012_c7_26ab_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2004_c7_840d_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2009_c7_5d16_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l2004_c7_840d] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2004_c7_840d_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2004_c7_840d_cond;
     tmp16_MUX_uxn_opcodes_h_l2004_c7_840d_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2004_c7_840d_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2004_c7_840d_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2004_c7_840d_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2004_c7_840d_return_output := tmp16_MUX_uxn_opcodes_h_l2004_c7_840d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2009_c7_5d16] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2009_c7_5d16_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2009_c7_5d16_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2009_c7_5d16_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2009_c7_5d16_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2009_c7_5d16_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2009_c7_5d16_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2009_c7_5d16_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2009_c7_5d16_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2004_c7_840d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c7_840d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c7_840d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c7_840d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c7_840d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c7_840d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c7_840d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c7_840d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c7_840d_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1995_c2_7197] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1995_c2_7197_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1995_c2_7197_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1995_c2_7197_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1995_c2_7197_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1995_c2_7197_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1995_c2_7197_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1995_c2_7197_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1995_c2_7197_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2009_c7_5d16] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2009_c7_5d16_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2009_c7_5d16_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2009_c7_5d16_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2009_c7_5d16_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2009_c7_5d16_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2009_c7_5d16_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2009_c7_5d16_return_output := result_stack_value_MUX_uxn_opcodes_h_l2009_c7_5d16_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l2001_c7_05d6] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l2001_c7_05d6_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2001_c7_05d6_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l2001_c7_05d6_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2001_c7_05d6_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l2001_c7_05d6_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2001_c7_05d6_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2001_c7_05d6_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l2001_c7_05d6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2009_c7_5d16] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2009_c7_5d16_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2009_c7_5d16_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2009_c7_5d16_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2009_c7_5d16_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2009_c7_5d16_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2009_c7_5d16_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2009_c7_5d16_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2009_c7_5d16_return_output;

     -- Submodule level 9
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2004_c7_840d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2009_c7_5d16_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1995_c2_7197_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2001_c7_05d6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2004_c7_840d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2009_c7_5d16_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2001_c7_05d6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c7_840d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2004_c7_840d_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2009_c7_5d16_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2001_c7_05d6_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2004_c7_840d_return_output;
     -- result_is_ram_read_MUX[uxn_opcodes_h_l1995_c2_7197] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1995_c2_7197_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1995_c2_7197_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1995_c2_7197_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1995_c2_7197_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1995_c2_7197_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1995_c2_7197_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1995_c2_7197_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1995_c2_7197_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2001_c7_05d6] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2001_c7_05d6_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2001_c7_05d6_cond;
     tmp16_MUX_uxn_opcodes_h_l2001_c7_05d6_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2001_c7_05d6_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2001_c7_05d6_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2001_c7_05d6_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2001_c7_05d6_return_output := tmp16_MUX_uxn_opcodes_h_l2001_c7_05d6_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2004_c7_840d] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2004_c7_840d_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2004_c7_840d_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2004_c7_840d_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2004_c7_840d_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2004_c7_840d_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2004_c7_840d_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2004_c7_840d_return_output := result_stack_value_MUX_uxn_opcodes_h_l2004_c7_840d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2004_c7_840d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2004_c7_840d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2004_c7_840d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2004_c7_840d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2004_c7_840d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2004_c7_840d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2004_c7_840d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2004_c7_840d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2004_c7_840d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2001_c7_05d6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2001_c7_05d6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2001_c7_05d6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2001_c7_05d6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2001_c7_05d6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2001_c7_05d6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2001_c7_05d6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2001_c7_05d6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2001_c7_05d6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2004_c7_840d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2004_c7_840d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2004_c7_840d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2004_c7_840d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2004_c7_840d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2004_c7_840d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2004_c7_840d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2004_c7_840d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2004_c7_840d_return_output;

     -- Submodule level 10
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2001_c7_05d6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2004_c7_840d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2001_c7_05d6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2004_c7_840d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1995_c2_7197_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2001_c7_05d6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2001_c7_05d6_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2004_c7_840d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1995_c2_7197_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2001_c7_05d6_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2001_c7_05d6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2001_c7_05d6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2001_c7_05d6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2001_c7_05d6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2001_c7_05d6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2001_c7_05d6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2001_c7_05d6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2001_c7_05d6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2001_c7_05d6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1995_c2_7197] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1995_c2_7197_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1995_c2_7197_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1995_c2_7197_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1995_c2_7197_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1995_c2_7197_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1995_c2_7197_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1995_c2_7197_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1995_c2_7197_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2001_c7_05d6] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2001_c7_05d6_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2001_c7_05d6_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2001_c7_05d6_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2001_c7_05d6_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2001_c7_05d6_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2001_c7_05d6_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2001_c7_05d6_return_output := result_stack_value_MUX_uxn_opcodes_h_l2001_c7_05d6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2001_c7_05d6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2001_c7_05d6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2001_c7_05d6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2001_c7_05d6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2001_c7_05d6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2001_c7_05d6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2001_c7_05d6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2001_c7_05d6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2001_c7_05d6_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1995_c2_7197] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1995_c2_7197_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1995_c2_7197_cond;
     tmp16_MUX_uxn_opcodes_h_l1995_c2_7197_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1995_c2_7197_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1995_c2_7197_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1995_c2_7197_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1995_c2_7197_return_output := tmp16_MUX_uxn_opcodes_h_l1995_c2_7197_return_output;

     -- Submodule level 11
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1995_c2_7197_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2001_c7_05d6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1995_c2_7197_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2001_c7_05d6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1995_c2_7197_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2001_c7_05d6_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l1995_c2_7197_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1995_c2_7197] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1995_c2_7197_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1995_c2_7197_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1995_c2_7197_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1995_c2_7197_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1995_c2_7197_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1995_c2_7197_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1995_c2_7197_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1995_c2_7197_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1995_c2_7197] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1995_c2_7197_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1995_c2_7197_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1995_c2_7197_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1995_c2_7197_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1995_c2_7197_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1995_c2_7197_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1995_c2_7197_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1995_c2_7197_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1995_c2_7197] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1995_c2_7197_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1995_c2_7197_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1995_c2_7197_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1995_c2_7197_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1995_c2_7197_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1995_c2_7197_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1995_c2_7197_return_output := result_stack_value_MUX_uxn_opcodes_h_l1995_c2_7197_return_output;

     -- Submodule level 12
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_c22c_uxn_opcodes_h_l2048_l1991_DUPLICATE_90a9 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c22c_uxn_opcodes_h_l2048_l1991_DUPLICATE_90a9_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_c22c(
     result,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1995_c2_7197_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1995_c2_7197_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1995_c2_7197_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1995_c2_7197_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1995_c2_7197_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1995_c2_7197_return_output,
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1995_c2_7197_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1995_c2_7197_return_output,
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1995_c2_7197_return_output);

     -- Submodule level 13
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c22c_uxn_opcodes_h_l2048_l1991_DUPLICATE_90a9_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c22c_uxn_opcodes_h_l2048_l1991_DUPLICATE_90a9_return_output;
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
