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
-- Submodules: 84
entity ldz2_0CLK_77d0ca3d is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end ldz2_0CLK_77d0ca3d;
architecture arch of ldz2_0CLK_77d0ca3d is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal tmp16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_tmp16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l1590_c6_5cf2]
signal BIN_OP_EQ_uxn_opcodes_h_l1590_c6_5cf2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1590_c6_5cf2_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1590_c6_5cf2_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1590_c1_c433]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1590_c1_c433_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1590_c1_c433_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1590_c1_c433_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1590_c1_c433_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1590_c2_e3de]
signal t8_MUX_uxn_opcodes_h_l1590_c2_e3de_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1590_c2_e3de_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1590_c2_e3de_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1590_c2_e3de_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1590_c2_e3de]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1590_c2_e3de_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1590_c2_e3de_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1590_c2_e3de_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1590_c2_e3de_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1590_c2_e3de]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1590_c2_e3de_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1590_c2_e3de_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1590_c2_e3de_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1590_c2_e3de_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1590_c2_e3de]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1590_c2_e3de_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1590_c2_e3de_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1590_c2_e3de_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1590_c2_e3de_return_output : signed(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1590_c2_e3de]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1590_c2_e3de_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1590_c2_e3de_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1590_c2_e3de_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1590_c2_e3de_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1590_c2_e3de]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1590_c2_e3de_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1590_c2_e3de_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1590_c2_e3de_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1590_c2_e3de_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1590_c2_e3de]
signal result_ram_addr_MUX_uxn_opcodes_h_l1590_c2_e3de_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1590_c2_e3de_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1590_c2_e3de_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1590_c2_e3de_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1590_c2_e3de]
signal result_stack_value_MUX_uxn_opcodes_h_l1590_c2_e3de_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1590_c2_e3de_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1590_c2_e3de_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1590_c2_e3de_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1590_c2_e3de]
signal tmp16_MUX_uxn_opcodes_h_l1590_c2_e3de_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1590_c2_e3de_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1590_c2_e3de_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1590_c2_e3de_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l1591_c3_52c1[uxn_opcodes_h_l1591_c3_52c1]
signal printf_uxn_opcodes_h_l1591_c3_52c1_uxn_opcodes_h_l1591_c3_52c1_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1595_c11_516a]
signal BIN_OP_EQ_uxn_opcodes_h_l1595_c11_516a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1595_c11_516a_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1595_c11_516a_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1595_c7_9025]
signal t8_MUX_uxn_opcodes_h_l1595_c7_9025_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1595_c7_9025_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1595_c7_9025_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1595_c7_9025_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1595_c7_9025]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1595_c7_9025_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1595_c7_9025_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1595_c7_9025_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1595_c7_9025_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1595_c7_9025]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1595_c7_9025_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1595_c7_9025_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1595_c7_9025_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1595_c7_9025_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1595_c7_9025]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1595_c7_9025_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1595_c7_9025_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1595_c7_9025_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1595_c7_9025_return_output : signed(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1595_c7_9025]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1595_c7_9025_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1595_c7_9025_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1595_c7_9025_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1595_c7_9025_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1595_c7_9025]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1595_c7_9025_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1595_c7_9025_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1595_c7_9025_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1595_c7_9025_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1595_c7_9025]
signal result_ram_addr_MUX_uxn_opcodes_h_l1595_c7_9025_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1595_c7_9025_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1595_c7_9025_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1595_c7_9025_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1595_c7_9025]
signal result_stack_value_MUX_uxn_opcodes_h_l1595_c7_9025_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1595_c7_9025_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1595_c7_9025_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1595_c7_9025_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1595_c7_9025]
signal tmp16_MUX_uxn_opcodes_h_l1595_c7_9025_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1595_c7_9025_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1595_c7_9025_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1595_c7_9025_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1598_c11_ea15]
signal BIN_OP_EQ_uxn_opcodes_h_l1598_c11_ea15_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1598_c11_ea15_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1598_c11_ea15_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1598_c7_e1cf]
signal t8_MUX_uxn_opcodes_h_l1598_c7_e1cf_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1598_c7_e1cf_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1598_c7_e1cf_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1598_c7_e1cf_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1598_c7_e1cf]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1598_c7_e1cf_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1598_c7_e1cf_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1598_c7_e1cf_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1598_c7_e1cf_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1598_c7_e1cf]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1598_c7_e1cf_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1598_c7_e1cf_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1598_c7_e1cf_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1598_c7_e1cf_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1598_c7_e1cf]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1598_c7_e1cf_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1598_c7_e1cf_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1598_c7_e1cf_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1598_c7_e1cf_return_output : signed(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1598_c7_e1cf]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1598_c7_e1cf_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1598_c7_e1cf_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1598_c7_e1cf_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1598_c7_e1cf_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1598_c7_e1cf]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1598_c7_e1cf_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1598_c7_e1cf_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1598_c7_e1cf_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1598_c7_e1cf_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1598_c7_e1cf]
signal result_ram_addr_MUX_uxn_opcodes_h_l1598_c7_e1cf_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1598_c7_e1cf_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1598_c7_e1cf_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1598_c7_e1cf_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1598_c7_e1cf]
signal result_stack_value_MUX_uxn_opcodes_h_l1598_c7_e1cf_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1598_c7_e1cf_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1598_c7_e1cf_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1598_c7_e1cf_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1598_c7_e1cf]
signal tmp16_MUX_uxn_opcodes_h_l1598_c7_e1cf_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1598_c7_e1cf_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1598_c7_e1cf_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1598_c7_e1cf_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1601_c32_375f]
signal BIN_OP_AND_uxn_opcodes_h_l1601_c32_375f_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1601_c32_375f_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1601_c32_375f_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1601_c32_1c83]
signal BIN_OP_GT_uxn_opcodes_h_l1601_c32_1c83_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1601_c32_1c83_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1601_c32_1c83_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1601_c32_0788]
signal MUX_uxn_opcodes_h_l1601_c32_0788_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1601_c32_0788_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1601_c32_0788_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1601_c32_0788_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1604_c11_af95]
signal BIN_OP_EQ_uxn_opcodes_h_l1604_c11_af95_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1604_c11_af95_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1604_c11_af95_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1604_c7_9a49]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1604_c7_9a49_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1604_c7_9a49_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1604_c7_9a49_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1604_c7_9a49_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1604_c7_9a49]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1604_c7_9a49_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1604_c7_9a49_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1604_c7_9a49_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1604_c7_9a49_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1604_c7_9a49]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1604_c7_9a49_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1604_c7_9a49_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1604_c7_9a49_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1604_c7_9a49_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1604_c7_9a49]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1604_c7_9a49_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1604_c7_9a49_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1604_c7_9a49_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1604_c7_9a49_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1604_c7_9a49]
signal result_ram_addr_MUX_uxn_opcodes_h_l1604_c7_9a49_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1604_c7_9a49_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1604_c7_9a49_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1604_c7_9a49_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1604_c7_9a49]
signal result_stack_value_MUX_uxn_opcodes_h_l1604_c7_9a49_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1604_c7_9a49_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1604_c7_9a49_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1604_c7_9a49_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1604_c7_9a49]
signal tmp16_MUX_uxn_opcodes_h_l1604_c7_9a49_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1604_c7_9a49_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1604_c7_9a49_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1604_c7_9a49_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1608_c11_3fe2]
signal BIN_OP_EQ_uxn_opcodes_h_l1608_c11_3fe2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1608_c11_3fe2_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1608_c11_3fe2_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1608_c7_c69c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1608_c7_c69c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1608_c7_c69c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1608_c7_c69c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1608_c7_c69c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1608_c7_c69c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1608_c7_c69c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1608_c7_c69c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1608_c7_c69c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1608_c7_c69c_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1608_c7_c69c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1608_c7_c69c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1608_c7_c69c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1608_c7_c69c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1608_c7_c69c_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1608_c7_c69c]
signal result_ram_addr_MUX_uxn_opcodes_h_l1608_c7_c69c_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1608_c7_c69c_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1608_c7_c69c_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1608_c7_c69c_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1608_c7_c69c]
signal result_stack_value_MUX_uxn_opcodes_h_l1608_c7_c69c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1608_c7_c69c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1608_c7_c69c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1608_c7_c69c_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1608_c7_c69c]
signal tmp16_MUX_uxn_opcodes_h_l1608_c7_c69c_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1608_c7_c69c_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1608_c7_c69c_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1608_c7_c69c_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1610_c3_ff64]
signal CONST_SL_8_uxn_opcodes_h_l1610_c3_ff64_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1610_c3_ff64_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1611_c32_fb20]
signal BIN_OP_PLUS_uxn_opcodes_h_l1611_c32_fb20_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1611_c32_fb20_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1611_c32_fb20_return_output : unsigned(8 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1613_c11_392e]
signal BIN_OP_EQ_uxn_opcodes_h_l1613_c11_392e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1613_c11_392e_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1613_c11_392e_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1613_c7_af1f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1613_c7_af1f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1613_c7_af1f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1613_c7_af1f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1613_c7_af1f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1613_c7_af1f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1613_c7_af1f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1613_c7_af1f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1613_c7_af1f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1613_c7_af1f_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1613_c7_af1f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1613_c7_af1f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1613_c7_af1f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1613_c7_af1f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1613_c7_af1f_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1613_c7_af1f]
signal result_ram_addr_MUX_uxn_opcodes_h_l1613_c7_af1f_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1613_c7_af1f_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1613_c7_af1f_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1613_c7_af1f_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1613_c7_af1f]
signal result_stack_value_MUX_uxn_opcodes_h_l1613_c7_af1f_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1613_c7_af1f_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1613_c7_af1f_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1613_c7_af1f_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1613_c7_af1f]
signal tmp16_MUX_uxn_opcodes_h_l1613_c7_af1f_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1613_c7_af1f_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1613_c7_af1f_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1613_c7_af1f_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1614_c32_7134]
signal BIN_OP_PLUS_uxn_opcodes_h_l1614_c32_7134_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1614_c32_7134_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1614_c32_7134_return_output : unsigned(8 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1616_c11_4a08]
signal BIN_OP_EQ_uxn_opcodes_h_l1616_c11_4a08_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1616_c11_4a08_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1616_c11_4a08_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1616_c7_2da6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1616_c7_2da6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1616_c7_2da6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1616_c7_2da6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1616_c7_2da6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1616_c7_2da6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1616_c7_2da6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1616_c7_2da6_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1616_c7_2da6_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1616_c7_2da6_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1616_c7_2da6]
signal result_stack_value_MUX_uxn_opcodes_h_l1616_c7_2da6_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1616_c7_2da6_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1616_c7_2da6_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1616_c7_2da6_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1616_c7_2da6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1616_c7_2da6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1616_c7_2da6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1616_c7_2da6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1616_c7_2da6_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1616_c7_2da6]
signal tmp16_MUX_uxn_opcodes_h_l1616_c7_2da6_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1616_c7_2da6_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1616_c7_2da6_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1616_c7_2da6_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1617_c3_0572]
signal BIN_OP_OR_uxn_opcodes_h_l1617_c3_0572_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1617_c3_0572_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1617_c3_0572_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1622_c11_ee37]
signal BIN_OP_EQ_uxn_opcodes_h_l1622_c11_ee37_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1622_c11_ee37_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1622_c11_ee37_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1622_c7_9f59]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1622_c7_9f59_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1622_c7_9f59_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1622_c7_9f59_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1622_c7_9f59_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1622_c7_9f59]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1622_c7_9f59_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1622_c7_9f59_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1622_c7_9f59_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1622_c7_9f59_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1622_c7_9f59]
signal result_stack_value_MUX_uxn_opcodes_h_l1622_c7_9f59_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1622_c7_9f59_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1622_c7_9f59_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1622_c7_9f59_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1622_c7_9f59]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1622_c7_9f59_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1622_c7_9f59_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1622_c7_9f59_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1622_c7_9f59_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1624_c34_fa3d]
signal CONST_SR_8_uxn_opcodes_h_l1624_c34_fa3d_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1624_c34_fa3d_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1626_c11_3eb4]
signal BIN_OP_EQ_uxn_opcodes_h_l1626_c11_3eb4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1626_c11_3eb4_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1626_c11_3eb4_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1626_c7_de4d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1626_c7_de4d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1626_c7_de4d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1626_c7_de4d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1626_c7_de4d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1626_c7_de4d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_de4d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_de4d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_de4d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_de4d_return_output : unsigned(0 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CAST_TO_uint16_t_uint9_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(8 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CAST_TO_uint8_t_uint16_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(15 downto 0);
  variable return_output : unsigned(7 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_3413( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : signed;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_stack_write := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.is_sp_shift := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.ram_addr := ref_toks_6;
      base.stack_value := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1590_c6_5cf2
BIN_OP_EQ_uxn_opcodes_h_l1590_c6_5cf2 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1590_c6_5cf2_left,
BIN_OP_EQ_uxn_opcodes_h_l1590_c6_5cf2_right,
BIN_OP_EQ_uxn_opcodes_h_l1590_c6_5cf2_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1590_c1_c433
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1590_c1_c433 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1590_c1_c433_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1590_c1_c433_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1590_c1_c433_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1590_c1_c433_return_output);

-- t8_MUX_uxn_opcodes_h_l1590_c2_e3de
t8_MUX_uxn_opcodes_h_l1590_c2_e3de : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1590_c2_e3de_cond,
t8_MUX_uxn_opcodes_h_l1590_c2_e3de_iftrue,
t8_MUX_uxn_opcodes_h_l1590_c2_e3de_iffalse,
t8_MUX_uxn_opcodes_h_l1590_c2_e3de_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1590_c2_e3de
result_is_stack_write_MUX_uxn_opcodes_h_l1590_c2_e3de : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1590_c2_e3de_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1590_c2_e3de_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1590_c2_e3de_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1590_c2_e3de_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1590_c2_e3de
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1590_c2_e3de : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1590_c2_e3de_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1590_c2_e3de_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1590_c2_e3de_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1590_c2_e3de_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1590_c2_e3de
result_sp_relative_shift_MUX_uxn_opcodes_h_l1590_c2_e3de : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1590_c2_e3de_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1590_c2_e3de_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1590_c2_e3de_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1590_c2_e3de_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1590_c2_e3de
result_is_sp_shift_MUX_uxn_opcodes_h_l1590_c2_e3de : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1590_c2_e3de_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1590_c2_e3de_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1590_c2_e3de_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1590_c2_e3de_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1590_c2_e3de
result_is_opc_done_MUX_uxn_opcodes_h_l1590_c2_e3de : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1590_c2_e3de_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1590_c2_e3de_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1590_c2_e3de_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1590_c2_e3de_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1590_c2_e3de
result_ram_addr_MUX_uxn_opcodes_h_l1590_c2_e3de : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1590_c2_e3de_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1590_c2_e3de_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1590_c2_e3de_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1590_c2_e3de_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1590_c2_e3de
result_stack_value_MUX_uxn_opcodes_h_l1590_c2_e3de : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1590_c2_e3de_cond,
result_stack_value_MUX_uxn_opcodes_h_l1590_c2_e3de_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1590_c2_e3de_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1590_c2_e3de_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1590_c2_e3de
tmp16_MUX_uxn_opcodes_h_l1590_c2_e3de : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1590_c2_e3de_cond,
tmp16_MUX_uxn_opcodes_h_l1590_c2_e3de_iftrue,
tmp16_MUX_uxn_opcodes_h_l1590_c2_e3de_iffalse,
tmp16_MUX_uxn_opcodes_h_l1590_c2_e3de_return_output);

-- printf_uxn_opcodes_h_l1591_c3_52c1_uxn_opcodes_h_l1591_c3_52c1
printf_uxn_opcodes_h_l1591_c3_52c1_uxn_opcodes_h_l1591_c3_52c1 : entity work.printf_uxn_opcodes_h_l1591_c3_52c1_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1591_c3_52c1_uxn_opcodes_h_l1591_c3_52c1_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1595_c11_516a
BIN_OP_EQ_uxn_opcodes_h_l1595_c11_516a : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1595_c11_516a_left,
BIN_OP_EQ_uxn_opcodes_h_l1595_c11_516a_right,
BIN_OP_EQ_uxn_opcodes_h_l1595_c11_516a_return_output);

-- t8_MUX_uxn_opcodes_h_l1595_c7_9025
t8_MUX_uxn_opcodes_h_l1595_c7_9025 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1595_c7_9025_cond,
t8_MUX_uxn_opcodes_h_l1595_c7_9025_iftrue,
t8_MUX_uxn_opcodes_h_l1595_c7_9025_iffalse,
t8_MUX_uxn_opcodes_h_l1595_c7_9025_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1595_c7_9025
result_is_stack_write_MUX_uxn_opcodes_h_l1595_c7_9025 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1595_c7_9025_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1595_c7_9025_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1595_c7_9025_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1595_c7_9025_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1595_c7_9025
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1595_c7_9025 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1595_c7_9025_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1595_c7_9025_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1595_c7_9025_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1595_c7_9025_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1595_c7_9025
result_sp_relative_shift_MUX_uxn_opcodes_h_l1595_c7_9025 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1595_c7_9025_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1595_c7_9025_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1595_c7_9025_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1595_c7_9025_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1595_c7_9025
result_is_sp_shift_MUX_uxn_opcodes_h_l1595_c7_9025 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1595_c7_9025_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1595_c7_9025_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1595_c7_9025_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1595_c7_9025_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1595_c7_9025
result_is_opc_done_MUX_uxn_opcodes_h_l1595_c7_9025 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1595_c7_9025_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1595_c7_9025_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1595_c7_9025_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1595_c7_9025_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1595_c7_9025
result_ram_addr_MUX_uxn_opcodes_h_l1595_c7_9025 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1595_c7_9025_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1595_c7_9025_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1595_c7_9025_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1595_c7_9025_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1595_c7_9025
result_stack_value_MUX_uxn_opcodes_h_l1595_c7_9025 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1595_c7_9025_cond,
result_stack_value_MUX_uxn_opcodes_h_l1595_c7_9025_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1595_c7_9025_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1595_c7_9025_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1595_c7_9025
tmp16_MUX_uxn_opcodes_h_l1595_c7_9025 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1595_c7_9025_cond,
tmp16_MUX_uxn_opcodes_h_l1595_c7_9025_iftrue,
tmp16_MUX_uxn_opcodes_h_l1595_c7_9025_iffalse,
tmp16_MUX_uxn_opcodes_h_l1595_c7_9025_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1598_c11_ea15
BIN_OP_EQ_uxn_opcodes_h_l1598_c11_ea15 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1598_c11_ea15_left,
BIN_OP_EQ_uxn_opcodes_h_l1598_c11_ea15_right,
BIN_OP_EQ_uxn_opcodes_h_l1598_c11_ea15_return_output);

