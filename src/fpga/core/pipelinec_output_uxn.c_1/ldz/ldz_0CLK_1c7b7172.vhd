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
-- Submodules: 58
entity ldz_0CLK_1c7b7172 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end ldz_0CLK_1c7b7172;
architecture arch of ldz_0CLK_1c7b7172 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1615_c6_4cb8]
signal BIN_OP_EQ_uxn_opcodes_h_l1615_c6_4cb8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1615_c6_4cb8_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1615_c6_4cb8_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1615_c1_3121]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1615_c1_3121_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1615_c1_3121_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1615_c1_3121_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1615_c1_3121_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1615_c2_a55b]
signal tmp8_MUX_uxn_opcodes_h_l1615_c2_a55b_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1615_c2_a55b_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1615_c2_a55b_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1615_c2_a55b_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1615_c2_a55b]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1615_c2_a55b_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1615_c2_a55b_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1615_c2_a55b_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1615_c2_a55b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1615_c2_a55b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1615_c2_a55b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1615_c2_a55b_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1615_c2_a55b_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1615_c2_a55b_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1615_c2_a55b]
signal result_stack_value_MUX_uxn_opcodes_h_l1615_c2_a55b_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1615_c2_a55b_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1615_c2_a55b_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1615_c2_a55b_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1615_c2_a55b]
signal result_ram_addr_MUX_uxn_opcodes_h_l1615_c2_a55b_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1615_c2_a55b_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1615_c2_a55b_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1615_c2_a55b_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1615_c2_a55b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1615_c2_a55b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1615_c2_a55b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1615_c2_a55b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1615_c2_a55b_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1615_c2_a55b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1615_c2_a55b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1615_c2_a55b_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1615_c2_a55b_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1615_c2_a55b_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1615_c2_a55b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1615_c2_a55b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1615_c2_a55b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1615_c2_a55b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1615_c2_a55b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1615_c2_a55b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1615_c2_a55b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1615_c2_a55b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1615_c2_a55b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1615_c2_a55b_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1615_c2_a55b]
signal t8_MUX_uxn_opcodes_h_l1615_c2_a55b_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1615_c2_a55b_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1615_c2_a55b_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1615_c2_a55b_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l1616_c3_8b15[uxn_opcodes_h_l1616_c3_8b15]
signal printf_uxn_opcodes_h_l1616_c3_8b15_uxn_opcodes_h_l1616_c3_8b15_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1621_c11_46ba]
signal BIN_OP_EQ_uxn_opcodes_h_l1621_c11_46ba_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1621_c11_46ba_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1621_c11_46ba_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1621_c7_0a7c]
signal tmp8_MUX_uxn_opcodes_h_l1621_c7_0a7c_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1621_c7_0a7c_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1621_c7_0a7c_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1621_c7_0a7c_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1621_c7_0a7c]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1621_c7_0a7c_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1621_c7_0a7c_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1621_c7_0a7c_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1621_c7_0a7c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1621_c7_0a7c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1621_c7_0a7c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1621_c7_0a7c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1621_c7_0a7c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1621_c7_0a7c_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1621_c7_0a7c]
signal result_stack_value_MUX_uxn_opcodes_h_l1621_c7_0a7c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1621_c7_0a7c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1621_c7_0a7c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1621_c7_0a7c_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1621_c7_0a7c]
signal result_ram_addr_MUX_uxn_opcodes_h_l1621_c7_0a7c_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1621_c7_0a7c_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1621_c7_0a7c_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1621_c7_0a7c_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1621_c7_0a7c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1621_c7_0a7c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1621_c7_0a7c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1621_c7_0a7c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1621_c7_0a7c_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1621_c7_0a7c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1621_c7_0a7c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1621_c7_0a7c_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1621_c7_0a7c_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1621_c7_0a7c_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1621_c7_0a7c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1621_c7_0a7c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1621_c7_0a7c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1621_c7_0a7c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1621_c7_0a7c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1621_c7_0a7c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1621_c7_0a7c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1621_c7_0a7c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1621_c7_0a7c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1621_c7_0a7c_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1621_c7_0a7c]
signal t8_MUX_uxn_opcodes_h_l1621_c7_0a7c_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1621_c7_0a7c_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1621_c7_0a7c_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1621_c7_0a7c_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1624_c11_eac3]
signal BIN_OP_EQ_uxn_opcodes_h_l1624_c11_eac3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1624_c11_eac3_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1624_c11_eac3_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1624_c7_8fc5]
signal tmp8_MUX_uxn_opcodes_h_l1624_c7_8fc5_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1624_c7_8fc5_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1624_c7_8fc5_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1624_c7_8fc5_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1624_c7_8fc5]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1624_c7_8fc5_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1624_c7_8fc5_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1624_c7_8fc5_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1624_c7_8fc5_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1624_c7_8fc5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1624_c7_8fc5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1624_c7_8fc5_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1624_c7_8fc5_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1624_c7_8fc5_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1624_c7_8fc5]
signal result_stack_value_MUX_uxn_opcodes_h_l1624_c7_8fc5_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1624_c7_8fc5_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1624_c7_8fc5_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1624_c7_8fc5_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1624_c7_8fc5]
signal result_ram_addr_MUX_uxn_opcodes_h_l1624_c7_8fc5_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1624_c7_8fc5_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1624_c7_8fc5_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1624_c7_8fc5_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1624_c7_8fc5]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1624_c7_8fc5_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1624_c7_8fc5_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1624_c7_8fc5_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1624_c7_8fc5_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1624_c7_8fc5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1624_c7_8fc5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1624_c7_8fc5_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1624_c7_8fc5_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1624_c7_8fc5_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1624_c7_8fc5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1624_c7_8fc5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1624_c7_8fc5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1624_c7_8fc5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1624_c7_8fc5_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1624_c7_8fc5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1624_c7_8fc5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1624_c7_8fc5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1624_c7_8fc5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1624_c7_8fc5_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1624_c7_8fc5]
signal t8_MUX_uxn_opcodes_h_l1624_c7_8fc5_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1624_c7_8fc5_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1624_c7_8fc5_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1624_c7_8fc5_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1628_c32_4845]
signal BIN_OP_AND_uxn_opcodes_h_l1628_c32_4845_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1628_c32_4845_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1628_c32_4845_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1628_c32_7765]
signal BIN_OP_GT_uxn_opcodes_h_l1628_c32_7765_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1628_c32_7765_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1628_c32_7765_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1628_c32_d6eb]
signal MUX_uxn_opcodes_h_l1628_c32_d6eb_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1628_c32_d6eb_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1628_c32_d6eb_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1628_c32_d6eb_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1631_c11_e19f]
signal BIN_OP_EQ_uxn_opcodes_h_l1631_c11_e19f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1631_c11_e19f_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1631_c11_e19f_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1631_c7_51c9]
signal tmp8_MUX_uxn_opcodes_h_l1631_c7_51c9_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1631_c7_51c9_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1631_c7_51c9_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1631_c7_51c9_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1631_c7_51c9]
signal result_ram_addr_MUX_uxn_opcodes_h_l1631_c7_51c9_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1631_c7_51c9_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1631_c7_51c9_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1631_c7_51c9_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1631_c7_51c9]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1631_c7_51c9_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1631_c7_51c9_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1631_c7_51c9_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1631_c7_51c9_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1631_c7_51c9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1631_c7_51c9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1631_c7_51c9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1631_c7_51c9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1631_c7_51c9_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1631_c7_51c9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1631_c7_51c9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1631_c7_51c9_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1631_c7_51c9_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1631_c7_51c9_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1631_c7_51c9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1631_c7_51c9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1631_c7_51c9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1631_c7_51c9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1631_c7_51c9_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1631_c7_51c9]
signal result_stack_value_MUX_uxn_opcodes_h_l1631_c7_51c9_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1631_c7_51c9_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1631_c7_51c9_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1631_c7_51c9_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1635_c11_c562]
signal BIN_OP_EQ_uxn_opcodes_h_l1635_c11_c562_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1635_c11_c562_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1635_c11_c562_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1635_c7_958d]
signal tmp8_MUX_uxn_opcodes_h_l1635_c7_958d_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1635_c7_958d_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1635_c7_958d_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1635_c7_958d_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1635_c7_958d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1635_c7_958d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1635_c7_958d_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1635_c7_958d_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1635_c7_958d_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1635_c7_958d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1635_c7_958d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1635_c7_958d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1635_c7_958d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1635_c7_958d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1635_c7_958d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1635_c7_958d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1635_c7_958d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1635_c7_958d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1635_c7_958d_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1635_c7_958d]
signal result_stack_value_MUX_uxn_opcodes_h_l1635_c7_958d_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1635_c7_958d_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1635_c7_958d_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1635_c7_958d_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1641_c11_b4a4]
signal BIN_OP_EQ_uxn_opcodes_h_l1641_c11_b4a4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1641_c11_b4a4_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1641_c11_b4a4_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1641_c7_291c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1641_c7_291c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1641_c7_291c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1641_c7_291c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1641_c7_291c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1641_c7_291c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1641_c7_291c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1641_c7_291c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1641_c7_291c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1641_c7_291c_return_output : unsigned(0 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
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
-- BIN_OP_EQ_uxn_opcodes_h_l1615_c6_4cb8
BIN_OP_EQ_uxn_opcodes_h_l1615_c6_4cb8 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1615_c6_4cb8_left,
BIN_OP_EQ_uxn_opcodes_h_l1615_c6_4cb8_right,
BIN_OP_EQ_uxn_opcodes_h_l1615_c6_4cb8_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1615_c1_3121
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1615_c1_3121 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1615_c1_3121_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1615_c1_3121_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1615_c1_3121_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1615_c1_3121_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1615_c2_a55b
tmp8_MUX_uxn_opcodes_h_l1615_c2_a55b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1615_c2_a55b_cond,
tmp8_MUX_uxn_opcodes_h_l1615_c2_a55b_iftrue,
tmp8_MUX_uxn_opcodes_h_l1615_c2_a55b_iffalse,
tmp8_MUX_uxn_opcodes_h_l1615_c2_a55b_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1615_c2_a55b
result_is_stack_read_MUX_uxn_opcodes_h_l1615_c2_a55b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1615_c2_a55b_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1615_c2_a55b_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1615_c2_a55b_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1615_c2_a55b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1615_c2_a55b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1615_c2_a55b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1615_c2_a55b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1615_c2_a55b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1615_c2_a55b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1615_c2_a55b_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1615_c2_a55b
result_stack_value_MUX_uxn_opcodes_h_l1615_c2_a55b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1615_c2_a55b_cond,
result_stack_value_MUX_uxn_opcodes_h_l1615_c2_a55b_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1615_c2_a55b_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1615_c2_a55b_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1615_c2_a55b
result_ram_addr_MUX_uxn_opcodes_h_l1615_c2_a55b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1615_c2_a55b_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1615_c2_a55b_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1615_c2_a55b_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1615_c2_a55b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1615_c2_a55b
result_is_sp_shift_MUX_uxn_opcodes_h_l1615_c2_a55b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1615_c2_a55b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1615_c2_a55b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1615_c2_a55b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1615_c2_a55b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1615_c2_a55b
result_sp_relative_shift_MUX_uxn_opcodes_h_l1615_c2_a55b : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1615_c2_a55b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1615_c2_a55b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1615_c2_a55b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1615_c2_a55b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1615_c2_a55b
result_is_stack_write_MUX_uxn_opcodes_h_l1615_c2_a55b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1615_c2_a55b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1615_c2_a55b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1615_c2_a55b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1615_c2_a55b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1615_c2_a55b
result_is_opc_done_MUX_uxn_opcodes_h_l1615_c2_a55b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1615_c2_a55b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1615_c2_a55b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1615_c2_a55b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1615_c2_a55b_return_output);

