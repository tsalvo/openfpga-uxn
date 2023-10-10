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
-- Submodules: 87
entity ldz2_0CLK_bbbe252c is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end ldz2_0CLK_bbbe252c;
architecture arch of ldz2_0CLK_bbbe252c is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1654_c6_11d5]
signal BIN_OP_EQ_uxn_opcodes_h_l1654_c6_11d5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1654_c6_11d5_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1654_c6_11d5_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1654_c1_595b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1654_c1_595b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1654_c1_595b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1654_c1_595b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1654_c1_595b_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1654_c2_0f6d]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1654_c2_0f6d_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1654_c2_0f6d_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1654_c2_0f6d_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1654_c2_0f6d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1654_c2_0f6d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c2_0f6d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c2_0f6d_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c2_0f6d_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c2_0f6d_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1654_c2_0f6d]
signal result_stack_value_MUX_uxn_opcodes_h_l1654_c2_0f6d_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1654_c2_0f6d_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1654_c2_0f6d_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1654_c2_0f6d_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1654_c2_0f6d]
signal result_ram_addr_MUX_uxn_opcodes_h_l1654_c2_0f6d_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1654_c2_0f6d_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1654_c2_0f6d_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1654_c2_0f6d_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1654_c2_0f6d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1654_c2_0f6d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1654_c2_0f6d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1654_c2_0f6d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1654_c2_0f6d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1654_c2_0f6d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c2_0f6d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c2_0f6d_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c2_0f6d_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c2_0f6d_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1654_c2_0f6d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1654_c2_0f6d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1654_c2_0f6d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1654_c2_0f6d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1654_c2_0f6d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1654_c2_0f6d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1654_c2_0f6d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1654_c2_0f6d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1654_c2_0f6d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1654_c2_0f6d_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1654_c2_0f6d]
signal t8_MUX_uxn_opcodes_h_l1654_c2_0f6d_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1654_c2_0f6d_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1654_c2_0f6d_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1654_c2_0f6d_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1654_c2_0f6d]
signal tmp16_MUX_uxn_opcodes_h_l1654_c2_0f6d_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1654_c2_0f6d_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1654_c2_0f6d_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1654_c2_0f6d_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l1655_c3_57d1[uxn_opcodes_h_l1655_c3_57d1]
signal printf_uxn_opcodes_h_l1655_c3_57d1_uxn_opcodes_h_l1655_c3_57d1_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1660_c11_0cab]
signal BIN_OP_EQ_uxn_opcodes_h_l1660_c11_0cab_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1660_c11_0cab_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1660_c11_0cab_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1660_c7_49ad]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1660_c7_49ad_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1660_c7_49ad_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1660_c7_49ad_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1660_c7_49ad_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1660_c7_49ad]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1660_c7_49ad_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1660_c7_49ad_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1660_c7_49ad_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1660_c7_49ad_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1660_c7_49ad]
signal result_stack_value_MUX_uxn_opcodes_h_l1660_c7_49ad_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1660_c7_49ad_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1660_c7_49ad_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1660_c7_49ad_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1660_c7_49ad]
signal result_ram_addr_MUX_uxn_opcodes_h_l1660_c7_49ad_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1660_c7_49ad_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1660_c7_49ad_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1660_c7_49ad_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1660_c7_49ad]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1660_c7_49ad_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1660_c7_49ad_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1660_c7_49ad_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1660_c7_49ad_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1660_c7_49ad]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1660_c7_49ad_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1660_c7_49ad_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1660_c7_49ad_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1660_c7_49ad_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1660_c7_49ad]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1660_c7_49ad_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1660_c7_49ad_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1660_c7_49ad_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1660_c7_49ad_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1660_c7_49ad]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1660_c7_49ad_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1660_c7_49ad_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1660_c7_49ad_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1660_c7_49ad_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1660_c7_49ad]
signal t8_MUX_uxn_opcodes_h_l1660_c7_49ad_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1660_c7_49ad_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1660_c7_49ad_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1660_c7_49ad_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1660_c7_49ad]
signal tmp16_MUX_uxn_opcodes_h_l1660_c7_49ad_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1660_c7_49ad_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1660_c7_49ad_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1660_c7_49ad_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1663_c11_6390]
signal BIN_OP_EQ_uxn_opcodes_h_l1663_c11_6390_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1663_c11_6390_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1663_c11_6390_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1663_c7_d212]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1663_c7_d212_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1663_c7_d212_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1663_c7_d212_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1663_c7_d212_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1663_c7_d212]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_d212_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_d212_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_d212_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_d212_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1663_c7_d212]
signal result_stack_value_MUX_uxn_opcodes_h_l1663_c7_d212_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1663_c7_d212_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1663_c7_d212_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1663_c7_d212_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1663_c7_d212]
signal result_ram_addr_MUX_uxn_opcodes_h_l1663_c7_d212_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1663_c7_d212_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1663_c7_d212_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1663_c7_d212_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1663_c7_d212]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1663_c7_d212_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1663_c7_d212_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1663_c7_d212_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1663_c7_d212_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1663_c7_d212]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1663_c7_d212_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1663_c7_d212_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1663_c7_d212_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1663_c7_d212_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1663_c7_d212]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_d212_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_d212_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_d212_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_d212_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1663_c7_d212]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_d212_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_d212_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_d212_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_d212_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1663_c7_d212]
signal t8_MUX_uxn_opcodes_h_l1663_c7_d212_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1663_c7_d212_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1663_c7_d212_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1663_c7_d212_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1663_c7_d212]
signal tmp16_MUX_uxn_opcodes_h_l1663_c7_d212_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1663_c7_d212_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1663_c7_d212_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1663_c7_d212_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1667_c32_8075]
signal BIN_OP_AND_uxn_opcodes_h_l1667_c32_8075_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1667_c32_8075_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1667_c32_8075_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1667_c32_b4f7]
signal BIN_OP_GT_uxn_opcodes_h_l1667_c32_b4f7_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1667_c32_b4f7_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1667_c32_b4f7_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1667_c32_c5aa]
signal MUX_uxn_opcodes_h_l1667_c32_c5aa_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1667_c32_c5aa_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1667_c32_c5aa_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1667_c32_c5aa_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1670_c11_c826]
signal BIN_OP_EQ_uxn_opcodes_h_l1670_c11_c826_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1670_c11_c826_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1670_c11_c826_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1670_c7_5b08]
signal result_ram_addr_MUX_uxn_opcodes_h_l1670_c7_5b08_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1670_c7_5b08_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1670_c7_5b08_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1670_c7_5b08_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1670_c7_5b08]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1670_c7_5b08_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1670_c7_5b08_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1670_c7_5b08_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1670_c7_5b08_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1670_c7_5b08]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1670_c7_5b08_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1670_c7_5b08_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1670_c7_5b08_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1670_c7_5b08_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1670_c7_5b08]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1670_c7_5b08_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1670_c7_5b08_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1670_c7_5b08_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1670_c7_5b08_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1670_c7_5b08]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1670_c7_5b08_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1670_c7_5b08_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1670_c7_5b08_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1670_c7_5b08_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1670_c7_5b08]
signal result_stack_value_MUX_uxn_opcodes_h_l1670_c7_5b08_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1670_c7_5b08_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1670_c7_5b08_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1670_c7_5b08_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1670_c7_5b08]
signal tmp16_MUX_uxn_opcodes_h_l1670_c7_5b08_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1670_c7_5b08_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1670_c7_5b08_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1670_c7_5b08_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1674_c11_165d]
signal BIN_OP_EQ_uxn_opcodes_h_l1674_c11_165d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1674_c11_165d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1674_c11_165d_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1674_c7_169e]
signal result_ram_addr_MUX_uxn_opcodes_h_l1674_c7_169e_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1674_c7_169e_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1674_c7_169e_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1674_c7_169e_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1674_c7_169e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_169e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_169e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_169e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_169e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1674_c7_169e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1674_c7_169e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1674_c7_169e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1674_c7_169e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1674_c7_169e_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1674_c7_169e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_169e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_169e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_169e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_169e_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1674_c7_169e]
signal result_stack_value_MUX_uxn_opcodes_h_l1674_c7_169e_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1674_c7_169e_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1674_c7_169e_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1674_c7_169e_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1674_c7_169e]
signal tmp16_MUX_uxn_opcodes_h_l1674_c7_169e_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1674_c7_169e_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1674_c7_169e_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1674_c7_169e_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1676_c3_ae35]
signal CONST_SL_8_uxn_opcodes_h_l1676_c3_ae35_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1676_c3_ae35_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1677_c32_d738]
signal BIN_OP_PLUS_uxn_opcodes_h_l1677_c32_d738_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1677_c32_d738_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1677_c32_d738_return_output : unsigned(8 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1679_c11_dad2]
signal BIN_OP_EQ_uxn_opcodes_h_l1679_c11_dad2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1679_c11_dad2_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1679_c11_dad2_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1679_c7_b1a1]
signal result_ram_addr_MUX_uxn_opcodes_h_l1679_c7_b1a1_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1679_c7_b1a1_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1679_c7_b1a1_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1679_c7_b1a1_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1679_c7_b1a1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1679_c7_b1a1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1679_c7_b1a1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1679_c7_b1a1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1679_c7_b1a1_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1679_c7_b1a1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1679_c7_b1a1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1679_c7_b1a1_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1679_c7_b1a1_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1679_c7_b1a1_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1679_c7_b1a1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1679_c7_b1a1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1679_c7_b1a1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1679_c7_b1a1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1679_c7_b1a1_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1679_c7_b1a1]
signal result_stack_value_MUX_uxn_opcodes_h_l1679_c7_b1a1_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1679_c7_b1a1_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1679_c7_b1a1_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1679_c7_b1a1_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1679_c7_b1a1]
signal tmp16_MUX_uxn_opcodes_h_l1679_c7_b1a1_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1679_c7_b1a1_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1679_c7_b1a1_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1679_c7_b1a1_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1680_c32_0ea8]
signal BIN_OP_PLUS_uxn_opcodes_h_l1680_c32_0ea8_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1680_c32_0ea8_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1680_c32_0ea8_return_output : unsigned(8 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1682_c11_eda0]
signal BIN_OP_EQ_uxn_opcodes_h_l1682_c11_eda0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1682_c11_eda0_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1682_c11_eda0_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1682_c7_901e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1682_c7_901e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1682_c7_901e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1682_c7_901e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1682_c7_901e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1682_c7_901e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1682_c7_901e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1682_c7_901e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1682_c7_901e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1682_c7_901e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1682_c7_901e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c7_901e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c7_901e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c7_901e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c7_901e_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1682_c7_901e]
signal result_stack_value_MUX_uxn_opcodes_h_l1682_c7_901e_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1682_c7_901e_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1682_c7_901e_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1682_c7_901e_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1682_c7_901e]
signal tmp16_MUX_uxn_opcodes_h_l1682_c7_901e_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1682_c7_901e_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1682_c7_901e_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1682_c7_901e_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1683_c3_49f2]
signal BIN_OP_OR_uxn_opcodes_h_l1683_c3_49f2_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1683_c3_49f2_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1683_c3_49f2_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1688_c11_475a]
signal BIN_OP_EQ_uxn_opcodes_h_l1688_c11_475a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1688_c11_475a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1688_c11_475a_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1688_c7_b4df]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1688_c7_b4df_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1688_c7_b4df_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1688_c7_b4df_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1688_c7_b4df_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1688_c7_b4df]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1688_c7_b4df_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1688_c7_b4df_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1688_c7_b4df_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1688_c7_b4df_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1688_c7_b4df]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1688_c7_b4df_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1688_c7_b4df_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1688_c7_b4df_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1688_c7_b4df_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1688_c7_b4df]
signal result_stack_value_MUX_uxn_opcodes_h_l1688_c7_b4df_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1688_c7_b4df_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1688_c7_b4df_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1688_c7_b4df_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1690_c34_1a41]
signal CONST_SR_8_uxn_opcodes_h_l1690_c34_1a41_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1690_c34_1a41_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1692_c11_346b]
signal BIN_OP_EQ_uxn_opcodes_h_l1692_c11_346b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1692_c11_346b_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1692_c11_346b_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1692_c7_0099]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1692_c7_0099_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1692_c7_0099_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1692_c7_0099_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1692_c7_0099_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1692_c7_0099]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1692_c7_0099_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1692_c7_0099_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1692_c7_0099_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1692_c7_0099_return_output : unsigned(0 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l1654_c6_11d5
BIN_OP_EQ_uxn_opcodes_h_l1654_c6_11d5 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1654_c6_11d5_left,
BIN_OP_EQ_uxn_opcodes_h_l1654_c6_11d5_right,
BIN_OP_EQ_uxn_opcodes_h_l1654_c6_11d5_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1654_c1_595b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1654_c1_595b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1654_c1_595b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1654_c1_595b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1654_c1_595b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1654_c1_595b_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1654_c2_0f6d
result_is_stack_read_MUX_uxn_opcodes_h_l1654_c2_0f6d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1654_c2_0f6d_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1654_c2_0f6d_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1654_c2_0f6d_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1654_c2_0f6d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c2_0f6d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c2_0f6d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c2_0f6d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c2_0f6d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c2_0f6d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c2_0f6d_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1654_c2_0f6d
result_stack_value_MUX_uxn_opcodes_h_l1654_c2_0f6d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1654_c2_0f6d_cond,
result_stack_value_MUX_uxn_opcodes_h_l1654_c2_0f6d_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1654_c2_0f6d_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1654_c2_0f6d_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1654_c2_0f6d
result_ram_addr_MUX_uxn_opcodes_h_l1654_c2_0f6d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1654_c2_0f6d_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1654_c2_0f6d_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1654_c2_0f6d_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1654_c2_0f6d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1654_c2_0f6d
result_is_sp_shift_MUX_uxn_opcodes_h_l1654_c2_0f6d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1654_c2_0f6d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1654_c2_0f6d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1654_c2_0f6d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1654_c2_0f6d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c2_0f6d
result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c2_0f6d : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c2_0f6d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c2_0f6d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c2_0f6d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c2_0f6d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1654_c2_0f6d
result_is_stack_write_MUX_uxn_opcodes_h_l1654_c2_0f6d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1654_c2_0f6d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1654_c2_0f6d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1654_c2_0f6d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1654_c2_0f6d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1654_c2_0f6d
result_is_opc_done_MUX_uxn_opcodes_h_l1654_c2_0f6d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1654_c2_0f6d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1654_c2_0f6d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1654_c2_0f6d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1654_c2_0f6d_return_output);