-- t8_MUX_uxn_opcodes_h_l1598_c7_e1cf
t8_MUX_uxn_opcodes_h_l1598_c7_e1cf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1598_c7_e1cf_cond,
t8_MUX_uxn_opcodes_h_l1598_c7_e1cf_iftrue,
t8_MUX_uxn_opcodes_h_l1598_c7_e1cf_iffalse,
t8_MUX_uxn_opcodes_h_l1598_c7_e1cf_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1598_c7_e1cf
result_is_stack_write_MUX_uxn_opcodes_h_l1598_c7_e1cf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1598_c7_e1cf_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1598_c7_e1cf_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1598_c7_e1cf_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1598_c7_e1cf_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1598_c7_e1cf
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1598_c7_e1cf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1598_c7_e1cf_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1598_c7_e1cf_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1598_c7_e1cf_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1598_c7_e1cf_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1598_c7_e1cf
result_sp_relative_shift_MUX_uxn_opcodes_h_l1598_c7_e1cf : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1598_c7_e1cf_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1598_c7_e1cf_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1598_c7_e1cf_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1598_c7_e1cf_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1598_c7_e1cf
result_is_sp_shift_MUX_uxn_opcodes_h_l1598_c7_e1cf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1598_c7_e1cf_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1598_c7_e1cf_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1598_c7_e1cf_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1598_c7_e1cf_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1598_c7_e1cf
result_is_opc_done_MUX_uxn_opcodes_h_l1598_c7_e1cf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1598_c7_e1cf_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1598_c7_e1cf_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1598_c7_e1cf_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1598_c7_e1cf_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1598_c7_e1cf
result_ram_addr_MUX_uxn_opcodes_h_l1598_c7_e1cf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1598_c7_e1cf_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1598_c7_e1cf_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1598_c7_e1cf_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1598_c7_e1cf_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1598_c7_e1cf
result_stack_value_MUX_uxn_opcodes_h_l1598_c7_e1cf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1598_c7_e1cf_cond,
result_stack_value_MUX_uxn_opcodes_h_l1598_c7_e1cf_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1598_c7_e1cf_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1598_c7_e1cf_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1598_c7_e1cf
tmp16_MUX_uxn_opcodes_h_l1598_c7_e1cf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1598_c7_e1cf_cond,
tmp16_MUX_uxn_opcodes_h_l1598_c7_e1cf_iftrue,
tmp16_MUX_uxn_opcodes_h_l1598_c7_e1cf_iffalse,
tmp16_MUX_uxn_opcodes_h_l1598_c7_e1cf_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1601_c32_375f
BIN_OP_AND_uxn_opcodes_h_l1601_c32_375f : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1601_c32_375f_left,
BIN_OP_AND_uxn_opcodes_h_l1601_c32_375f_right,
BIN_OP_AND_uxn_opcodes_h_l1601_c32_375f_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1601_c32_1c83
BIN_OP_GT_uxn_opcodes_h_l1601_c32_1c83 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1601_c32_1c83_left,
BIN_OP_GT_uxn_opcodes_h_l1601_c32_1c83_right,
BIN_OP_GT_uxn_opcodes_h_l1601_c32_1c83_return_output);

