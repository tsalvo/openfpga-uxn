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
-- Submodules: 60
entity ldr_0CLK_f7466064 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end ldr_0CLK_f7466064;
architecture arch of ldr_0CLK_f7466064 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal tmp8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_tmp8 : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l1794_c6_ba27]
signal BIN_OP_EQ_uxn_opcodes_h_l1794_c6_ba27_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1794_c6_ba27_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1794_c6_ba27_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1794_c1_bd57]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1794_c1_bd57_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1794_c1_bd57_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1794_c1_bd57_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1794_c1_bd57_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1794_c2_dd43]
signal tmp8_MUX_uxn_opcodes_h_l1794_c2_dd43_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1794_c2_dd43_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1794_c2_dd43_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1794_c2_dd43_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1794_c2_dd43]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1794_c2_dd43_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1794_c2_dd43_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1794_c2_dd43_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1794_c2_dd43_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1794_c2_dd43]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1794_c2_dd43_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1794_c2_dd43_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1794_c2_dd43_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1794_c2_dd43_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1794_c2_dd43]
signal result_stack_value_MUX_uxn_opcodes_h_l1794_c2_dd43_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1794_c2_dd43_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1794_c2_dd43_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1794_c2_dd43_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1794_c2_dd43]
signal result_ram_addr_MUX_uxn_opcodes_h_l1794_c2_dd43_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1794_c2_dd43_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1794_c2_dd43_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1794_c2_dd43_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1794_c2_dd43]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1794_c2_dd43_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1794_c2_dd43_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1794_c2_dd43_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1794_c2_dd43_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1794_c2_dd43]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1794_c2_dd43_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1794_c2_dd43_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1794_c2_dd43_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1794_c2_dd43_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1794_c2_dd43]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1794_c2_dd43_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1794_c2_dd43_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1794_c2_dd43_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1794_c2_dd43_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1794_c2_dd43]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1794_c2_dd43_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1794_c2_dd43_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1794_c2_dd43_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1794_c2_dd43_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1794_c2_dd43]
signal t8_MUX_uxn_opcodes_h_l1794_c2_dd43_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1794_c2_dd43_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1794_c2_dd43_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1794_c2_dd43_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l1795_c3_7346[uxn_opcodes_h_l1795_c3_7346]
signal printf_uxn_opcodes_h_l1795_c3_7346_uxn_opcodes_h_l1795_c3_7346_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1800_c11_5955]
signal BIN_OP_EQ_uxn_opcodes_h_l1800_c11_5955_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1800_c11_5955_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1800_c11_5955_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1800_c7_1f1f]
signal tmp8_MUX_uxn_opcodes_h_l1800_c7_1f1f_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1800_c7_1f1f_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1800_c7_1f1f_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1800_c7_1f1f_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1800_c7_1f1f]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1800_c7_1f1f_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1800_c7_1f1f_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1800_c7_1f1f_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1800_c7_1f1f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1800_c7_1f1f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1800_c7_1f1f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1800_c7_1f1f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1800_c7_1f1f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1800_c7_1f1f_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1800_c7_1f1f]
signal result_stack_value_MUX_uxn_opcodes_h_l1800_c7_1f1f_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1800_c7_1f1f_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1800_c7_1f1f_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1800_c7_1f1f_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1800_c7_1f1f]
signal result_ram_addr_MUX_uxn_opcodes_h_l1800_c7_1f1f_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1800_c7_1f1f_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1800_c7_1f1f_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1800_c7_1f1f_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1800_c7_1f1f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1800_c7_1f1f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1800_c7_1f1f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1800_c7_1f1f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1800_c7_1f1f_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1800_c7_1f1f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1800_c7_1f1f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1800_c7_1f1f_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1800_c7_1f1f_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1800_c7_1f1f_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1800_c7_1f1f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1800_c7_1f1f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1800_c7_1f1f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1800_c7_1f1f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1800_c7_1f1f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1800_c7_1f1f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1800_c7_1f1f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1800_c7_1f1f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1800_c7_1f1f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1800_c7_1f1f_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1800_c7_1f1f]
signal t8_MUX_uxn_opcodes_h_l1800_c7_1f1f_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1800_c7_1f1f_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1800_c7_1f1f_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1800_c7_1f1f_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1803_c11_5101]
signal BIN_OP_EQ_uxn_opcodes_h_l1803_c11_5101_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1803_c11_5101_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1803_c11_5101_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1803_c7_8739]
signal tmp8_MUX_uxn_opcodes_h_l1803_c7_8739_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1803_c7_8739_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1803_c7_8739_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1803_c7_8739_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1803_c7_8739]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1803_c7_8739_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1803_c7_8739_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1803_c7_8739_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1803_c7_8739_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1803_c7_8739]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1803_c7_8739_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1803_c7_8739_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1803_c7_8739_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1803_c7_8739_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1803_c7_8739]
signal result_stack_value_MUX_uxn_opcodes_h_l1803_c7_8739_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1803_c7_8739_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1803_c7_8739_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1803_c7_8739_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1803_c7_8739]
signal result_ram_addr_MUX_uxn_opcodes_h_l1803_c7_8739_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1803_c7_8739_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1803_c7_8739_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1803_c7_8739_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1803_c7_8739]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1803_c7_8739_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1803_c7_8739_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1803_c7_8739_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1803_c7_8739_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1803_c7_8739]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1803_c7_8739_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1803_c7_8739_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1803_c7_8739_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1803_c7_8739_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1803_c7_8739]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1803_c7_8739_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1803_c7_8739_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1803_c7_8739_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1803_c7_8739_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1803_c7_8739]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1803_c7_8739_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1803_c7_8739_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1803_c7_8739_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1803_c7_8739_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1803_c7_8739]
signal t8_MUX_uxn_opcodes_h_l1803_c7_8739_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1803_c7_8739_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1803_c7_8739_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1803_c7_8739_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1807_c32_9eef]
signal BIN_OP_AND_uxn_opcodes_h_l1807_c32_9eef_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1807_c32_9eef_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1807_c32_9eef_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1807_c32_6035]
signal BIN_OP_GT_uxn_opcodes_h_l1807_c32_6035_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1807_c32_6035_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1807_c32_6035_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1807_c32_840c]
signal MUX_uxn_opcodes_h_l1807_c32_840c_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1807_c32_840c_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1807_c32_840c_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1807_c32_840c_return_output : signed(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1808_c21_8dc5]
signal BIN_OP_PLUS_uxn_opcodes_h_l1808_c21_8dc5_left : signed(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1808_c21_8dc5_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1808_c21_8dc5_return_output : signed(17 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1810_c11_4917]
signal BIN_OP_EQ_uxn_opcodes_h_l1810_c11_4917_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1810_c11_4917_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1810_c11_4917_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1810_c7_3aab]
signal tmp8_MUX_uxn_opcodes_h_l1810_c7_3aab_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1810_c7_3aab_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1810_c7_3aab_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1810_c7_3aab_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1810_c7_3aab]
signal result_ram_addr_MUX_uxn_opcodes_h_l1810_c7_3aab_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1810_c7_3aab_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1810_c7_3aab_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1810_c7_3aab_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1810_c7_3aab]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1810_c7_3aab_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1810_c7_3aab_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1810_c7_3aab_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1810_c7_3aab_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1810_c7_3aab]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1810_c7_3aab_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1810_c7_3aab_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1810_c7_3aab_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1810_c7_3aab_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1810_c7_3aab]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1810_c7_3aab_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1810_c7_3aab_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1810_c7_3aab_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1810_c7_3aab_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1810_c7_3aab]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1810_c7_3aab_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1810_c7_3aab_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1810_c7_3aab_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1810_c7_3aab_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1810_c7_3aab]
signal result_stack_value_MUX_uxn_opcodes_h_l1810_c7_3aab_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1810_c7_3aab_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1810_c7_3aab_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1810_c7_3aab_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1812_c21_5cdf]
signal BIN_OP_PLUS_uxn_opcodes_h_l1812_c21_5cdf_left : signed(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1812_c21_5cdf_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1812_c21_5cdf_return_output : signed(17 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1814_c11_086a]
signal BIN_OP_EQ_uxn_opcodes_h_l1814_c11_086a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1814_c11_086a_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1814_c11_086a_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1814_c7_079e]
signal tmp8_MUX_uxn_opcodes_h_l1814_c7_079e_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1814_c7_079e_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1814_c7_079e_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1814_c7_079e_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1814_c7_079e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1814_c7_079e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1814_c7_079e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1814_c7_079e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1814_c7_079e_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1814_c7_079e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1814_c7_079e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1814_c7_079e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1814_c7_079e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1814_c7_079e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1814_c7_079e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1814_c7_079e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1814_c7_079e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1814_c7_079e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1814_c7_079e_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1814_c7_079e]
signal result_stack_value_MUX_uxn_opcodes_h_l1814_c7_079e_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1814_c7_079e_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1814_c7_079e_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1814_c7_079e_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1820_c11_e866]
signal BIN_OP_EQ_uxn_opcodes_h_l1820_c11_e866_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1820_c11_e866_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1820_c11_e866_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1820_c7_5c25]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1820_c7_5c25_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1820_c7_5c25_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1820_c7_5c25_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1820_c7_5c25_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1820_c7_5c25]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1820_c7_5c25_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1820_c7_5c25_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1820_c7_5c25_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1820_c7_5c25_return_output : unsigned(0 downto 0);