-- t8_MUX_uxn_opcodes_h_l1654_c2_0f6d
t8_MUX_uxn_opcodes_h_l1654_c2_0f6d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1654_c2_0f6d_cond,
t8_MUX_uxn_opcodes_h_l1654_c2_0f6d_iftrue,
t8_MUX_uxn_opcodes_h_l1654_c2_0f6d_iffalse,
t8_MUX_uxn_opcodes_h_l1654_c2_0f6d_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1654_c2_0f6d
tmp16_MUX_uxn_opcodes_h_l1654_c2_0f6d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1654_c2_0f6d_cond,
tmp16_MUX_uxn_opcodes_h_l1654_c2_0f6d_iftrue,
tmp16_MUX_uxn_opcodes_h_l1654_c2_0f6d_iffalse,
tmp16_MUX_uxn_opcodes_h_l1654_c2_0f6d_return_output);

-- printf_uxn_opcodes_h_l1655_c3_57d1_uxn_opcodes_h_l1655_c3_57d1
printf_uxn_opcodes_h_l1655_c3_57d1_uxn_opcodes_h_l1655_c3_57d1 : entity work.printf_uxn_opcodes_h_l1655_c3_57d1_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1655_c3_57d1_uxn_opcodes_h_l1655_c3_57d1_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1660_c11_0cab
BIN_OP_EQ_uxn_opcodes_h_l1660_c11_0cab : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1660_c11_0cab_left,
BIN_OP_EQ_uxn_opcodes_h_l1660_c11_0cab_right,
BIN_OP_EQ_uxn_opcodes_h_l1660_c11_0cab_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1660_c7_49ad
result_is_stack_read_MUX_uxn_opcodes_h_l1660_c7_49ad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1660_c7_49ad_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1660_c7_49ad_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1660_c7_49ad_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1660_c7_49ad_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1660_c7_49ad
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1660_c7_49ad : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1660_c7_49ad_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1660_c7_49ad_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1660_c7_49ad_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1660_c7_49ad_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1660_c7_49ad
result_stack_value_MUX_uxn_opcodes_h_l1660_c7_49ad : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1660_c7_49ad_cond,
result_stack_value_MUX_uxn_opcodes_h_l1660_c7_49ad_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1660_c7_49ad_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1660_c7_49ad_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1660_c7_49ad
result_ram_addr_MUX_uxn_opcodes_h_l1660_c7_49ad : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1660_c7_49ad_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1660_c7_49ad_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1660_c7_49ad_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1660_c7_49ad_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1660_c7_49ad
result_is_sp_shift_MUX_uxn_opcodes_h_l1660_c7_49ad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1660_c7_49ad_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1660_c7_49ad_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1660_c7_49ad_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1660_c7_49ad_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1660_c7_49ad
result_sp_relative_shift_MUX_uxn_opcodes_h_l1660_c7_49ad : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1660_c7_49ad_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1660_c7_49ad_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1660_c7_49ad_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1660_c7_49ad_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1660_c7_49ad
result_is_stack_write_MUX_uxn_opcodes_h_l1660_c7_49ad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1660_c7_49ad_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1660_c7_49ad_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1660_c7_49ad_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1660_c7_49ad_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1660_c7_49ad
result_is_opc_done_MUX_uxn_opcodes_h_l1660_c7_49ad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1660_c7_49ad_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1660_c7_49ad_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1660_c7_49ad_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1660_c7_49ad_return_output);

-- t8_MUX_uxn_opcodes_h_l1660_c7_49ad
t8_MUX_uxn_opcodes_h_l1660_c7_49ad : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1660_c7_49ad_cond,
t8_MUX_uxn_opcodes_h_l1660_c7_49ad_iftrue,
t8_MUX_uxn_opcodes_h_l1660_c7_49ad_iffalse,
t8_MUX_uxn_opcodes_h_l1660_c7_49ad_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1660_c7_49ad
tmp16_MUX_uxn_opcodes_h_l1660_c7_49ad : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1660_c7_49ad_cond,
tmp16_MUX_uxn_opcodes_h_l1660_c7_49ad_iftrue,
tmp16_MUX_uxn_opcodes_h_l1660_c7_49ad_iffalse,
tmp16_MUX_uxn_opcodes_h_l1660_c7_49ad_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1663_c11_6390
BIN_OP_EQ_uxn_opcodes_h_l1663_c11_6390 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1663_c11_6390_left,
BIN_OP_EQ_uxn_opcodes_h_l1663_c11_6390_right,
BIN_OP_EQ_uxn_opcodes_h_l1663_c11_6390_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1663_c7_d212
result_is_stack_read_MUX_uxn_opcodes_h_l1663_c7_d212 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1663_c7_d212_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1663_c7_d212_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1663_c7_d212_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1663_c7_d212_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_d212
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_d212 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_d212_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_d212_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_d212_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_d212_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1663_c7_d212
result_stack_value_MUX_uxn_opcodes_h_l1663_c7_d212 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1663_c7_d212_cond,
result_stack_value_MUX_uxn_opcodes_h_l1663_c7_d212_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1663_c7_d212_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1663_c7_d212_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1663_c7_d212
result_ram_addr_MUX_uxn_opcodes_h_l1663_c7_d212 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1663_c7_d212_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1663_c7_d212_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1663_c7_d212_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1663_c7_d212_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1663_c7_d212
result_is_sp_shift_MUX_uxn_opcodes_h_l1663_c7_d212 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1663_c7_d212_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1663_c7_d212_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1663_c7_d212_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1663_c7_d212_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1663_c7_d212
result_sp_relative_shift_MUX_uxn_opcodes_h_l1663_c7_d212 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1663_c7_d212_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1663_c7_d212_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1663_c7_d212_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1663_c7_d212_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_d212
result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_d212 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_d212_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_d212_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_d212_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_d212_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_d212
result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_d212 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_d212_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_d212_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_d212_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_d212_return_output);