-- MUX_uxn_opcodes_h_l1601_c32_0788
MUX_uxn_opcodes_h_l1601_c32_0788 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1601_c32_0788_cond,
MUX_uxn_opcodes_h_l1601_c32_0788_iftrue,
MUX_uxn_opcodes_h_l1601_c32_0788_iffalse,
MUX_uxn_opcodes_h_l1601_c32_0788_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1604_c11_af95
BIN_OP_EQ_uxn_opcodes_h_l1604_c11_af95 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1604_c11_af95_left,
BIN_OP_EQ_uxn_opcodes_h_l1604_c11_af95_right,
BIN_OP_EQ_uxn_opcodes_h_l1604_c11_af95_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1604_c7_9a49
result_is_stack_write_MUX_uxn_opcodes_h_l1604_c7_9a49 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1604_c7_9a49_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1604_c7_9a49_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1604_c7_9a49_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1604_c7_9a49_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1604_c7_9a49
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1604_c7_9a49 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1604_c7_9a49_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1604_c7_9a49_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1604_c7_9a49_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1604_c7_9a49_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1604_c7_9a49
result_is_sp_shift_MUX_uxn_opcodes_h_l1604_c7_9a49 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1604_c7_9a49_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1604_c7_9a49_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1604_c7_9a49_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1604_c7_9a49_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1604_c7_9a49
result_is_opc_done_MUX_uxn_opcodes_h_l1604_c7_9a49 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1604_c7_9a49_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1604_c7_9a49_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1604_c7_9a49_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1604_c7_9a49_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1604_c7_9a49
result_ram_addr_MUX_uxn_opcodes_h_l1604_c7_9a49 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1604_c7_9a49_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1604_c7_9a49_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1604_c7_9a49_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1604_c7_9a49_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1604_c7_9a49
result_stack_value_MUX_uxn_opcodes_h_l1604_c7_9a49 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1604_c7_9a49_cond,
result_stack_value_MUX_uxn_opcodes_h_l1604_c7_9a49_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1604_c7_9a49_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1604_c7_9a49_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1604_c7_9a49
tmp16_MUX_uxn_opcodes_h_l1604_c7_9a49 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1604_c7_9a49_cond,
tmp16_MUX_uxn_opcodes_h_l1604_c7_9a49_iftrue,
tmp16_MUX_uxn_opcodes_h_l1604_c7_9a49_iffalse,
tmp16_MUX_uxn_opcodes_h_l1604_c7_9a49_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1608_c11_3fe2
BIN_OP_EQ_uxn_opcodes_h_l1608_c11_3fe2 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1608_c11_3fe2_left,
BIN_OP_EQ_uxn_opcodes_h_l1608_c11_3fe2_right,
BIN_OP_EQ_uxn_opcodes_h_l1608_c11_3fe2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1608_c7_c69c
result_is_stack_write_MUX_uxn_opcodes_h_l1608_c7_c69c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1608_c7_c69c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1608_c7_c69c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1608_c7_c69c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1608_c7_c69c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1608_c7_c69c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1608_c7_c69c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1608_c7_c69c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1608_c7_c69c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1608_c7_c69c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1608_c7_c69c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1608_c7_c69c
result_is_opc_done_MUX_uxn_opcodes_h_l1608_c7_c69c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1608_c7_c69c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1608_c7_c69c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1608_c7_c69c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1608_c7_c69c_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1608_c7_c69c
result_ram_addr_MUX_uxn_opcodes_h_l1608_c7_c69c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1608_c7_c69c_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1608_c7_c69c_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1608_c7_c69c_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1608_c7_c69c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1608_c7_c69c
result_stack_value_MUX_uxn_opcodes_h_l1608_c7_c69c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1608_c7_c69c_cond,
result_stack_value_MUX_uxn_opcodes_h_l1608_c7_c69c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1608_c7_c69c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1608_c7_c69c_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1608_c7_c69c
tmp16_MUX_uxn_opcodes_h_l1608_c7_c69c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1608_c7_c69c_cond,
tmp16_MUX_uxn_opcodes_h_l1608_c7_c69c_iftrue,
tmp16_MUX_uxn_opcodes_h_l1608_c7_c69c_iffalse,
tmp16_MUX_uxn_opcodes_h_l1608_c7_c69c_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1610_c3_ff64
CONST_SL_8_uxn_opcodes_h_l1610_c3_ff64 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1610_c3_ff64_x,
CONST_SL_8_uxn_opcodes_h_l1610_c3_ff64_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1611_c32_fb20
BIN_OP_PLUS_uxn_opcodes_h_l1611_c32_fb20 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1611_c32_fb20_left,
BIN_OP_PLUS_uxn_opcodes_h_l1611_c32_fb20_right,
BIN_OP_PLUS_uxn_opcodes_h_l1611_c32_fb20_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1613_c11_392e
BIN_OP_EQ_uxn_opcodes_h_l1613_c11_392e : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1613_c11_392e_left,
BIN_OP_EQ_uxn_opcodes_h_l1613_c11_392e_right,
BIN_OP_EQ_uxn_opcodes_h_l1613_c11_392e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1613_c7_af1f
result_is_stack_write_MUX_uxn_opcodes_h_l1613_c7_af1f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1613_c7_af1f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1613_c7_af1f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1613_c7_af1f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1613_c7_af1f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1613_c7_af1f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1613_c7_af1f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1613_c7_af1f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1613_c7_af1f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1613_c7_af1f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1613_c7_af1f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1613_c7_af1f
result_is_opc_done_MUX_uxn_opcodes_h_l1613_c7_af1f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1613_c7_af1f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1613_c7_af1f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1613_c7_af1f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1613_c7_af1f_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1613_c7_af1f
result_ram_addr_MUX_uxn_opcodes_h_l1613_c7_af1f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1613_c7_af1f_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1613_c7_af1f_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1613_c7_af1f_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1613_c7_af1f_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1613_c7_af1f
result_stack_value_MUX_uxn_opcodes_h_l1613_c7_af1f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1613_c7_af1f_cond,
result_stack_value_MUX_uxn_opcodes_h_l1613_c7_af1f_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1613_c7_af1f_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1613_c7_af1f_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1613_c7_af1f
tmp16_MUX_uxn_opcodes_h_l1613_c7_af1f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1613_c7_af1f_cond,
tmp16_MUX_uxn_opcodes_h_l1613_c7_af1f_iftrue,
tmp16_MUX_uxn_opcodes_h_l1613_c7_af1f_iffalse,
tmp16_MUX_uxn_opcodes_h_l1613_c7_af1f_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1614_c32_7134
BIN_OP_PLUS_uxn_opcodes_h_l1614_c32_7134 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1614_c32_7134_left,
BIN_OP_PLUS_uxn_opcodes_h_l1614_c32_7134_right,
BIN_OP_PLUS_uxn_opcodes_h_l1614_c32_7134_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1616_c11_4a08
BIN_OP_EQ_uxn_opcodes_h_l1616_c11_4a08 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1616_c11_4a08_left,
BIN_OP_EQ_uxn_opcodes_h_l1616_c11_4a08_right,
BIN_OP_EQ_uxn_opcodes_h_l1616_c11_4a08_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1616_c7_2da6
result_is_stack_write_MUX_uxn_opcodes_h_l1616_c7_2da6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1616_c7_2da6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1616_c7_2da6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1616_c7_2da6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1616_c7_2da6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1616_c7_2da6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1616_c7_2da6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1616_c7_2da6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1616_c7_2da6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1616_c7_2da6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1616_c7_2da6_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1616_c7_2da6
result_stack_value_MUX_uxn_opcodes_h_l1616_c7_2da6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1616_c7_2da6_cond,
result_stack_value_MUX_uxn_opcodes_h_l1616_c7_2da6_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1616_c7_2da6_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1616_c7_2da6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1616_c7_2da6
result_is_opc_done_MUX_uxn_opcodes_h_l1616_c7_2da6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1616_c7_2da6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1616_c7_2da6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1616_c7_2da6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1616_c7_2da6_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1616_c7_2da6
tmp16_MUX_uxn_opcodes_h_l1616_c7_2da6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1616_c7_2da6_cond,
tmp16_MUX_uxn_opcodes_h_l1616_c7_2da6_iftrue,
tmp16_MUX_uxn_opcodes_h_l1616_c7_2da6_iffalse,
tmp16_MUX_uxn_opcodes_h_l1616_c7_2da6_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1617_c3_0572
BIN_OP_OR_uxn_opcodes_h_l1617_c3_0572 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1617_c3_0572_left,
BIN_OP_OR_uxn_opcodes_h_l1617_c3_0572_right,
BIN_OP_OR_uxn_opcodes_h_l1617_c3_0572_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1622_c11_ee37
BIN_OP_EQ_uxn_opcodes_h_l1622_c11_ee37 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1622_c11_ee37_left,
BIN_OP_EQ_uxn_opcodes_h_l1622_c11_ee37_right,
BIN_OP_EQ_uxn_opcodes_h_l1622_c11_ee37_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1622_c7_9f59
result_is_stack_write_MUX_uxn_opcodes_h_l1622_c7_9f59 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1622_c7_9f59_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1622_c7_9f59_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1622_c7_9f59_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1622_c7_9f59_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1622_c7_9f59
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1622_c7_9f59 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1622_c7_9f59_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1622_c7_9f59_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1622_c7_9f59_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1622_c7_9f59_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1622_c7_9f59
result_stack_value_MUX_uxn_opcodes_h_l1622_c7_9f59 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1622_c7_9f59_cond,
result_stack_value_MUX_uxn_opcodes_h_l1622_c7_9f59_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1622_c7_9f59_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1622_c7_9f59_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1622_c7_9f59
result_is_opc_done_MUX_uxn_opcodes_h_l1622_c7_9f59 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1622_c7_9f59_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1622_c7_9f59_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1622_c7_9f59_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1622_c7_9f59_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1624_c34_fa3d
CONST_SR_8_uxn_opcodes_h_l1624_c34_fa3d : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1624_c34_fa3d_x,
CONST_SR_8_uxn_opcodes_h_l1624_c34_fa3d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1626_c11_3eb4
BIN_OP_EQ_uxn_opcodes_h_l1626_c11_3eb4 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1626_c11_3eb4_left,
BIN_OP_EQ_uxn_opcodes_h_l1626_c11_3eb4_right,
BIN_OP_EQ_uxn_opcodes_h_l1626_c11_3eb4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1626_c7_de4d
result_is_stack_write_MUX_uxn_opcodes_h_l1626_c7_de4d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1626_c7_de4d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1626_c7_de4d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1626_c7_de4d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1626_c7_de4d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_de4d
result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_de4d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_de4d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_de4d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_de4d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_de4d_return_output);



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
 tmp16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1590_c6_5cf2_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1590_c1_c433_return_output,
 t8_MUX_uxn_opcodes_h_l1590_c2_e3de_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1590_c2_e3de_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1590_c2_e3de_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1590_c2_e3de_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1590_c2_e3de_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1590_c2_e3de_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1590_c2_e3de_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1590_c2_e3de_return_output,
 tmp16_MUX_uxn_opcodes_h_l1590_c2_e3de_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1595_c11_516a_return_output,
 t8_MUX_uxn_opcodes_h_l1595_c7_9025_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1595_c7_9025_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1595_c7_9025_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1595_c7_9025_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1595_c7_9025_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1595_c7_9025_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1595_c7_9025_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1595_c7_9025_return_output,
 tmp16_MUX_uxn_opcodes_h_l1595_c7_9025_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1598_c11_ea15_return_output,
 t8_MUX_uxn_opcodes_h_l1598_c7_e1cf_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1598_c7_e1cf_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1598_c7_e1cf_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1598_c7_e1cf_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1598_c7_e1cf_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1598_c7_e1cf_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1598_c7_e1cf_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1598_c7_e1cf_return_output,
 tmp16_MUX_uxn_opcodes_h_l1598_c7_e1cf_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1601_c32_375f_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1601_c32_1c83_return_output,
 MUX_uxn_opcodes_h_l1601_c32_0788_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1604_c11_af95_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1604_c7_9a49_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1604_c7_9a49_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1604_c7_9a49_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1604_c7_9a49_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1604_c7_9a49_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1604_c7_9a49_return_output,
 tmp16_MUX_uxn_opcodes_h_l1604_c7_9a49_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1608_c11_3fe2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1608_c7_c69c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1608_c7_c69c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1608_c7_c69c_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1608_c7_c69c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1608_c7_c69c_return_output,
 tmp16_MUX_uxn_opcodes_h_l1608_c7_c69c_return_output,
 CONST_SL_8_uxn_opcodes_h_l1610_c3_ff64_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1611_c32_fb20_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1613_c11_392e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1613_c7_af1f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1613_c7_af1f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1613_c7_af1f_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1613_c7_af1f_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1613_c7_af1f_return_output,
 tmp16_MUX_uxn_opcodes_h_l1613_c7_af1f_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1614_c32_7134_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1616_c11_4a08_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1616_c7_2da6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1616_c7_2da6_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1616_c7_2da6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1616_c7_2da6_return_output,
 tmp16_MUX_uxn_opcodes_h_l1616_c7_2da6_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1617_c3_0572_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1622_c11_ee37_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1622_c7_9f59_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1622_c7_9f59_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1622_c7_9f59_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1622_c7_9f59_return_output,
 CONST_SR_8_uxn_opcodes_h_l1624_c34_fa3d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1626_c11_3eb4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1626_c7_de4d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_de4d_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1590_c6_5cf2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1590_c6_5cf2_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1590_c6_5cf2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1590_c1_c433_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1590_c1_c433_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1590_c1_c433_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1590_c1_c433_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1590_c2_e3de_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1590_c2_e3de_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1595_c7_9025_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1590_c2_e3de_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1590_c2_e3de_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1590_c2_e3de_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1590_c2_e3de_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1595_c7_9025_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1590_c2_e3de_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1590_c2_e3de_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1590_c2_e3de_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1592_c3_6ee5 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1590_c2_e3de_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1595_c7_9025_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1590_c2_e3de_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1590_c2_e3de_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1590_c2_e3de_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1590_c2_e3de_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1595_c7_9025_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1590_c2_e3de_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1590_c2_e3de_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1590_c2_e3de_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1590_c2_e3de_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1595_c7_9025_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1590_c2_e3de_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1590_c2_e3de_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1590_c2_e3de_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1590_c2_e3de_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1595_c7_9025_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1590_c2_e3de_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1590_c2_e3de_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1590_c2_e3de_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1590_c2_e3de_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1595_c7_9025_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1590_c2_e3de_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1590_c2_e3de_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1590_c2_e3de_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1590_c2_e3de_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1595_c7_9025_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1590_c2_e3de_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1590_c2_e3de_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1590_c2_e3de_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1590_c2_e3de_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1595_c7_9025_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1590_c2_e3de_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1590_c2_e3de_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1591_c3_52c1_uxn_opcodes_h_l1591_c3_52c1_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1595_c11_516a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1595_c11_516a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1595_c11_516a_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1595_c7_9025_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1595_c7_9025_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1598_c7_e1cf_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1595_c7_9025_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1595_c7_9025_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1595_c7_9025_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1598_c7_e1cf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1595_c7_9025_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1595_c7_9025_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1596_c3_5c7d : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1595_c7_9025_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1598_c7_e1cf_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1595_c7_9025_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1595_c7_9025_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1595_c7_9025_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1598_c7_e1cf_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1595_c7_9025_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1595_c7_9025_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1595_c7_9025_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1598_c7_e1cf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1595_c7_9025_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1595_c7_9025_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1595_c7_9025_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1598_c7_e1cf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1595_c7_9025_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1595_c7_9025_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1595_c7_9025_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1598_c7_e1cf_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1595_c7_9025_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1595_c7_9025_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1595_c7_9025_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1598_c7_e1cf_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1595_c7_9025_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1595_c7_9025_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1595_c7_9025_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1598_c7_e1cf_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1595_c7_9025_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1598_c11_ea15_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1598_c11_ea15_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1598_c11_ea15_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1598_c7_e1cf_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1598_c7_e1cf_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1598_c7_e1cf_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1598_c7_e1cf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1598_c7_e1cf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1604_c7_9a49_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1598_c7_e1cf_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1598_c7_e1cf_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1598_c7_e1cf_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1604_c7_9a49_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1598_c7_e1cf_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1598_c7_e1cf_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1598_c7_e1cf_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1598_c7_e1cf_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1598_c7_e1cf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1598_c7_e1cf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1604_c7_9a49_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1598_c7_e1cf_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1598_c7_e1cf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1598_c7_e1cf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1604_c7_9a49_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1598_c7_e1cf_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1598_c7_e1cf_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1598_c7_e1cf_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1604_c7_9a49_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1598_c7_e1cf_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1598_c7_e1cf_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1598_c7_e1cf_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1604_c7_9a49_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1598_c7_e1cf_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1598_c7_e1cf_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1598_c7_e1cf_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1604_c7_9a49_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1598_c7_e1cf_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1601_c32_0788_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1601_c32_0788_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1601_c32_0788_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1601_c32_375f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1601_c32_375f_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1601_c32_375f_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1601_c32_1c83_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1601_c32_1c83_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1601_c32_1c83_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1601_c32_0788_return_output : signed(7 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1602_c21_4986_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1604_c11_af95_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1604_c11_af95_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1604_c11_af95_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1604_c7_9a49_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1604_c7_9a49_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1608_c7_c69c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1604_c7_9a49_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1604_c7_9a49_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1604_c7_9a49_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1608_c7_c69c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1604_c7_9a49_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1604_c7_9a49_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1604_c7_9a49_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1604_c7_9a49_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1604_c7_9a49_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1604_c7_9a49_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1608_c7_c69c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1604_c7_9a49_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1604_c7_9a49_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1604_c7_9a49_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1608_c7_c69c_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1604_c7_9a49_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1604_c7_9a49_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1604_c7_9a49_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1608_c7_c69c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1604_c7_9a49_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1604_c7_9a49_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1604_c7_9a49_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1608_c7_c69c_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1604_c7_9a49_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1606_c21_e85f_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1608_c11_3fe2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1608_c11_3fe2_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1608_c11_3fe2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1608_c7_c69c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1608_c7_c69c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1613_c7_af1f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1608_c7_c69c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1608_c7_c69c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1608_c7_c69c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1613_c7_af1f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1608_c7_c69c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1608_c7_c69c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1608_c7_c69c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1613_c7_af1f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1608_c7_c69c_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1608_c7_c69c_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1608_c7_c69c_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1613_c7_af1f_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1608_c7_c69c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1608_c7_c69c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1608_c7_c69c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1613_c7_af1f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1608_c7_c69c_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1608_c7_c69c_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1608_c7_c69c_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1613_c7_af1f_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1608_c7_c69c_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1610_c3_ff64_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1610_c3_ff64_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1611_c32_fb20_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1611_c32_fb20_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1611_c32_fb20_return_output : unsigned(8 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1611_c21_f450_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1613_c11_392e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1613_c11_392e_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1613_c11_392e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1613_c7_af1f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1613_c7_af1f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1616_c7_2da6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1613_c7_af1f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1613_c7_af1f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1613_c7_af1f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1616_c7_2da6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1613_c7_af1f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1613_c7_af1f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1613_c7_af1f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1616_c7_2da6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1613_c7_af1f_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1613_c7_af1f_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1613_c7_af1f_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1613_c7_af1f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1613_c7_af1f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1613_c7_af1f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1616_c7_2da6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1613_c7_af1f_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1613_c7_af1f_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1613_c7_af1f_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1616_c7_2da6_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1613_c7_af1f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1614_c32_7134_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1614_c32_7134_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1614_c32_7134_return_output : unsigned(8 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1614_c21_3acc_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1616_c11_4a08_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1616_c11_4a08_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1616_c11_4a08_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1616_c7_2da6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1616_c7_2da6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1622_c7_9f59_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1616_c7_2da6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1616_c7_2da6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1619_c3_8cff : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1616_c7_2da6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1622_c7_9f59_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1616_c7_2da6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1616_c7_2da6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1616_c7_2da6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1622_c7_9f59_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1616_c7_2da6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1616_c7_2da6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1616_c7_2da6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1622_c7_9f59_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1616_c7_2da6_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1616_c7_2da6_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1616_c7_2da6_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1616_c7_2da6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1617_c3_0572_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1617_c3_0572_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1617_c3_0572_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1620_c24_cec8_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1622_c11_ee37_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1622_c11_ee37_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1622_c11_ee37_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1622_c7_9f59_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1622_c7_9f59_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1626_c7_de4d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1622_c7_9f59_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1622_c7_9f59_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1623_c3_4ea9 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1622_c7_9f59_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1622_c7_9f59_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1622_c7_9f59_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1622_c7_9f59_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1622_c7_9f59_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1622_c7_9f59_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1622_c7_9f59_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_de4d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1622_c7_9f59_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1624_c34_fa3d_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1624_c34_fa3d_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1624_c24_873c_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1626_c11_3eb4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1626_c11_3eb4_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1626_c11_3eb4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1626_c7_de4d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1626_c7_de4d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1626_c7_de4d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_de4d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_de4d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_de4d_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1608_l1590_l1626_l1622_l1613_l1598_l1604_l1595_DUPLICATE_02b2_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1598_l1590_l1595_DUPLICATE_644d_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1590_l1604_l1595_DUPLICATE_48ba_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1613_l1590_l1595_DUPLICATE_a5a3_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1608_l1590_l1622_l1613_l1598_l1604_l1595_DUPLICATE_f624_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1608_l1626_l1622_l1613_l1616_l1598_l1604_l1595_DUPLICATE_c8e9_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1608_l1622_l1613_l1598_l1604_DUPLICATE_1901_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1609_l1617_DUPLICATE_4d4c_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3413_uxn_opcodes_h_l1631_l1585_DUPLICATE_0b6d_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_tmp16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_tmp16 := tmp16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_GT_uxn_opcodes_h_l1601_c32_1c83_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1596_c3_5c7d := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1595_c7_9025_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1596_c3_5c7d;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1611_c32_fb20_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1598_c11_ea15_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1619_c3_8cff := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1616_c7_2da6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1619_c3_8cff;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1604_c11_af95_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1613_c11_392e_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1626_c11_3eb4_right := to_unsigned(8, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1622_c11_ee37_right := to_unsigned(7, 3);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1614_c32_7134_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1595_c11_516a_right := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1604_c7_9a49_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1590_c2_e3de_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1616_c7_2da6_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1626_c7_de4d_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1601_c32_0788_iftrue := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_MUX_uxn_opcodes_h_l1601_c32_0788_iffalse := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1608_c11_3fe2_right := to_unsigned(4, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_de4d_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1590_c1_c433_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1616_c11_4a08_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1592_c3_6ee5 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1590_c2_e3de_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1592_c3_6ee5;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1623_c3_4ea9 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1622_c7_9f59_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1623_c3_4ea9;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1598_c7_e1cf_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1590_c6_5cf2_right := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l1601_c32_375f_right := to_unsigned(128, 8);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1590_c1_c433_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1601_c32_375f_left := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1590_c6_5cf2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1595_c11_516a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1598_c11_ea15_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1604_c11_af95_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1608_c11_3fe2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1613_c11_392e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1616_c11_4a08_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1622_c11_ee37_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1626_c11_3eb4_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l1598_c7_e1cf_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1611_c32_fb20_left := t8;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1614_c32_7134_left := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1590_c2_e3de_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1595_c7_9025_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1598_c7_e1cf_iffalse := t8;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1617_c3_0572_left := tmp16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1624_c34_fa3d_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1590_c2_e3de_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1595_c7_9025_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1598_c7_e1cf_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1604_c7_9a49_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1613_c7_af1f_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1616_c7_2da6_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l1626_c11_3eb4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1626_c11_3eb4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1626_c11_3eb4_left;
     BIN_OP_EQ_uxn_opcodes_h_l1626_c11_3eb4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1626_c11_3eb4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1626_c11_3eb4_return_output := BIN_OP_EQ_uxn_opcodes_h_l1626_c11_3eb4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1616_c11_4a08] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1616_c11_4a08_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1616_c11_4a08_left;
     BIN_OP_EQ_uxn_opcodes_h_l1616_c11_4a08_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1616_c11_4a08_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1616_c11_4a08_return_output := BIN_OP_EQ_uxn_opcodes_h_l1616_c11_4a08_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1613_l1590_l1595_DUPLICATE_a5a3 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1613_l1590_l1595_DUPLICATE_a5a3_return_output := result.ram_addr;

     -- CAST_TO_uint16_t[uxn_opcodes_h_l1606_c21_e85f] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1606_c21_e85f_return_output := CAST_TO_uint16_t_uint8_t(
     t8);

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1609_l1617_DUPLICATE_4d4c LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1609_l1617_DUPLICATE_4d4c_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- BIN_OP_AND[uxn_opcodes_h_l1601_c32_375f] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1601_c32_375f_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1601_c32_375f_left;
     BIN_OP_AND_uxn_opcodes_h_l1601_c32_375f_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1601_c32_375f_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1601_c32_375f_return_output := BIN_OP_AND_uxn_opcodes_h_l1601_c32_375f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1595_c11_516a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1595_c11_516a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1595_c11_516a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1595_c11_516a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1595_c11_516a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1595_c11_516a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1595_c11_516a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1608_c11_3fe2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1608_c11_3fe2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1608_c11_3fe2_left;
     BIN_OP_EQ_uxn_opcodes_h_l1608_c11_3fe2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1608_c11_3fe2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1608_c11_3fe2_return_output := BIN_OP_EQ_uxn_opcodes_h_l1608_c11_3fe2_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l1624_c34_fa3d] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1624_c34_fa3d_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1624_c34_fa3d_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1624_c34_fa3d_return_output := CONST_SR_8_uxn_opcodes_h_l1624_c34_fa3d_return_output;

     -- CAST_TO_uint16_t[uxn_opcodes_h_l1602_c21_4986] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1602_c21_4986_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_PLUS[uxn_opcodes_h_l1614_c32_7134] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1614_c32_7134_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1614_c32_7134_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1614_c32_7134_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1614_c32_7134_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1614_c32_7134_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1614_c32_7134_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1598_l1590_l1595_DUPLICATE_644d LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1598_l1590_l1595_DUPLICATE_644d_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1613_c11_392e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1613_c11_392e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1613_c11_392e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1613_c11_392e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1613_c11_392e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1613_c11_392e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1613_c11_392e_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1608_l1590_l1626_l1622_l1613_l1598_l1604_l1595_DUPLICATE_02b2 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1608_l1590_l1626_l1622_l1613_l1598_l1604_l1595_DUPLICATE_02b2_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1604_c11_af95] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1604_c11_af95_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1604_c11_af95_left;
     BIN_OP_EQ_uxn_opcodes_h_l1604_c11_af95_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1604_c11_af95_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1604_c11_af95_return_output := BIN_OP_EQ_uxn_opcodes_h_l1604_c11_af95_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1608_l1622_l1613_l1598_l1604_DUPLICATE_1901 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1608_l1622_l1613_l1598_l1604_DUPLICATE_1901_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1622_c11_ee37] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1622_c11_ee37_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1622_c11_ee37_left;
     BIN_OP_EQ_uxn_opcodes_h_l1622_c11_ee37_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1622_c11_ee37_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1622_c11_ee37_return_output := BIN_OP_EQ_uxn_opcodes_h_l1622_c11_ee37_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1611_c32_fb20] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1611_c32_fb20_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1611_c32_fb20_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1611_c32_fb20_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1611_c32_fb20_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1611_c32_fb20_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1611_c32_fb20_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1608_l1626_l1622_l1613_l1616_l1598_l1604_l1595_DUPLICATE_c8e9 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1608_l1626_l1622_l1613_l1616_l1598_l1604_l1595_DUPLICATE_c8e9_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1608_l1590_l1622_l1613_l1598_l1604_l1595_DUPLICATE_f624 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1608_l1590_l1622_l1613_l1598_l1604_l1595_DUPLICATE_f624_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1590_c6_5cf2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1590_c6_5cf2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1590_c6_5cf2_left;
     BIN_OP_EQ_uxn_opcodes_h_l1590_c6_5cf2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1590_c6_5cf2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1590_c6_5cf2_return_output := BIN_OP_EQ_uxn_opcodes_h_l1590_c6_5cf2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1598_c11_ea15] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1598_c11_ea15_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1598_c11_ea15_left;
     BIN_OP_EQ_uxn_opcodes_h_l1598_c11_ea15_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1598_c11_ea15_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1598_c11_ea15_return_output := BIN_OP_EQ_uxn_opcodes_h_l1598_c11_ea15_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1590_l1604_l1595_DUPLICATE_48ba LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1590_l1604_l1595_DUPLICATE_48ba_return_output := result.is_sp_shift;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1601_c32_1c83_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1601_c32_375f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1590_c1_c433_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1590_c6_5cf2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1590_c2_e3de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1590_c6_5cf2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1590_c2_e3de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1590_c6_5cf2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1590_c2_e3de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1590_c6_5cf2_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1590_c2_e3de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1590_c6_5cf2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1590_c2_e3de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1590_c6_5cf2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1590_c2_e3de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1590_c6_5cf2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1590_c2_e3de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1590_c6_5cf2_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1590_c2_e3de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1590_c6_5cf2_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1590_c2_e3de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1590_c6_5cf2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1595_c7_9025_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1595_c11_516a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1595_c7_9025_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1595_c11_516a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1595_c7_9025_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1595_c11_516a_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1595_c7_9025_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1595_c11_516a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1595_c7_9025_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1595_c11_516a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1595_c7_9025_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1595_c11_516a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1595_c7_9025_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1595_c11_516a_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1595_c7_9025_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1595_c11_516a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1595_c7_9025_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1595_c11_516a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1598_c7_e1cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1598_c11_ea15_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1598_c7_e1cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1598_c11_ea15_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1598_c7_e1cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1598_c11_ea15_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1598_c7_e1cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1598_c11_ea15_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1598_c7_e1cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1598_c11_ea15_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1598_c7_e1cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1598_c11_ea15_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1598_c7_e1cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1598_c11_ea15_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1598_c7_e1cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1598_c11_ea15_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1598_c7_e1cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1598_c11_ea15_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1604_c7_9a49_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1604_c11_af95_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1604_c7_9a49_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1604_c11_af95_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1604_c7_9a49_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1604_c11_af95_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1604_c7_9a49_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1604_c11_af95_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1604_c7_9a49_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1604_c11_af95_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1604_c7_9a49_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1604_c11_af95_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1604_c7_9a49_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1604_c11_af95_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1608_c7_c69c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1608_c11_3fe2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1608_c7_c69c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1608_c11_3fe2_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1608_c7_c69c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1608_c11_3fe2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1608_c7_c69c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1608_c11_3fe2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1608_c7_c69c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1608_c11_3fe2_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1608_c7_c69c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1608_c11_3fe2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1613_c7_af1f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1613_c11_392e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1613_c7_af1f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1613_c11_392e_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1613_c7_af1f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1613_c11_392e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1613_c7_af1f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1613_c11_392e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1613_c7_af1f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1613_c11_392e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1613_c7_af1f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1613_c11_392e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1616_c7_2da6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1616_c11_4a08_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1616_c7_2da6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1616_c11_4a08_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1616_c7_2da6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1616_c11_4a08_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1616_c7_2da6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1616_c11_4a08_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1616_c7_2da6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1616_c11_4a08_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1622_c7_9f59_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1622_c11_ee37_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1622_c7_9f59_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1622_c11_ee37_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1622_c7_9f59_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1622_c11_ee37_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1622_c7_9f59_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1622_c11_ee37_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_de4d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1626_c11_3eb4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1626_c7_de4d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1626_c11_3eb4_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1598_c7_e1cf_iftrue := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1602_c21_4986_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1604_c7_9a49_iftrue := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1606_c21_e85f_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1617_c3_0572_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1609_l1617_DUPLICATE_4d4c_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1610_c3_ff64_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1609_l1617_DUPLICATE_4d4c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1590_c2_e3de_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1598_l1590_l1595_DUPLICATE_644d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1595_c7_9025_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1598_l1590_l1595_DUPLICATE_644d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1598_c7_e1cf_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1598_l1590_l1595_DUPLICATE_644d_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1590_c2_e3de_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1613_l1590_l1595_DUPLICATE_a5a3_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1595_c7_9025_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1613_l1590_l1595_DUPLICATE_a5a3_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1613_c7_af1f_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1613_l1590_l1595_DUPLICATE_a5a3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1595_c7_9025_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1608_l1626_l1622_l1613_l1616_l1598_l1604_l1595_DUPLICATE_c8e9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1598_c7_e1cf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1608_l1626_l1622_l1613_l1616_l1598_l1604_l1595_DUPLICATE_c8e9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1604_c7_9a49_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1608_l1626_l1622_l1613_l1616_l1598_l1604_l1595_DUPLICATE_c8e9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1608_c7_c69c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1608_l1626_l1622_l1613_l1616_l1598_l1604_l1595_DUPLICATE_c8e9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1613_c7_af1f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1608_l1626_l1622_l1613_l1616_l1598_l1604_l1595_DUPLICATE_c8e9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1616_c7_2da6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1608_l1626_l1622_l1613_l1616_l1598_l1604_l1595_DUPLICATE_c8e9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1622_c7_9f59_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1608_l1626_l1622_l1613_l1616_l1598_l1604_l1595_DUPLICATE_c8e9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_de4d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1608_l1626_l1622_l1613_l1616_l1598_l1604_l1595_DUPLICATE_c8e9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1590_c2_e3de_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1590_l1604_l1595_DUPLICATE_48ba_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1595_c7_9025_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1590_l1604_l1595_DUPLICATE_48ba_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1604_c7_9a49_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1590_l1604_l1595_DUPLICATE_48ba_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1590_c2_e3de_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1608_l1590_l1626_l1622_l1613_l1598_l1604_l1595_DUPLICATE_02b2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1595_c7_9025_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1608_l1590_l1626_l1622_l1613_l1598_l1604_l1595_DUPLICATE_02b2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1598_c7_e1cf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1608_l1590_l1626_l1622_l1613_l1598_l1604_l1595_DUPLICATE_02b2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1604_c7_9a49_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1608_l1590_l1626_l1622_l1613_l1598_l1604_l1595_DUPLICATE_02b2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1608_c7_c69c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1608_l1590_l1626_l1622_l1613_l1598_l1604_l1595_DUPLICATE_02b2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1613_c7_af1f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1608_l1590_l1626_l1622_l1613_l1598_l1604_l1595_DUPLICATE_02b2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1622_c7_9f59_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1608_l1590_l1626_l1622_l1613_l1598_l1604_l1595_DUPLICATE_02b2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1626_c7_de4d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1608_l1590_l1626_l1622_l1613_l1598_l1604_l1595_DUPLICATE_02b2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1598_c7_e1cf_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1608_l1622_l1613_l1598_l1604_DUPLICATE_1901_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1604_c7_9a49_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1608_l1622_l1613_l1598_l1604_DUPLICATE_1901_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1608_c7_c69c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1608_l1622_l1613_l1598_l1604_DUPLICATE_1901_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1613_c7_af1f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1608_l1622_l1613_l1598_l1604_DUPLICATE_1901_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1622_c7_9f59_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1608_l1622_l1613_l1598_l1604_DUPLICATE_1901_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1590_c2_e3de_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1608_l1590_l1622_l1613_l1598_l1604_l1595_DUPLICATE_f624_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1595_c7_9025_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1608_l1590_l1622_l1613_l1598_l1604_l1595_DUPLICATE_f624_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1598_c7_e1cf_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1608_l1590_l1622_l1613_l1598_l1604_l1595_DUPLICATE_f624_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1604_c7_9a49_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1608_l1590_l1622_l1613_l1598_l1604_l1595_DUPLICATE_f624_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1608_c7_c69c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1608_l1590_l1622_l1613_l1598_l1604_l1595_DUPLICATE_f624_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1613_c7_af1f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1608_l1590_l1622_l1613_l1598_l1604_l1595_DUPLICATE_f624_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1622_c7_9f59_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1608_l1590_l1622_l1613_l1598_l1604_l1595_DUPLICATE_f624_return_output;
     -- CAST_TO_uint8_t[uxn_opcodes_h_l1624_c24_873c] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1624_c24_873c_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1624_c34_fa3d_return_output);

     -- BIN_OP_GT[uxn_opcodes_h_l1601_c32_1c83] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1601_c32_1c83_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1601_c32_1c83_left;
     BIN_OP_GT_uxn_opcodes_h_l1601_c32_1c83_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1601_c32_1c83_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1601_c32_1c83_return_output := BIN_OP_GT_uxn_opcodes_h_l1601_c32_1c83_return_output;

     -- CAST_TO_uint16_t[uxn_opcodes_h_l1611_c21_f450] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1611_c21_f450_return_output := CAST_TO_uint16_t_uint9_t(
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1611_c32_fb20_return_output);

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1622_c7_9f59] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1622_c7_9f59_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1622_c7_9f59_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1622_c7_9f59_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1622_c7_9f59_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1622_c7_9f59_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1622_c7_9f59_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1622_c7_9f59_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1622_c7_9f59_return_output;

     -- CAST_TO_uint16_t[uxn_opcodes_h_l1614_c21_3acc] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1614_c21_3acc_return_output := CAST_TO_uint16_t_uint9_t(
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1614_c32_7134_return_output);

     -- BIN_OP_OR[uxn_opcodes_h_l1617_c3_0572] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1617_c3_0572_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1617_c3_0572_left;
     BIN_OP_OR_uxn_opcodes_h_l1617_c3_0572_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1617_c3_0572_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1617_c3_0572_return_output := BIN_OP_OR_uxn_opcodes_h_l1617_c3_0572_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1604_c7_9a49] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1604_c7_9a49_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1604_c7_9a49_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1604_c7_9a49_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1604_c7_9a49_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1604_c7_9a49_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1604_c7_9a49_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1604_c7_9a49_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1604_c7_9a49_return_output;

     -- t8_MUX[uxn_opcodes_h_l1598_c7_e1cf] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1598_c7_e1cf_cond <= VAR_t8_MUX_uxn_opcodes_h_l1598_c7_e1cf_cond;
     t8_MUX_uxn_opcodes_h_l1598_c7_e1cf_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1598_c7_e1cf_iftrue;
     t8_MUX_uxn_opcodes_h_l1598_c7_e1cf_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1598_c7_e1cf_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1598_c7_e1cf_return_output := t8_MUX_uxn_opcodes_h_l1598_c7_e1cf_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1626_c7_de4d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_de4d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_de4d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_de4d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_de4d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_de4d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_de4d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_de4d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_de4d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1626_c7_de4d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1626_c7_de4d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1626_c7_de4d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1626_c7_de4d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1626_c7_de4d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1626_c7_de4d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1626_c7_de4d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1626_c7_de4d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1626_c7_de4d_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1590_c1_c433] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1590_c1_c433_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1590_c1_c433_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1590_c1_c433_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1590_c1_c433_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1590_c1_c433_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1590_c1_c433_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1590_c1_c433_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1590_c1_c433_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l1610_c3_ff64] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1610_c3_ff64_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1610_c3_ff64_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1610_c3_ff64_return_output := CONST_SL_8_uxn_opcodes_h_l1610_c3_ff64_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1601_c32_0788_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1601_c32_1c83_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1616_c7_2da6_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1617_c3_0572_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1608_c7_c69c_iftrue := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1611_c21_f450_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1613_c7_af1f_iftrue := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1614_c21_3acc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1622_c7_9f59_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1624_c24_873c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1608_c7_c69c_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1610_c3_ff64_return_output;
     VAR_printf_uxn_opcodes_h_l1591_c3_52c1_uxn_opcodes_h_l1591_c3_52c1_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1590_c1_c433_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1622_c7_9f59_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_de4d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1598_c7_e1cf_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1604_c7_9a49_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1622_c7_9f59_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1626_c7_de4d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1616_c7_2da6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1622_c7_9f59_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1595_c7_9025_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1598_c7_e1cf_return_output;
     -- CAST_TO_uint8_t[uxn_opcodes_h_l1620_c24_cec8] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1620_c24_cec8_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_OR_uxn_opcodes_h_l1617_c3_0572_return_output);

     -- MUX[uxn_opcodes_h_l1601_c32_0788] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1601_c32_0788_cond <= VAR_MUX_uxn_opcodes_h_l1601_c32_0788_cond;
     MUX_uxn_opcodes_h_l1601_c32_0788_iftrue <= VAR_MUX_uxn_opcodes_h_l1601_c32_0788_iftrue;
     MUX_uxn_opcodes_h_l1601_c32_0788_iffalse <= VAR_MUX_uxn_opcodes_h_l1601_c32_0788_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1601_c32_0788_return_output := MUX_uxn_opcodes_h_l1601_c32_0788_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1622_c7_9f59] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1622_c7_9f59_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1622_c7_9f59_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1622_c7_9f59_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1622_c7_9f59_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1622_c7_9f59_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1622_c7_9f59_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1622_c7_9f59_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1622_c7_9f59_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1598_c7_e1cf] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1598_c7_e1cf_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1598_c7_e1cf_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1598_c7_e1cf_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1598_c7_e1cf_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1598_c7_e1cf_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1598_c7_e1cf_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1598_c7_e1cf_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1598_c7_e1cf_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1622_c7_9f59] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1622_c7_9f59_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1622_c7_9f59_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1622_c7_9f59_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1622_c7_9f59_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1622_c7_9f59_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1622_c7_9f59_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1622_c7_9f59_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1622_c7_9f59_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1613_c7_af1f] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1613_c7_af1f_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1613_c7_af1f_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1613_c7_af1f_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1613_c7_af1f_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1613_c7_af1f_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1613_c7_af1f_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1613_c7_af1f_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1613_c7_af1f_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1616_c7_2da6] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1616_c7_2da6_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1616_c7_2da6_cond;
     tmp16_MUX_uxn_opcodes_h_l1616_c7_2da6_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1616_c7_2da6_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1616_c7_2da6_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1616_c7_2da6_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1616_c7_2da6_return_output := tmp16_MUX_uxn_opcodes_h_l1616_c7_2da6_return_output;

     -- t8_MUX[uxn_opcodes_h_l1595_c7_9025] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1595_c7_9025_cond <= VAR_t8_MUX_uxn_opcodes_h_l1595_c7_9025_cond;
     t8_MUX_uxn_opcodes_h_l1595_c7_9025_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1595_c7_9025_iftrue;
     t8_MUX_uxn_opcodes_h_l1595_c7_9025_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1595_c7_9025_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1595_c7_9025_return_output := t8_MUX_uxn_opcodes_h_l1595_c7_9025_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1616_c7_2da6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1616_c7_2da6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1616_c7_2da6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1616_c7_2da6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1616_c7_2da6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1616_c7_2da6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1616_c7_2da6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1616_c7_2da6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1616_c7_2da6_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1622_c7_9f59] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1622_c7_9f59_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1622_c7_9f59_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1622_c7_9f59_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1622_c7_9f59_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1622_c7_9f59_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1622_c7_9f59_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1622_c7_9f59_return_output := result_stack_value_MUX_uxn_opcodes_h_l1622_c7_9f59_return_output;

     -- printf_uxn_opcodes_h_l1591_c3_52c1[uxn_opcodes_h_l1591_c3_52c1] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1591_c3_52c1_uxn_opcodes_h_l1591_c3_52c1_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1591_c3_52c1_uxn_opcodes_h_l1591_c3_52c1_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- Submodule level 3
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1616_c7_2da6_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1620_c24_cec8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1598_c7_e1cf_iftrue := VAR_MUX_uxn_opcodes_h_l1601_c32_0788_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1616_c7_2da6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1622_c7_9f59_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1595_c7_9025_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1598_c7_e1cf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1616_c7_2da6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1622_c7_9f59_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1608_c7_c69c_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1613_c7_af1f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1613_c7_af1f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1616_c7_2da6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1616_c7_2da6_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1622_c7_9f59_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1590_c2_e3de_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1595_c7_9025_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1613_c7_af1f_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1616_c7_2da6_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1598_c7_e1cf] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1598_c7_e1cf_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1598_c7_e1cf_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1598_c7_e1cf_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1598_c7_e1cf_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1598_c7_e1cf_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1598_c7_e1cf_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1598_c7_e1cf_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1598_c7_e1cf_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1595_c7_9025] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1595_c7_9025_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1595_c7_9025_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1595_c7_9025_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1595_c7_9025_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1595_c7_9025_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1595_c7_9025_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1595_c7_9025_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1595_c7_9025_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1616_c7_2da6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1616_c7_2da6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1616_c7_2da6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1616_c7_2da6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1616_c7_2da6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1616_c7_2da6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1616_c7_2da6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1616_c7_2da6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1616_c7_2da6_return_output;

     -- t8_MUX[uxn_opcodes_h_l1590_c2_e3de] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1590_c2_e3de_cond <= VAR_t8_MUX_uxn_opcodes_h_l1590_c2_e3de_cond;
     t8_MUX_uxn_opcodes_h_l1590_c2_e3de_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1590_c2_e3de_iftrue;
     t8_MUX_uxn_opcodes_h_l1590_c2_e3de_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1590_c2_e3de_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1590_c2_e3de_return_output := t8_MUX_uxn_opcodes_h_l1590_c2_e3de_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1608_c7_c69c] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1608_c7_c69c_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1608_c7_c69c_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1608_c7_c69c_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1608_c7_c69c_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1608_c7_c69c_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1608_c7_c69c_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1608_c7_c69c_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1608_c7_c69c_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1616_c7_2da6] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1616_c7_2da6_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1616_c7_2da6_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1616_c7_2da6_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1616_c7_2da6_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1616_c7_2da6_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1616_c7_2da6_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1616_c7_2da6_return_output := result_stack_value_MUX_uxn_opcodes_h_l1616_c7_2da6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1616_c7_2da6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1616_c7_2da6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1616_c7_2da6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1616_c7_2da6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1616_c7_2da6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1616_c7_2da6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1616_c7_2da6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1616_c7_2da6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1616_c7_2da6_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1613_c7_af1f] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1613_c7_af1f_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1613_c7_af1f_cond;
     tmp16_MUX_uxn_opcodes_h_l1613_c7_af1f_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1613_c7_af1f_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1613_c7_af1f_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1613_c7_af1f_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1613_c7_af1f_return_output := tmp16_MUX_uxn_opcodes_h_l1613_c7_af1f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1613_c7_af1f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1613_c7_af1f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1613_c7_af1f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1613_c7_af1f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1613_c7_af1f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1613_c7_af1f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1613_c7_af1f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1613_c7_af1f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1613_c7_af1f_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1613_c7_af1f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1616_c7_2da6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1590_c2_e3de_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1595_c7_9025_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1613_c7_af1f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1616_c7_2da6_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1604_c7_9a49_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1608_c7_c69c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1595_c7_9025_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1598_c7_e1cf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1608_c7_c69c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1613_c7_af1f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1613_c7_af1f_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1616_c7_2da6_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1590_c2_e3de_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1608_c7_c69c_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1613_c7_af1f_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1613_c7_af1f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1613_c7_af1f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1613_c7_af1f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1613_c7_af1f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1613_c7_af1f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1613_c7_af1f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1613_c7_af1f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1613_c7_af1f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1613_c7_af1f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1595_c7_9025] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1595_c7_9025_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1595_c7_9025_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1595_c7_9025_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1595_c7_9025_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1595_c7_9025_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1595_c7_9025_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1595_c7_9025_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1595_c7_9025_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1608_c7_c69c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1608_c7_c69c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1608_c7_c69c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1608_c7_c69c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1608_c7_c69c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1608_c7_c69c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1608_c7_c69c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1608_c7_c69c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1608_c7_c69c_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1613_c7_af1f] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1613_c7_af1f_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1613_c7_af1f_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1613_c7_af1f_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1613_c7_af1f_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1613_c7_af1f_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1613_c7_af1f_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1613_c7_af1f_return_output := result_stack_value_MUX_uxn_opcodes_h_l1613_c7_af1f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1613_c7_af1f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1613_c7_af1f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1613_c7_af1f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1613_c7_af1f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1613_c7_af1f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1613_c7_af1f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1613_c7_af1f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1613_c7_af1f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1613_c7_af1f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1590_c2_e3de] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1590_c2_e3de_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1590_c2_e3de_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1590_c2_e3de_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1590_c2_e3de_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1590_c2_e3de_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1590_c2_e3de_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1590_c2_e3de_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1590_c2_e3de_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1608_c7_c69c] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1608_c7_c69c_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1608_c7_c69c_cond;
     tmp16_MUX_uxn_opcodes_h_l1608_c7_c69c_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1608_c7_c69c_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1608_c7_c69c_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1608_c7_c69c_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1608_c7_c69c_return_output := tmp16_MUX_uxn_opcodes_h_l1608_c7_c69c_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1604_c7_9a49] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1604_c7_9a49_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1604_c7_9a49_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1604_c7_9a49_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1604_c7_9a49_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1604_c7_9a49_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1604_c7_9a49_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1604_c7_9a49_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1604_c7_9a49_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1608_c7_c69c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1613_c7_af1f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1608_c7_c69c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1613_c7_af1f_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1598_c7_e1cf_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1604_c7_9a49_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1590_c2_e3de_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1595_c7_9025_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1604_c7_9a49_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1608_c7_c69c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1608_c7_c69c_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1613_c7_af1f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1604_c7_9a49_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1608_c7_c69c_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1608_c7_c69c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1608_c7_c69c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1608_c7_c69c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1608_c7_c69c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1608_c7_c69c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1608_c7_c69c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1608_c7_c69c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1608_c7_c69c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1608_c7_c69c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1590_c2_e3de] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1590_c2_e3de_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1590_c2_e3de_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1590_c2_e3de_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1590_c2_e3de_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1590_c2_e3de_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1590_c2_e3de_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1590_c2_e3de_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1590_c2_e3de_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1608_c7_c69c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1608_c7_c69c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1608_c7_c69c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1608_c7_c69c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1608_c7_c69c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1608_c7_c69c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1608_c7_c69c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1608_c7_c69c_return_output := result_stack_value_MUX_uxn_opcodes_h_l1608_c7_c69c_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1604_c7_9a49] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1604_c7_9a49_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1604_c7_9a49_cond;
     tmp16_MUX_uxn_opcodes_h_l1604_c7_9a49_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1604_c7_9a49_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1604_c7_9a49_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1604_c7_9a49_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1604_c7_9a49_return_output := tmp16_MUX_uxn_opcodes_h_l1604_c7_9a49_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1608_c7_c69c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1608_c7_c69c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1608_c7_c69c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1608_c7_c69c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1608_c7_c69c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1608_c7_c69c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1608_c7_c69c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1608_c7_c69c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1608_c7_c69c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1604_c7_9a49] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1604_c7_9a49_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1604_c7_9a49_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1604_c7_9a49_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1604_c7_9a49_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1604_c7_9a49_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1604_c7_9a49_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1604_c7_9a49_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1604_c7_9a49_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1598_c7_e1cf] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1598_c7_e1cf_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1598_c7_e1cf_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1598_c7_e1cf_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1598_c7_e1cf_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1598_c7_e1cf_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1598_c7_e1cf_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1598_c7_e1cf_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1598_c7_e1cf_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1604_c7_9a49_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1608_c7_c69c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1604_c7_9a49_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1608_c7_c69c_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1595_c7_9025_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1598_c7_e1cf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1598_c7_e1cf_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1604_c7_9a49_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1604_c7_9a49_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1608_c7_c69c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1598_c7_e1cf_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1604_c7_9a49_return_output;
     -- result_ram_addr_MUX[uxn_opcodes_h_l1595_c7_9025] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1595_c7_9025_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1595_c7_9025_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1595_c7_9025_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1595_c7_9025_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1595_c7_9025_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1595_c7_9025_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1595_c7_9025_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1595_c7_9025_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1598_c7_e1cf] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1598_c7_e1cf_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1598_c7_e1cf_cond;
     tmp16_MUX_uxn_opcodes_h_l1598_c7_e1cf_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1598_c7_e1cf_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1598_c7_e1cf_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1598_c7_e1cf_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1598_c7_e1cf_return_output := tmp16_MUX_uxn_opcodes_h_l1598_c7_e1cf_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1604_c7_9a49] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1604_c7_9a49_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1604_c7_9a49_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1604_c7_9a49_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1604_c7_9a49_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1604_c7_9a49_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1604_c7_9a49_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1604_c7_9a49_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1604_c7_9a49_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1604_c7_9a49] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1604_c7_9a49_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1604_c7_9a49_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1604_c7_9a49_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1604_c7_9a49_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1604_c7_9a49_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1604_c7_9a49_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1604_c7_9a49_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1604_c7_9a49_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1598_c7_e1cf] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1598_c7_e1cf_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1598_c7_e1cf_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1598_c7_e1cf_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1598_c7_e1cf_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1598_c7_e1cf_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1598_c7_e1cf_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1598_c7_e1cf_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1598_c7_e1cf_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1604_c7_9a49] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1604_c7_9a49_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1604_c7_9a49_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1604_c7_9a49_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1604_c7_9a49_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1604_c7_9a49_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1604_c7_9a49_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1604_c7_9a49_return_output := result_stack_value_MUX_uxn_opcodes_h_l1604_c7_9a49_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1598_c7_e1cf_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1604_c7_9a49_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1598_c7_e1cf_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1604_c7_9a49_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1590_c2_e3de_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1595_c7_9025_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1595_c7_9025_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1598_c7_e1cf_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1598_c7_e1cf_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1604_c7_9a49_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1595_c7_9025_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1598_c7_e1cf_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1598_c7_e1cf] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1598_c7_e1cf_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1598_c7_e1cf_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1598_c7_e1cf_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1598_c7_e1cf_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1598_c7_e1cf_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1598_c7_e1cf_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1598_c7_e1cf_return_output := result_stack_value_MUX_uxn_opcodes_h_l1598_c7_e1cf_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1598_c7_e1cf] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1598_c7_e1cf_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1598_c7_e1cf_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1598_c7_e1cf_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1598_c7_e1cf_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1598_c7_e1cf_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1598_c7_e1cf_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1598_c7_e1cf_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1598_c7_e1cf_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1598_c7_e1cf] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1598_c7_e1cf_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1598_c7_e1cf_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1598_c7_e1cf_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1598_c7_e1cf_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1598_c7_e1cf_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1598_c7_e1cf_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1598_c7_e1cf_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1598_c7_e1cf_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1595_c7_9025] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1595_c7_9025_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1595_c7_9025_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1595_c7_9025_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1595_c7_9025_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1595_c7_9025_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1595_c7_9025_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1595_c7_9025_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1595_c7_9025_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1595_c7_9025] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1595_c7_9025_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1595_c7_9025_cond;
     tmp16_MUX_uxn_opcodes_h_l1595_c7_9025_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1595_c7_9025_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1595_c7_9025_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1595_c7_9025_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1595_c7_9025_return_output := tmp16_MUX_uxn_opcodes_h_l1595_c7_9025_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1590_c2_e3de] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1590_c2_e3de_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1590_c2_e3de_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1590_c2_e3de_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1590_c2_e3de_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1590_c2_e3de_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1590_c2_e3de_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1590_c2_e3de_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1590_c2_e3de_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1595_c7_9025_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1598_c7_e1cf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1595_c7_9025_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1598_c7_e1cf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1590_c2_e3de_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1595_c7_9025_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1595_c7_9025_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1598_c7_e1cf_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1590_c2_e3de_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1595_c7_9025_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1595_c7_9025] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1595_c7_9025_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1595_c7_9025_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1595_c7_9025_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1595_c7_9025_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1595_c7_9025_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1595_c7_9025_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1595_c7_9025_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1595_c7_9025_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1595_c7_9025] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1595_c7_9025_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1595_c7_9025_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1595_c7_9025_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1595_c7_9025_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1595_c7_9025_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1595_c7_9025_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1595_c7_9025_return_output := result_stack_value_MUX_uxn_opcodes_h_l1595_c7_9025_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1590_c2_e3de] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1590_c2_e3de_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1590_c2_e3de_cond;
     tmp16_MUX_uxn_opcodes_h_l1590_c2_e3de_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1590_c2_e3de_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1590_c2_e3de_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1590_c2_e3de_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1590_c2_e3de_return_output := tmp16_MUX_uxn_opcodes_h_l1590_c2_e3de_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1590_c2_e3de] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1590_c2_e3de_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1590_c2_e3de_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1590_c2_e3de_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1590_c2_e3de_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1590_c2_e3de_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1590_c2_e3de_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1590_c2_e3de_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1590_c2_e3de_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1595_c7_9025] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1595_c7_9025_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1595_c7_9025_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1595_c7_9025_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1595_c7_9025_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1595_c7_9025_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1595_c7_9025_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1595_c7_9025_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1595_c7_9025_return_output;

     -- Submodule level 9
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1590_c2_e3de_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1595_c7_9025_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1590_c2_e3de_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1595_c7_9025_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1590_c2_e3de_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1595_c7_9025_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l1590_c2_e3de_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1590_c2_e3de] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1590_c2_e3de_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1590_c2_e3de_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1590_c2_e3de_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1590_c2_e3de_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1590_c2_e3de_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1590_c2_e3de_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1590_c2_e3de_return_output := result_stack_value_MUX_uxn_opcodes_h_l1590_c2_e3de_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1590_c2_e3de] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1590_c2_e3de_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1590_c2_e3de_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1590_c2_e3de_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1590_c2_e3de_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1590_c2_e3de_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1590_c2_e3de_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1590_c2_e3de_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1590_c2_e3de_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1590_c2_e3de] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1590_c2_e3de_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1590_c2_e3de_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1590_c2_e3de_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1590_c2_e3de_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1590_c2_e3de_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1590_c2_e3de_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1590_c2_e3de_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1590_c2_e3de_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_3413_uxn_opcodes_h_l1631_l1585_DUPLICATE_0b6d LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3413_uxn_opcodes_h_l1631_l1585_DUPLICATE_0b6d_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3413(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1590_c2_e3de_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1590_c2_e3de_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1590_c2_e3de_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1590_c2_e3de_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1590_c2_e3de_return_output,
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1590_c2_e3de_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1590_c2_e3de_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3413_uxn_opcodes_h_l1631_l1585_DUPLICATE_0b6d_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3413_uxn_opcodes_h_l1631_l1585_DUPLICATE_0b6d_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_tmp16 <= REG_VAR_tmp16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     tmp16 <= REG_COMB_tmp16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