function CAST_TO_int8_t_uint8_t( rhs : unsigned) return signed is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : signed(7 downto 0);

begin

      return_output := signed(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_2155( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : signed;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_stack_read := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.stack_value := ref_toks_3;
      base.ram_addr := ref_toks_4;
      base.is_sp_shift := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.is_stack_write := ref_toks_7;
      base.is_opc_done := ref_toks_8;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1794_c6_ba27
BIN_OP_EQ_uxn_opcodes_h_l1794_c6_ba27 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1794_c6_ba27_left,
BIN_OP_EQ_uxn_opcodes_h_l1794_c6_ba27_right,
BIN_OP_EQ_uxn_opcodes_h_l1794_c6_ba27_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1794_c1_bd57
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1794_c1_bd57 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1794_c1_bd57_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1794_c1_bd57_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1794_c1_bd57_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1794_c1_bd57_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1794_c2_dd43
tmp8_MUX_uxn_opcodes_h_l1794_c2_dd43 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1794_c2_dd43_cond,
tmp8_MUX_uxn_opcodes_h_l1794_c2_dd43_iftrue,
tmp8_MUX_uxn_opcodes_h_l1794_c2_dd43_iffalse,
tmp8_MUX_uxn_opcodes_h_l1794_c2_dd43_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1794_c2_dd43
result_is_stack_read_MUX_uxn_opcodes_h_l1794_c2_dd43 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1794_c2_dd43_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1794_c2_dd43_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1794_c2_dd43_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1794_c2_dd43_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1794_c2_dd43
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1794_c2_dd43 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1794_c2_dd43_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1794_c2_dd43_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1794_c2_dd43_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1794_c2_dd43_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1794_c2_dd43
result_stack_value_MUX_uxn_opcodes_h_l1794_c2_dd43 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1794_c2_dd43_cond,
result_stack_value_MUX_uxn_opcodes_h_l1794_c2_dd43_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1794_c2_dd43_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1794_c2_dd43_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1794_c2_dd43
result_ram_addr_MUX_uxn_opcodes_h_l1794_c2_dd43 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1794_c2_dd43_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1794_c2_dd43_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1794_c2_dd43_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1794_c2_dd43_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1794_c2_dd43
result_is_sp_shift_MUX_uxn_opcodes_h_l1794_c2_dd43 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1794_c2_dd43_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1794_c2_dd43_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1794_c2_dd43_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1794_c2_dd43_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1794_c2_dd43
result_sp_relative_shift_MUX_uxn_opcodes_h_l1794_c2_dd43 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1794_c2_dd43_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1794_c2_dd43_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1794_c2_dd43_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1794_c2_dd43_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1794_c2_dd43
result_is_stack_write_MUX_uxn_opcodes_h_l1794_c2_dd43 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1794_c2_dd43_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1794_c2_dd43_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1794_c2_dd43_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1794_c2_dd43_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1794_c2_dd43
result_is_opc_done_MUX_uxn_opcodes_h_l1794_c2_dd43 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1794_c2_dd43_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1794_c2_dd43_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1794_c2_dd43_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1794_c2_dd43_return_output);

-- t8_MUX_uxn_opcodes_h_l1794_c2_dd43
t8_MUX_uxn_opcodes_h_l1794_c2_dd43 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1794_c2_dd43_cond,
t8_MUX_uxn_opcodes_h_l1794_c2_dd43_iftrue,
t8_MUX_uxn_opcodes_h_l1794_c2_dd43_iffalse,
t8_MUX_uxn_opcodes_h_l1794_c2_dd43_return_output);

-- printf_uxn_opcodes_h_l1795_c3_7346_uxn_opcodes_h_l1795_c3_7346
printf_uxn_opcodes_h_l1795_c3_7346_uxn_opcodes_h_l1795_c3_7346 : entity work.printf_uxn_opcodes_h_l1795_c3_7346_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1795_c3_7346_uxn_opcodes_h_l1795_c3_7346_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1800_c11_5955
BIN_OP_EQ_uxn_opcodes_h_l1800_c11_5955 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1800_c11_5955_left,
BIN_OP_EQ_uxn_opcodes_h_l1800_c11_5955_right,
BIN_OP_EQ_uxn_opcodes_h_l1800_c11_5955_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1800_c7_1f1f
tmp8_MUX_uxn_opcodes_h_l1800_c7_1f1f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1800_c7_1f1f_cond,
tmp8_MUX_uxn_opcodes_h_l1800_c7_1f1f_iftrue,
tmp8_MUX_uxn_opcodes_h_l1800_c7_1f1f_iffalse,
tmp8_MUX_uxn_opcodes_h_l1800_c7_1f1f_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1800_c7_1f1f
result_is_stack_read_MUX_uxn_opcodes_h_l1800_c7_1f1f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1800_c7_1f1f_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1800_c7_1f1f_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1800_c7_1f1f_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1800_c7_1f1f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1800_c7_1f1f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1800_c7_1f1f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1800_c7_1f1f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1800_c7_1f1f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1800_c7_1f1f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1800_c7_1f1f_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1800_c7_1f1f
result_stack_value_MUX_uxn_opcodes_h_l1800_c7_1f1f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1800_c7_1f1f_cond,
result_stack_value_MUX_uxn_opcodes_h_l1800_c7_1f1f_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1800_c7_1f1f_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1800_c7_1f1f_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1800_c7_1f1f
result_ram_addr_MUX_uxn_opcodes_h_l1800_c7_1f1f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1800_c7_1f1f_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1800_c7_1f1f_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1800_c7_1f1f_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1800_c7_1f1f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1800_c7_1f1f
result_is_sp_shift_MUX_uxn_opcodes_h_l1800_c7_1f1f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1800_c7_1f1f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1800_c7_1f1f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1800_c7_1f1f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1800_c7_1f1f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1800_c7_1f1f
result_sp_relative_shift_MUX_uxn_opcodes_h_l1800_c7_1f1f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1800_c7_1f1f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1800_c7_1f1f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1800_c7_1f1f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1800_c7_1f1f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1800_c7_1f1f
result_is_stack_write_MUX_uxn_opcodes_h_l1800_c7_1f1f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1800_c7_1f1f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1800_c7_1f1f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1800_c7_1f1f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1800_c7_1f1f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1800_c7_1f1f
result_is_opc_done_MUX_uxn_opcodes_h_l1800_c7_1f1f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1800_c7_1f1f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1800_c7_1f1f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1800_c7_1f1f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1800_c7_1f1f_return_output);