-- t8_MUX_uxn_opcodes_h_l1663_c7_d212
t8_MUX_uxn_opcodes_h_l1663_c7_d212 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1663_c7_d212_cond,
t8_MUX_uxn_opcodes_h_l1663_c7_d212_iftrue,
t8_MUX_uxn_opcodes_h_l1663_c7_d212_iffalse,
t8_MUX_uxn_opcodes_h_l1663_c7_d212_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1663_c7_d212
tmp16_MUX_uxn_opcodes_h_l1663_c7_d212 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1663_c7_d212_cond,
tmp16_MUX_uxn_opcodes_h_l1663_c7_d212_iftrue,
tmp16_MUX_uxn_opcodes_h_l1663_c7_d212_iffalse,
tmp16_MUX_uxn_opcodes_h_l1663_c7_d212_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1667_c32_8075
BIN_OP_AND_uxn_opcodes_h_l1667_c32_8075 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1667_c32_8075_left,
BIN_OP_AND_uxn_opcodes_h_l1667_c32_8075_right,
BIN_OP_AND_uxn_opcodes_h_l1667_c32_8075_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1667_c32_b4f7
BIN_OP_GT_uxn_opcodes_h_l1667_c32_b4f7 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1667_c32_b4f7_left,
BIN_OP_GT_uxn_opcodes_h_l1667_c32_b4f7_right,
BIN_OP_GT_uxn_opcodes_h_l1667_c32_b4f7_return_output);