-- t8_MUX_uxn_opcodes_h_l1615_c2_a55b
t8_MUX_uxn_opcodes_h_l1615_c2_a55b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1615_c2_a55b_cond,
t8_MUX_uxn_opcodes_h_l1615_c2_a55b_iftrue,
t8_MUX_uxn_opcodes_h_l1615_c2_a55b_iffalse,
t8_MUX_uxn_opcodes_h_l1615_c2_a55b_return_output);

-- printf_uxn_opcodes_h_l1616_c3_8b15_uxn_opcodes_h_l1616_c3_8b15
printf_uxn_opcodes_h_l1616_c3_8b15_uxn_opcodes_h_l1616_c3_8b15 : entity work.printf_uxn_opcodes_h_l1616_c3_8b15_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1616_c3_8b15_uxn_opcodes_h_l1616_c3_8b15_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1621_c11_46ba
BIN_OP_EQ_uxn_opcodes_h_l1621_c11_46ba : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1621_c11_46ba_left,
BIN_OP_EQ_uxn_opcodes_h_l1621_c11_46ba_right,
BIN_OP_EQ_uxn_opcodes_h_l1621_c11_46ba_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1621_c7_0a7c
tmp8_MUX_uxn_opcodes_h_l1621_c7_0a7c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1621_c7_0a7c_cond,
tmp8_MUX_uxn_opcodes_h_l1621_c7_0a7c_iftrue,
tmp8_MUX_uxn_opcodes_h_l1621_c7_0a7c_iffalse,
tmp8_MUX_uxn_opcodes_h_l1621_c7_0a7c_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1621_c7_0a7c
result_is_stack_read_MUX_uxn_opcodes_h_l1621_c7_0a7c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1621_c7_0a7c_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1621_c7_0a7c_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1621_c7_0a7c_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1621_c7_0a7c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1621_c7_0a7c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1621_c7_0a7c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1621_c7_0a7c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1621_c7_0a7c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1621_c7_0a7c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1621_c7_0a7c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1621_c7_0a7c
result_stack_value_MUX_uxn_opcodes_h_l1621_c7_0a7c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1621_c7_0a7c_cond,
result_stack_value_MUX_uxn_opcodes_h_l1621_c7_0a7c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1621_c7_0a7c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1621_c7_0a7c_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1621_c7_0a7c
result_ram_addr_MUX_uxn_opcodes_h_l1621_c7_0a7c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1621_c7_0a7c_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1621_c7_0a7c_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1621_c7_0a7c_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1621_c7_0a7c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1621_c7_0a7c
result_is_sp_shift_MUX_uxn_opcodes_h_l1621_c7_0a7c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1621_c7_0a7c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1621_c7_0a7c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1621_c7_0a7c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1621_c7_0a7c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1621_c7_0a7c
result_sp_relative_shift_MUX_uxn_opcodes_h_l1621_c7_0a7c : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1621_c7_0a7c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1621_c7_0a7c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1621_c7_0a7c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1621_c7_0a7c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1621_c7_0a7c
result_is_stack_write_MUX_uxn_opcodes_h_l1621_c7_0a7c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1621_c7_0a7c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1621_c7_0a7c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1621_c7_0a7c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1621_c7_0a7c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1621_c7_0a7c
result_is_opc_done_MUX_uxn_opcodes_h_l1621_c7_0a7c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1621_c7_0a7c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1621_c7_0a7c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1621_c7_0a7c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1621_c7_0a7c_return_output);