-- t8_MUX_uxn_opcodes_h_l1800_c7_1f1f
t8_MUX_uxn_opcodes_h_l1800_c7_1f1f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1800_c7_1f1f_cond,
t8_MUX_uxn_opcodes_h_l1800_c7_1f1f_iftrue,
t8_MUX_uxn_opcodes_h_l1800_c7_1f1f_iffalse,
t8_MUX_uxn_opcodes_h_l1800_c7_1f1f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1803_c11_5101
BIN_OP_EQ_uxn_opcodes_h_l1803_c11_5101 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1803_c11_5101_left,
BIN_OP_EQ_uxn_opcodes_h_l1803_c11_5101_right,
BIN_OP_EQ_uxn_opcodes_h_l1803_c11_5101_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1803_c7_8739
tmp8_MUX_uxn_opcodes_h_l1803_c7_8739 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1803_c7_8739_cond,
tmp8_MUX_uxn_opcodes_h_l1803_c7_8739_iftrue,
tmp8_MUX_uxn_opcodes_h_l1803_c7_8739_iffalse,
tmp8_MUX_uxn_opcodes_h_l1803_c7_8739_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1803_c7_8739
result_is_stack_read_MUX_uxn_opcodes_h_l1803_c7_8739 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1803_c7_8739_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1803_c7_8739_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1803_c7_8739_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1803_c7_8739_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1803_c7_8739
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1803_c7_8739 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1803_c7_8739_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1803_c7_8739_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1803_c7_8739_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1803_c7_8739_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1803_c7_8739
result_stack_value_MUX_uxn_opcodes_h_l1803_c7_8739 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1803_c7_8739_cond,
result_stack_value_MUX_uxn_opcodes_h_l1803_c7_8739_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1803_c7_8739_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1803_c7_8739_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1803_c7_8739
result_ram_addr_MUX_uxn_opcodes_h_l1803_c7_8739 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1803_c7_8739_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1803_c7_8739_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1803_c7_8739_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1803_c7_8739_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1803_c7_8739
result_is_sp_shift_MUX_uxn_opcodes_h_l1803_c7_8739 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1803_c7_8739_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1803_c7_8739_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1803_c7_8739_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1803_c7_8739_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1803_c7_8739
result_sp_relative_shift_MUX_uxn_opcodes_h_l1803_c7_8739 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1803_c7_8739_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1803_c7_8739_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1803_c7_8739_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1803_c7_8739_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1803_c7_8739
result_is_stack_write_MUX_uxn_opcodes_h_l1803_c7_8739 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1803_c7_8739_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1803_c7_8739_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1803_c7_8739_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1803_c7_8739_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1803_c7_8739
result_is_opc_done_MUX_uxn_opcodes_h_l1803_c7_8739 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1803_c7_8739_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1803_c7_8739_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1803_c7_8739_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1803_c7_8739_return_output);

-- t8_MUX_uxn_opcodes_h_l1803_c7_8739
t8_MUX_uxn_opcodes_h_l1803_c7_8739 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1803_c7_8739_cond,
t8_MUX_uxn_opcodes_h_l1803_c7_8739_iftrue,
t8_MUX_uxn_opcodes_h_l1803_c7_8739_iffalse,
t8_MUX_uxn_opcodes_h_l1803_c7_8739_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1807_c32_9eef
BIN_OP_AND_uxn_opcodes_h_l1807_c32_9eef : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1807_c32_9eef_left,
BIN_OP_AND_uxn_opcodes_h_l1807_c32_9eef_right,
BIN_OP_AND_uxn_opcodes_h_l1807_c32_9eef_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1807_c32_6035
BIN_OP_GT_uxn_opcodes_h_l1807_c32_6035 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1807_c32_6035_left,
BIN_OP_GT_uxn_opcodes_h_l1807_c32_6035_right,
BIN_OP_GT_uxn_opcodes_h_l1807_c32_6035_return_output);