-- MUX_uxn_opcodes_h_l1667_c32_c5aa
MUX_uxn_opcodes_h_l1667_c32_c5aa : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1667_c32_c5aa_cond,
MUX_uxn_opcodes_h_l1667_c32_c5aa_iftrue,
MUX_uxn_opcodes_h_l1667_c32_c5aa_iffalse,
MUX_uxn_opcodes_h_l1667_c32_c5aa_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1670_c11_c826
BIN_OP_EQ_uxn_opcodes_h_l1670_c11_c826 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1670_c11_c826_left,
BIN_OP_EQ_uxn_opcodes_h_l1670_c11_c826_right,
BIN_OP_EQ_uxn_opcodes_h_l1670_c11_c826_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1670_c7_5b08
result_ram_addr_MUX_uxn_opcodes_h_l1670_c7_5b08 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1670_c7_5b08_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1670_c7_5b08_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1670_c7_5b08_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1670_c7_5b08_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1670_c7_5b08
result_is_sp_shift_MUX_uxn_opcodes_h_l1670_c7_5b08 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1670_c7_5b08_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1670_c7_5b08_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1670_c7_5b08_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1670_c7_5b08_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1670_c7_5b08
result_is_stack_write_MUX_uxn_opcodes_h_l1670_c7_5b08 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1670_c7_5b08_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1670_c7_5b08_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1670_c7_5b08_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1670_c7_5b08_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1670_c7_5b08
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1670_c7_5b08 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1670_c7_5b08_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1670_c7_5b08_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1670_c7_5b08_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1670_c7_5b08_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1670_c7_5b08
result_is_opc_done_MUX_uxn_opcodes_h_l1670_c7_5b08 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1670_c7_5b08_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1670_c7_5b08_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1670_c7_5b08_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1670_c7_5b08_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1670_c7_5b08
result_stack_value_MUX_uxn_opcodes_h_l1670_c7_5b08 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1670_c7_5b08_cond,
result_stack_value_MUX_uxn_opcodes_h_l1670_c7_5b08_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1670_c7_5b08_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1670_c7_5b08_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1670_c7_5b08
tmp16_MUX_uxn_opcodes_h_l1670_c7_5b08 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1670_c7_5b08_cond,
tmp16_MUX_uxn_opcodes_h_l1670_c7_5b08_iftrue,
tmp16_MUX_uxn_opcodes_h_l1670_c7_5b08_iffalse,
tmp16_MUX_uxn_opcodes_h_l1670_c7_5b08_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1674_c11_165d
BIN_OP_EQ_uxn_opcodes_h_l1674_c11_165d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1674_c11_165d_left,
BIN_OP_EQ_uxn_opcodes_h_l1674_c11_165d_right,
BIN_OP_EQ_uxn_opcodes_h_l1674_c11_165d_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1674_c7_169e
result_ram_addr_MUX_uxn_opcodes_h_l1674_c7_169e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1674_c7_169e_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1674_c7_169e_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1674_c7_169e_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1674_c7_169e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_169e
result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_169e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_169e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_169e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_169e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_169e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1674_c7_169e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1674_c7_169e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1674_c7_169e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1674_c7_169e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1674_c7_169e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1674_c7_169e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_169e
result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_169e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_169e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_169e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_169e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_169e_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1674_c7_169e
result_stack_value_MUX_uxn_opcodes_h_l1674_c7_169e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1674_c7_169e_cond,
result_stack_value_MUX_uxn_opcodes_h_l1674_c7_169e_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1674_c7_169e_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1674_c7_169e_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1674_c7_169e
tmp16_MUX_uxn_opcodes_h_l1674_c7_169e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1674_c7_169e_cond,
tmp16_MUX_uxn_opcodes_h_l1674_c7_169e_iftrue,
tmp16_MUX_uxn_opcodes_h_l1674_c7_169e_iffalse,
tmp16_MUX_uxn_opcodes_h_l1674_c7_169e_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1676_c3_ae35
CONST_SL_8_uxn_opcodes_h_l1676_c3_ae35 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1676_c3_ae35_x,
CONST_SL_8_uxn_opcodes_h_l1676_c3_ae35_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1677_c32_d738
BIN_OP_PLUS_uxn_opcodes_h_l1677_c32_d738 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1677_c32_d738_left,
BIN_OP_PLUS_uxn_opcodes_h_l1677_c32_d738_right,
BIN_OP_PLUS_uxn_opcodes_h_l1677_c32_d738_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1679_c11_dad2
BIN_OP_EQ_uxn_opcodes_h_l1679_c11_dad2 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1679_c11_dad2_left,
BIN_OP_EQ_uxn_opcodes_h_l1679_c11_dad2_right,
BIN_OP_EQ_uxn_opcodes_h_l1679_c11_dad2_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1679_c7_b1a1
result_ram_addr_MUX_uxn_opcodes_h_l1679_c7_b1a1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1679_c7_b1a1_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1679_c7_b1a1_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1679_c7_b1a1_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1679_c7_b1a1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1679_c7_b1a1
result_is_stack_write_MUX_uxn_opcodes_h_l1679_c7_b1a1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1679_c7_b1a1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1679_c7_b1a1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1679_c7_b1a1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1679_c7_b1a1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1679_c7_b1a1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1679_c7_b1a1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1679_c7_b1a1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1679_c7_b1a1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1679_c7_b1a1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1679_c7_b1a1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1679_c7_b1a1
result_is_opc_done_MUX_uxn_opcodes_h_l1679_c7_b1a1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1679_c7_b1a1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1679_c7_b1a1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1679_c7_b1a1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1679_c7_b1a1_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1679_c7_b1a1
result_stack_value_MUX_uxn_opcodes_h_l1679_c7_b1a1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1679_c7_b1a1_cond,
result_stack_value_MUX_uxn_opcodes_h_l1679_c7_b1a1_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1679_c7_b1a1_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1679_c7_b1a1_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1679_c7_b1a1
tmp16_MUX_uxn_opcodes_h_l1679_c7_b1a1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1679_c7_b1a1_cond,
tmp16_MUX_uxn_opcodes_h_l1679_c7_b1a1_iftrue,
tmp16_MUX_uxn_opcodes_h_l1679_c7_b1a1_iffalse,
tmp16_MUX_uxn_opcodes_h_l1679_c7_b1a1_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1680_c32_0ea8
BIN_OP_PLUS_uxn_opcodes_h_l1680_c32_0ea8 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1680_c32_0ea8_left,
BIN_OP_PLUS_uxn_opcodes_h_l1680_c32_0ea8_right,
BIN_OP_PLUS_uxn_opcodes_h_l1680_c32_0ea8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1682_c11_eda0
BIN_OP_EQ_uxn_opcodes_h_l1682_c11_eda0 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1682_c11_eda0_left,
BIN_OP_EQ_uxn_opcodes_h_l1682_c11_eda0_right,
BIN_OP_EQ_uxn_opcodes_h_l1682_c11_eda0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1682_c7_901e
result_is_stack_write_MUX_uxn_opcodes_h_l1682_c7_901e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1682_c7_901e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1682_c7_901e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1682_c7_901e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1682_c7_901e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1682_c7_901e
result_is_opc_done_MUX_uxn_opcodes_h_l1682_c7_901e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1682_c7_901e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1682_c7_901e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1682_c7_901e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1682_c7_901e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c7_901e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c7_901e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c7_901e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c7_901e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c7_901e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c7_901e_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1682_c7_901e
result_stack_value_MUX_uxn_opcodes_h_l1682_c7_901e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1682_c7_901e_cond,
result_stack_value_MUX_uxn_opcodes_h_l1682_c7_901e_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1682_c7_901e_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1682_c7_901e_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1682_c7_901e
tmp16_MUX_uxn_opcodes_h_l1682_c7_901e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1682_c7_901e_cond,
tmp16_MUX_uxn_opcodes_h_l1682_c7_901e_iftrue,
tmp16_MUX_uxn_opcodes_h_l1682_c7_901e_iffalse,
tmp16_MUX_uxn_opcodes_h_l1682_c7_901e_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1683_c3_49f2
BIN_OP_OR_uxn_opcodes_h_l1683_c3_49f2 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1683_c3_49f2_left,
BIN_OP_OR_uxn_opcodes_h_l1683_c3_49f2_right,
BIN_OP_OR_uxn_opcodes_h_l1683_c3_49f2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1688_c11_475a
BIN_OP_EQ_uxn_opcodes_h_l1688_c11_475a : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1688_c11_475a_left,
BIN_OP_EQ_uxn_opcodes_h_l1688_c11_475a_right,
BIN_OP_EQ_uxn_opcodes_h_l1688_c11_475a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1688_c7_b4df
result_is_stack_write_MUX_uxn_opcodes_h_l1688_c7_b4df : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1688_c7_b4df_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1688_c7_b4df_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1688_c7_b4df_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1688_c7_b4df_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1688_c7_b4df
result_is_opc_done_MUX_uxn_opcodes_h_l1688_c7_b4df : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1688_c7_b4df_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1688_c7_b4df_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1688_c7_b4df_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1688_c7_b4df_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1688_c7_b4df
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1688_c7_b4df : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1688_c7_b4df_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1688_c7_b4df_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1688_c7_b4df_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1688_c7_b4df_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1688_c7_b4df
result_stack_value_MUX_uxn_opcodes_h_l1688_c7_b4df : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1688_c7_b4df_cond,
result_stack_value_MUX_uxn_opcodes_h_l1688_c7_b4df_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1688_c7_b4df_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1688_c7_b4df_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1690_c34_1a41
CONST_SR_8_uxn_opcodes_h_l1690_c34_1a41 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1690_c34_1a41_x,
CONST_SR_8_uxn_opcodes_h_l1690_c34_1a41_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1692_c11_346b
BIN_OP_EQ_uxn_opcodes_h_l1692_c11_346b : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1692_c11_346b_left,
BIN_OP_EQ_uxn_opcodes_h_l1692_c11_346b_right,
BIN_OP_EQ_uxn_opcodes_h_l1692_c11_346b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1692_c7_0099
result_is_stack_write_MUX_uxn_opcodes_h_l1692_c7_0099 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1692_c7_0099_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1692_c7_0099_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1692_c7_0099_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1692_c7_0099_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1692_c7_0099
result_is_opc_done_MUX_uxn_opcodes_h_l1692_c7_0099 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1692_c7_0099_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1692_c7_0099_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1692_c7_0099_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1692_c7_0099_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1654_c6_11d5_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1654_c1_595b_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1654_c2_0f6d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c2_0f6d_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1654_c2_0f6d_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1654_c2_0f6d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1654_c2_0f6d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c2_0f6d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1654_c2_0f6d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1654_c2_0f6d_return_output,
 t8_MUX_uxn_opcodes_h_l1654_c2_0f6d_return_output,
 tmp16_MUX_uxn_opcodes_h_l1654_c2_0f6d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1660_c11_0cab_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1660_c7_49ad_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1660_c7_49ad_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1660_c7_49ad_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1660_c7_49ad_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1660_c7_49ad_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1660_c7_49ad_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1660_c7_49ad_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1660_c7_49ad_return_output,
 t8_MUX_uxn_opcodes_h_l1660_c7_49ad_return_output,
 tmp16_MUX_uxn_opcodes_h_l1660_c7_49ad_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1663_c11_6390_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1663_c7_d212_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_d212_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1663_c7_d212_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1663_c7_d212_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1663_c7_d212_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1663_c7_d212_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_d212_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_d212_return_output,
 t8_MUX_uxn_opcodes_h_l1663_c7_d212_return_output,
 tmp16_MUX_uxn_opcodes_h_l1663_c7_d212_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1667_c32_8075_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1667_c32_b4f7_return_output,
 MUX_uxn_opcodes_h_l1667_c32_c5aa_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1670_c11_c826_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1670_c7_5b08_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1670_c7_5b08_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1670_c7_5b08_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1670_c7_5b08_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1670_c7_5b08_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1670_c7_5b08_return_output,
 tmp16_MUX_uxn_opcodes_h_l1670_c7_5b08_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1674_c11_165d_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1674_c7_169e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_169e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1674_c7_169e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_169e_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1674_c7_169e_return_output,
 tmp16_MUX_uxn_opcodes_h_l1674_c7_169e_return_output,
 CONST_SL_8_uxn_opcodes_h_l1676_c3_ae35_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1677_c32_d738_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1679_c11_dad2_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1679_c7_b1a1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1679_c7_b1a1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1679_c7_b1a1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1679_c7_b1a1_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1679_c7_b1a1_return_output,
 tmp16_MUX_uxn_opcodes_h_l1679_c7_b1a1_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1680_c32_0ea8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1682_c11_eda0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1682_c7_901e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1682_c7_901e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c7_901e_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1682_c7_901e_return_output,
 tmp16_MUX_uxn_opcodes_h_l1682_c7_901e_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1683_c3_49f2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1688_c11_475a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1688_c7_b4df_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1688_c7_b4df_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1688_c7_b4df_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1688_c7_b4df_return_output,
 CONST_SR_8_uxn_opcodes_h_l1690_c34_1a41_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1692_c11_346b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1692_c7_0099_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1692_c7_0099_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c6_11d5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c6_11d5_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c6_11d5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1654_c1_595b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1654_c1_595b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1654_c1_595b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1654_c1_595b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1654_c2_0f6d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1654_c2_0f6d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1660_c7_49ad_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1654_c2_0f6d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1654_c2_0f6d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c2_0f6d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1657_c3_a4ac : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c2_0f6d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1660_c7_49ad_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c2_0f6d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c2_0f6d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1654_c2_0f6d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1654_c2_0f6d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1660_c7_49ad_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1654_c2_0f6d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1654_c2_0f6d_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1654_c2_0f6d_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1654_c2_0f6d_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1660_c7_49ad_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1654_c2_0f6d_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1654_c2_0f6d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1654_c2_0f6d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1654_c2_0f6d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1660_c7_49ad_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1654_c2_0f6d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1654_c2_0f6d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c2_0f6d_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c2_0f6d_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1660_c7_49ad_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c2_0f6d_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c2_0f6d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1654_c2_0f6d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1654_c2_0f6d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1660_c7_49ad_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1654_c2_0f6d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1654_c2_0f6d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1654_c2_0f6d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1654_c2_0f6d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1660_c7_49ad_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1654_c2_0f6d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1654_c2_0f6d_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1654_c2_0f6d_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1654_c2_0f6d_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1660_c7_49ad_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1654_c2_0f6d_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1654_c2_0f6d_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1654_c2_0f6d_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1654_c2_0f6d_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1660_c7_49ad_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1654_c2_0f6d_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1654_c2_0f6d_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1655_c3_57d1_uxn_opcodes_h_l1655_c3_57d1_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1660_c11_0cab_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1660_c11_0cab_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1660_c11_0cab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1660_c7_49ad_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1660_c7_49ad_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1663_c7_d212_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1660_c7_49ad_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1660_c7_49ad_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1661_c3_d02e : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1660_c7_49ad_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_d212_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1660_c7_49ad_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1660_c7_49ad_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1660_c7_49ad_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1663_c7_d212_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1660_c7_49ad_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1660_c7_49ad_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1660_c7_49ad_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1663_c7_d212_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1660_c7_49ad_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1660_c7_49ad_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1660_c7_49ad_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1663_c7_d212_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1660_c7_49ad_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1660_c7_49ad_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1660_c7_49ad_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1663_c7_d212_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1660_c7_49ad_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1660_c7_49ad_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1660_c7_49ad_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_d212_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1660_c7_49ad_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1660_c7_49ad_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1660_c7_49ad_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_d212_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1660_c7_49ad_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1660_c7_49ad_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1660_c7_49ad_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1663_c7_d212_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1660_c7_49ad_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1660_c7_49ad_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1660_c7_49ad_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1663_c7_d212_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1660_c7_49ad_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1663_c11_6390_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1663_c11_6390_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1663_c11_6390_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1663_c7_d212_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1663_c7_d212_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1663_c7_d212_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_d212_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_d212_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1670_c7_5b08_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_d212_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1663_c7_d212_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1663_c7_d212_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1670_c7_5b08_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1663_c7_d212_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1663_c7_d212_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1663_c7_d212_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1670_c7_5b08_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1663_c7_d212_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1663_c7_d212_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1663_c7_d212_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1670_c7_5b08_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1663_c7_d212_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1663_c7_d212_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1663_c7_d212_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1663_c7_d212_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_d212_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_d212_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1670_c7_5b08_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_d212_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_d212_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_d212_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1670_c7_5b08_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_d212_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1663_c7_d212_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1663_c7_d212_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1663_c7_d212_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1663_c7_d212_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1663_c7_d212_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1670_c7_5b08_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1663_c7_d212_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1667_c32_c5aa_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1667_c32_c5aa_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1667_c32_c5aa_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1667_c32_8075_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1667_c32_8075_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1667_c32_8075_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1667_c32_b4f7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1667_c32_b4f7_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1667_c32_b4f7_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1667_c32_c5aa_return_output : signed(7 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1668_c21_e4cc_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1670_c11_c826_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1670_c11_c826_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1670_c11_c826_return_output : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1670_c7_5b08_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1670_c7_5b08_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1674_c7_169e_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1670_c7_5b08_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1670_c7_5b08_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1670_c7_5b08_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1670_c7_5b08_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1670_c7_5b08_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1670_c7_5b08_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_169e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1670_c7_5b08_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1670_c7_5b08_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1670_c7_5b08_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1674_c7_169e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1670_c7_5b08_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1670_c7_5b08_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1670_c7_5b08_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_169e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1670_c7_5b08_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1670_c7_5b08_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1670_c7_5b08_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1674_c7_169e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1670_c7_5b08_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1670_c7_5b08_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1670_c7_5b08_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1674_c7_169e_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1670_c7_5b08_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1672_c21_5574_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1674_c11_165d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1674_c11_165d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1674_c11_165d_return_output : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1674_c7_169e_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1674_c7_169e_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1679_c7_b1a1_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1674_c7_169e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_169e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_169e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1679_c7_b1a1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_169e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1674_c7_169e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1674_c7_169e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1679_c7_b1a1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1674_c7_169e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_169e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_169e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1679_c7_b1a1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_169e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1674_c7_169e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1674_c7_169e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1679_c7_b1a1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1674_c7_169e_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1674_c7_169e_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1674_c7_169e_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1679_c7_b1a1_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1674_c7_169e_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1676_c3_ae35_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1676_c3_ae35_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1677_c32_d738_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1677_c32_d738_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1677_c32_d738_return_output : unsigned(8 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1677_c21_1723_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1679_c11_dad2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1679_c11_dad2_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1679_c11_dad2_return_output : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1679_c7_b1a1_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1679_c7_b1a1_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1679_c7_b1a1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1679_c7_b1a1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1679_c7_b1a1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1682_c7_901e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1679_c7_b1a1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1679_c7_b1a1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1679_c7_b1a1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c7_901e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1679_c7_b1a1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1679_c7_b1a1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1679_c7_b1a1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1682_c7_901e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1679_c7_b1a1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1679_c7_b1a1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1679_c7_b1a1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1682_c7_901e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1679_c7_b1a1_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1679_c7_b1a1_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1679_c7_b1a1_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1682_c7_901e_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1679_c7_b1a1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1680_c32_0ea8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1680_c32_0ea8_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1680_c32_0ea8_return_output : unsigned(8 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1680_c21_6e95_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1682_c11_eda0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1682_c11_eda0_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1682_c11_eda0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1682_c7_901e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1682_c7_901e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1688_c7_b4df_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1682_c7_901e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1682_c7_901e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1682_c7_901e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1688_c7_b4df_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1682_c7_901e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c7_901e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1685_c3_1fd5 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c7_901e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1688_c7_b4df_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c7_901e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1682_c7_901e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1682_c7_901e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1688_c7_b4df_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1682_c7_901e_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1682_c7_901e_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1682_c7_901e_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1682_c7_901e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1683_c3_49f2_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1683_c3_49f2_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1683_c3_49f2_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1686_c24_bf20_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1688_c11_475a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1688_c11_475a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1688_c11_475a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1688_c7_b4df_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1688_c7_b4df_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1692_c7_0099_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1688_c7_b4df_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1688_c7_b4df_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1688_c7_b4df_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1692_c7_0099_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1688_c7_b4df_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1688_c7_b4df_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1689_c3_3fd5 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1688_c7_b4df_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1688_c7_b4df_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1688_c7_b4df_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1688_c7_b4df_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1688_c7_b4df_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1690_c34_1a41_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1690_c34_1a41_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1690_c24_d5e1_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1692_c11_346b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1692_c11_346b_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1692_c11_346b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1692_c7_0099_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1692_c7_0099_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1692_c7_0099_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1692_c7_0099_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1692_c7_0099_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1692_c7_0099_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1654_l1679_l1674_l1670_l1663_l1660_l1688_DUPLICATE_d7e7_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1679_l1654_l1660_DUPLICATE_b55b_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1654_l1670_l1660_DUPLICATE_bf59_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1663_l1654_l1660_DUPLICATE_a248_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1654_l1679_l1674_l1670_l1663_l1692_l1660_l1688_DUPLICATE_dc09_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1663_l1660_DUPLICATE_41c8_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1682_l1679_l1674_l1670_l1663_l1692_l1660_l1688_DUPLICATE_7868_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1679_l1674_l1670_l1663_l1688_DUPLICATE_2f5a_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1683_l1675_DUPLICATE_b079_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_2155_uxn_opcodes_h_l1697_l1649_DUPLICATE_1c2a_return_output : opcode_result_t;
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
     VAR_MUX_uxn_opcodes_h_l1667_c32_c5aa_iffalse := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1692_c7_0099_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1689_c3_3fd5 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1688_c7_b4df_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1689_c3_3fd5;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1692_c7_0099_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1663_c7_d212_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1682_c11_eda0_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1660_c11_0cab_right := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l1667_c32_8075_right := to_unsigned(128, 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1657_c3_a4ac := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c2_0f6d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1657_c3_a4ac;
     VAR_BIN_OP_GT_uxn_opcodes_h_l1667_c32_b4f7_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1692_c11_346b_right := to_unsigned(8, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1685_c3_1fd5 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c7_901e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1685_c3_1fd5;
     VAR_MUX_uxn_opcodes_h_l1667_c32_c5aa_iftrue := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1654_c2_0f6d_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1661_c3_d02e := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1660_c7_49ad_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1661_c3_d02e;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1677_c32_d738_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1663_c11_6390_right := to_unsigned(2, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1682_c7_901e_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c6_11d5_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1670_c11_c826_right := to_unsigned(3, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1670_c7_5b08_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1680_c32_0ea8_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1674_c11_165d_right := to_unsigned(4, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1663_c7_d212_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1654_c1_595b_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1688_c11_475a_right := to_unsigned(7, 3);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1654_c2_0f6d_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1679_c11_dad2_right := to_unsigned(5, 3);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1654_c1_595b_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1667_c32_8075_left := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c6_11d5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1660_c11_0cab_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1663_c11_6390_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1670_c11_c826_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1674_c11_165d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1679_c11_dad2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1682_c11_eda0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1688_c11_475a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1692_c11_346b_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l1663_c7_d212_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1677_c32_d738_left := t8;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1680_c32_0ea8_left := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1654_c2_0f6d_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1660_c7_49ad_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1663_c7_d212_iffalse := t8;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1683_c3_49f2_left := tmp16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1690_c34_1a41_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1654_c2_0f6d_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1660_c7_49ad_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1663_c7_d212_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1670_c7_5b08_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1679_c7_b1a1_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1682_c7_901e_iffalse := tmp16;
     -- CONST_SR_8[uxn_opcodes_h_l1690_c34_1a41] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1690_c34_1a41_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1690_c34_1a41_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1690_c34_1a41_return_output := CONST_SR_8_uxn_opcodes_h_l1690_c34_1a41_return_output;

     -- CAST_TO_uint16_t[uxn_opcodes_h_l1672_c21_5574] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1672_c21_5574_return_output := CAST_TO_uint16_t_uint8_t(
     t8);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1682_l1679_l1674_l1670_l1663_l1692_l1660_l1688_DUPLICATE_7868 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1682_l1679_l1674_l1670_l1663_l1692_l1660_l1688_DUPLICATE_7868_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1654_c6_11d5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1654_c6_11d5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c6_11d5_left;
     BIN_OP_EQ_uxn_opcodes_h_l1654_c6_11d5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c6_11d5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c6_11d5_return_output := BIN_OP_EQ_uxn_opcodes_h_l1654_c6_11d5_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l1667_c32_8075] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1667_c32_8075_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1667_c32_8075_left;
     BIN_OP_AND_uxn_opcodes_h_l1667_c32_8075_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1667_c32_8075_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1667_c32_8075_return_output := BIN_OP_AND_uxn_opcodes_h_l1667_c32_8075_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1680_c32_0ea8] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1680_c32_0ea8_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1680_c32_0ea8_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1680_c32_0ea8_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1680_c32_0ea8_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1680_c32_0ea8_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1680_c32_0ea8_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1679_l1654_l1660_DUPLICATE_b55b LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1679_l1654_l1660_DUPLICATE_b55b_return_output := result.ram_addr;

     -- CAST_TO_uint16_t[uxn_opcodes_h_l1668_c21_e4cc] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1668_c21_e4cc_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1682_c11_eda0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1682_c11_eda0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1682_c11_eda0_left;
     BIN_OP_EQ_uxn_opcodes_h_l1682_c11_eda0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1682_c11_eda0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1682_c11_eda0_return_output := BIN_OP_EQ_uxn_opcodes_h_l1682_c11_eda0_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1677_c32_d738] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1677_c32_d738_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1677_c32_d738_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1677_c32_d738_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1677_c32_d738_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1677_c32_d738_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1677_c32_d738_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1663_l1654_l1660_DUPLICATE_a248 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1663_l1654_l1660_DUPLICATE_a248_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1679_c11_dad2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1679_c11_dad2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1679_c11_dad2_left;
     BIN_OP_EQ_uxn_opcodes_h_l1679_c11_dad2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1679_c11_dad2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1679_c11_dad2_return_output := BIN_OP_EQ_uxn_opcodes_h_l1679_c11_dad2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1660_c11_0cab] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1660_c11_0cab_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1660_c11_0cab_left;
     BIN_OP_EQ_uxn_opcodes_h_l1660_c11_0cab_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1660_c11_0cab_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1660_c11_0cab_return_output := BIN_OP_EQ_uxn_opcodes_h_l1660_c11_0cab_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1670_c11_c826] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1670_c11_c826_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1670_c11_c826_left;
     BIN_OP_EQ_uxn_opcodes_h_l1670_c11_c826_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1670_c11_c826_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1670_c11_c826_return_output := BIN_OP_EQ_uxn_opcodes_h_l1670_c11_c826_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1679_l1674_l1670_l1663_l1688_DUPLICATE_2f5a LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1679_l1674_l1670_l1663_l1688_DUPLICATE_2f5a_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1654_l1679_l1674_l1670_l1663_l1692_l1660_l1688_DUPLICATE_dc09 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1654_l1679_l1674_l1670_l1663_l1692_l1660_l1688_DUPLICATE_dc09_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1674_c11_165d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1674_c11_165d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1674_c11_165d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1674_c11_165d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1674_c11_165d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1674_c11_165d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1674_c11_165d_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1654_l1679_l1674_l1670_l1663_l1660_l1688_DUPLICATE_d7e7 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1654_l1679_l1674_l1670_l1663_l1660_l1688_DUPLICATE_d7e7_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1692_c11_346b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1692_c11_346b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1692_c11_346b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1692_c11_346b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1692_c11_346b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1692_c11_346b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1692_c11_346b_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1683_l1675_DUPLICATE_b079 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1683_l1675_DUPLICATE_b079_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1663_l1660_DUPLICATE_41c8 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1663_l1660_DUPLICATE_41c8_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l1688_c11_475a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1688_c11_475a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1688_c11_475a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1688_c11_475a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1688_c11_475a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1688_c11_475a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1688_c11_475a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1663_c11_6390] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1663_c11_6390_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1663_c11_6390_left;
     BIN_OP_EQ_uxn_opcodes_h_l1663_c11_6390_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1663_c11_6390_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1663_c11_6390_return_output := BIN_OP_EQ_uxn_opcodes_h_l1663_c11_6390_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1654_l1670_l1660_DUPLICATE_bf59 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1654_l1670_l1660_DUPLICATE_bf59_return_output := result.is_sp_shift;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1667_c32_b4f7_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1667_c32_8075_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1654_c1_595b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c6_11d5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1654_c2_0f6d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c6_11d5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1654_c2_0f6d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c6_11d5_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1654_c2_0f6d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c6_11d5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1654_c2_0f6d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c6_11d5_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1654_c2_0f6d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c6_11d5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c2_0f6d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c6_11d5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c2_0f6d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c6_11d5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1654_c2_0f6d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c6_11d5_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1654_c2_0f6d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c6_11d5_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1654_c2_0f6d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c6_11d5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1660_c7_49ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1660_c11_0cab_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1660_c7_49ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1660_c11_0cab_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1660_c7_49ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1660_c11_0cab_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1660_c7_49ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1660_c11_0cab_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1660_c7_49ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1660_c11_0cab_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1660_c7_49ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1660_c11_0cab_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1660_c7_49ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1660_c11_0cab_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1660_c7_49ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1660_c11_0cab_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1660_c7_49ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1660_c11_0cab_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1660_c7_49ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1660_c11_0cab_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_d212_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1663_c11_6390_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1663_c7_d212_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1663_c11_6390_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1663_c7_d212_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1663_c11_6390_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_d212_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1663_c11_6390_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1663_c7_d212_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1663_c11_6390_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1663_c7_d212_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1663_c11_6390_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_d212_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1663_c11_6390_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1663_c7_d212_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1663_c11_6390_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1663_c7_d212_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1663_c11_6390_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1663_c7_d212_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1663_c11_6390_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1670_c7_5b08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1670_c11_c826_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1670_c7_5b08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1670_c11_c826_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1670_c7_5b08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1670_c11_c826_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1670_c7_5b08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1670_c11_c826_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1670_c7_5b08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1670_c11_c826_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1670_c7_5b08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1670_c11_c826_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1670_c7_5b08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1670_c11_c826_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_169e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1674_c11_165d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_169e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1674_c11_165d_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1674_c7_169e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1674_c11_165d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1674_c7_169e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1674_c11_165d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1674_c7_169e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1674_c11_165d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1674_c7_169e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1674_c11_165d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1679_c7_b1a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1679_c11_dad2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1679_c7_b1a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1679_c11_dad2_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1679_c7_b1a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1679_c11_dad2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1679_c7_b1a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1679_c11_dad2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1679_c7_b1a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1679_c11_dad2_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1679_c7_b1a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1679_c11_dad2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1682_c7_901e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1682_c11_eda0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1682_c7_901e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1682_c11_eda0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c7_901e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1682_c11_eda0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1682_c7_901e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1682_c11_eda0_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1682_c7_901e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1682_c11_eda0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1688_c7_b4df_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1688_c11_475a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1688_c7_b4df_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1688_c11_475a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1688_c7_b4df_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1688_c11_475a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1688_c7_b4df_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1688_c11_475a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1692_c7_0099_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1692_c11_346b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1692_c7_0099_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1692_c11_346b_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1663_c7_d212_iftrue := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1668_c21_e4cc_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1670_c7_5b08_iftrue := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1672_c21_5574_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1683_c3_49f2_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1683_l1675_DUPLICATE_b079_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1676_c3_ae35_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1683_l1675_DUPLICATE_b079_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c2_0f6d_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1663_l1654_l1660_DUPLICATE_a248_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1660_c7_49ad_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1663_l1654_l1660_DUPLICATE_a248_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1663_c7_d212_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1663_l1654_l1660_DUPLICATE_a248_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1654_c2_0f6d_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1679_l1654_l1660_DUPLICATE_b55b_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1660_c7_49ad_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1679_l1654_l1660_DUPLICATE_b55b_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1679_c7_b1a1_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1679_l1654_l1660_DUPLICATE_b55b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1660_c7_49ad_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1682_l1679_l1674_l1670_l1663_l1692_l1660_l1688_DUPLICATE_7868_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_d212_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1682_l1679_l1674_l1670_l1663_l1692_l1660_l1688_DUPLICATE_7868_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1670_c7_5b08_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1682_l1679_l1674_l1670_l1663_l1692_l1660_l1688_DUPLICATE_7868_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_169e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1682_l1679_l1674_l1670_l1663_l1692_l1660_l1688_DUPLICATE_7868_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1679_c7_b1a1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1682_l1679_l1674_l1670_l1663_l1692_l1660_l1688_DUPLICATE_7868_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1682_c7_901e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1682_l1679_l1674_l1670_l1663_l1692_l1660_l1688_DUPLICATE_7868_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1688_c7_b4df_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1682_l1679_l1674_l1670_l1663_l1692_l1660_l1688_DUPLICATE_7868_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1692_c7_0099_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1682_l1679_l1674_l1670_l1663_l1692_l1660_l1688_DUPLICATE_7868_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1654_c2_0f6d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1654_l1670_l1660_DUPLICATE_bf59_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1660_c7_49ad_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1654_l1670_l1660_DUPLICATE_bf59_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1670_c7_5b08_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1654_l1670_l1660_DUPLICATE_bf59_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1660_c7_49ad_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1663_l1660_DUPLICATE_41c8_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1663_c7_d212_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1663_l1660_DUPLICATE_41c8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1654_c2_0f6d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1654_l1679_l1674_l1670_l1663_l1692_l1660_l1688_DUPLICATE_dc09_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1660_c7_49ad_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1654_l1679_l1674_l1670_l1663_l1692_l1660_l1688_DUPLICATE_dc09_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_d212_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1654_l1679_l1674_l1670_l1663_l1692_l1660_l1688_DUPLICATE_dc09_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1670_c7_5b08_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1654_l1679_l1674_l1670_l1663_l1692_l1660_l1688_DUPLICATE_dc09_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_169e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1654_l1679_l1674_l1670_l1663_l1692_l1660_l1688_DUPLICATE_dc09_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1679_c7_b1a1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1654_l1679_l1674_l1670_l1663_l1692_l1660_l1688_DUPLICATE_dc09_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1688_c7_b4df_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1654_l1679_l1674_l1670_l1663_l1692_l1660_l1688_DUPLICATE_dc09_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1692_c7_0099_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1654_l1679_l1674_l1670_l1663_l1692_l1660_l1688_DUPLICATE_dc09_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_d212_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1679_l1674_l1670_l1663_l1688_DUPLICATE_2f5a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1670_c7_5b08_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1679_l1674_l1670_l1663_l1688_DUPLICATE_2f5a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1674_c7_169e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1679_l1674_l1670_l1663_l1688_DUPLICATE_2f5a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1679_c7_b1a1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1679_l1674_l1670_l1663_l1688_DUPLICATE_2f5a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1688_c7_b4df_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1679_l1674_l1670_l1663_l1688_DUPLICATE_2f5a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1654_c2_0f6d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1654_l1679_l1674_l1670_l1663_l1660_l1688_DUPLICATE_d7e7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1660_c7_49ad_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1654_l1679_l1674_l1670_l1663_l1660_l1688_DUPLICATE_d7e7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1663_c7_d212_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1654_l1679_l1674_l1670_l1663_l1660_l1688_DUPLICATE_d7e7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1670_c7_5b08_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1654_l1679_l1674_l1670_l1663_l1660_l1688_DUPLICATE_d7e7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1674_c7_169e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1654_l1679_l1674_l1670_l1663_l1660_l1688_DUPLICATE_d7e7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1679_c7_b1a1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1654_l1679_l1674_l1670_l1663_l1660_l1688_DUPLICATE_d7e7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1688_c7_b4df_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1654_l1679_l1674_l1670_l1663_l1660_l1688_DUPLICATE_d7e7_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1692_c7_0099] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1692_c7_0099_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1692_c7_0099_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1692_c7_0099_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1692_c7_0099_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1692_c7_0099_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1692_c7_0099_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1692_c7_0099_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1692_c7_0099_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1670_c7_5b08] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1670_c7_5b08_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1670_c7_5b08_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1670_c7_5b08_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1670_c7_5b08_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1670_c7_5b08_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1670_c7_5b08_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1670_c7_5b08_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1670_c7_5b08_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1690_c24_d5e1] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1690_c24_d5e1_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1690_c34_1a41_return_output);

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1692_c7_0099] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1692_c7_0099_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1692_c7_0099_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1692_c7_0099_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1692_c7_0099_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1692_c7_0099_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1692_c7_0099_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1692_c7_0099_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1692_c7_0099_return_output;

     -- CAST_TO_uint16_t[uxn_opcodes_h_l1680_c21_6e95] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1680_c21_6e95_return_output := CAST_TO_uint16_t_uint9_t(
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1680_c32_0ea8_return_output);

     -- CONST_SL_8[uxn_opcodes_h_l1676_c3_ae35] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1676_c3_ae35_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1676_c3_ae35_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1676_c3_ae35_return_output := CONST_SL_8_uxn_opcodes_h_l1676_c3_ae35_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1688_c7_b4df] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1688_c7_b4df_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1688_c7_b4df_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1688_c7_b4df_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1688_c7_b4df_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1688_c7_b4df_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1688_c7_b4df_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1688_c7_b4df_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1688_c7_b4df_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1663_c7_d212] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1663_c7_d212_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1663_c7_d212_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1663_c7_d212_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1663_c7_d212_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1663_c7_d212_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1663_c7_d212_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1663_c7_d212_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1663_c7_d212_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1683_c3_49f2] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1683_c3_49f2_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1683_c3_49f2_left;
     BIN_OP_OR_uxn_opcodes_h_l1683_c3_49f2_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1683_c3_49f2_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1683_c3_49f2_return_output := BIN_OP_OR_uxn_opcodes_h_l1683_c3_49f2_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1654_c1_595b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1654_c1_595b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1654_c1_595b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1654_c1_595b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1654_c1_595b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1654_c1_595b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1654_c1_595b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1654_c1_595b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1654_c1_595b_return_output;

     -- CAST_TO_uint16_t[uxn_opcodes_h_l1677_c21_1723] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1677_c21_1723_return_output := CAST_TO_uint16_t_uint9_t(
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1677_c32_d738_return_output);

     -- BIN_OP_GT[uxn_opcodes_h_l1667_c32_b4f7] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1667_c32_b4f7_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1667_c32_b4f7_left;
     BIN_OP_GT_uxn_opcodes_h_l1667_c32_b4f7_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1667_c32_b4f7_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1667_c32_b4f7_return_output := BIN_OP_GT_uxn_opcodes_h_l1667_c32_b4f7_return_output;

     -- t8_MUX[uxn_opcodes_h_l1663_c7_d212] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1663_c7_d212_cond <= VAR_t8_MUX_uxn_opcodes_h_l1663_c7_d212_cond;
     t8_MUX_uxn_opcodes_h_l1663_c7_d212_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1663_c7_d212_iftrue;
     t8_MUX_uxn_opcodes_h_l1663_c7_d212_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1663_c7_d212_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1663_c7_d212_return_output := t8_MUX_uxn_opcodes_h_l1663_c7_d212_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1667_c32_c5aa_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1667_c32_b4f7_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1682_c7_901e_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1683_c3_49f2_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1674_c7_169e_iftrue := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1677_c21_1723_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1679_c7_b1a1_iftrue := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1680_c21_6e95_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1688_c7_b4df_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1690_c24_d5e1_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1674_c7_169e_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1676_c3_ae35_return_output;
     VAR_printf_uxn_opcodes_h_l1655_c3_57d1_uxn_opcodes_h_l1655_c3_57d1_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1654_c1_595b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1688_c7_b4df_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1692_c7_0099_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1663_c7_d212_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1670_c7_5b08_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1660_c7_49ad_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1663_c7_d212_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1688_c7_b4df_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1692_c7_0099_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c7_901e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1688_c7_b4df_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1660_c7_49ad_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1663_c7_d212_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1663_c7_d212] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1663_c7_d212_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1663_c7_d212_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1663_c7_d212_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1663_c7_d212_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1663_c7_d212_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1663_c7_d212_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1663_c7_d212_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1663_c7_d212_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1682_c7_901e] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1682_c7_901e_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1682_c7_901e_cond;
     tmp16_MUX_uxn_opcodes_h_l1682_c7_901e_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1682_c7_901e_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1682_c7_901e_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1682_c7_901e_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1682_c7_901e_return_output := tmp16_MUX_uxn_opcodes_h_l1682_c7_901e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1688_c7_b4df] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1688_c7_b4df_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1688_c7_b4df_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1688_c7_b4df_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1688_c7_b4df_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1688_c7_b4df_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1688_c7_b4df_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1688_c7_b4df_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1688_c7_b4df_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1688_c7_b4df] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1688_c7_b4df_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1688_c7_b4df_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1688_c7_b4df_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1688_c7_b4df_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1688_c7_b4df_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1688_c7_b4df_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1688_c7_b4df_return_output := result_stack_value_MUX_uxn_opcodes_h_l1688_c7_b4df_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1686_c24_bf20] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1686_c24_bf20_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_OR_uxn_opcodes_h_l1683_c3_49f2_return_output);

     -- MUX[uxn_opcodes_h_l1667_c32_c5aa] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1667_c32_c5aa_cond <= VAR_MUX_uxn_opcodes_h_l1667_c32_c5aa_cond;
     MUX_uxn_opcodes_h_l1667_c32_c5aa_iftrue <= VAR_MUX_uxn_opcodes_h_l1667_c32_c5aa_iftrue;
     MUX_uxn_opcodes_h_l1667_c32_c5aa_iffalse <= VAR_MUX_uxn_opcodes_h_l1667_c32_c5aa_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1667_c32_c5aa_return_output := MUX_uxn_opcodes_h_l1667_c32_c5aa_return_output;

     -- printf_uxn_opcodes_h_l1655_c3_57d1[uxn_opcodes_h_l1655_c3_57d1] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1655_c3_57d1_uxn_opcodes_h_l1655_c3_57d1_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1655_c3_57d1_uxn_opcodes_h_l1655_c3_57d1_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1660_c7_49ad] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1660_c7_49ad_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1660_c7_49ad_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1660_c7_49ad_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1660_c7_49ad_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1660_c7_49ad_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1660_c7_49ad_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1660_c7_49ad_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1660_c7_49ad_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1679_c7_b1a1] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1679_c7_b1a1_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1679_c7_b1a1_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1679_c7_b1a1_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1679_c7_b1a1_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1679_c7_b1a1_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1679_c7_b1a1_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1679_c7_b1a1_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1679_c7_b1a1_return_output;

     -- t8_MUX[uxn_opcodes_h_l1660_c7_49ad] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1660_c7_49ad_cond <= VAR_t8_MUX_uxn_opcodes_h_l1660_c7_49ad_cond;
     t8_MUX_uxn_opcodes_h_l1660_c7_49ad_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1660_c7_49ad_iftrue;
     t8_MUX_uxn_opcodes_h_l1660_c7_49ad_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1660_c7_49ad_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1660_c7_49ad_return_output := t8_MUX_uxn_opcodes_h_l1660_c7_49ad_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1682_c7_901e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c7_901e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c7_901e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c7_901e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c7_901e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c7_901e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c7_901e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c7_901e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c7_901e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1688_c7_b4df] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1688_c7_b4df_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1688_c7_b4df_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1688_c7_b4df_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1688_c7_b4df_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1688_c7_b4df_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1688_c7_b4df_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1688_c7_b4df_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1688_c7_b4df_return_output;

     -- Submodule level 3
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1682_c7_901e_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1686_c24_bf20_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1663_c7_d212_iftrue := VAR_MUX_uxn_opcodes_h_l1667_c32_c5aa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1682_c7_901e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1688_c7_b4df_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1660_c7_49ad_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1663_c7_d212_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1654_c2_0f6d_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1660_c7_49ad_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1682_c7_901e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1688_c7_b4df_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1674_c7_169e_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1679_c7_b1a1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1679_c7_b1a1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1682_c7_901e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1682_c7_901e_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1688_c7_b4df_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1654_c2_0f6d_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1660_c7_49ad_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1679_c7_b1a1_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1682_c7_901e_return_output;
     -- t8_MUX[uxn_opcodes_h_l1654_c2_0f6d] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1654_c2_0f6d_cond <= VAR_t8_MUX_uxn_opcodes_h_l1654_c2_0f6d_cond;
     t8_MUX_uxn_opcodes_h_l1654_c2_0f6d_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1654_c2_0f6d_iftrue;
     t8_MUX_uxn_opcodes_h_l1654_c2_0f6d_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1654_c2_0f6d_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1654_c2_0f6d_return_output := t8_MUX_uxn_opcodes_h_l1654_c2_0f6d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1682_c7_901e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1682_c7_901e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1682_c7_901e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1682_c7_901e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1682_c7_901e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1682_c7_901e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1682_c7_901e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1682_c7_901e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1682_c7_901e_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1682_c7_901e] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1682_c7_901e_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1682_c7_901e_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1682_c7_901e_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1682_c7_901e_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1682_c7_901e_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1682_c7_901e_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1682_c7_901e_return_output := result_stack_value_MUX_uxn_opcodes_h_l1682_c7_901e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1682_c7_901e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1682_c7_901e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1682_c7_901e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1682_c7_901e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1682_c7_901e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1682_c7_901e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1682_c7_901e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1682_c7_901e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1682_c7_901e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1663_c7_d212] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1663_c7_d212_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1663_c7_d212_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1663_c7_d212_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1663_c7_d212_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1663_c7_d212_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1663_c7_d212_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1663_c7_d212_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1663_c7_d212_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1654_c2_0f6d] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1654_c2_0f6d_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1654_c2_0f6d_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1654_c2_0f6d_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1654_c2_0f6d_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1654_c2_0f6d_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1654_c2_0f6d_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1654_c2_0f6d_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1654_c2_0f6d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1660_c7_49ad] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1660_c7_49ad_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1660_c7_49ad_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1660_c7_49ad_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1660_c7_49ad_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1660_c7_49ad_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1660_c7_49ad_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1660_c7_49ad_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1660_c7_49ad_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1679_c7_b1a1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1679_c7_b1a1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1679_c7_b1a1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1679_c7_b1a1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1679_c7_b1a1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1679_c7_b1a1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1679_c7_b1a1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1679_c7_b1a1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1679_c7_b1a1_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1679_c7_b1a1] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1679_c7_b1a1_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1679_c7_b1a1_cond;
     tmp16_MUX_uxn_opcodes_h_l1679_c7_b1a1_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1679_c7_b1a1_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1679_c7_b1a1_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1679_c7_b1a1_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1679_c7_b1a1_return_output := tmp16_MUX_uxn_opcodes_h_l1679_c7_b1a1_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1674_c7_169e] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1674_c7_169e_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1674_c7_169e_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1674_c7_169e_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1674_c7_169e_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1674_c7_169e_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1674_c7_169e_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1674_c7_169e_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1674_c7_169e_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1679_c7_b1a1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1682_c7_901e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1654_c2_0f6d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1660_c7_49ad_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1679_c7_b1a1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1682_c7_901e_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1670_c7_5b08_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1674_c7_169e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1660_c7_49ad_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1663_c7_d212_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1674_c7_169e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1679_c7_b1a1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1679_c7_b1a1_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1682_c7_901e_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1654_c2_0f6d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1674_c7_169e_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1679_c7_b1a1_return_output;
     -- result_ram_addr_MUX[uxn_opcodes_h_l1670_c7_5b08] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1670_c7_5b08_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1670_c7_5b08_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1670_c7_5b08_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1670_c7_5b08_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1670_c7_5b08_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1670_c7_5b08_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1670_c7_5b08_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1670_c7_5b08_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1679_c7_b1a1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1679_c7_b1a1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1679_c7_b1a1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1679_c7_b1a1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1679_c7_b1a1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1679_c7_b1a1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1679_c7_b1a1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1679_c7_b1a1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1679_c7_b1a1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1674_c7_169e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1674_c7_169e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1674_c7_169e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1674_c7_169e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1674_c7_169e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1674_c7_169e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1674_c7_169e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1674_c7_169e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1674_c7_169e_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1674_c7_169e] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1674_c7_169e_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1674_c7_169e_cond;
     tmp16_MUX_uxn_opcodes_h_l1674_c7_169e_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1674_c7_169e_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1674_c7_169e_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1674_c7_169e_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1674_c7_169e_return_output := tmp16_MUX_uxn_opcodes_h_l1674_c7_169e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1679_c7_b1a1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1679_c7_b1a1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1679_c7_b1a1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1679_c7_b1a1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1679_c7_b1a1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1679_c7_b1a1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1679_c7_b1a1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1679_c7_b1a1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1679_c7_b1a1_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1660_c7_49ad] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1660_c7_49ad_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1660_c7_49ad_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1660_c7_49ad_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1660_c7_49ad_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1660_c7_49ad_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1660_c7_49ad_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1660_c7_49ad_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1660_c7_49ad_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1654_c2_0f6d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1654_c2_0f6d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1654_c2_0f6d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1654_c2_0f6d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1654_c2_0f6d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1654_c2_0f6d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1654_c2_0f6d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1654_c2_0f6d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1654_c2_0f6d_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1679_c7_b1a1] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1679_c7_b1a1_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1679_c7_b1a1_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1679_c7_b1a1_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1679_c7_b1a1_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1679_c7_b1a1_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1679_c7_b1a1_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1679_c7_b1a1_return_output := result_stack_value_MUX_uxn_opcodes_h_l1679_c7_b1a1_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_169e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1679_c7_b1a1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_169e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1679_c7_b1a1_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1663_c7_d212_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1670_c7_5b08_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c2_0f6d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1660_c7_49ad_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1670_c7_5b08_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1674_c7_169e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1674_c7_169e_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1679_c7_b1a1_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1670_c7_5b08_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1674_c7_169e_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1674_c7_169e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_169e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_169e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_169e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_169e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_169e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_169e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_169e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_169e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1670_c7_5b08] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1670_c7_5b08_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1670_c7_5b08_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1670_c7_5b08_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1670_c7_5b08_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1670_c7_5b08_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1670_c7_5b08_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1670_c7_5b08_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1670_c7_5b08_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1663_c7_d212] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1663_c7_d212_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1663_c7_d212_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1663_c7_d212_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1663_c7_d212_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1663_c7_d212_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1663_c7_d212_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1663_c7_d212_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1663_c7_d212_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1674_c7_169e] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1674_c7_169e_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1674_c7_169e_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1674_c7_169e_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1674_c7_169e_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1674_c7_169e_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1674_c7_169e_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1674_c7_169e_return_output := result_stack_value_MUX_uxn_opcodes_h_l1674_c7_169e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1654_c2_0f6d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c2_0f6d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c2_0f6d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c2_0f6d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c2_0f6d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c2_0f6d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c2_0f6d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c2_0f6d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c2_0f6d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1674_c7_169e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_169e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_169e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_169e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_169e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_169e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_169e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_169e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_169e_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1670_c7_5b08] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1670_c7_5b08_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1670_c7_5b08_cond;
     tmp16_MUX_uxn_opcodes_h_l1670_c7_5b08_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1670_c7_5b08_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1670_c7_5b08_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1670_c7_5b08_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1670_c7_5b08_return_output := tmp16_MUX_uxn_opcodes_h_l1670_c7_5b08_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1670_c7_5b08_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1674_c7_169e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1670_c7_5b08_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1674_c7_169e_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1660_c7_49ad_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1663_c7_d212_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_d212_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1670_c7_5b08_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1670_c7_5b08_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1674_c7_169e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1663_c7_d212_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1670_c7_5b08_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1663_c7_d212] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1663_c7_d212_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1663_c7_d212_cond;
     tmp16_MUX_uxn_opcodes_h_l1663_c7_d212_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1663_c7_d212_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1663_c7_d212_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1663_c7_d212_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1663_c7_d212_return_output := tmp16_MUX_uxn_opcodes_h_l1663_c7_d212_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1670_c7_5b08] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1670_c7_5b08_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1670_c7_5b08_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1670_c7_5b08_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1670_c7_5b08_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1670_c7_5b08_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1670_c7_5b08_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1670_c7_5b08_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1670_c7_5b08_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1660_c7_49ad] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1660_c7_49ad_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1660_c7_49ad_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1660_c7_49ad_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1660_c7_49ad_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1660_c7_49ad_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1660_c7_49ad_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1660_c7_49ad_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1660_c7_49ad_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1670_c7_5b08] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1670_c7_5b08_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1670_c7_5b08_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1670_c7_5b08_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1670_c7_5b08_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1670_c7_5b08_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1670_c7_5b08_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1670_c7_5b08_return_output := result_stack_value_MUX_uxn_opcodes_h_l1670_c7_5b08_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1670_c7_5b08] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1670_c7_5b08_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1670_c7_5b08_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1670_c7_5b08_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1670_c7_5b08_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1670_c7_5b08_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1670_c7_5b08_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1670_c7_5b08_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1670_c7_5b08_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1663_c7_d212] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_d212_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_d212_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_d212_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_d212_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_d212_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_d212_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_d212_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_d212_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_d212_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1670_c7_5b08_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_d212_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1670_c7_5b08_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1654_c2_0f6d_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1660_c7_49ad_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1660_c7_49ad_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_d212_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1663_c7_d212_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1670_c7_5b08_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1660_c7_49ad_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1663_c7_d212_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1663_c7_d212] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_d212_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_d212_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_d212_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_d212_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_d212_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_d212_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_d212_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_d212_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1654_c2_0f6d] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1654_c2_0f6d_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1654_c2_0f6d_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1654_c2_0f6d_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1654_c2_0f6d_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1654_c2_0f6d_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1654_c2_0f6d_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1654_c2_0f6d_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1654_c2_0f6d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1663_c7_d212] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_d212_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_d212_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_d212_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_d212_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_d212_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_d212_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_d212_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_d212_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1663_c7_d212] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1663_c7_d212_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1663_c7_d212_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1663_c7_d212_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1663_c7_d212_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1663_c7_d212_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1663_c7_d212_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1663_c7_d212_return_output := result_stack_value_MUX_uxn_opcodes_h_l1663_c7_d212_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1660_c7_49ad] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1660_c7_49ad_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1660_c7_49ad_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1660_c7_49ad_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1660_c7_49ad_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1660_c7_49ad_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1660_c7_49ad_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1660_c7_49ad_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1660_c7_49ad_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1660_c7_49ad] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1660_c7_49ad_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1660_c7_49ad_cond;
     tmp16_MUX_uxn_opcodes_h_l1660_c7_49ad_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1660_c7_49ad_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1660_c7_49ad_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1660_c7_49ad_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1660_c7_49ad_return_output := tmp16_MUX_uxn_opcodes_h_l1660_c7_49ad_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1660_c7_49ad_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_d212_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1660_c7_49ad_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_d212_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c2_0f6d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1660_c7_49ad_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1660_c7_49ad_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1663_c7_d212_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1654_c2_0f6d_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1660_c7_49ad_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1660_c7_49ad] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1660_c7_49ad_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1660_c7_49ad_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1660_c7_49ad_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1660_c7_49ad_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1660_c7_49ad_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1660_c7_49ad_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1660_c7_49ad_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1660_c7_49ad_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1654_c2_0f6d] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1654_c2_0f6d_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1654_c2_0f6d_cond;
     tmp16_MUX_uxn_opcodes_h_l1654_c2_0f6d_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1654_c2_0f6d_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1654_c2_0f6d_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1654_c2_0f6d_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1654_c2_0f6d_return_output := tmp16_MUX_uxn_opcodes_h_l1654_c2_0f6d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1660_c7_49ad] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1660_c7_49ad_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1660_c7_49ad_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1660_c7_49ad_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1660_c7_49ad_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1660_c7_49ad_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1660_c7_49ad_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1660_c7_49ad_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1660_c7_49ad_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1654_c2_0f6d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c2_0f6d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c2_0f6d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c2_0f6d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c2_0f6d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c2_0f6d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c2_0f6d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c2_0f6d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c2_0f6d_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1660_c7_49ad] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1660_c7_49ad_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1660_c7_49ad_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1660_c7_49ad_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1660_c7_49ad_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1660_c7_49ad_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1660_c7_49ad_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1660_c7_49ad_return_output := result_stack_value_MUX_uxn_opcodes_h_l1660_c7_49ad_return_output;

     -- Submodule level 9
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1654_c2_0f6d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1660_c7_49ad_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1654_c2_0f6d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1660_c7_49ad_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1654_c2_0f6d_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1660_c7_49ad_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l1654_c2_0f6d_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1654_c2_0f6d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1654_c2_0f6d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1654_c2_0f6d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1654_c2_0f6d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1654_c2_0f6d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1654_c2_0f6d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1654_c2_0f6d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1654_c2_0f6d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1654_c2_0f6d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1654_c2_0f6d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1654_c2_0f6d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1654_c2_0f6d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1654_c2_0f6d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1654_c2_0f6d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1654_c2_0f6d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1654_c2_0f6d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1654_c2_0f6d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1654_c2_0f6d_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1654_c2_0f6d] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1654_c2_0f6d_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1654_c2_0f6d_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1654_c2_0f6d_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1654_c2_0f6d_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1654_c2_0f6d_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1654_c2_0f6d_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1654_c2_0f6d_return_output := result_stack_value_MUX_uxn_opcodes_h_l1654_c2_0f6d_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_2155_uxn_opcodes_h_l1697_l1649_DUPLICATE_1c2a LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_2155_uxn_opcodes_h_l1697_l1649_DUPLICATE_1c2a_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_2155(
     result,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1654_c2_0f6d_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c2_0f6d_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1654_c2_0f6d_return_output,
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1654_c2_0f6d_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1654_c2_0f6d_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c2_0f6d_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1654_c2_0f6d_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1654_c2_0f6d_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_2155_uxn_opcodes_h_l1697_l1649_DUPLICATE_1c2a_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_2155_uxn_opcodes_h_l1697_l1649_DUPLICATE_1c2a_return_output;
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