-- t8_MUX_uxn_opcodes_h_l1621_c7_0a7c
t8_MUX_uxn_opcodes_h_l1621_c7_0a7c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1621_c7_0a7c_cond,
t8_MUX_uxn_opcodes_h_l1621_c7_0a7c_iftrue,
t8_MUX_uxn_opcodes_h_l1621_c7_0a7c_iffalse,
t8_MUX_uxn_opcodes_h_l1621_c7_0a7c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1624_c11_eac3
BIN_OP_EQ_uxn_opcodes_h_l1624_c11_eac3 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1624_c11_eac3_left,
BIN_OP_EQ_uxn_opcodes_h_l1624_c11_eac3_right,
BIN_OP_EQ_uxn_opcodes_h_l1624_c11_eac3_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1624_c7_8fc5
tmp8_MUX_uxn_opcodes_h_l1624_c7_8fc5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1624_c7_8fc5_cond,
tmp8_MUX_uxn_opcodes_h_l1624_c7_8fc5_iftrue,
tmp8_MUX_uxn_opcodes_h_l1624_c7_8fc5_iffalse,
tmp8_MUX_uxn_opcodes_h_l1624_c7_8fc5_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1624_c7_8fc5
result_is_stack_read_MUX_uxn_opcodes_h_l1624_c7_8fc5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1624_c7_8fc5_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1624_c7_8fc5_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1624_c7_8fc5_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1624_c7_8fc5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1624_c7_8fc5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1624_c7_8fc5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1624_c7_8fc5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1624_c7_8fc5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1624_c7_8fc5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1624_c7_8fc5_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1624_c7_8fc5
result_stack_value_MUX_uxn_opcodes_h_l1624_c7_8fc5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1624_c7_8fc5_cond,
result_stack_value_MUX_uxn_opcodes_h_l1624_c7_8fc5_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1624_c7_8fc5_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1624_c7_8fc5_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1624_c7_8fc5
result_ram_addr_MUX_uxn_opcodes_h_l1624_c7_8fc5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1624_c7_8fc5_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1624_c7_8fc5_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1624_c7_8fc5_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1624_c7_8fc5_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1624_c7_8fc5
result_is_sp_shift_MUX_uxn_opcodes_h_l1624_c7_8fc5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1624_c7_8fc5_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1624_c7_8fc5_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1624_c7_8fc5_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1624_c7_8fc5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1624_c7_8fc5
result_sp_relative_shift_MUX_uxn_opcodes_h_l1624_c7_8fc5 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1624_c7_8fc5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1624_c7_8fc5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1624_c7_8fc5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1624_c7_8fc5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1624_c7_8fc5
result_is_stack_write_MUX_uxn_opcodes_h_l1624_c7_8fc5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1624_c7_8fc5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1624_c7_8fc5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1624_c7_8fc5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1624_c7_8fc5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1624_c7_8fc5
result_is_opc_done_MUX_uxn_opcodes_h_l1624_c7_8fc5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1624_c7_8fc5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1624_c7_8fc5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1624_c7_8fc5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1624_c7_8fc5_return_output);

-- t8_MUX_uxn_opcodes_h_l1624_c7_8fc5
t8_MUX_uxn_opcodes_h_l1624_c7_8fc5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1624_c7_8fc5_cond,
t8_MUX_uxn_opcodes_h_l1624_c7_8fc5_iftrue,
t8_MUX_uxn_opcodes_h_l1624_c7_8fc5_iffalse,
t8_MUX_uxn_opcodes_h_l1624_c7_8fc5_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1628_c32_4845
BIN_OP_AND_uxn_opcodes_h_l1628_c32_4845 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1628_c32_4845_left,
BIN_OP_AND_uxn_opcodes_h_l1628_c32_4845_right,
BIN_OP_AND_uxn_opcodes_h_l1628_c32_4845_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1628_c32_7765
BIN_OP_GT_uxn_opcodes_h_l1628_c32_7765 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1628_c32_7765_left,
BIN_OP_GT_uxn_opcodes_h_l1628_c32_7765_right,
BIN_OP_GT_uxn_opcodes_h_l1628_c32_7765_return_output);