-- MUX_uxn_opcodes_h_l1807_c32_840c
MUX_uxn_opcodes_h_l1807_c32_840c : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1807_c32_840c_cond,
MUX_uxn_opcodes_h_l1807_c32_840c_iftrue,
MUX_uxn_opcodes_h_l1807_c32_840c_iffalse,
MUX_uxn_opcodes_h_l1807_c32_840c_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1808_c21_8dc5
BIN_OP_PLUS_uxn_opcodes_h_l1808_c21_8dc5 : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1808_c21_8dc5_left,
BIN_OP_PLUS_uxn_opcodes_h_l1808_c21_8dc5_right,
BIN_OP_PLUS_uxn_opcodes_h_l1808_c21_8dc5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1810_c11_4917
BIN_OP_EQ_uxn_opcodes_h_l1810_c11_4917 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1810_c11_4917_left,
BIN_OP_EQ_uxn_opcodes_h_l1810_c11_4917_right,
BIN_OP_EQ_uxn_opcodes_h_l1810_c11_4917_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1810_c7_3aab
tmp8_MUX_uxn_opcodes_h_l1810_c7_3aab : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1810_c7_3aab_cond,
tmp8_MUX_uxn_opcodes_h_l1810_c7_3aab_iftrue,
tmp8_MUX_uxn_opcodes_h_l1810_c7_3aab_iffalse,
tmp8_MUX_uxn_opcodes_h_l1810_c7_3aab_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1810_c7_3aab
result_ram_addr_MUX_uxn_opcodes_h_l1810_c7_3aab : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1810_c7_3aab_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1810_c7_3aab_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1810_c7_3aab_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1810_c7_3aab_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1810_c7_3aab
result_is_sp_shift_MUX_uxn_opcodes_h_l1810_c7_3aab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1810_c7_3aab_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1810_c7_3aab_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1810_c7_3aab_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1810_c7_3aab_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1810_c7_3aab
result_is_stack_write_MUX_uxn_opcodes_h_l1810_c7_3aab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1810_c7_3aab_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1810_c7_3aab_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1810_c7_3aab_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1810_c7_3aab_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1810_c7_3aab
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1810_c7_3aab : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1810_c7_3aab_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1810_c7_3aab_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1810_c7_3aab_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1810_c7_3aab_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1810_c7_3aab
result_is_opc_done_MUX_uxn_opcodes_h_l1810_c7_3aab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1810_c7_3aab_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1810_c7_3aab_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1810_c7_3aab_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1810_c7_3aab_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1810_c7_3aab
result_stack_value_MUX_uxn_opcodes_h_l1810_c7_3aab : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1810_c7_3aab_cond,
result_stack_value_MUX_uxn_opcodes_h_l1810_c7_3aab_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1810_c7_3aab_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1810_c7_3aab_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1812_c21_5cdf
BIN_OP_PLUS_uxn_opcodes_h_l1812_c21_5cdf : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1812_c21_5cdf_left,
BIN_OP_PLUS_uxn_opcodes_h_l1812_c21_5cdf_right,
BIN_OP_PLUS_uxn_opcodes_h_l1812_c21_5cdf_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1814_c11_086a
BIN_OP_EQ_uxn_opcodes_h_l1814_c11_086a : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1814_c11_086a_left,
BIN_OP_EQ_uxn_opcodes_h_l1814_c11_086a_right,
BIN_OP_EQ_uxn_opcodes_h_l1814_c11_086a_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1814_c7_079e
tmp8_MUX_uxn_opcodes_h_l1814_c7_079e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1814_c7_079e_cond,
tmp8_MUX_uxn_opcodes_h_l1814_c7_079e_iftrue,
tmp8_MUX_uxn_opcodes_h_l1814_c7_079e_iffalse,
tmp8_MUX_uxn_opcodes_h_l1814_c7_079e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1814_c7_079e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1814_c7_079e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1814_c7_079e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1814_c7_079e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1814_c7_079e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1814_c7_079e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1814_c7_079e
result_is_stack_write_MUX_uxn_opcodes_h_l1814_c7_079e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1814_c7_079e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1814_c7_079e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1814_c7_079e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1814_c7_079e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1814_c7_079e
result_is_opc_done_MUX_uxn_opcodes_h_l1814_c7_079e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1814_c7_079e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1814_c7_079e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1814_c7_079e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1814_c7_079e_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1814_c7_079e
result_stack_value_MUX_uxn_opcodes_h_l1814_c7_079e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1814_c7_079e_cond,
result_stack_value_MUX_uxn_opcodes_h_l1814_c7_079e_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1814_c7_079e_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1814_c7_079e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1820_c11_e866
BIN_OP_EQ_uxn_opcodes_h_l1820_c11_e866 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1820_c11_e866_left,
BIN_OP_EQ_uxn_opcodes_h_l1820_c11_e866_right,
BIN_OP_EQ_uxn_opcodes_h_l1820_c11_e866_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1820_c7_5c25
result_is_stack_write_MUX_uxn_opcodes_h_l1820_c7_5c25 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1820_c7_5c25_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1820_c7_5c25_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1820_c7_5c25_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1820_c7_5c25_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1820_c7_5c25
result_is_opc_done_MUX_uxn_opcodes_h_l1820_c7_5c25 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1820_c7_5c25_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1820_c7_5c25_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1820_c7_5c25_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1820_c7_5c25_return_output);



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
 t8,
 tmp8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1794_c6_ba27_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1794_c1_bd57_return_output,
 tmp8_MUX_uxn_opcodes_h_l1794_c2_dd43_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1794_c2_dd43_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1794_c2_dd43_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1794_c2_dd43_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1794_c2_dd43_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1794_c2_dd43_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1794_c2_dd43_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1794_c2_dd43_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1794_c2_dd43_return_output,
 t8_MUX_uxn_opcodes_h_l1794_c2_dd43_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1800_c11_5955_return_output,
 tmp8_MUX_uxn_opcodes_h_l1800_c7_1f1f_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1800_c7_1f1f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1800_c7_1f1f_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1800_c7_1f1f_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1800_c7_1f1f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1800_c7_1f1f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1800_c7_1f1f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1800_c7_1f1f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1800_c7_1f1f_return_output,
 t8_MUX_uxn_opcodes_h_l1800_c7_1f1f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1803_c11_5101_return_output,
 tmp8_MUX_uxn_opcodes_h_l1803_c7_8739_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1803_c7_8739_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1803_c7_8739_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1803_c7_8739_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1803_c7_8739_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1803_c7_8739_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1803_c7_8739_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1803_c7_8739_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1803_c7_8739_return_output,
 t8_MUX_uxn_opcodes_h_l1803_c7_8739_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1807_c32_9eef_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1807_c32_6035_return_output,
 MUX_uxn_opcodes_h_l1807_c32_840c_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1808_c21_8dc5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1810_c11_4917_return_output,
 tmp8_MUX_uxn_opcodes_h_l1810_c7_3aab_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1810_c7_3aab_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1810_c7_3aab_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1810_c7_3aab_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1810_c7_3aab_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1810_c7_3aab_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1810_c7_3aab_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1812_c21_5cdf_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1814_c11_086a_return_output,
 tmp8_MUX_uxn_opcodes_h_l1814_c7_079e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1814_c7_079e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1814_c7_079e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1814_c7_079e_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1814_c7_079e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1820_c11_e866_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1820_c7_5c25_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1820_c7_5c25_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1794_c6_ba27_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1794_c6_ba27_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1794_c6_ba27_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1794_c1_bd57_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1794_c1_bd57_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1794_c1_bd57_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1794_c1_bd57_iffalse : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1794_c2_dd43_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1794_c2_dd43_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1800_c7_1f1f_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1794_c2_dd43_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1794_c2_dd43_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1794_c2_dd43_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1794_c2_dd43_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1800_c7_1f1f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1794_c2_dd43_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1794_c2_dd43_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1794_c2_dd43_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1797_c3_80cf : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1794_c2_dd43_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1800_c7_1f1f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1794_c2_dd43_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1794_c2_dd43_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1794_c2_dd43_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1794_c2_dd43_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1800_c7_1f1f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1794_c2_dd43_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1794_c2_dd43_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1794_c2_dd43_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1794_c2_dd43_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1800_c7_1f1f_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1794_c2_dd43_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1794_c2_dd43_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1794_c2_dd43_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1794_c2_dd43_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1800_c7_1f1f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1794_c2_dd43_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1794_c2_dd43_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1794_c2_dd43_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1794_c2_dd43_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1800_c7_1f1f_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1794_c2_dd43_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1794_c2_dd43_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1794_c2_dd43_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1794_c2_dd43_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1800_c7_1f1f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1794_c2_dd43_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1794_c2_dd43_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1794_c2_dd43_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1794_c2_dd43_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1800_c7_1f1f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1794_c2_dd43_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1794_c2_dd43_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1794_c2_dd43_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1794_c2_dd43_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1800_c7_1f1f_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1794_c2_dd43_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1794_c2_dd43_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1795_c3_7346_uxn_opcodes_h_l1795_c3_7346_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1800_c11_5955_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1800_c11_5955_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1800_c11_5955_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1800_c7_1f1f_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1800_c7_1f1f_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1803_c7_8739_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1800_c7_1f1f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1800_c7_1f1f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1800_c7_1f1f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1803_c7_8739_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1800_c7_1f1f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1800_c7_1f1f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1801_c3_6bac : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1800_c7_1f1f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1803_c7_8739_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1800_c7_1f1f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1800_c7_1f1f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1800_c7_1f1f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1803_c7_8739_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1800_c7_1f1f_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1800_c7_1f1f_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1800_c7_1f1f_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1803_c7_8739_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1800_c7_1f1f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1800_c7_1f1f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1800_c7_1f1f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1803_c7_8739_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1800_c7_1f1f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1800_c7_1f1f_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1800_c7_1f1f_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1803_c7_8739_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1800_c7_1f1f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1800_c7_1f1f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1800_c7_1f1f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1803_c7_8739_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1800_c7_1f1f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1800_c7_1f1f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1800_c7_1f1f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1803_c7_8739_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1800_c7_1f1f_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1800_c7_1f1f_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1800_c7_1f1f_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1803_c7_8739_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1800_c7_1f1f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1803_c11_5101_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1803_c11_5101_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1803_c11_5101_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1803_c7_8739_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1803_c7_8739_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1810_c7_3aab_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1803_c7_8739_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1803_c7_8739_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1803_c7_8739_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1803_c7_8739_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1803_c7_8739_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1803_c7_8739_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1810_c7_3aab_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1803_c7_8739_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1803_c7_8739_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1803_c7_8739_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1810_c7_3aab_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1803_c7_8739_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1803_c7_8739_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l1808_c3_78ea : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1803_c7_8739_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1810_c7_3aab_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1803_c7_8739_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1803_c7_8739_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1803_c7_8739_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1810_c7_3aab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1803_c7_8739_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1803_c7_8739_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1803_c7_8739_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1803_c7_8739_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1803_c7_8739_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1803_c7_8739_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1810_c7_3aab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1803_c7_8739_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1803_c7_8739_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1803_c7_8739_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1810_c7_3aab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1803_c7_8739_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1803_c7_8739_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1803_c7_8739_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1803_c7_8739_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1807_c32_840c_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1807_c32_840c_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1807_c32_840c_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1807_c32_9eef_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1807_c32_9eef_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1807_c32_9eef_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1807_c32_6035_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1807_c32_6035_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1807_c32_6035_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1807_c32_840c_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1808_c21_8dc5_left : signed(16 downto 0);
 variable VAR_CAST_TO_int8_t_uxn_opcodes_h_l1808_c26_91e9_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1808_c21_8dc5_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1808_c21_8dc5_return_output : signed(17 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1810_c11_4917_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1810_c11_4917_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1810_c11_4917_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1810_c7_3aab_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1810_c7_3aab_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1814_c7_079e_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1810_c7_3aab_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1810_c7_3aab_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l1812_c3_b6ed : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1810_c7_3aab_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1810_c7_3aab_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1810_c7_3aab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1810_c7_3aab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1810_c7_3aab_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1810_c7_3aab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1810_c7_3aab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1814_c7_079e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1810_c7_3aab_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1810_c7_3aab_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1810_c7_3aab_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1814_c7_079e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1810_c7_3aab_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1810_c7_3aab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1810_c7_3aab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1814_c7_079e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1810_c7_3aab_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1810_c7_3aab_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1810_c7_3aab_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1814_c7_079e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1810_c7_3aab_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1812_c21_5cdf_left : signed(16 downto 0);
 variable VAR_CAST_TO_int8_t_uxn_opcodes_h_l1812_c26_c946_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1812_c21_5cdf_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1812_c21_5cdf_return_output : signed(17 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1814_c11_086a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1814_c11_086a_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1814_c11_086a_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1814_c7_079e_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1814_c7_079e_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1814_c7_079e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1814_c7_079e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1817_c3_2729 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1814_c7_079e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1814_c7_079e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1814_c7_079e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1814_c7_079e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1820_c7_5c25_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1814_c7_079e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1814_c7_079e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1814_c7_079e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1820_c7_5c25_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1814_c7_079e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1814_c7_079e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1814_c7_079e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1814_c7_079e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1820_c11_e866_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1820_c11_e866_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1820_c11_e866_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1820_c7_5c25_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1820_c7_5c25_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1820_c7_5c25_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1820_c7_5c25_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1820_c7_5c25_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1820_c7_5c25_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1803_l1800_l1794_l1814_l1810_DUPLICATE_56a7_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1800_l1794_l1810_DUPLICATE_b2f5_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1800_l1794_l1810_DUPLICATE_0f37_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1800_l1803_l1794_DUPLICATE_af13_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1803_l1800_l1794_l1820_l1810_DUPLICATE_6ec8_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1800_l1803_DUPLICATE_e538_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1803_l1800_l1820_l1814_l1810_DUPLICATE_8672_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1814_l1803_l1810_DUPLICATE_b7a5_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_2155_uxn_opcodes_h_l1790_l1825_DUPLICATE_153b_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_tmp8 : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_tmp8 := tmp8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_MUX_uxn_opcodes_h_l1807_c32_840c_iffalse := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1794_c2_dd43_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1794_c2_dd43_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1820_c7_5c25_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1814_c7_079e_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1800_c11_5955_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1803_c11_5101_right := to_unsigned(2, 2);
     VAR_BIN_OP_GT_uxn_opcodes_h_l1807_c32_6035_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1801_c3_6bac := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1800_c7_1f1f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1801_c3_6bac;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1810_c7_3aab_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1810_c11_4917_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1794_c6_ba27_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1797_c3_80cf := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1794_c2_dd43_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1797_c3_80cf;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1794_c1_bd57_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1814_c11_086a_right := to_unsigned(3, 2);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1803_c7_8739_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1820_c7_5c25_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1820_c11_e866_right := to_unsigned(4, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1803_c7_8739_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l1807_c32_9eef_right := to_unsigned(128, 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1817_c3_2729 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1814_c7_079e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1817_c3_2729;
     VAR_MUX_uxn_opcodes_h_l1807_c32_840c_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1794_c1_bd57_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1807_c32_9eef_left := VAR_ins;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1808_c21_8dc5_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1812_c21_5cdf_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1794_c6_ba27_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1800_c11_5955_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1803_c11_5101_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1810_c11_4917_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1814_c11_086a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1820_c11_e866_left := VAR_phase;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1814_c7_079e_iftrue := VAR_previous_ram_read;
     VAR_tmp8_MUX_uxn_opcodes_h_l1814_c7_079e_iftrue := VAR_previous_ram_read;
     VAR_t8_MUX_uxn_opcodes_h_l1803_c7_8739_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1794_c2_dd43_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1800_c7_1f1f_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1803_c7_8739_iffalse := t8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1794_c2_dd43_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1800_c7_1f1f_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1803_c7_8739_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1810_c7_3aab_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1814_c7_079e_iffalse := tmp8;
     -- CAST_TO_int8_t[uxn_opcodes_h_l1812_c26_c946] LATENCY=0
     VAR_CAST_TO_int8_t_uxn_opcodes_h_l1812_c26_c946_return_output := CAST_TO_int8_t_uint8_t(
     t8);

     -- CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1800_l1794_l1810_DUPLICATE_b2f5 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1800_l1794_l1810_DUPLICATE_b2f5_return_output := result.ram_addr;

     -- BIN_OP_EQ[uxn_opcodes_h_l1820_c11_e866] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1820_c11_e866_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1820_c11_e866_left;
     BIN_OP_EQ_uxn_opcodes_h_l1820_c11_e866_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1820_c11_e866_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1820_c11_e866_return_output := BIN_OP_EQ_uxn_opcodes_h_l1820_c11_e866_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1800_c11_5955] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1800_c11_5955_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1800_c11_5955_left;
     BIN_OP_EQ_uxn_opcodes_h_l1800_c11_5955_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1800_c11_5955_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1800_c11_5955_return_output := BIN_OP_EQ_uxn_opcodes_h_l1800_c11_5955_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1814_l1803_l1810_DUPLICATE_b7a5 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1814_l1803_l1810_DUPLICATE_b7a5_return_output := result.stack_address_sp_offset;

     -- BIN_OP_AND[uxn_opcodes_h_l1807_c32_9eef] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1807_c32_9eef_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1807_c32_9eef_left;
     BIN_OP_AND_uxn_opcodes_h_l1807_c32_9eef_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1807_c32_9eef_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1807_c32_9eef_return_output := BIN_OP_AND_uxn_opcodes_h_l1807_c32_9eef_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1803_l1800_l1794_l1814_l1810_DUPLICATE_56a7 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1803_l1800_l1794_l1814_l1810_DUPLICATE_56a7_return_output := result.stack_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1803_l1800_l1820_l1814_l1810_DUPLICATE_8672 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1803_l1800_l1820_l1814_l1810_DUPLICATE_8672_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1800_l1803_DUPLICATE_e538 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1800_l1803_DUPLICATE_e538_return_output := result.is_stack_read;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1800_l1803_l1794_DUPLICATE_af13 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1800_l1803_l1794_DUPLICATE_af13_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1810_c11_4917] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1810_c11_4917_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1810_c11_4917_left;
     BIN_OP_EQ_uxn_opcodes_h_l1810_c11_4917_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1810_c11_4917_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1810_c11_4917_return_output := BIN_OP_EQ_uxn_opcodes_h_l1810_c11_4917_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1800_l1794_l1810_DUPLICATE_0f37 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1800_l1794_l1810_DUPLICATE_0f37_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1803_c11_5101] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1803_c11_5101_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1803_c11_5101_left;
     BIN_OP_EQ_uxn_opcodes_h_l1803_c11_5101_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1803_c11_5101_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1803_c11_5101_return_output := BIN_OP_EQ_uxn_opcodes_h_l1803_c11_5101_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1803_l1800_l1794_l1820_l1810_DUPLICATE_6ec8 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1803_l1800_l1794_l1820_l1810_DUPLICATE_6ec8_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1814_c11_086a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1814_c11_086a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1814_c11_086a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1814_c11_086a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1814_c11_086a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1814_c11_086a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1814_c11_086a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1794_c6_ba27] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1794_c6_ba27_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1794_c6_ba27_left;
     BIN_OP_EQ_uxn_opcodes_h_l1794_c6_ba27_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1794_c6_ba27_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1794_c6_ba27_return_output := BIN_OP_EQ_uxn_opcodes_h_l1794_c6_ba27_return_output;

     -- CAST_TO_int8_t[uxn_opcodes_h_l1808_c26_91e9] LATENCY=0
     VAR_CAST_TO_int8_t_uxn_opcodes_h_l1808_c26_91e9_return_output := CAST_TO_int8_t_uint8_t(
     VAR_previous_stack_read);

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1807_c32_6035_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1807_c32_9eef_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1794_c1_bd57_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1794_c6_ba27_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1794_c2_dd43_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1794_c6_ba27_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1794_c2_dd43_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1794_c6_ba27_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1794_c2_dd43_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1794_c6_ba27_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1794_c2_dd43_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1794_c6_ba27_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1794_c2_dd43_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1794_c6_ba27_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1794_c2_dd43_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1794_c6_ba27_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1794_c2_dd43_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1794_c6_ba27_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1794_c2_dd43_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1794_c6_ba27_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1794_c2_dd43_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1794_c6_ba27_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1794_c2_dd43_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1794_c6_ba27_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1800_c7_1f1f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1800_c11_5955_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1800_c7_1f1f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1800_c11_5955_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1800_c7_1f1f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1800_c11_5955_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1800_c7_1f1f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1800_c11_5955_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1800_c7_1f1f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1800_c11_5955_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1800_c7_1f1f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1800_c11_5955_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1800_c7_1f1f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1800_c11_5955_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1800_c7_1f1f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1800_c11_5955_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1800_c7_1f1f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1800_c11_5955_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1800_c7_1f1f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1800_c11_5955_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1803_c7_8739_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1803_c11_5101_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1803_c7_8739_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1803_c11_5101_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1803_c7_8739_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1803_c11_5101_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1803_c7_8739_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1803_c11_5101_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1803_c7_8739_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1803_c11_5101_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1803_c7_8739_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1803_c11_5101_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1803_c7_8739_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1803_c11_5101_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1803_c7_8739_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1803_c11_5101_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1803_c7_8739_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1803_c11_5101_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1803_c7_8739_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1803_c11_5101_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1810_c7_3aab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1810_c11_4917_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1810_c7_3aab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1810_c11_4917_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1810_c7_3aab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1810_c11_4917_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1810_c7_3aab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1810_c11_4917_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1810_c7_3aab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1810_c11_4917_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1810_c7_3aab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1810_c11_4917_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1810_c7_3aab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1810_c11_4917_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1814_c7_079e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1814_c11_086a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1814_c7_079e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1814_c11_086a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1814_c7_079e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1814_c11_086a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1814_c7_079e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1814_c11_086a_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1814_c7_079e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1814_c11_086a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1820_c7_5c25_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1820_c11_e866_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1820_c7_5c25_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1820_c11_e866_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1808_c21_8dc5_right := VAR_CAST_TO_int8_t_uxn_opcodes_h_l1808_c26_91e9_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1812_c21_5cdf_right := VAR_CAST_TO_int8_t_uxn_opcodes_h_l1812_c26_c946_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1794_c2_dd43_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1800_l1803_l1794_DUPLICATE_af13_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1800_c7_1f1f_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1800_l1803_l1794_DUPLICATE_af13_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1803_c7_8739_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1800_l1803_l1794_DUPLICATE_af13_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1794_c2_dd43_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1800_l1794_l1810_DUPLICATE_b2f5_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1800_c7_1f1f_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1800_l1794_l1810_DUPLICATE_b2f5_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1810_c7_3aab_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1800_l1794_l1810_DUPLICATE_b2f5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1800_c7_1f1f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1803_l1800_l1820_l1814_l1810_DUPLICATE_8672_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1803_c7_8739_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1803_l1800_l1820_l1814_l1810_DUPLICATE_8672_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1810_c7_3aab_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1803_l1800_l1820_l1814_l1810_DUPLICATE_8672_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1814_c7_079e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1803_l1800_l1820_l1814_l1810_DUPLICATE_8672_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1820_c7_5c25_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1803_l1800_l1820_l1814_l1810_DUPLICATE_8672_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1794_c2_dd43_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1800_l1794_l1810_DUPLICATE_0f37_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1800_c7_1f1f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1800_l1794_l1810_DUPLICATE_0f37_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1810_c7_3aab_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1800_l1794_l1810_DUPLICATE_0f37_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1800_c7_1f1f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1800_l1803_DUPLICATE_e538_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1803_c7_8739_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1800_l1803_DUPLICATE_e538_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1794_c2_dd43_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1803_l1800_l1794_l1820_l1810_DUPLICATE_6ec8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1800_c7_1f1f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1803_l1800_l1794_l1820_l1810_DUPLICATE_6ec8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1803_c7_8739_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1803_l1800_l1794_l1820_l1810_DUPLICATE_6ec8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1810_c7_3aab_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1803_l1800_l1794_l1820_l1810_DUPLICATE_6ec8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1820_c7_5c25_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1803_l1800_l1794_l1820_l1810_DUPLICATE_6ec8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1803_c7_8739_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1814_l1803_l1810_DUPLICATE_b7a5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1810_c7_3aab_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1814_l1803_l1810_DUPLICATE_b7a5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1814_c7_079e_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1814_l1803_l1810_DUPLICATE_b7a5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1794_c2_dd43_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1803_l1800_l1794_l1814_l1810_DUPLICATE_56a7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1800_c7_1f1f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1803_l1800_l1794_l1814_l1810_DUPLICATE_56a7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1803_c7_8739_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1803_l1800_l1794_l1814_l1810_DUPLICATE_56a7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1810_c7_3aab_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1803_l1800_l1794_l1814_l1810_DUPLICATE_56a7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1814_c7_079e_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1803_l1800_l1794_l1814_l1810_DUPLICATE_56a7_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1810_c7_3aab] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1810_c7_3aab_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1810_c7_3aab_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1810_c7_3aab_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1810_c7_3aab_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1810_c7_3aab_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1810_c7_3aab_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1810_c7_3aab_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1810_c7_3aab_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1814_c7_079e] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1814_c7_079e_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1814_c7_079e_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1814_c7_079e_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1814_c7_079e_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1814_c7_079e_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1814_c7_079e_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1814_c7_079e_return_output := result_stack_value_MUX_uxn_opcodes_h_l1814_c7_079e_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1803_c7_8739] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1803_c7_8739_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1803_c7_8739_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1803_c7_8739_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1803_c7_8739_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1803_c7_8739_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1803_c7_8739_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1803_c7_8739_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1803_c7_8739_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1808_c21_8dc5] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1808_c21_8dc5_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1808_c21_8dc5_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1808_c21_8dc5_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1808_c21_8dc5_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1808_c21_8dc5_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1808_c21_8dc5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1820_c7_5c25] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1820_c7_5c25_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1820_c7_5c25_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1820_c7_5c25_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1820_c7_5c25_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1820_c7_5c25_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1820_c7_5c25_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1820_c7_5c25_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1820_c7_5c25_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1812_c21_5cdf] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1812_c21_5cdf_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1812_c21_5cdf_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1812_c21_5cdf_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1812_c21_5cdf_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1812_c21_5cdf_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1812_c21_5cdf_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1794_c1_bd57] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1794_c1_bd57_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1794_c1_bd57_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1794_c1_bd57_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1794_c1_bd57_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1794_c1_bd57_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1794_c1_bd57_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1794_c1_bd57_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1794_c1_bd57_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1820_c7_5c25] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1820_c7_5c25_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1820_c7_5c25_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1820_c7_5c25_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1820_c7_5c25_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1820_c7_5c25_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1820_c7_5c25_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1820_c7_5c25_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1820_c7_5c25_return_output;

     -- t8_MUX[uxn_opcodes_h_l1803_c7_8739] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1803_c7_8739_cond <= VAR_t8_MUX_uxn_opcodes_h_l1803_c7_8739_cond;
     t8_MUX_uxn_opcodes_h_l1803_c7_8739_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1803_c7_8739_iftrue;
     t8_MUX_uxn_opcodes_h_l1803_c7_8739_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1803_c7_8739_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1803_c7_8739_return_output := t8_MUX_uxn_opcodes_h_l1803_c7_8739_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1814_c7_079e] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1814_c7_079e_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1814_c7_079e_cond;
     tmp8_MUX_uxn_opcodes_h_l1814_c7_079e_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1814_c7_079e_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1814_c7_079e_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1814_c7_079e_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1814_c7_079e_return_output := tmp8_MUX_uxn_opcodes_h_l1814_c7_079e_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1807_c32_6035] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1807_c32_6035_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1807_c32_6035_left;
     BIN_OP_GT_uxn_opcodes_h_l1807_c32_6035_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1807_c32_6035_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1807_c32_6035_return_output := BIN_OP_GT_uxn_opcodes_h_l1807_c32_6035_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1814_c7_079e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1814_c7_079e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1814_c7_079e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1814_c7_079e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1814_c7_079e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1814_c7_079e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1814_c7_079e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1814_c7_079e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1814_c7_079e_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1807_c32_840c_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1807_c32_6035_return_output;
     VAR_result_ram_addr_uxn_opcodes_h_l1808_c3_78ea := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1808_c21_8dc5_return_output)),16);
     VAR_result_ram_addr_uxn_opcodes_h_l1812_c3_b6ed := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1812_c21_5cdf_return_output)),16);
     VAR_printf_uxn_opcodes_h_l1795_c3_7346_uxn_opcodes_h_l1795_c3_7346_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1794_c1_bd57_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1814_c7_079e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1820_c7_5c25_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1803_c7_8739_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1810_c7_3aab_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1800_c7_1f1f_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1803_c7_8739_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1814_c7_079e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1820_c7_5c25_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1810_c7_3aab_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1814_c7_079e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1810_c7_3aab_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1814_c7_079e_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1800_c7_1f1f_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1803_c7_8739_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1810_c7_3aab_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1814_c7_079e_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1803_c7_8739_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l1808_c3_78ea;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1810_c7_3aab_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l1812_c3_b6ed;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1810_c7_3aab] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1810_c7_3aab_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1810_c7_3aab_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1810_c7_3aab_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1810_c7_3aab_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1810_c7_3aab_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1810_c7_3aab_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1810_c7_3aab_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1810_c7_3aab_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1810_c7_3aab] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1810_c7_3aab_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1810_c7_3aab_cond;
     tmp8_MUX_uxn_opcodes_h_l1810_c7_3aab_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1810_c7_3aab_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1810_c7_3aab_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1810_c7_3aab_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1810_c7_3aab_return_output := tmp8_MUX_uxn_opcodes_h_l1810_c7_3aab_return_output;

     -- t8_MUX[uxn_opcodes_h_l1800_c7_1f1f] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1800_c7_1f1f_cond <= VAR_t8_MUX_uxn_opcodes_h_l1800_c7_1f1f_cond;
     t8_MUX_uxn_opcodes_h_l1800_c7_1f1f_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1800_c7_1f1f_iftrue;
     t8_MUX_uxn_opcodes_h_l1800_c7_1f1f_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1800_c7_1f1f_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1800_c7_1f1f_return_output := t8_MUX_uxn_opcodes_h_l1800_c7_1f1f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1814_c7_079e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1814_c7_079e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1814_c7_079e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1814_c7_079e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1814_c7_079e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1814_c7_079e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1814_c7_079e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1814_c7_079e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1814_c7_079e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1814_c7_079e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1814_c7_079e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1814_c7_079e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1814_c7_079e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1814_c7_079e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1814_c7_079e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1814_c7_079e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1814_c7_079e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1814_c7_079e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1803_c7_8739] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1803_c7_8739_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1803_c7_8739_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1803_c7_8739_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1803_c7_8739_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1803_c7_8739_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1803_c7_8739_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1803_c7_8739_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1803_c7_8739_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1800_c7_1f1f] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1800_c7_1f1f_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1800_c7_1f1f_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1800_c7_1f1f_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1800_c7_1f1f_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1800_c7_1f1f_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1800_c7_1f1f_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1800_c7_1f1f_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1800_c7_1f1f_return_output;

     -- MUX[uxn_opcodes_h_l1807_c32_840c] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1807_c32_840c_cond <= VAR_MUX_uxn_opcodes_h_l1807_c32_840c_cond;
     MUX_uxn_opcodes_h_l1807_c32_840c_iftrue <= VAR_MUX_uxn_opcodes_h_l1807_c32_840c_iftrue;
     MUX_uxn_opcodes_h_l1807_c32_840c_iffalse <= VAR_MUX_uxn_opcodes_h_l1807_c32_840c_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1807_c32_840c_return_output := MUX_uxn_opcodes_h_l1807_c32_840c_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1810_c7_3aab] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1810_c7_3aab_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1810_c7_3aab_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1810_c7_3aab_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1810_c7_3aab_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1810_c7_3aab_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1810_c7_3aab_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1810_c7_3aab_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1810_c7_3aab_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1810_c7_3aab] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1810_c7_3aab_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1810_c7_3aab_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1810_c7_3aab_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1810_c7_3aab_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1810_c7_3aab_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1810_c7_3aab_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1810_c7_3aab_return_output := result_stack_value_MUX_uxn_opcodes_h_l1810_c7_3aab_return_output;

     -- printf_uxn_opcodes_h_l1795_c3_7346[uxn_opcodes_h_l1795_c3_7346] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1795_c3_7346_uxn_opcodes_h_l1795_c3_7346_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1795_c3_7346_uxn_opcodes_h_l1795_c3_7346_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1803_c7_8739_iftrue := VAR_MUX_uxn_opcodes_h_l1807_c32_840c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1810_c7_3aab_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1814_c7_079e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1800_c7_1f1f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1803_c7_8739_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1794_c2_dd43_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1800_c7_1f1f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1810_c7_3aab_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1814_c7_079e_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1803_c7_8739_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1810_c7_3aab_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1803_c7_8739_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1810_c7_3aab_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1803_c7_8739_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1810_c7_3aab_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1794_c2_dd43_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1800_c7_1f1f_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1803_c7_8739_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1810_c7_3aab_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1800_c7_1f1f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1800_c7_1f1f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1800_c7_1f1f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1800_c7_1f1f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1800_c7_1f1f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1800_c7_1f1f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1800_c7_1f1f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1800_c7_1f1f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1800_c7_1f1f_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1794_c2_dd43] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1794_c2_dd43_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1794_c2_dd43_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1794_c2_dd43_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1794_c2_dd43_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1794_c2_dd43_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1794_c2_dd43_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1794_c2_dd43_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1794_c2_dd43_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1803_c7_8739] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1803_c7_8739_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1803_c7_8739_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1803_c7_8739_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1803_c7_8739_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1803_c7_8739_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1803_c7_8739_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1803_c7_8739_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1803_c7_8739_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1803_c7_8739] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1803_c7_8739_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1803_c7_8739_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1803_c7_8739_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1803_c7_8739_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1803_c7_8739_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1803_c7_8739_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1803_c7_8739_return_output := result_stack_value_MUX_uxn_opcodes_h_l1803_c7_8739_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1810_c7_3aab] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1810_c7_3aab_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1810_c7_3aab_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1810_c7_3aab_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1810_c7_3aab_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1810_c7_3aab_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1810_c7_3aab_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1810_c7_3aab_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1810_c7_3aab_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1810_c7_3aab] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1810_c7_3aab_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1810_c7_3aab_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1810_c7_3aab_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1810_c7_3aab_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1810_c7_3aab_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1810_c7_3aab_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1810_c7_3aab_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1810_c7_3aab_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1803_c7_8739] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1803_c7_8739_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1803_c7_8739_cond;
     tmp8_MUX_uxn_opcodes_h_l1803_c7_8739_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1803_c7_8739_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1803_c7_8739_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1803_c7_8739_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1803_c7_8739_return_output := tmp8_MUX_uxn_opcodes_h_l1803_c7_8739_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1803_c7_8739] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1803_c7_8739_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1803_c7_8739_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1803_c7_8739_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1803_c7_8739_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1803_c7_8739_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1803_c7_8739_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1803_c7_8739_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1803_c7_8739_return_output;

     -- t8_MUX[uxn_opcodes_h_l1794_c2_dd43] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1794_c2_dd43_cond <= VAR_t8_MUX_uxn_opcodes_h_l1794_c2_dd43_cond;
     t8_MUX_uxn_opcodes_h_l1794_c2_dd43_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1794_c2_dd43_iftrue;
     t8_MUX_uxn_opcodes_h_l1794_c2_dd43_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1794_c2_dd43_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1794_c2_dd43_return_output := t8_MUX_uxn_opcodes_h_l1794_c2_dd43_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1803_c7_8739] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1803_c7_8739_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1803_c7_8739_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1803_c7_8739_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1803_c7_8739_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1803_c7_8739_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1803_c7_8739_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1803_c7_8739_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1803_c7_8739_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1803_c7_8739_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1810_c7_3aab_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1794_c2_dd43_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1800_c7_1f1f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1803_c7_8739_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1810_c7_3aab_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1800_c7_1f1f_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1803_c7_8739_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1800_c7_1f1f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1803_c7_8739_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1800_c7_1f1f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1803_c7_8739_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1800_c7_1f1f_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1803_c7_8739_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1794_c2_dd43_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1800_c7_1f1f_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1803_c7_8739_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1800_c7_1f1f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1800_c7_1f1f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1800_c7_1f1f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1800_c7_1f1f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1800_c7_1f1f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1800_c7_1f1f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1800_c7_1f1f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1800_c7_1f1f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1800_c7_1f1f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1794_c2_dd43] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1794_c2_dd43_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1794_c2_dd43_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1794_c2_dd43_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1794_c2_dd43_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1794_c2_dd43_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1794_c2_dd43_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1794_c2_dd43_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1794_c2_dd43_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1800_c7_1f1f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1800_c7_1f1f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1800_c7_1f1f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1800_c7_1f1f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1800_c7_1f1f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1800_c7_1f1f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1800_c7_1f1f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1800_c7_1f1f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1800_c7_1f1f_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1800_c7_1f1f] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1800_c7_1f1f_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1800_c7_1f1f_cond;
     tmp8_MUX_uxn_opcodes_h_l1800_c7_1f1f_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1800_c7_1f1f_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1800_c7_1f1f_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1800_c7_1f1f_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1800_c7_1f1f_return_output := tmp8_MUX_uxn_opcodes_h_l1800_c7_1f1f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1803_c7_8739] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1803_c7_8739_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1803_c7_8739_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1803_c7_8739_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1803_c7_8739_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1803_c7_8739_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1803_c7_8739_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1803_c7_8739_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1803_c7_8739_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1800_c7_1f1f] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1800_c7_1f1f_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1800_c7_1f1f_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1800_c7_1f1f_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1800_c7_1f1f_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1800_c7_1f1f_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1800_c7_1f1f_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1800_c7_1f1f_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1800_c7_1f1f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1803_c7_8739] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1803_c7_8739_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1803_c7_8739_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1803_c7_8739_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1803_c7_8739_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1803_c7_8739_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1803_c7_8739_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1803_c7_8739_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1803_c7_8739_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1800_c7_1f1f] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1800_c7_1f1f_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1800_c7_1f1f_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1800_c7_1f1f_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1800_c7_1f1f_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1800_c7_1f1f_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1800_c7_1f1f_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1800_c7_1f1f_return_output := result_stack_value_MUX_uxn_opcodes_h_l1800_c7_1f1f_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1800_c7_1f1f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1803_c7_8739_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1800_c7_1f1f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1803_c7_8739_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1794_c2_dd43_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1800_c7_1f1f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1794_c2_dd43_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1800_c7_1f1f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1794_c2_dd43_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1800_c7_1f1f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1794_c2_dd43_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1800_c7_1f1f_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1794_c2_dd43_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1800_c7_1f1f_return_output;
     -- tmp8_MUX[uxn_opcodes_h_l1794_c2_dd43] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1794_c2_dd43_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1794_c2_dd43_cond;
     tmp8_MUX_uxn_opcodes_h_l1794_c2_dd43_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1794_c2_dd43_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1794_c2_dd43_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1794_c2_dd43_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1794_c2_dd43_return_output := tmp8_MUX_uxn_opcodes_h_l1794_c2_dd43_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1794_c2_dd43] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1794_c2_dd43_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1794_c2_dd43_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1794_c2_dd43_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1794_c2_dd43_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1794_c2_dd43_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1794_c2_dd43_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1794_c2_dd43_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1794_c2_dd43_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1794_c2_dd43] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1794_c2_dd43_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1794_c2_dd43_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1794_c2_dd43_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1794_c2_dd43_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1794_c2_dd43_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1794_c2_dd43_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1794_c2_dd43_return_output := result_stack_value_MUX_uxn_opcodes_h_l1794_c2_dd43_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1800_c7_1f1f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1800_c7_1f1f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1800_c7_1f1f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1800_c7_1f1f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1800_c7_1f1f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1800_c7_1f1f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1800_c7_1f1f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1800_c7_1f1f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1800_c7_1f1f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1800_c7_1f1f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1800_c7_1f1f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1800_c7_1f1f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1800_c7_1f1f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1800_c7_1f1f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1800_c7_1f1f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1800_c7_1f1f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1800_c7_1f1f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1800_c7_1f1f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1794_c2_dd43] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1794_c2_dd43_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1794_c2_dd43_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1794_c2_dd43_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1794_c2_dd43_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1794_c2_dd43_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1794_c2_dd43_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1794_c2_dd43_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1794_c2_dd43_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1794_c2_dd43] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1794_c2_dd43_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1794_c2_dd43_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1794_c2_dd43_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1794_c2_dd43_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1794_c2_dd43_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1794_c2_dd43_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1794_c2_dd43_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1794_c2_dd43_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1794_c2_dd43_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1800_c7_1f1f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1794_c2_dd43_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1800_c7_1f1f_return_output;
     REG_VAR_tmp8 := VAR_tmp8_MUX_uxn_opcodes_h_l1794_c2_dd43_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1794_c2_dd43] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1794_c2_dd43_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1794_c2_dd43_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1794_c2_dd43_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1794_c2_dd43_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1794_c2_dd43_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1794_c2_dd43_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1794_c2_dd43_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1794_c2_dd43_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1794_c2_dd43] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1794_c2_dd43_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1794_c2_dd43_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1794_c2_dd43_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1794_c2_dd43_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1794_c2_dd43_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1794_c2_dd43_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1794_c2_dd43_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1794_c2_dd43_return_output;

     -- Submodule level 7
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_2155_uxn_opcodes_h_l1790_l1825_DUPLICATE_153b LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_2155_uxn_opcodes_h_l1790_l1825_DUPLICATE_153b_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_2155(
     result,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1794_c2_dd43_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1794_c2_dd43_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1794_c2_dd43_return_output,
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1794_c2_dd43_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1794_c2_dd43_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1794_c2_dd43_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1794_c2_dd43_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1794_c2_dd43_return_output);

     -- Submodule level 8
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_2155_uxn_opcodes_h_l1790_l1825_DUPLICATE_153b_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_2155_uxn_opcodes_h_l1790_l1825_DUPLICATE_153b_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_tmp8 <= REG_VAR_tmp8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     tmp8 <= REG_COMB_tmp8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