-- MUX_uxn_opcodes_h_l1628_c32_d6eb
MUX_uxn_opcodes_h_l1628_c32_d6eb : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1628_c32_d6eb_cond,
MUX_uxn_opcodes_h_l1628_c32_d6eb_iftrue,
MUX_uxn_opcodes_h_l1628_c32_d6eb_iffalse,
MUX_uxn_opcodes_h_l1628_c32_d6eb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1631_c11_e19f
BIN_OP_EQ_uxn_opcodes_h_l1631_c11_e19f : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1631_c11_e19f_left,
BIN_OP_EQ_uxn_opcodes_h_l1631_c11_e19f_right,
BIN_OP_EQ_uxn_opcodes_h_l1631_c11_e19f_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1631_c7_51c9
tmp8_MUX_uxn_opcodes_h_l1631_c7_51c9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1631_c7_51c9_cond,
tmp8_MUX_uxn_opcodes_h_l1631_c7_51c9_iftrue,
tmp8_MUX_uxn_opcodes_h_l1631_c7_51c9_iffalse,
tmp8_MUX_uxn_opcodes_h_l1631_c7_51c9_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1631_c7_51c9
result_ram_addr_MUX_uxn_opcodes_h_l1631_c7_51c9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1631_c7_51c9_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1631_c7_51c9_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1631_c7_51c9_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1631_c7_51c9_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1631_c7_51c9
result_is_sp_shift_MUX_uxn_opcodes_h_l1631_c7_51c9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1631_c7_51c9_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1631_c7_51c9_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1631_c7_51c9_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1631_c7_51c9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1631_c7_51c9
result_is_stack_write_MUX_uxn_opcodes_h_l1631_c7_51c9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1631_c7_51c9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1631_c7_51c9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1631_c7_51c9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1631_c7_51c9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1631_c7_51c9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1631_c7_51c9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1631_c7_51c9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1631_c7_51c9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1631_c7_51c9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1631_c7_51c9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1631_c7_51c9
result_is_opc_done_MUX_uxn_opcodes_h_l1631_c7_51c9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1631_c7_51c9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1631_c7_51c9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1631_c7_51c9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1631_c7_51c9_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1631_c7_51c9
result_stack_value_MUX_uxn_opcodes_h_l1631_c7_51c9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1631_c7_51c9_cond,
result_stack_value_MUX_uxn_opcodes_h_l1631_c7_51c9_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1631_c7_51c9_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1631_c7_51c9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1635_c11_c562
BIN_OP_EQ_uxn_opcodes_h_l1635_c11_c562 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1635_c11_c562_left,
BIN_OP_EQ_uxn_opcodes_h_l1635_c11_c562_right,
BIN_OP_EQ_uxn_opcodes_h_l1635_c11_c562_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1635_c7_958d
tmp8_MUX_uxn_opcodes_h_l1635_c7_958d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1635_c7_958d_cond,
tmp8_MUX_uxn_opcodes_h_l1635_c7_958d_iftrue,
tmp8_MUX_uxn_opcodes_h_l1635_c7_958d_iffalse,
tmp8_MUX_uxn_opcodes_h_l1635_c7_958d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1635_c7_958d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1635_c7_958d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1635_c7_958d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1635_c7_958d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1635_c7_958d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1635_c7_958d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1635_c7_958d
result_is_stack_write_MUX_uxn_opcodes_h_l1635_c7_958d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1635_c7_958d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1635_c7_958d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1635_c7_958d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1635_c7_958d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1635_c7_958d
result_is_opc_done_MUX_uxn_opcodes_h_l1635_c7_958d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1635_c7_958d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1635_c7_958d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1635_c7_958d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1635_c7_958d_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1635_c7_958d
result_stack_value_MUX_uxn_opcodes_h_l1635_c7_958d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1635_c7_958d_cond,
result_stack_value_MUX_uxn_opcodes_h_l1635_c7_958d_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1635_c7_958d_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1635_c7_958d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1641_c11_b4a4
BIN_OP_EQ_uxn_opcodes_h_l1641_c11_b4a4 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1641_c11_b4a4_left,
BIN_OP_EQ_uxn_opcodes_h_l1641_c11_b4a4_right,
BIN_OP_EQ_uxn_opcodes_h_l1641_c11_b4a4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1641_c7_291c
result_is_stack_write_MUX_uxn_opcodes_h_l1641_c7_291c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1641_c7_291c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1641_c7_291c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1641_c7_291c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1641_c7_291c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1641_c7_291c
result_is_opc_done_MUX_uxn_opcodes_h_l1641_c7_291c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1641_c7_291c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1641_c7_291c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1641_c7_291c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1641_c7_291c_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 previous_ram_read,
 -- Registers
 t8,
 tmp8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1615_c6_4cb8_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1615_c1_3121_return_output,
 tmp8_MUX_uxn_opcodes_h_l1615_c2_a55b_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1615_c2_a55b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1615_c2_a55b_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1615_c2_a55b_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1615_c2_a55b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1615_c2_a55b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1615_c2_a55b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1615_c2_a55b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1615_c2_a55b_return_output,
 t8_MUX_uxn_opcodes_h_l1615_c2_a55b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1621_c11_46ba_return_output,
 tmp8_MUX_uxn_opcodes_h_l1621_c7_0a7c_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1621_c7_0a7c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1621_c7_0a7c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1621_c7_0a7c_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1621_c7_0a7c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1621_c7_0a7c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1621_c7_0a7c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1621_c7_0a7c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1621_c7_0a7c_return_output,
 t8_MUX_uxn_opcodes_h_l1621_c7_0a7c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1624_c11_eac3_return_output,
 tmp8_MUX_uxn_opcodes_h_l1624_c7_8fc5_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1624_c7_8fc5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1624_c7_8fc5_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1624_c7_8fc5_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1624_c7_8fc5_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1624_c7_8fc5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1624_c7_8fc5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1624_c7_8fc5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1624_c7_8fc5_return_output,
 t8_MUX_uxn_opcodes_h_l1624_c7_8fc5_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1628_c32_4845_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1628_c32_7765_return_output,
 MUX_uxn_opcodes_h_l1628_c32_d6eb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1631_c11_e19f_return_output,
 tmp8_MUX_uxn_opcodes_h_l1631_c7_51c9_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1631_c7_51c9_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1631_c7_51c9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1631_c7_51c9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1631_c7_51c9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1631_c7_51c9_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1631_c7_51c9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1635_c11_c562_return_output,
 tmp8_MUX_uxn_opcodes_h_l1635_c7_958d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1635_c7_958d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1635_c7_958d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1635_c7_958d_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1635_c7_958d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1641_c11_b4a4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1641_c7_291c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1641_c7_291c_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1615_c6_4cb8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1615_c6_4cb8_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1615_c6_4cb8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1615_c1_3121_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1615_c1_3121_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1615_c1_3121_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1615_c1_3121_iffalse : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1615_c2_a55b_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1615_c2_a55b_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1621_c7_0a7c_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1615_c2_a55b_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1615_c2_a55b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1615_c2_a55b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1615_c2_a55b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1621_c7_0a7c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1615_c2_a55b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1615_c2_a55b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1615_c2_a55b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1618_c3_ed00 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1615_c2_a55b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1621_c7_0a7c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1615_c2_a55b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1615_c2_a55b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1615_c2_a55b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1615_c2_a55b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1621_c7_0a7c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1615_c2_a55b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1615_c2_a55b_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1615_c2_a55b_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1615_c2_a55b_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1621_c7_0a7c_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1615_c2_a55b_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1615_c2_a55b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1615_c2_a55b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1615_c2_a55b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1621_c7_0a7c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1615_c2_a55b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1615_c2_a55b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1615_c2_a55b_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1615_c2_a55b_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1621_c7_0a7c_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1615_c2_a55b_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1615_c2_a55b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1615_c2_a55b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1615_c2_a55b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1621_c7_0a7c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1615_c2_a55b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1615_c2_a55b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1615_c2_a55b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1615_c2_a55b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1621_c7_0a7c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1615_c2_a55b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1615_c2_a55b_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1615_c2_a55b_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1615_c2_a55b_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1621_c7_0a7c_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1615_c2_a55b_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1615_c2_a55b_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1616_c3_8b15_uxn_opcodes_h_l1616_c3_8b15_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1621_c11_46ba_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1621_c11_46ba_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1621_c11_46ba_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1621_c7_0a7c_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1621_c7_0a7c_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1624_c7_8fc5_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1621_c7_0a7c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1621_c7_0a7c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1621_c7_0a7c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1624_c7_8fc5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1621_c7_0a7c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1621_c7_0a7c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1622_c3_8e64 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1621_c7_0a7c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1624_c7_8fc5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1621_c7_0a7c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1621_c7_0a7c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1621_c7_0a7c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1624_c7_8fc5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1621_c7_0a7c_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1621_c7_0a7c_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1621_c7_0a7c_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1624_c7_8fc5_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1621_c7_0a7c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1621_c7_0a7c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1621_c7_0a7c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1624_c7_8fc5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1621_c7_0a7c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1621_c7_0a7c_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1621_c7_0a7c_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1624_c7_8fc5_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1621_c7_0a7c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1621_c7_0a7c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1621_c7_0a7c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1624_c7_8fc5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1621_c7_0a7c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1621_c7_0a7c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1621_c7_0a7c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1624_c7_8fc5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1621_c7_0a7c_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1621_c7_0a7c_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1621_c7_0a7c_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1624_c7_8fc5_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1621_c7_0a7c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1624_c11_eac3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1624_c11_eac3_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1624_c11_eac3_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1624_c7_8fc5_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1624_c7_8fc5_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1631_c7_51c9_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1624_c7_8fc5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1624_c7_8fc5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1624_c7_8fc5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1624_c7_8fc5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1624_c7_8fc5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1624_c7_8fc5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1631_c7_51c9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1624_c7_8fc5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1624_c7_8fc5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1624_c7_8fc5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1631_c7_51c9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1624_c7_8fc5_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1624_c7_8fc5_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1624_c7_8fc5_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1631_c7_51c9_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1624_c7_8fc5_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1624_c7_8fc5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1624_c7_8fc5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1631_c7_51c9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1624_c7_8fc5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1624_c7_8fc5_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1624_c7_8fc5_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1624_c7_8fc5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1624_c7_8fc5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1624_c7_8fc5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1631_c7_51c9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1624_c7_8fc5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1624_c7_8fc5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1624_c7_8fc5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1631_c7_51c9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1624_c7_8fc5_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1624_c7_8fc5_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1624_c7_8fc5_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1624_c7_8fc5_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1628_c32_d6eb_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1628_c32_d6eb_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1628_c32_d6eb_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1628_c32_4845_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1628_c32_4845_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1628_c32_4845_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1628_c32_7765_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1628_c32_7765_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1628_c32_7765_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1628_c32_d6eb_return_output : signed(7 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1629_c21_a0d4_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1631_c11_e19f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1631_c11_e19f_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1631_c11_e19f_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1631_c7_51c9_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1631_c7_51c9_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1635_c7_958d_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1631_c7_51c9_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1631_c7_51c9_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1631_c7_51c9_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1631_c7_51c9_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1631_c7_51c9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1631_c7_51c9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1631_c7_51c9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1631_c7_51c9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1631_c7_51c9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1635_c7_958d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1631_c7_51c9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1631_c7_51c9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1631_c7_51c9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1635_c7_958d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1631_c7_51c9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1631_c7_51c9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1631_c7_51c9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1635_c7_958d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1631_c7_51c9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1631_c7_51c9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1631_c7_51c9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1635_c7_958d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1631_c7_51c9_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1633_c21_5e70_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1635_c11_c562_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1635_c11_c562_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1635_c11_c562_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1635_c7_958d_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1635_c7_958d_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1635_c7_958d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1635_c7_958d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1638_c3_eed2 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1635_c7_958d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1635_c7_958d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1635_c7_958d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1635_c7_958d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1641_c7_291c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1635_c7_958d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1635_c7_958d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1635_c7_958d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1641_c7_291c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1635_c7_958d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1635_c7_958d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1635_c7_958d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1635_c7_958d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1641_c11_b4a4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1641_c11_b4a4_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1641_c11_b4a4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1641_c7_291c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1641_c7_291c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1641_c7_291c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1641_c7_291c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1641_c7_291c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1641_c7_291c_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1621_l1615_l1635_l1631_l1624_DUPLICATE_8993_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1615_l1631_l1621_DUPLICATE_8173_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1615_l1631_l1621_DUPLICATE_5ba9_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1615_l1621_l1624_DUPLICATE_f5f5_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1621_l1615_l1641_l1631_l1624_DUPLICATE_0e57_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1621_l1624_DUPLICATE_974b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1621_l1641_l1635_l1631_l1624_DUPLICATE_aef5_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1631_l1635_l1624_DUPLICATE_9f95_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_2155_uxn_opcodes_h_l1646_l1611_DUPLICATE_e4fc_return_output : opcode_result_t;
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
     VAR_MUX_uxn_opcodes_h_l1628_c32_d6eb_iffalse := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1641_c11_b4a4_right := to_unsigned(5, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1641_c7_291c_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1635_c7_958d_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1618_c3_ed00 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1615_c2_a55b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1618_c3_ed00;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1628_c32_4845_right := to_unsigned(128, 8);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1641_c7_291c_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1635_c11_c562_right := to_unsigned(4, 3);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1615_c1_3121_iffalse := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1624_c7_8fc5_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1631_c7_51c9_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1615_c6_4cb8_right := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1628_c32_d6eb_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1615_c2_a55b_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1624_c11_eac3_right := to_unsigned(2, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1615_c2_a55b_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1624_c7_8fc5_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1631_c11_e19f_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1621_c11_46ba_right := to_unsigned(1, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l1628_c32_7765_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1638_c3_eed2 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1635_c7_958d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1638_c3_eed2;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1622_c3_8e64 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1621_c7_0a7c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1622_c3_8e64;

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1615_c1_3121_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1628_c32_4845_left := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1615_c6_4cb8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1621_c11_46ba_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1624_c11_eac3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1631_c11_e19f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1635_c11_c562_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1641_c11_b4a4_left := VAR_phase;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1635_c7_958d_iftrue := VAR_previous_ram_read;
     VAR_tmp8_MUX_uxn_opcodes_h_l1635_c7_958d_iftrue := VAR_previous_ram_read;
     VAR_t8_MUX_uxn_opcodes_h_l1624_c7_8fc5_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1615_c2_a55b_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1621_c7_0a7c_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1624_c7_8fc5_iffalse := t8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1615_c2_a55b_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1621_c7_0a7c_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1624_c7_8fc5_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1631_c7_51c9_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1635_c7_958d_iffalse := tmp8;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1621_l1615_l1641_l1631_l1624_DUPLICATE_0e57 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1621_l1615_l1641_l1631_l1624_DUPLICATE_0e57_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1621_l1641_l1635_l1631_l1624_DUPLICATE_aef5 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1621_l1641_l1635_l1631_l1624_DUPLICATE_aef5_return_output := result.is_opc_done;

     -- BIN_OP_AND[uxn_opcodes_h_l1628_c32_4845] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1628_c32_4845_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1628_c32_4845_left;
     BIN_OP_AND_uxn_opcodes_h_l1628_c32_4845_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1628_c32_4845_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1628_c32_4845_return_output := BIN_OP_AND_uxn_opcodes_h_l1628_c32_4845_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1615_c6_4cb8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1615_c6_4cb8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1615_c6_4cb8_left;
     BIN_OP_EQ_uxn_opcodes_h_l1615_c6_4cb8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1615_c6_4cb8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1615_c6_4cb8_return_output := BIN_OP_EQ_uxn_opcodes_h_l1615_c6_4cb8_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1615_l1621_l1624_DUPLICATE_f5f5 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1615_l1621_l1624_DUPLICATE_f5f5_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1615_l1631_l1621_DUPLICATE_8173 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1615_l1631_l1621_DUPLICATE_8173_return_output := result.ram_addr;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1615_l1631_l1621_DUPLICATE_5ba9 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1615_l1631_l1621_DUPLICATE_5ba9_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1621_c11_46ba] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1621_c11_46ba_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1621_c11_46ba_left;
     BIN_OP_EQ_uxn_opcodes_h_l1621_c11_46ba_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1621_c11_46ba_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1621_c11_46ba_return_output := BIN_OP_EQ_uxn_opcodes_h_l1621_c11_46ba_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1631_l1635_l1624_DUPLICATE_9f95 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1631_l1635_l1624_DUPLICATE_9f95_return_output := result.stack_address_sp_offset;

     -- CAST_TO_uint16_t[uxn_opcodes_h_l1633_c21_5e70] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1633_c21_5e70_return_output := CAST_TO_uint16_t_uint8_t(
     t8);

     -- CAST_TO_uint16_t[uxn_opcodes_h_l1629_c21_a0d4] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1629_c21_a0d4_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1621_l1624_DUPLICATE_974b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1621_l1624_DUPLICATE_974b_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l1635_c11_c562] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1635_c11_c562_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1635_c11_c562_left;
     BIN_OP_EQ_uxn_opcodes_h_l1635_c11_c562_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1635_c11_c562_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1635_c11_c562_return_output := BIN_OP_EQ_uxn_opcodes_h_l1635_c11_c562_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1631_c11_e19f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1631_c11_e19f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1631_c11_e19f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1631_c11_e19f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1631_c11_e19f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1631_c11_e19f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1631_c11_e19f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1624_c11_eac3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1624_c11_eac3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1624_c11_eac3_left;
     BIN_OP_EQ_uxn_opcodes_h_l1624_c11_eac3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1624_c11_eac3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1624_c11_eac3_return_output := BIN_OP_EQ_uxn_opcodes_h_l1624_c11_eac3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1641_c11_b4a4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1641_c11_b4a4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1641_c11_b4a4_left;
     BIN_OP_EQ_uxn_opcodes_h_l1641_c11_b4a4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1641_c11_b4a4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1641_c11_b4a4_return_output := BIN_OP_EQ_uxn_opcodes_h_l1641_c11_b4a4_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1621_l1615_l1635_l1631_l1624_DUPLICATE_8993 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1621_l1615_l1635_l1631_l1624_DUPLICATE_8993_return_output := result.stack_value;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1628_c32_7765_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1628_c32_4845_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1615_c1_3121_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1615_c6_4cb8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1615_c2_a55b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1615_c6_4cb8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1615_c2_a55b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1615_c6_4cb8_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1615_c2_a55b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1615_c6_4cb8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1615_c2_a55b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1615_c6_4cb8_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1615_c2_a55b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1615_c6_4cb8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1615_c2_a55b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1615_c6_4cb8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1615_c2_a55b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1615_c6_4cb8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1615_c2_a55b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1615_c6_4cb8_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1615_c2_a55b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1615_c6_4cb8_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1615_c2_a55b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1615_c6_4cb8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1621_c7_0a7c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1621_c11_46ba_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1621_c7_0a7c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1621_c11_46ba_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1621_c7_0a7c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1621_c11_46ba_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1621_c7_0a7c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1621_c11_46ba_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1621_c7_0a7c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1621_c11_46ba_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1621_c7_0a7c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1621_c11_46ba_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1621_c7_0a7c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1621_c11_46ba_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1621_c7_0a7c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1621_c11_46ba_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1621_c7_0a7c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1621_c11_46ba_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1621_c7_0a7c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1621_c11_46ba_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1624_c7_8fc5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1624_c11_eac3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1624_c7_8fc5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1624_c11_eac3_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1624_c7_8fc5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1624_c11_eac3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1624_c7_8fc5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1624_c11_eac3_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1624_c7_8fc5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1624_c11_eac3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1624_c7_8fc5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1624_c11_eac3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1624_c7_8fc5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1624_c11_eac3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1624_c7_8fc5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1624_c11_eac3_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1624_c7_8fc5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1624_c11_eac3_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1624_c7_8fc5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1624_c11_eac3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1631_c7_51c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1631_c11_e19f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1631_c7_51c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1631_c11_e19f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1631_c7_51c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1631_c11_e19f_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1631_c7_51c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1631_c11_e19f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1631_c7_51c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1631_c11_e19f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1631_c7_51c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1631_c11_e19f_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1631_c7_51c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1631_c11_e19f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1635_c7_958d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1635_c11_c562_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1635_c7_958d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1635_c11_c562_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1635_c7_958d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1635_c11_c562_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1635_c7_958d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1635_c11_c562_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1635_c7_958d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1635_c11_c562_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1641_c7_291c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1641_c11_b4a4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1641_c7_291c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1641_c11_b4a4_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1624_c7_8fc5_iftrue := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1629_c21_a0d4_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1631_c7_51c9_iftrue := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1633_c21_5e70_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1615_c2_a55b_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1615_l1621_l1624_DUPLICATE_f5f5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1621_c7_0a7c_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1615_l1621_l1624_DUPLICATE_f5f5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1624_c7_8fc5_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1615_l1621_l1624_DUPLICATE_f5f5_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1615_c2_a55b_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1615_l1631_l1621_DUPLICATE_8173_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1621_c7_0a7c_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1615_l1631_l1621_DUPLICATE_8173_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1631_c7_51c9_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1615_l1631_l1621_DUPLICATE_8173_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1621_c7_0a7c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1621_l1641_l1635_l1631_l1624_DUPLICATE_aef5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1624_c7_8fc5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1621_l1641_l1635_l1631_l1624_DUPLICATE_aef5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1631_c7_51c9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1621_l1641_l1635_l1631_l1624_DUPLICATE_aef5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1635_c7_958d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1621_l1641_l1635_l1631_l1624_DUPLICATE_aef5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1641_c7_291c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1621_l1641_l1635_l1631_l1624_DUPLICATE_aef5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1615_c2_a55b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1615_l1631_l1621_DUPLICATE_5ba9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1621_c7_0a7c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1615_l1631_l1621_DUPLICATE_5ba9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1631_c7_51c9_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1615_l1631_l1621_DUPLICATE_5ba9_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1621_c7_0a7c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1621_l1624_DUPLICATE_974b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1624_c7_8fc5_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1621_l1624_DUPLICATE_974b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1615_c2_a55b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1621_l1615_l1641_l1631_l1624_DUPLICATE_0e57_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1621_c7_0a7c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1621_l1615_l1641_l1631_l1624_DUPLICATE_0e57_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1624_c7_8fc5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1621_l1615_l1641_l1631_l1624_DUPLICATE_0e57_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1631_c7_51c9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1621_l1615_l1641_l1631_l1624_DUPLICATE_0e57_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1641_c7_291c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1621_l1615_l1641_l1631_l1624_DUPLICATE_0e57_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1624_c7_8fc5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1631_l1635_l1624_DUPLICATE_9f95_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1631_c7_51c9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1631_l1635_l1624_DUPLICATE_9f95_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1635_c7_958d_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1631_l1635_l1624_DUPLICATE_9f95_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1615_c2_a55b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1621_l1615_l1635_l1631_l1624_DUPLICATE_8993_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1621_c7_0a7c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1621_l1615_l1635_l1631_l1624_DUPLICATE_8993_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1624_c7_8fc5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1621_l1615_l1635_l1631_l1624_DUPLICATE_8993_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1631_c7_51c9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1621_l1615_l1635_l1631_l1624_DUPLICATE_8993_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1635_c7_958d_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1621_l1615_l1635_l1631_l1624_DUPLICATE_8993_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1641_c7_291c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1641_c7_291c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1641_c7_291c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1641_c7_291c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1641_c7_291c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1641_c7_291c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1641_c7_291c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1641_c7_291c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1641_c7_291c_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1628_c32_7765] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1628_c32_7765_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1628_c32_7765_left;
     BIN_OP_GT_uxn_opcodes_h_l1628_c32_7765_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1628_c32_7765_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1628_c32_7765_return_output := BIN_OP_GT_uxn_opcodes_h_l1628_c32_7765_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1631_c7_51c9] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1631_c7_51c9_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1631_c7_51c9_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1631_c7_51c9_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1631_c7_51c9_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1631_c7_51c9_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1631_c7_51c9_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1631_c7_51c9_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1631_c7_51c9_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1635_c7_958d] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1635_c7_958d_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1635_c7_958d_cond;
     tmp8_MUX_uxn_opcodes_h_l1635_c7_958d_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1635_c7_958d_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1635_c7_958d_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1635_c7_958d_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1635_c7_958d_return_output := tmp8_MUX_uxn_opcodes_h_l1635_c7_958d_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1624_c7_8fc5] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1624_c7_8fc5_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1624_c7_8fc5_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1624_c7_8fc5_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1624_c7_8fc5_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1624_c7_8fc5_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1624_c7_8fc5_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1624_c7_8fc5_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1624_c7_8fc5_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1641_c7_291c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1641_c7_291c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1641_c7_291c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1641_c7_291c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1641_c7_291c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1641_c7_291c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1641_c7_291c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1641_c7_291c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1641_c7_291c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1635_c7_958d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1635_c7_958d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1635_c7_958d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1635_c7_958d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1635_c7_958d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1635_c7_958d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1635_c7_958d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1635_c7_958d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1635_c7_958d_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1615_c1_3121] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1615_c1_3121_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1615_c1_3121_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1615_c1_3121_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1615_c1_3121_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1615_c1_3121_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1615_c1_3121_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1615_c1_3121_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1615_c1_3121_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1631_c7_51c9] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1631_c7_51c9_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1631_c7_51c9_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1631_c7_51c9_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1631_c7_51c9_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1631_c7_51c9_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1631_c7_51c9_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1631_c7_51c9_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1631_c7_51c9_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1635_c7_958d] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1635_c7_958d_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1635_c7_958d_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1635_c7_958d_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1635_c7_958d_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1635_c7_958d_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1635_c7_958d_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1635_c7_958d_return_output := result_stack_value_MUX_uxn_opcodes_h_l1635_c7_958d_return_output;

     -- t8_MUX[uxn_opcodes_h_l1624_c7_8fc5] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1624_c7_8fc5_cond <= VAR_t8_MUX_uxn_opcodes_h_l1624_c7_8fc5_cond;
     t8_MUX_uxn_opcodes_h_l1624_c7_8fc5_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1624_c7_8fc5_iftrue;
     t8_MUX_uxn_opcodes_h_l1624_c7_8fc5_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1624_c7_8fc5_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1624_c7_8fc5_return_output := t8_MUX_uxn_opcodes_h_l1624_c7_8fc5_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1628_c32_d6eb_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1628_c32_7765_return_output;
     VAR_printf_uxn_opcodes_h_l1616_c3_8b15_uxn_opcodes_h_l1616_c3_8b15_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1615_c1_3121_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1635_c7_958d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1641_c7_291c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1624_c7_8fc5_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1631_c7_51c9_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1621_c7_0a7c_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1624_c7_8fc5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1635_c7_958d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1641_c7_291c_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1624_c7_8fc5_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1631_c7_51c9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1631_c7_51c9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1635_c7_958d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1631_c7_51c9_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1635_c7_958d_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1621_c7_0a7c_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1624_c7_8fc5_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1631_c7_51c9_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1635_c7_958d_return_output;
     -- result_ram_addr_MUX[uxn_opcodes_h_l1624_c7_8fc5] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1624_c7_8fc5_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1624_c7_8fc5_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1624_c7_8fc5_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1624_c7_8fc5_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1624_c7_8fc5_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1624_c7_8fc5_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1624_c7_8fc5_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1624_c7_8fc5_return_output;

     -- t8_MUX[uxn_opcodes_h_l1621_c7_0a7c] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1621_c7_0a7c_cond <= VAR_t8_MUX_uxn_opcodes_h_l1621_c7_0a7c_cond;
     t8_MUX_uxn_opcodes_h_l1621_c7_0a7c_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1621_c7_0a7c_iftrue;
     t8_MUX_uxn_opcodes_h_l1621_c7_0a7c_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1621_c7_0a7c_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1621_c7_0a7c_return_output := t8_MUX_uxn_opcodes_h_l1621_c7_0a7c_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1631_c7_51c9] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1631_c7_51c9_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1631_c7_51c9_cond;
     tmp8_MUX_uxn_opcodes_h_l1631_c7_51c9_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1631_c7_51c9_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1631_c7_51c9_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1631_c7_51c9_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1631_c7_51c9_return_output := tmp8_MUX_uxn_opcodes_h_l1631_c7_51c9_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1621_c7_0a7c] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1621_c7_0a7c_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1621_c7_0a7c_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1621_c7_0a7c_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1621_c7_0a7c_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1621_c7_0a7c_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1621_c7_0a7c_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1621_c7_0a7c_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1621_c7_0a7c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1635_c7_958d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1635_c7_958d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1635_c7_958d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1635_c7_958d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1635_c7_958d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1635_c7_958d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1635_c7_958d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1635_c7_958d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1635_c7_958d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1624_c7_8fc5] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1624_c7_8fc5_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1624_c7_8fc5_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1624_c7_8fc5_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1624_c7_8fc5_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1624_c7_8fc5_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1624_c7_8fc5_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1624_c7_8fc5_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1624_c7_8fc5_return_output;

     -- MUX[uxn_opcodes_h_l1628_c32_d6eb] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1628_c32_d6eb_cond <= VAR_MUX_uxn_opcodes_h_l1628_c32_d6eb_cond;
     MUX_uxn_opcodes_h_l1628_c32_d6eb_iftrue <= VAR_MUX_uxn_opcodes_h_l1628_c32_d6eb_iftrue;
     MUX_uxn_opcodes_h_l1628_c32_d6eb_iffalse <= VAR_MUX_uxn_opcodes_h_l1628_c32_d6eb_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1628_c32_d6eb_return_output := MUX_uxn_opcodes_h_l1628_c32_d6eb_return_output;

     -- printf_uxn_opcodes_h_l1616_c3_8b15[uxn_opcodes_h_l1616_c3_8b15] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1616_c3_8b15_uxn_opcodes_h_l1616_c3_8b15_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1616_c3_8b15_uxn_opcodes_h_l1616_c3_8b15_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_stack_value_MUX[uxn_opcodes_h_l1631_c7_51c9] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1631_c7_51c9_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1631_c7_51c9_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1631_c7_51c9_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1631_c7_51c9_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1631_c7_51c9_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1631_c7_51c9_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1631_c7_51c9_return_output := result_stack_value_MUX_uxn_opcodes_h_l1631_c7_51c9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1635_c7_958d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1635_c7_958d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1635_c7_958d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1635_c7_958d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1635_c7_958d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1635_c7_958d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1635_c7_958d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1635_c7_958d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1635_c7_958d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1631_c7_51c9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1631_c7_51c9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1631_c7_51c9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1631_c7_51c9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1631_c7_51c9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1631_c7_51c9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1631_c7_51c9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1631_c7_51c9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1631_c7_51c9_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1624_c7_8fc5_iftrue := VAR_MUX_uxn_opcodes_h_l1628_c32_d6eb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1631_c7_51c9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1635_c7_958d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1621_c7_0a7c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1624_c7_8fc5_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1615_c2_a55b_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1621_c7_0a7c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1631_c7_51c9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1635_c7_958d_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1621_c7_0a7c_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1624_c7_8fc5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1624_c7_8fc5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1631_c7_51c9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1624_c7_8fc5_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1631_c7_51c9_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1615_c2_a55b_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1621_c7_0a7c_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1624_c7_8fc5_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1631_c7_51c9_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1621_c7_0a7c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1621_c7_0a7c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1621_c7_0a7c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1621_c7_0a7c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1621_c7_0a7c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1621_c7_0a7c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1621_c7_0a7c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1621_c7_0a7c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1621_c7_0a7c_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1615_c2_a55b] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1615_c2_a55b_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1615_c2_a55b_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1615_c2_a55b_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1615_c2_a55b_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1615_c2_a55b_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1615_c2_a55b_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1615_c2_a55b_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1615_c2_a55b_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1621_c7_0a7c] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1621_c7_0a7c_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1621_c7_0a7c_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1621_c7_0a7c_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1621_c7_0a7c_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1621_c7_0a7c_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1621_c7_0a7c_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1621_c7_0a7c_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1621_c7_0a7c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1624_c7_8fc5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1624_c7_8fc5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1624_c7_8fc5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1624_c7_8fc5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1624_c7_8fc5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1624_c7_8fc5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1624_c7_8fc5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1624_c7_8fc5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1624_c7_8fc5_return_output;

     -- t8_MUX[uxn_opcodes_h_l1615_c2_a55b] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1615_c2_a55b_cond <= VAR_t8_MUX_uxn_opcodes_h_l1615_c2_a55b_cond;
     t8_MUX_uxn_opcodes_h_l1615_c2_a55b_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1615_c2_a55b_iftrue;
     t8_MUX_uxn_opcodes_h_l1615_c2_a55b_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1615_c2_a55b_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1615_c2_a55b_return_output := t8_MUX_uxn_opcodes_h_l1615_c2_a55b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1631_c7_51c9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1631_c7_51c9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1631_c7_51c9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1631_c7_51c9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1631_c7_51c9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1631_c7_51c9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1631_c7_51c9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1631_c7_51c9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1631_c7_51c9_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1624_c7_8fc5] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1624_c7_8fc5_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1624_c7_8fc5_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1624_c7_8fc5_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1624_c7_8fc5_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1624_c7_8fc5_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1624_c7_8fc5_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1624_c7_8fc5_return_output := result_stack_value_MUX_uxn_opcodes_h_l1624_c7_8fc5_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1631_c7_51c9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1631_c7_51c9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1631_c7_51c9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1631_c7_51c9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1631_c7_51c9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1631_c7_51c9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1631_c7_51c9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1631_c7_51c9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1631_c7_51c9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1624_c7_8fc5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1624_c7_8fc5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1624_c7_8fc5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1624_c7_8fc5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1624_c7_8fc5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1624_c7_8fc5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1624_c7_8fc5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1624_c7_8fc5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1624_c7_8fc5_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1624_c7_8fc5] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1624_c7_8fc5_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1624_c7_8fc5_cond;
     tmp8_MUX_uxn_opcodes_h_l1624_c7_8fc5_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1624_c7_8fc5_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1624_c7_8fc5_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1624_c7_8fc5_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1624_c7_8fc5_return_output := tmp8_MUX_uxn_opcodes_h_l1624_c7_8fc5_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1624_c7_8fc5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1631_c7_51c9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1615_c2_a55b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1621_c7_0a7c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1624_c7_8fc5_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1631_c7_51c9_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1615_c2_a55b_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1621_c7_0a7c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1621_c7_0a7c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1624_c7_8fc5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1621_c7_0a7c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1624_c7_8fc5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1621_c7_0a7c_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1624_c7_8fc5_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1615_c2_a55b_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1621_c7_0a7c_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1624_c7_8fc5_return_output;
     -- result_ram_addr_MUX[uxn_opcodes_h_l1615_c2_a55b] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1615_c2_a55b_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1615_c2_a55b_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1615_c2_a55b_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1615_c2_a55b_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1615_c2_a55b_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1615_c2_a55b_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1615_c2_a55b_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1615_c2_a55b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1615_c2_a55b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1615_c2_a55b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1615_c2_a55b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1615_c2_a55b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1615_c2_a55b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1615_c2_a55b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1615_c2_a55b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1615_c2_a55b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1615_c2_a55b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1624_c7_8fc5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1624_c7_8fc5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1624_c7_8fc5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1624_c7_8fc5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1624_c7_8fc5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1624_c7_8fc5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1624_c7_8fc5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1624_c7_8fc5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1624_c7_8fc5_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1621_c7_0a7c] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1621_c7_0a7c_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1621_c7_0a7c_cond;
     tmp8_MUX_uxn_opcodes_h_l1621_c7_0a7c_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1621_c7_0a7c_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1621_c7_0a7c_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1621_c7_0a7c_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1621_c7_0a7c_return_output := tmp8_MUX_uxn_opcodes_h_l1621_c7_0a7c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1621_c7_0a7c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1621_c7_0a7c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1621_c7_0a7c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1621_c7_0a7c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1621_c7_0a7c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1621_c7_0a7c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1621_c7_0a7c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1621_c7_0a7c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1621_c7_0a7c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1621_c7_0a7c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1621_c7_0a7c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1621_c7_0a7c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1621_c7_0a7c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1621_c7_0a7c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1621_c7_0a7c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1621_c7_0a7c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1621_c7_0a7c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1621_c7_0a7c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1624_c7_8fc5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1624_c7_8fc5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1624_c7_8fc5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1624_c7_8fc5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1624_c7_8fc5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1624_c7_8fc5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1624_c7_8fc5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1624_c7_8fc5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1624_c7_8fc5_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1621_c7_0a7c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1621_c7_0a7c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1621_c7_0a7c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1621_c7_0a7c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1621_c7_0a7c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1621_c7_0a7c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1621_c7_0a7c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1621_c7_0a7c_return_output := result_stack_value_MUX_uxn_opcodes_h_l1621_c7_0a7c_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1621_c7_0a7c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1624_c7_8fc5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1621_c7_0a7c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1624_c7_8fc5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1615_c2_a55b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1621_c7_0a7c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1615_c2_a55b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1621_c7_0a7c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1615_c2_a55b_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1621_c7_0a7c_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1615_c2_a55b_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1621_c7_0a7c_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1615_c2_a55b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1615_c2_a55b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1615_c2_a55b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1615_c2_a55b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1615_c2_a55b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1615_c2_a55b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1615_c2_a55b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1615_c2_a55b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1615_c2_a55b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1621_c7_0a7c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1621_c7_0a7c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1621_c7_0a7c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1621_c7_0a7c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1621_c7_0a7c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1621_c7_0a7c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1621_c7_0a7c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1621_c7_0a7c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1621_c7_0a7c_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1615_c2_a55b] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1615_c2_a55b_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1615_c2_a55b_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1615_c2_a55b_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1615_c2_a55b_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1615_c2_a55b_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1615_c2_a55b_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1615_c2_a55b_return_output := result_stack_value_MUX_uxn_opcodes_h_l1615_c2_a55b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1621_c7_0a7c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1621_c7_0a7c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1621_c7_0a7c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1621_c7_0a7c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1621_c7_0a7c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1621_c7_0a7c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1621_c7_0a7c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1621_c7_0a7c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1621_c7_0a7c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1615_c2_a55b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1615_c2_a55b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1615_c2_a55b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1615_c2_a55b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1615_c2_a55b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1615_c2_a55b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1615_c2_a55b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1615_c2_a55b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1615_c2_a55b_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1615_c2_a55b] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1615_c2_a55b_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1615_c2_a55b_cond;
     tmp8_MUX_uxn_opcodes_h_l1615_c2_a55b_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1615_c2_a55b_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1615_c2_a55b_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1615_c2_a55b_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1615_c2_a55b_return_output := tmp8_MUX_uxn_opcodes_h_l1615_c2_a55b_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1615_c2_a55b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1621_c7_0a7c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1615_c2_a55b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1621_c7_0a7c_return_output;
     REG_VAR_tmp8 := VAR_tmp8_MUX_uxn_opcodes_h_l1615_c2_a55b_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1615_c2_a55b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1615_c2_a55b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1615_c2_a55b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1615_c2_a55b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1615_c2_a55b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1615_c2_a55b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1615_c2_a55b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1615_c2_a55b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1615_c2_a55b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1615_c2_a55b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1615_c2_a55b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1615_c2_a55b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1615_c2_a55b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1615_c2_a55b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1615_c2_a55b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1615_c2_a55b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1615_c2_a55b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1615_c2_a55b_return_output;

     -- Submodule level 7
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_2155_uxn_opcodes_h_l1646_l1611_DUPLICATE_e4fc LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_2155_uxn_opcodes_h_l1646_l1611_DUPLICATE_e4fc_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_2155(
     result,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1615_c2_a55b_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1615_c2_a55b_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1615_c2_a55b_return_output,
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1615_c2_a55b_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1615_c2_a55b_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1615_c2_a55b_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1615_c2_a55b_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1615_c2_a55b_return_output);

     -- Submodule level 8
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_2155_uxn_opcodes_h_l1646_l1611_DUPLICATE_e4fc_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_2155_uxn_opcodes_h_l1646_l1611_DUPLICATE_e4fc_return_output;
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
