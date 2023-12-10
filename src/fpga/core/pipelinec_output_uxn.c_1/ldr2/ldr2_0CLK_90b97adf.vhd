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
-- Submodules: 68
entity ldr2_0CLK_90b97adf is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end ldr2_0CLK_90b97adf;
architecture arch of ldr2_0CLK_90b97adf is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1610_c6_c6e0]
signal BIN_OP_EQ_uxn_opcodes_h_l1610_c6_c6e0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1610_c6_c6e0_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1610_c6_c6e0_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1610_c2_18dc]
signal tmp16_MUX_uxn_opcodes_h_l1610_c2_18dc_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1610_c2_18dc_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1610_c2_18dc_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1610_c2_18dc_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1610_c2_18dc]
signal result_u16_value_MUX_uxn_opcodes_h_l1610_c2_18dc_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1610_c2_18dc_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1610_c2_18dc_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1610_c2_18dc_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1610_c2_18dc]
signal result_u8_value_MUX_uxn_opcodes_h_l1610_c2_18dc_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1610_c2_18dc_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1610_c2_18dc_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1610_c2_18dc_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1610_c2_18dc]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1610_c2_18dc_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1610_c2_18dc_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1610_c2_18dc_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1610_c2_18dc_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1610_c2_18dc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1610_c2_18dc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1610_c2_18dc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1610_c2_18dc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1610_c2_18dc_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1610_c2_18dc]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1610_c2_18dc_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1610_c2_18dc_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1610_c2_18dc_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1610_c2_18dc_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1610_c2_18dc]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1610_c2_18dc_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1610_c2_18dc_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1610_c2_18dc_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1610_c2_18dc_return_output : unsigned(3 downto 0);

-- t8_MUX[uxn_opcodes_h_l1610_c2_18dc]
signal t8_MUX_uxn_opcodes_h_l1610_c2_18dc_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1610_c2_18dc_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1610_c2_18dc_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1610_c2_18dc_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1617_c11_b50b]
signal BIN_OP_EQ_uxn_opcodes_h_l1617_c11_b50b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1617_c11_b50b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1617_c11_b50b_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1617_c7_3d35]
signal tmp16_MUX_uxn_opcodes_h_l1617_c7_3d35_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1617_c7_3d35_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1617_c7_3d35_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1617_c7_3d35_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1617_c7_3d35]
signal result_u16_value_MUX_uxn_opcodes_h_l1617_c7_3d35_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1617_c7_3d35_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1617_c7_3d35_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1617_c7_3d35_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1617_c7_3d35]
signal result_u8_value_MUX_uxn_opcodes_h_l1617_c7_3d35_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1617_c7_3d35_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1617_c7_3d35_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1617_c7_3d35_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1617_c7_3d35]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1617_c7_3d35_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1617_c7_3d35_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1617_c7_3d35_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1617_c7_3d35_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1617_c7_3d35]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1617_c7_3d35_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1617_c7_3d35_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1617_c7_3d35_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1617_c7_3d35_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1617_c7_3d35]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1617_c7_3d35_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1617_c7_3d35_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1617_c7_3d35_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1617_c7_3d35_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1617_c7_3d35]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1617_c7_3d35_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1617_c7_3d35_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1617_c7_3d35_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1617_c7_3d35_return_output : unsigned(3 downto 0);

-- t8_MUX[uxn_opcodes_h_l1617_c7_3d35]
signal t8_MUX_uxn_opcodes_h_l1617_c7_3d35_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1617_c7_3d35_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1617_c7_3d35_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1617_c7_3d35_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1620_c11_6e7d]
signal BIN_OP_EQ_uxn_opcodes_h_l1620_c11_6e7d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1620_c11_6e7d_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1620_c11_6e7d_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1620_c7_b03d]
signal tmp16_MUX_uxn_opcodes_h_l1620_c7_b03d_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1620_c7_b03d_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1620_c7_b03d_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1620_c7_b03d_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1620_c7_b03d]
signal result_u16_value_MUX_uxn_opcodes_h_l1620_c7_b03d_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1620_c7_b03d_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1620_c7_b03d_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1620_c7_b03d_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1620_c7_b03d]
signal result_u8_value_MUX_uxn_opcodes_h_l1620_c7_b03d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1620_c7_b03d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1620_c7_b03d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1620_c7_b03d_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1620_c7_b03d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1620_c7_b03d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1620_c7_b03d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1620_c7_b03d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1620_c7_b03d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1620_c7_b03d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1620_c7_b03d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1620_c7_b03d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1620_c7_b03d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1620_c7_b03d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1620_c7_b03d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1620_c7_b03d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1620_c7_b03d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1620_c7_b03d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1620_c7_b03d_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1620_c7_b03d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1620_c7_b03d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1620_c7_b03d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1620_c7_b03d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1620_c7_b03d_return_output : unsigned(3 downto 0);

-- t8_MUX[uxn_opcodes_h_l1620_c7_b03d]
signal t8_MUX_uxn_opcodes_h_l1620_c7_b03d_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1620_c7_b03d_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1620_c7_b03d_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1620_c7_b03d_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1623_c30_e1e3]
signal sp_relative_shift_uxn_opcodes_h_l1623_c30_e1e3_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1623_c30_e1e3_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1623_c30_e1e3_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1623_c30_e1e3_return_output : signed(3 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1624_c22_28e5]
signal BIN_OP_PLUS_uxn_opcodes_h_l1624_c22_28e5_left : signed(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1624_c22_28e5_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1624_c22_28e5_return_output : signed(17 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1626_c11_33d4]
signal BIN_OP_EQ_uxn_opcodes_h_l1626_c11_33d4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1626_c11_33d4_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1626_c11_33d4_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1626_c7_beb6]
signal tmp16_MUX_uxn_opcodes_h_l1626_c7_beb6_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1626_c7_beb6_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1626_c7_beb6_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1626_c7_beb6_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1626_c7_beb6]
signal result_u16_value_MUX_uxn_opcodes_h_l1626_c7_beb6_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1626_c7_beb6_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1626_c7_beb6_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1626_c7_beb6_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1626_c7_beb6]
signal result_u8_value_MUX_uxn_opcodes_h_l1626_c7_beb6_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1626_c7_beb6_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1626_c7_beb6_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1626_c7_beb6_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1626_c7_beb6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1626_c7_beb6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1626_c7_beb6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1626_c7_beb6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1626_c7_beb6_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1626_c7_beb6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_beb6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_beb6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_beb6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_beb6_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1626_c7_beb6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1626_c7_beb6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1626_c7_beb6_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1626_c7_beb6_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1626_c7_beb6_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1626_c7_beb6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1626_c7_beb6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1626_c7_beb6_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1626_c7_beb6_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1626_c7_beb6_return_output : unsigned(3 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1628_c22_16c4]
signal BIN_OP_PLUS_uxn_opcodes_h_l1628_c22_16c4_left : signed(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1628_c22_16c4_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1628_c22_16c4_return_output : signed(17 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1628_c22_07f9]
signal BIN_OP_PLUS_uxn_opcodes_h_l1628_c22_07f9_left : signed(17 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1628_c22_07f9_right : signed(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1628_c22_07f9_return_output : signed(18 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1630_c11_6f6c]
signal BIN_OP_EQ_uxn_opcodes_h_l1630_c11_6f6c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1630_c11_6f6c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1630_c11_6f6c_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1630_c7_24e2]
signal tmp16_MUX_uxn_opcodes_h_l1630_c7_24e2_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1630_c7_24e2_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1630_c7_24e2_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1630_c7_24e2_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1630_c7_24e2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1630_c7_24e2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1630_c7_24e2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1630_c7_24e2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1630_c7_24e2_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1630_c7_24e2]
signal result_u8_value_MUX_uxn_opcodes_h_l1630_c7_24e2_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1630_c7_24e2_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1630_c7_24e2_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1630_c7_24e2_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1630_c7_24e2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1630_c7_24e2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1630_c7_24e2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1630_c7_24e2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1630_c7_24e2_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1630_c7_24e2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1630_c7_24e2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1630_c7_24e2_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1630_c7_24e2_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1630_c7_24e2_return_output : unsigned(3 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1632_c3_cc89]
signal CONST_SL_8_uxn_opcodes_h_l1632_c3_cc89_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1632_c3_cc89_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1634_c11_fa40]
signal BIN_OP_EQ_uxn_opcodes_h_l1634_c11_fa40_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1634_c11_fa40_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1634_c11_fa40_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1634_c7_0c55]
signal tmp16_MUX_uxn_opcodes_h_l1634_c7_0c55_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1634_c7_0c55_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1634_c7_0c55_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1634_c7_0c55_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1634_c7_0c55]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1634_c7_0c55_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1634_c7_0c55_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1634_c7_0c55_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1634_c7_0c55_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1634_c7_0c55]
signal result_u8_value_MUX_uxn_opcodes_h_l1634_c7_0c55_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1634_c7_0c55_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1634_c7_0c55_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1634_c7_0c55_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1634_c7_0c55]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1634_c7_0c55_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1634_c7_0c55_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1634_c7_0c55_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1634_c7_0c55_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1634_c7_0c55]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1634_c7_0c55_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1634_c7_0c55_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1634_c7_0c55_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1634_c7_0c55_return_output : unsigned(3 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1635_c3_a293]
signal BIN_OP_OR_uxn_opcodes_h_l1635_c3_a293_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1635_c3_a293_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1635_c3_a293_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1640_c11_ee84]
signal BIN_OP_EQ_uxn_opcodes_h_l1640_c11_ee84_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1640_c11_ee84_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1640_c11_ee84_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1640_c7_f60c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1640_c7_f60c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1640_c7_f60c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1640_c7_f60c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1640_c7_f60c_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1640_c7_f60c]
signal result_u8_value_MUX_uxn_opcodes_h_l1640_c7_f60c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1640_c7_f60c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1640_c7_f60c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1640_c7_f60c_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1640_c7_f60c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1640_c7_f60c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1640_c7_f60c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1640_c7_f60c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1640_c7_f60c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1640_c7_f60c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1640_c7_f60c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1640_c7_f60c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1640_c7_f60c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1640_c7_f60c_return_output : unsigned(3 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1642_c31_f1d2]
signal CONST_SR_8_uxn_opcodes_h_l1642_c31_f1d2_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1642_c31_f1d2_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1644_c11_bf03]
signal BIN_OP_EQ_uxn_opcodes_h_l1644_c11_bf03_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1644_c11_bf03_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1644_c11_bf03_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1644_c7_a7d2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1644_c7_a7d2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1644_c7_a7d2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1644_c7_a7d2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1644_c7_a7d2_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1644_c7_a7d2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1644_c7_a7d2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1644_c7_a7d2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1644_c7_a7d2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1644_c7_a7d2_return_output : unsigned(0 downto 0);

function CAST_TO_int8_t_uint8_t( rhs : unsigned) return signed is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : signed(7 downto 0);

begin

      return_output := signed(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_e78e( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : signed;
 ref_toks_6 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.u16_value := ref_toks_1;
      base.u8_value := ref_toks_2;
      base.is_stack_write := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.stack_address_sp_offset := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1610_c6_c6e0
BIN_OP_EQ_uxn_opcodes_h_l1610_c6_c6e0 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1610_c6_c6e0_left,
BIN_OP_EQ_uxn_opcodes_h_l1610_c6_c6e0_right,
BIN_OP_EQ_uxn_opcodes_h_l1610_c6_c6e0_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1610_c2_18dc
tmp16_MUX_uxn_opcodes_h_l1610_c2_18dc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1610_c2_18dc_cond,
tmp16_MUX_uxn_opcodes_h_l1610_c2_18dc_iftrue,
tmp16_MUX_uxn_opcodes_h_l1610_c2_18dc_iffalse,
tmp16_MUX_uxn_opcodes_h_l1610_c2_18dc_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1610_c2_18dc
result_u16_value_MUX_uxn_opcodes_h_l1610_c2_18dc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1610_c2_18dc_cond,
result_u16_value_MUX_uxn_opcodes_h_l1610_c2_18dc_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1610_c2_18dc_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1610_c2_18dc_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1610_c2_18dc
result_u8_value_MUX_uxn_opcodes_h_l1610_c2_18dc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1610_c2_18dc_cond,
result_u8_value_MUX_uxn_opcodes_h_l1610_c2_18dc_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1610_c2_18dc_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1610_c2_18dc_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1610_c2_18dc
result_is_stack_write_MUX_uxn_opcodes_h_l1610_c2_18dc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1610_c2_18dc_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1610_c2_18dc_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1610_c2_18dc_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1610_c2_18dc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1610_c2_18dc
result_is_opc_done_MUX_uxn_opcodes_h_l1610_c2_18dc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1610_c2_18dc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1610_c2_18dc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1610_c2_18dc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1610_c2_18dc_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1610_c2_18dc
result_sp_relative_shift_MUX_uxn_opcodes_h_l1610_c2_18dc : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1610_c2_18dc_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1610_c2_18dc_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1610_c2_18dc_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1610_c2_18dc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1610_c2_18dc
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1610_c2_18dc : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1610_c2_18dc_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1610_c2_18dc_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1610_c2_18dc_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1610_c2_18dc_return_output);

-- t8_MUX_uxn_opcodes_h_l1610_c2_18dc
t8_MUX_uxn_opcodes_h_l1610_c2_18dc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1610_c2_18dc_cond,
t8_MUX_uxn_opcodes_h_l1610_c2_18dc_iftrue,
t8_MUX_uxn_opcodes_h_l1610_c2_18dc_iffalse,
t8_MUX_uxn_opcodes_h_l1610_c2_18dc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1617_c11_b50b
BIN_OP_EQ_uxn_opcodes_h_l1617_c11_b50b : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1617_c11_b50b_left,
BIN_OP_EQ_uxn_opcodes_h_l1617_c11_b50b_right,
BIN_OP_EQ_uxn_opcodes_h_l1617_c11_b50b_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1617_c7_3d35
tmp16_MUX_uxn_opcodes_h_l1617_c7_3d35 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1617_c7_3d35_cond,
tmp16_MUX_uxn_opcodes_h_l1617_c7_3d35_iftrue,
tmp16_MUX_uxn_opcodes_h_l1617_c7_3d35_iffalse,
tmp16_MUX_uxn_opcodes_h_l1617_c7_3d35_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1617_c7_3d35
result_u16_value_MUX_uxn_opcodes_h_l1617_c7_3d35 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1617_c7_3d35_cond,
result_u16_value_MUX_uxn_opcodes_h_l1617_c7_3d35_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1617_c7_3d35_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1617_c7_3d35_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1617_c7_3d35
result_u8_value_MUX_uxn_opcodes_h_l1617_c7_3d35 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1617_c7_3d35_cond,
result_u8_value_MUX_uxn_opcodes_h_l1617_c7_3d35_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1617_c7_3d35_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1617_c7_3d35_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1617_c7_3d35
result_is_stack_write_MUX_uxn_opcodes_h_l1617_c7_3d35 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1617_c7_3d35_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1617_c7_3d35_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1617_c7_3d35_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1617_c7_3d35_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1617_c7_3d35
result_is_opc_done_MUX_uxn_opcodes_h_l1617_c7_3d35 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1617_c7_3d35_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1617_c7_3d35_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1617_c7_3d35_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1617_c7_3d35_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1617_c7_3d35
result_sp_relative_shift_MUX_uxn_opcodes_h_l1617_c7_3d35 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1617_c7_3d35_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1617_c7_3d35_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1617_c7_3d35_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1617_c7_3d35_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1617_c7_3d35
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1617_c7_3d35 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1617_c7_3d35_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1617_c7_3d35_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1617_c7_3d35_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1617_c7_3d35_return_output);

-- t8_MUX_uxn_opcodes_h_l1617_c7_3d35
t8_MUX_uxn_opcodes_h_l1617_c7_3d35 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1617_c7_3d35_cond,
t8_MUX_uxn_opcodes_h_l1617_c7_3d35_iftrue,
t8_MUX_uxn_opcodes_h_l1617_c7_3d35_iffalse,
t8_MUX_uxn_opcodes_h_l1617_c7_3d35_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1620_c11_6e7d
BIN_OP_EQ_uxn_opcodes_h_l1620_c11_6e7d : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1620_c11_6e7d_left,
BIN_OP_EQ_uxn_opcodes_h_l1620_c11_6e7d_right,
BIN_OP_EQ_uxn_opcodes_h_l1620_c11_6e7d_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1620_c7_b03d
tmp16_MUX_uxn_opcodes_h_l1620_c7_b03d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1620_c7_b03d_cond,
tmp16_MUX_uxn_opcodes_h_l1620_c7_b03d_iftrue,
tmp16_MUX_uxn_opcodes_h_l1620_c7_b03d_iffalse,
tmp16_MUX_uxn_opcodes_h_l1620_c7_b03d_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1620_c7_b03d
result_u16_value_MUX_uxn_opcodes_h_l1620_c7_b03d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1620_c7_b03d_cond,
result_u16_value_MUX_uxn_opcodes_h_l1620_c7_b03d_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1620_c7_b03d_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1620_c7_b03d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1620_c7_b03d
result_u8_value_MUX_uxn_opcodes_h_l1620_c7_b03d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1620_c7_b03d_cond,
result_u8_value_MUX_uxn_opcodes_h_l1620_c7_b03d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1620_c7_b03d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1620_c7_b03d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1620_c7_b03d
result_is_stack_write_MUX_uxn_opcodes_h_l1620_c7_b03d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1620_c7_b03d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1620_c7_b03d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1620_c7_b03d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1620_c7_b03d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1620_c7_b03d
result_is_opc_done_MUX_uxn_opcodes_h_l1620_c7_b03d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1620_c7_b03d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1620_c7_b03d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1620_c7_b03d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1620_c7_b03d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1620_c7_b03d
result_sp_relative_shift_MUX_uxn_opcodes_h_l1620_c7_b03d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1620_c7_b03d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1620_c7_b03d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1620_c7_b03d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1620_c7_b03d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1620_c7_b03d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1620_c7_b03d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1620_c7_b03d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1620_c7_b03d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1620_c7_b03d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1620_c7_b03d_return_output);

-- t8_MUX_uxn_opcodes_h_l1620_c7_b03d
t8_MUX_uxn_opcodes_h_l1620_c7_b03d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1620_c7_b03d_cond,
t8_MUX_uxn_opcodes_h_l1620_c7_b03d_iftrue,
t8_MUX_uxn_opcodes_h_l1620_c7_b03d_iffalse,
t8_MUX_uxn_opcodes_h_l1620_c7_b03d_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1623_c30_e1e3
sp_relative_shift_uxn_opcodes_h_l1623_c30_e1e3 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1623_c30_e1e3_ins,
sp_relative_shift_uxn_opcodes_h_l1623_c30_e1e3_x,
sp_relative_shift_uxn_opcodes_h_l1623_c30_e1e3_y,
sp_relative_shift_uxn_opcodes_h_l1623_c30_e1e3_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1624_c22_28e5
BIN_OP_PLUS_uxn_opcodes_h_l1624_c22_28e5 : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1624_c22_28e5_left,
BIN_OP_PLUS_uxn_opcodes_h_l1624_c22_28e5_right,
BIN_OP_PLUS_uxn_opcodes_h_l1624_c22_28e5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1626_c11_33d4
BIN_OP_EQ_uxn_opcodes_h_l1626_c11_33d4 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1626_c11_33d4_left,
BIN_OP_EQ_uxn_opcodes_h_l1626_c11_33d4_right,
BIN_OP_EQ_uxn_opcodes_h_l1626_c11_33d4_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1626_c7_beb6
tmp16_MUX_uxn_opcodes_h_l1626_c7_beb6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1626_c7_beb6_cond,
tmp16_MUX_uxn_opcodes_h_l1626_c7_beb6_iftrue,
tmp16_MUX_uxn_opcodes_h_l1626_c7_beb6_iffalse,
tmp16_MUX_uxn_opcodes_h_l1626_c7_beb6_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1626_c7_beb6
result_u16_value_MUX_uxn_opcodes_h_l1626_c7_beb6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1626_c7_beb6_cond,
result_u16_value_MUX_uxn_opcodes_h_l1626_c7_beb6_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1626_c7_beb6_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1626_c7_beb6_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1626_c7_beb6
result_u8_value_MUX_uxn_opcodes_h_l1626_c7_beb6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1626_c7_beb6_cond,
result_u8_value_MUX_uxn_opcodes_h_l1626_c7_beb6_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1626_c7_beb6_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1626_c7_beb6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1626_c7_beb6
result_is_stack_write_MUX_uxn_opcodes_h_l1626_c7_beb6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1626_c7_beb6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1626_c7_beb6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1626_c7_beb6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1626_c7_beb6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_beb6
result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_beb6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_beb6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_beb6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_beb6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_beb6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1626_c7_beb6
result_sp_relative_shift_MUX_uxn_opcodes_h_l1626_c7_beb6 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1626_c7_beb6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1626_c7_beb6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1626_c7_beb6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1626_c7_beb6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1626_c7_beb6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1626_c7_beb6 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1626_c7_beb6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1626_c7_beb6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1626_c7_beb6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1626_c7_beb6_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1628_c22_16c4
BIN_OP_PLUS_uxn_opcodes_h_l1628_c22_16c4 : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1628_c22_16c4_left,
BIN_OP_PLUS_uxn_opcodes_h_l1628_c22_16c4_right,
BIN_OP_PLUS_uxn_opcodes_h_l1628_c22_16c4_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1628_c22_07f9
BIN_OP_PLUS_uxn_opcodes_h_l1628_c22_07f9 : entity work.BIN_OP_PLUS_int18_t_int2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1628_c22_07f9_left,
BIN_OP_PLUS_uxn_opcodes_h_l1628_c22_07f9_right,
BIN_OP_PLUS_uxn_opcodes_h_l1628_c22_07f9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1630_c11_6f6c
BIN_OP_EQ_uxn_opcodes_h_l1630_c11_6f6c : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1630_c11_6f6c_left,
BIN_OP_EQ_uxn_opcodes_h_l1630_c11_6f6c_right,
BIN_OP_EQ_uxn_opcodes_h_l1630_c11_6f6c_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1630_c7_24e2
tmp16_MUX_uxn_opcodes_h_l1630_c7_24e2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1630_c7_24e2_cond,
tmp16_MUX_uxn_opcodes_h_l1630_c7_24e2_iftrue,
tmp16_MUX_uxn_opcodes_h_l1630_c7_24e2_iffalse,
tmp16_MUX_uxn_opcodes_h_l1630_c7_24e2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1630_c7_24e2
result_is_opc_done_MUX_uxn_opcodes_h_l1630_c7_24e2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1630_c7_24e2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1630_c7_24e2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1630_c7_24e2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1630_c7_24e2_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1630_c7_24e2
result_u8_value_MUX_uxn_opcodes_h_l1630_c7_24e2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1630_c7_24e2_cond,
result_u8_value_MUX_uxn_opcodes_h_l1630_c7_24e2_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1630_c7_24e2_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1630_c7_24e2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1630_c7_24e2
result_is_stack_write_MUX_uxn_opcodes_h_l1630_c7_24e2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1630_c7_24e2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1630_c7_24e2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1630_c7_24e2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1630_c7_24e2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1630_c7_24e2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1630_c7_24e2 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1630_c7_24e2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1630_c7_24e2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1630_c7_24e2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1630_c7_24e2_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1632_c3_cc89
CONST_SL_8_uxn_opcodes_h_l1632_c3_cc89 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1632_c3_cc89_x,
CONST_SL_8_uxn_opcodes_h_l1632_c3_cc89_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1634_c11_fa40
BIN_OP_EQ_uxn_opcodes_h_l1634_c11_fa40 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1634_c11_fa40_left,
BIN_OP_EQ_uxn_opcodes_h_l1634_c11_fa40_right,
BIN_OP_EQ_uxn_opcodes_h_l1634_c11_fa40_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1634_c7_0c55
tmp16_MUX_uxn_opcodes_h_l1634_c7_0c55 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1634_c7_0c55_cond,
tmp16_MUX_uxn_opcodes_h_l1634_c7_0c55_iftrue,
tmp16_MUX_uxn_opcodes_h_l1634_c7_0c55_iffalse,
tmp16_MUX_uxn_opcodes_h_l1634_c7_0c55_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1634_c7_0c55
result_is_opc_done_MUX_uxn_opcodes_h_l1634_c7_0c55 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1634_c7_0c55_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1634_c7_0c55_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1634_c7_0c55_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1634_c7_0c55_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1634_c7_0c55
result_u8_value_MUX_uxn_opcodes_h_l1634_c7_0c55 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1634_c7_0c55_cond,
result_u8_value_MUX_uxn_opcodes_h_l1634_c7_0c55_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1634_c7_0c55_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1634_c7_0c55_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1634_c7_0c55
result_is_stack_write_MUX_uxn_opcodes_h_l1634_c7_0c55 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1634_c7_0c55_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1634_c7_0c55_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1634_c7_0c55_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1634_c7_0c55_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1634_c7_0c55
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1634_c7_0c55 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1634_c7_0c55_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1634_c7_0c55_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1634_c7_0c55_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1634_c7_0c55_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1635_c3_a293
BIN_OP_OR_uxn_opcodes_h_l1635_c3_a293 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1635_c3_a293_left,
BIN_OP_OR_uxn_opcodes_h_l1635_c3_a293_right,
BIN_OP_OR_uxn_opcodes_h_l1635_c3_a293_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1640_c11_ee84
BIN_OP_EQ_uxn_opcodes_h_l1640_c11_ee84 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1640_c11_ee84_left,
BIN_OP_EQ_uxn_opcodes_h_l1640_c11_ee84_right,
BIN_OP_EQ_uxn_opcodes_h_l1640_c11_ee84_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1640_c7_f60c
result_is_opc_done_MUX_uxn_opcodes_h_l1640_c7_f60c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1640_c7_f60c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1640_c7_f60c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1640_c7_f60c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1640_c7_f60c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1640_c7_f60c
result_u8_value_MUX_uxn_opcodes_h_l1640_c7_f60c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1640_c7_f60c_cond,
result_u8_value_MUX_uxn_opcodes_h_l1640_c7_f60c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1640_c7_f60c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1640_c7_f60c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1640_c7_f60c
result_is_stack_write_MUX_uxn_opcodes_h_l1640_c7_f60c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1640_c7_f60c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1640_c7_f60c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1640_c7_f60c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1640_c7_f60c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1640_c7_f60c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1640_c7_f60c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1640_c7_f60c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1640_c7_f60c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1640_c7_f60c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1640_c7_f60c_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1642_c31_f1d2
CONST_SR_8_uxn_opcodes_h_l1642_c31_f1d2 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1642_c31_f1d2_x,
CONST_SR_8_uxn_opcodes_h_l1642_c31_f1d2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1644_c11_bf03
BIN_OP_EQ_uxn_opcodes_h_l1644_c11_bf03 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1644_c11_bf03_left,
BIN_OP_EQ_uxn_opcodes_h_l1644_c11_bf03_right,
BIN_OP_EQ_uxn_opcodes_h_l1644_c11_bf03_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1644_c7_a7d2
result_is_opc_done_MUX_uxn_opcodes_h_l1644_c7_a7d2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1644_c7_a7d2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1644_c7_a7d2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1644_c7_a7d2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1644_c7_a7d2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1644_c7_a7d2
result_is_stack_write_MUX_uxn_opcodes_h_l1644_c7_a7d2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1644_c7_a7d2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1644_c7_a7d2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1644_c7_a7d2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1644_c7_a7d2_return_output);



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
 tmp16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1610_c6_c6e0_return_output,
 tmp16_MUX_uxn_opcodes_h_l1610_c2_18dc_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1610_c2_18dc_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1610_c2_18dc_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1610_c2_18dc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1610_c2_18dc_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1610_c2_18dc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1610_c2_18dc_return_output,
 t8_MUX_uxn_opcodes_h_l1610_c2_18dc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1617_c11_b50b_return_output,
 tmp16_MUX_uxn_opcodes_h_l1617_c7_3d35_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1617_c7_3d35_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1617_c7_3d35_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1617_c7_3d35_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1617_c7_3d35_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1617_c7_3d35_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1617_c7_3d35_return_output,
 t8_MUX_uxn_opcodes_h_l1617_c7_3d35_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1620_c11_6e7d_return_output,
 tmp16_MUX_uxn_opcodes_h_l1620_c7_b03d_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1620_c7_b03d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1620_c7_b03d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1620_c7_b03d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1620_c7_b03d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1620_c7_b03d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1620_c7_b03d_return_output,
 t8_MUX_uxn_opcodes_h_l1620_c7_b03d_return_output,
 sp_relative_shift_uxn_opcodes_h_l1623_c30_e1e3_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1624_c22_28e5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1626_c11_33d4_return_output,
 tmp16_MUX_uxn_opcodes_h_l1626_c7_beb6_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1626_c7_beb6_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1626_c7_beb6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1626_c7_beb6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_beb6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1626_c7_beb6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1626_c7_beb6_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1628_c22_16c4_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1628_c22_07f9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1630_c11_6f6c_return_output,
 tmp16_MUX_uxn_opcodes_h_l1630_c7_24e2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1630_c7_24e2_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1630_c7_24e2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1630_c7_24e2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1630_c7_24e2_return_output,
 CONST_SL_8_uxn_opcodes_h_l1632_c3_cc89_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1634_c11_fa40_return_output,
 tmp16_MUX_uxn_opcodes_h_l1634_c7_0c55_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1634_c7_0c55_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1634_c7_0c55_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1634_c7_0c55_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1634_c7_0c55_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1635_c3_a293_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1640_c11_ee84_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1640_c7_f60c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1640_c7_f60c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1640_c7_f60c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1640_c7_f60c_return_output,
 CONST_SR_8_uxn_opcodes_h_l1642_c31_f1d2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1644_c11_bf03_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1644_c7_a7d2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1644_c7_a7d2_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1610_c6_c6e0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1610_c6_c6e0_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1610_c6_c6e0_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1610_c2_18dc_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1610_c2_18dc_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1617_c7_3d35_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1610_c2_18dc_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1610_c2_18dc_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1610_c2_18dc_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1610_c2_18dc_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1617_c7_3d35_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1610_c2_18dc_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1610_c2_18dc_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1610_c2_18dc_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1610_c2_18dc_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1617_c7_3d35_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1610_c2_18dc_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1610_c2_18dc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1610_c2_18dc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1610_c2_18dc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1617_c7_3d35_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1610_c2_18dc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1610_c2_18dc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1610_c2_18dc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1610_c2_18dc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1617_c7_3d35_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1610_c2_18dc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1610_c2_18dc_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1610_c2_18dc_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1610_c2_18dc_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1617_c7_3d35_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1610_c2_18dc_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1610_c2_18dc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1610_c2_18dc_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1614_c3_8c4a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1610_c2_18dc_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1617_c7_3d35_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1610_c2_18dc_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1610_c2_18dc_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1610_c2_18dc_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1610_c2_18dc_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1617_c7_3d35_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1610_c2_18dc_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1610_c2_18dc_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1617_c11_b50b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1617_c11_b50b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1617_c11_b50b_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1617_c7_3d35_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1617_c7_3d35_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1620_c7_b03d_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1617_c7_3d35_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1617_c7_3d35_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1617_c7_3d35_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1620_c7_b03d_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1617_c7_3d35_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1617_c7_3d35_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1617_c7_3d35_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1620_c7_b03d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1617_c7_3d35_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1617_c7_3d35_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1617_c7_3d35_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1620_c7_b03d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1617_c7_3d35_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1617_c7_3d35_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1617_c7_3d35_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1620_c7_b03d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1617_c7_3d35_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1617_c7_3d35_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1617_c7_3d35_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1620_c7_b03d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1617_c7_3d35_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1617_c7_3d35_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1618_c3_bf40 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1617_c7_3d35_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1620_c7_b03d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1617_c7_3d35_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1617_c7_3d35_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1617_c7_3d35_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1620_c7_b03d_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1617_c7_3d35_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1620_c11_6e7d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1620_c11_6e7d_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1620_c11_6e7d_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1620_c7_b03d_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1620_c7_b03d_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1626_c7_beb6_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1620_c7_b03d_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1620_c7_b03d_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l1624_c3_8f3b : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1620_c7_b03d_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1626_c7_beb6_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1620_c7_b03d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1620_c7_b03d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1620_c7_b03d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1626_c7_beb6_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1620_c7_b03d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1620_c7_b03d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1620_c7_b03d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1626_c7_beb6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1620_c7_b03d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1620_c7_b03d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1620_c7_b03d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_beb6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1620_c7_b03d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1620_c7_b03d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1620_c7_b03d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1626_c7_beb6_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1620_c7_b03d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1620_c7_b03d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1620_c7_b03d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1626_c7_beb6_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1620_c7_b03d_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1620_c7_b03d_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1620_c7_b03d_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1620_c7_b03d_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1623_c30_e1e3_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1623_c30_e1e3_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1623_c30_e1e3_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1623_c30_e1e3_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1624_c22_28e5_left : signed(16 downto 0);
 variable VAR_CAST_TO_int8_t_uxn_opcodes_h_l1624_c27_1812_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1624_c22_28e5_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1624_c22_28e5_return_output : signed(17 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1626_c11_33d4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1626_c11_33d4_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1626_c11_33d4_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1626_c7_beb6_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1626_c7_beb6_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1630_c7_24e2_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1626_c7_beb6_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1626_c7_beb6_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l1628_c3_b4de : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1626_c7_beb6_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1626_c7_beb6_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1626_c7_beb6_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1626_c7_beb6_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1630_c7_24e2_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1626_c7_beb6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1626_c7_beb6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1626_c7_beb6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1630_c7_24e2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1626_c7_beb6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_beb6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_beb6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1630_c7_24e2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_beb6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1626_c7_beb6_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1627_c3_e1ed : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1626_c7_beb6_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1626_c7_beb6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1626_c7_beb6_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1626_c7_beb6_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1630_c7_24e2_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1626_c7_beb6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1628_c22_16c4_left : signed(16 downto 0);
 variable VAR_CAST_TO_int8_t_uxn_opcodes_h_l1628_c27_903a_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1628_c22_16c4_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1628_c22_16c4_return_output : signed(17 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1628_c22_07f9_left : signed(17 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1628_c22_07f9_right : signed(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1628_c22_07f9_return_output : signed(18 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1630_c11_6f6c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1630_c11_6f6c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1630_c11_6f6c_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1630_c7_24e2_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1630_c7_24e2_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1634_c7_0c55_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1630_c7_24e2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1630_c7_24e2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1630_c7_24e2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1634_c7_0c55_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1630_c7_24e2_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1630_c7_24e2_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1630_c7_24e2_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1634_c7_0c55_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1630_c7_24e2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1630_c7_24e2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1630_c7_24e2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1634_c7_0c55_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1630_c7_24e2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1630_c7_24e2_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1630_c7_24e2_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1634_c7_0c55_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1630_c7_24e2_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1632_c3_cc89_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1632_c3_cc89_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1634_c11_fa40_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1634_c11_fa40_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1634_c11_fa40_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1634_c7_0c55_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1634_c7_0c55_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1634_c7_0c55_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1634_c7_0c55_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1634_c7_0c55_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1640_c7_f60c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1634_c7_0c55_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1634_c7_0c55_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1634_c7_0c55_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1640_c7_f60c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1634_c7_0c55_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1634_c7_0c55_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1634_c7_0c55_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1640_c7_f60c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1634_c7_0c55_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1634_c7_0c55_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1637_c3_4433 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1634_c7_0c55_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1640_c7_f60c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1634_c7_0c55_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1635_c3_a293_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1635_c3_a293_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1635_c3_a293_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1638_c21_2d34_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1640_c11_ee84_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1640_c11_ee84_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1640_c11_ee84_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1640_c7_f60c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1640_c7_f60c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1644_c7_a7d2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1640_c7_f60c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1640_c7_f60c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1640_c7_f60c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1640_c7_f60c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1640_c7_f60c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1640_c7_f60c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1644_c7_a7d2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1640_c7_f60c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1640_c7_f60c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1641_c3_d9d0 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1640_c7_f60c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1640_c7_f60c_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1642_c31_f1d2_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1642_c31_f1d2_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1642_c21_3f75_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1644_c11_bf03_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1644_c11_bf03_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1644_c11_bf03_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1644_c7_a7d2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1644_c7_a7d2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1644_c7_a7d2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1644_c7_a7d2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1644_c7_a7d2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1644_c7_a7d2_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1610_l1626_l1617_DUPLICATE_25b5_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1626_l1620_l1617_l1610_l1640_l1630_DUPLICATE_9395_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1626_l1620_l1617_l1644_l1610_l1640_l1630_DUPLICATE_04e2_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1610_l1626_l1617_DUPLICATE_e251_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1626_l1620_l1617_l1644_l1640_l1634_l1630_DUPLICATE_20d7_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1620_l1626_l1640_l1630_DUPLICATE_9421_return_output : unsigned(3 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1631_l1635_DUPLICATE_6777_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e78e_uxn_opcodes_h_l1649_l1605_DUPLICATE_ace6_return_output : opcode_result_t;
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
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1644_c7_a7d2_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1623_c30_e1e3_y := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1634_c7_0c55_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1637_c3_4433 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1634_c7_0c55_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1637_c3_4433;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1620_c11_6e7d_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1617_c11_b50b_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1618_c3_bf40 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1617_c7_3d35_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1618_c3_bf40;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1627_c3_e1ed := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1626_c7_beb6_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1627_c3_e1ed;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1628_c22_07f9_right := signed(std_logic_vector(resize(to_unsigned(1, 1), 2)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1634_c11_fa40_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1644_c11_bf03_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1610_c6_c6e0_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1626_c11_33d4_right := to_unsigned(3, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1610_c2_18dc_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1644_c7_a7d2_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1641_c3_d9d0 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1640_c7_f60c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1641_c3_d9d0;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1630_c11_6f6c_right := to_unsigned(4, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l1623_c30_e1e3_x := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1640_c11_ee84_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1614_c3_8c4a := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1610_c2_18dc_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1614_c3_8c4a;

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1623_c30_e1e3_ins := VAR_ins;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1624_c22_28e5_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1628_c22_16c4_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1610_c6_c6e0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1617_c11_b50b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1620_c11_6e7d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1626_c11_33d4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1630_c11_6f6c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1634_c11_fa40_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1640_c11_ee84_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1644_c11_bf03_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l1620_c7_b03d_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1610_c2_18dc_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1617_c7_3d35_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1620_c7_b03d_iffalse := t8;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1635_c3_a293_left := tmp16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1642_c31_f1d2_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1610_c2_18dc_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1617_c7_3d35_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1620_c7_b03d_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1626_c7_beb6_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1634_c7_0c55_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l1644_c11_bf03] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1644_c11_bf03_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1644_c11_bf03_left;
     BIN_OP_EQ_uxn_opcodes_h_l1644_c11_bf03_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1644_c11_bf03_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1644_c11_bf03_return_output := BIN_OP_EQ_uxn_opcodes_h_l1644_c11_bf03_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l1642_c31_f1d2] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1642_c31_f1d2_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1642_c31_f1d2_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1642_c31_f1d2_return_output := CONST_SR_8_uxn_opcodes_h_l1642_c31_f1d2_return_output;

     -- CAST_TO_int8_t[uxn_opcodes_h_l1628_c27_903a] LATENCY=0
     VAR_CAST_TO_int8_t_uxn_opcodes_h_l1628_c27_903a_return_output := CAST_TO_int8_t_uint8_t(
     t8);

     -- BIN_OP_EQ[uxn_opcodes_h_l1640_c11_ee84] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1640_c11_ee84_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1640_c11_ee84_left;
     BIN_OP_EQ_uxn_opcodes_h_l1640_c11_ee84_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1640_c11_ee84_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1640_c11_ee84_return_output := BIN_OP_EQ_uxn_opcodes_h_l1640_c11_ee84_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1626_l1620_l1617_l1610_l1640_l1630_DUPLICATE_9395 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1626_l1620_l1617_l1610_l1640_l1630_DUPLICATE_9395_return_output := result.u8_value;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1620_l1626_l1640_l1630_DUPLICATE_9421 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1620_l1626_l1640_l1630_DUPLICATE_9421_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1610_l1626_l1617_DUPLICATE_25b5 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1610_l1626_l1617_DUPLICATE_25b5_return_output := result.u16_value;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1631_l1635_DUPLICATE_6777 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1631_l1635_DUPLICATE_6777_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1620_c11_6e7d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1620_c11_6e7d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1620_c11_6e7d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1620_c11_6e7d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1620_c11_6e7d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1620_c11_6e7d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1620_c11_6e7d_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1626_l1620_l1617_l1644_l1640_l1634_l1630_DUPLICATE_20d7 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1626_l1620_l1617_l1644_l1640_l1634_l1630_DUPLICATE_20d7_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1617_c11_b50b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1617_c11_b50b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1617_c11_b50b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1617_c11_b50b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1617_c11_b50b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1617_c11_b50b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1617_c11_b50b_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l1623_c30_e1e3] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1623_c30_e1e3_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1623_c30_e1e3_ins;
     sp_relative_shift_uxn_opcodes_h_l1623_c30_e1e3_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1623_c30_e1e3_x;
     sp_relative_shift_uxn_opcodes_h_l1623_c30_e1e3_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1623_c30_e1e3_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1623_c30_e1e3_return_output := sp_relative_shift_uxn_opcodes_h_l1623_c30_e1e3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1630_c11_6f6c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1630_c11_6f6c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1630_c11_6f6c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1630_c11_6f6c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1630_c11_6f6c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1630_c11_6f6c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1630_c11_6f6c_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1610_l1626_l1617_DUPLICATE_e251 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1610_l1626_l1617_DUPLICATE_e251_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1626_c11_33d4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1626_c11_33d4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1626_c11_33d4_left;
     BIN_OP_EQ_uxn_opcodes_h_l1626_c11_33d4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1626_c11_33d4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1626_c11_33d4_return_output := BIN_OP_EQ_uxn_opcodes_h_l1626_c11_33d4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1610_c6_c6e0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1610_c6_c6e0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1610_c6_c6e0_left;
     BIN_OP_EQ_uxn_opcodes_h_l1610_c6_c6e0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1610_c6_c6e0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1610_c6_c6e0_return_output := BIN_OP_EQ_uxn_opcodes_h_l1610_c6_c6e0_return_output;

     -- CAST_TO_int8_t[uxn_opcodes_h_l1624_c27_1812] LATENCY=0
     VAR_CAST_TO_int8_t_uxn_opcodes_h_l1624_c27_1812_return_output := CAST_TO_int8_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1634_c11_fa40] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1634_c11_fa40_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1634_c11_fa40_left;
     BIN_OP_EQ_uxn_opcodes_h_l1634_c11_fa40_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1634_c11_fa40_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1634_c11_fa40_return_output := BIN_OP_EQ_uxn_opcodes_h_l1634_c11_fa40_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1626_l1620_l1617_l1644_l1610_l1640_l1630_DUPLICATE_04e2 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1626_l1620_l1617_l1644_l1610_l1640_l1630_DUPLICATE_04e2_return_output := result.is_stack_write;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1610_c2_18dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1610_c6_c6e0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1610_c2_18dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1610_c6_c6e0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1610_c2_18dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1610_c6_c6e0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1610_c2_18dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1610_c6_c6e0_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1610_c2_18dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1610_c6_c6e0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1610_c2_18dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1610_c6_c6e0_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1610_c2_18dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1610_c6_c6e0_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1610_c2_18dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1610_c6_c6e0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1617_c7_3d35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1617_c11_b50b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1617_c7_3d35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1617_c11_b50b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1617_c7_3d35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1617_c11_b50b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1617_c7_3d35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1617_c11_b50b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1617_c7_3d35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1617_c11_b50b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1617_c7_3d35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1617_c11_b50b_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1617_c7_3d35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1617_c11_b50b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1617_c7_3d35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1617_c11_b50b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1620_c7_b03d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1620_c11_6e7d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1620_c7_b03d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1620_c11_6e7d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1620_c7_b03d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1620_c11_6e7d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1620_c7_b03d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1620_c11_6e7d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1620_c7_b03d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1620_c11_6e7d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1620_c7_b03d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1620_c11_6e7d_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1620_c7_b03d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1620_c11_6e7d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1620_c7_b03d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1620_c11_6e7d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_beb6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1626_c11_33d4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1626_c7_beb6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1626_c11_33d4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1626_c7_beb6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1626_c11_33d4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1626_c7_beb6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1626_c11_33d4_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1626_c7_beb6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1626_c11_33d4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1626_c7_beb6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1626_c11_33d4_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1626_c7_beb6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1626_c11_33d4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1630_c7_24e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1630_c11_6f6c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1630_c7_24e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1630_c11_6f6c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1630_c7_24e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1630_c11_6f6c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1630_c7_24e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1630_c11_6f6c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1630_c7_24e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1630_c11_6f6c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1634_c7_0c55_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1634_c11_fa40_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1634_c7_0c55_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1634_c11_fa40_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1634_c7_0c55_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1634_c11_fa40_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1634_c7_0c55_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1634_c11_fa40_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1634_c7_0c55_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1634_c11_fa40_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1640_c7_f60c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1640_c11_ee84_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1640_c7_f60c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1640_c11_ee84_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1640_c7_f60c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1640_c11_ee84_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1640_c7_f60c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1640_c11_ee84_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1644_c7_a7d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1644_c11_bf03_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1644_c7_a7d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1644_c11_bf03_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1624_c22_28e5_right := VAR_CAST_TO_int8_t_uxn_opcodes_h_l1624_c27_1812_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1628_c22_16c4_right := VAR_CAST_TO_int8_t_uxn_opcodes_h_l1628_c27_903a_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1635_c3_a293_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1631_l1635_DUPLICATE_6777_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1632_c3_cc89_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1631_l1635_DUPLICATE_6777_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1610_c2_18dc_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1610_l1626_l1617_DUPLICATE_e251_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1617_c7_3d35_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1610_l1626_l1617_DUPLICATE_e251_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1626_c7_beb6_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1610_l1626_l1617_DUPLICATE_e251_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1610_c2_18dc_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1610_l1626_l1617_DUPLICATE_25b5_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1617_c7_3d35_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1610_l1626_l1617_DUPLICATE_25b5_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1626_c7_beb6_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1610_l1626_l1617_DUPLICATE_25b5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1617_c7_3d35_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1626_l1620_l1617_l1644_l1640_l1634_l1630_DUPLICATE_20d7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1620_c7_b03d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1626_l1620_l1617_l1644_l1640_l1634_l1630_DUPLICATE_20d7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_beb6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1626_l1620_l1617_l1644_l1640_l1634_l1630_DUPLICATE_20d7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1630_c7_24e2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1626_l1620_l1617_l1644_l1640_l1634_l1630_DUPLICATE_20d7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1634_c7_0c55_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1626_l1620_l1617_l1644_l1640_l1634_l1630_DUPLICATE_20d7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1640_c7_f60c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1626_l1620_l1617_l1644_l1640_l1634_l1630_DUPLICATE_20d7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1644_c7_a7d2_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1626_l1620_l1617_l1644_l1640_l1634_l1630_DUPLICATE_20d7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1610_c2_18dc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1626_l1620_l1617_l1644_l1610_l1640_l1630_DUPLICATE_04e2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1617_c7_3d35_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1626_l1620_l1617_l1644_l1610_l1640_l1630_DUPLICATE_04e2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1620_c7_b03d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1626_l1620_l1617_l1644_l1610_l1640_l1630_DUPLICATE_04e2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1626_c7_beb6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1626_l1620_l1617_l1644_l1610_l1640_l1630_DUPLICATE_04e2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1630_c7_24e2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1626_l1620_l1617_l1644_l1610_l1640_l1630_DUPLICATE_04e2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1640_c7_f60c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1626_l1620_l1617_l1644_l1610_l1640_l1630_DUPLICATE_04e2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1644_c7_a7d2_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1626_l1620_l1617_l1644_l1610_l1640_l1630_DUPLICATE_04e2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1620_c7_b03d_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1620_l1626_l1640_l1630_DUPLICATE_9421_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1626_c7_beb6_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1620_l1626_l1640_l1630_DUPLICATE_9421_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1630_c7_24e2_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1620_l1626_l1640_l1630_DUPLICATE_9421_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1640_c7_f60c_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1620_l1626_l1640_l1630_DUPLICATE_9421_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1610_c2_18dc_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1626_l1620_l1617_l1610_l1640_l1630_DUPLICATE_9395_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1617_c7_3d35_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1626_l1620_l1617_l1610_l1640_l1630_DUPLICATE_9395_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1620_c7_b03d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1626_l1620_l1617_l1610_l1640_l1630_DUPLICATE_9395_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1626_c7_beb6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1626_l1620_l1617_l1610_l1640_l1630_DUPLICATE_9395_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1630_c7_24e2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1626_l1620_l1617_l1610_l1640_l1630_DUPLICATE_9395_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1640_c7_f60c_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1626_l1620_l1617_l1610_l1640_l1630_DUPLICATE_9395_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1620_c7_b03d_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1623_c30_e1e3_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1626_c7_beb6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1626_c7_beb6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1626_c7_beb6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1626_c7_beb6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1626_c7_beb6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1626_c7_beb6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1626_c7_beb6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1626_c7_beb6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1626_c7_beb6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1640_c7_f60c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1640_c7_f60c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1640_c7_f60c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1640_c7_f60c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1640_c7_f60c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1640_c7_f60c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1640_c7_f60c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1640_c7_f60c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1640_c7_f60c_return_output;

     -- t8_MUX[uxn_opcodes_h_l1620_c7_b03d] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1620_c7_b03d_cond <= VAR_t8_MUX_uxn_opcodes_h_l1620_c7_b03d_cond;
     t8_MUX_uxn_opcodes_h_l1620_c7_b03d_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1620_c7_b03d_iftrue;
     t8_MUX_uxn_opcodes_h_l1620_c7_b03d_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1620_c7_b03d_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1620_c7_b03d_return_output := t8_MUX_uxn_opcodes_h_l1620_c7_b03d_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1635_c3_a293] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1635_c3_a293_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1635_c3_a293_left;
     BIN_OP_OR_uxn_opcodes_h_l1635_c3_a293_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1635_c3_a293_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1635_c3_a293_return_output := BIN_OP_OR_uxn_opcodes_h_l1635_c3_a293_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1628_c22_16c4] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1628_c22_16c4_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1628_c22_16c4_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1628_c22_16c4_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1628_c22_16c4_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1628_c22_16c4_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1628_c22_16c4_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1642_c21_3f75] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1642_c21_3f75_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1642_c31_f1d2_return_output);

     -- CONST_SL_8[uxn_opcodes_h_l1632_c3_cc89] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1632_c3_cc89_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1632_c3_cc89_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1632_c3_cc89_return_output := CONST_SL_8_uxn_opcodes_h_l1632_c3_cc89_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1624_c22_28e5] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1624_c22_28e5_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1624_c22_28e5_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1624_c22_28e5_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1624_c22_28e5_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1624_c22_28e5_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1624_c22_28e5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1644_c7_a7d2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1644_c7_a7d2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1644_c7_a7d2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1644_c7_a7d2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1644_c7_a7d2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1644_c7_a7d2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1644_c7_a7d2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1644_c7_a7d2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1644_c7_a7d2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1644_c7_a7d2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1644_c7_a7d2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1644_c7_a7d2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1644_c7_a7d2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1644_c7_a7d2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1644_c7_a7d2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1644_c7_a7d2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1644_c7_a7d2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1644_c7_a7d2_return_output;

     -- Submodule level 2
     VAR_tmp16_MUX_uxn_opcodes_h_l1634_c7_0c55_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1635_c3_a293_return_output;
     VAR_result_u16_value_uxn_opcodes_h_l1624_c3_8f3b := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1624_c22_28e5_return_output)),16);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1628_c22_07f9_left := VAR_BIN_OP_PLUS_uxn_opcodes_h_l1628_c22_16c4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1640_c7_f60c_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1642_c21_3f75_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1630_c7_24e2_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1632_c3_cc89_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1640_c7_f60c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1644_c7_a7d2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1640_c7_f60c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1644_c7_a7d2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1620_c7_b03d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1626_c7_beb6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1634_c7_0c55_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1640_c7_f60c_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1617_c7_3d35_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1620_c7_b03d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1620_c7_b03d_iftrue := VAR_result_u16_value_uxn_opcodes_h_l1624_c3_8f3b;
     -- t8_MUX[uxn_opcodes_h_l1617_c7_3d35] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1617_c7_3d35_cond <= VAR_t8_MUX_uxn_opcodes_h_l1617_c7_3d35_cond;
     t8_MUX_uxn_opcodes_h_l1617_c7_3d35_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1617_c7_3d35_iftrue;
     t8_MUX_uxn_opcodes_h_l1617_c7_3d35_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1617_c7_3d35_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1617_c7_3d35_return_output := t8_MUX_uxn_opcodes_h_l1617_c7_3d35_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1640_c7_f60c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1640_c7_f60c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1640_c7_f60c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1640_c7_f60c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1640_c7_f60c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1640_c7_f60c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1640_c7_f60c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1640_c7_f60c_return_output := result_u8_value_MUX_uxn_opcodes_h_l1640_c7_f60c_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1628_c22_07f9] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1628_c22_07f9_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1628_c22_07f9_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1628_c22_07f9_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1628_c22_07f9_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1628_c22_07f9_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1628_c22_07f9_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1640_c7_f60c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1640_c7_f60c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1640_c7_f60c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1640_c7_f60c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1640_c7_f60c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1640_c7_f60c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1640_c7_f60c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1640_c7_f60c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1640_c7_f60c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1634_c7_0c55] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1634_c7_0c55_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1634_c7_0c55_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1634_c7_0c55_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1634_c7_0c55_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1634_c7_0c55_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1634_c7_0c55_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1634_c7_0c55_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1634_c7_0c55_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1638_c21_2d34] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1638_c21_2d34_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_OR_uxn_opcodes_h_l1635_c3_a293_return_output);

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1640_c7_f60c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1640_c7_f60c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1640_c7_f60c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1640_c7_f60c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1640_c7_f60c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1640_c7_f60c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1640_c7_f60c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1640_c7_f60c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1640_c7_f60c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1620_c7_b03d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1620_c7_b03d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1620_c7_b03d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1620_c7_b03d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1620_c7_b03d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1620_c7_b03d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1620_c7_b03d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1620_c7_b03d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1620_c7_b03d_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1634_c7_0c55] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1634_c7_0c55_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1634_c7_0c55_cond;
     tmp16_MUX_uxn_opcodes_h_l1634_c7_0c55_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1634_c7_0c55_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1634_c7_0c55_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1634_c7_0c55_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1634_c7_0c55_return_output := tmp16_MUX_uxn_opcodes_h_l1634_c7_0c55_return_output;

     -- Submodule level 3
     VAR_result_u16_value_uxn_opcodes_h_l1628_c3_b4de := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1628_c22_07f9_return_output)),16);
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1634_c7_0c55_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1638_c21_2d34_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1634_c7_0c55_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1640_c7_f60c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1634_c7_0c55_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1640_c7_f60c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1617_c7_3d35_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1620_c7_b03d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1630_c7_24e2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1634_c7_0c55_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1634_c7_0c55_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1640_c7_f60c_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1610_c2_18dc_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1617_c7_3d35_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1630_c7_24e2_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1634_c7_0c55_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1626_c7_beb6_iftrue := VAR_result_u16_value_uxn_opcodes_h_l1628_c3_b4de;
     -- result_u8_value_MUX[uxn_opcodes_h_l1634_c7_0c55] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1634_c7_0c55_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1634_c7_0c55_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1634_c7_0c55_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1634_c7_0c55_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1634_c7_0c55_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1634_c7_0c55_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1634_c7_0c55_return_output := result_u8_value_MUX_uxn_opcodes_h_l1634_c7_0c55_return_output;

     -- t8_MUX[uxn_opcodes_h_l1610_c2_18dc] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1610_c2_18dc_cond <= VAR_t8_MUX_uxn_opcodes_h_l1610_c2_18dc_cond;
     t8_MUX_uxn_opcodes_h_l1610_c2_18dc_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1610_c2_18dc_iftrue;
     t8_MUX_uxn_opcodes_h_l1610_c2_18dc_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1610_c2_18dc_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1610_c2_18dc_return_output := t8_MUX_uxn_opcodes_h_l1610_c2_18dc_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1630_c7_24e2] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1630_c7_24e2_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1630_c7_24e2_cond;
     tmp16_MUX_uxn_opcodes_h_l1630_c7_24e2_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1630_c7_24e2_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1630_c7_24e2_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1630_c7_24e2_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1630_c7_24e2_return_output := tmp16_MUX_uxn_opcodes_h_l1630_c7_24e2_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1626_c7_beb6] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1626_c7_beb6_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1626_c7_beb6_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1626_c7_beb6_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1626_c7_beb6_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1626_c7_beb6_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1626_c7_beb6_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1626_c7_beb6_return_output := result_u16_value_MUX_uxn_opcodes_h_l1626_c7_beb6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1630_c7_24e2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1630_c7_24e2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1630_c7_24e2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1630_c7_24e2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1630_c7_24e2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1630_c7_24e2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1630_c7_24e2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1630_c7_24e2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1630_c7_24e2_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1617_c7_3d35] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1617_c7_3d35_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1617_c7_3d35_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1617_c7_3d35_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1617_c7_3d35_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1617_c7_3d35_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1617_c7_3d35_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1617_c7_3d35_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1617_c7_3d35_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1634_c7_0c55] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1634_c7_0c55_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1634_c7_0c55_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1634_c7_0c55_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1634_c7_0c55_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1634_c7_0c55_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1634_c7_0c55_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1634_c7_0c55_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1634_c7_0c55_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1634_c7_0c55] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1634_c7_0c55_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1634_c7_0c55_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1634_c7_0c55_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1634_c7_0c55_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1634_c7_0c55_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1634_c7_0c55_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1634_c7_0c55_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1634_c7_0c55_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1630_c7_24e2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1634_c7_0c55_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1630_c7_24e2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1634_c7_0c55_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1610_c2_18dc_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1617_c7_3d35_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1626_c7_beb6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1630_c7_24e2_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1620_c7_b03d_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1626_c7_beb6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1630_c7_24e2_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1634_c7_0c55_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1610_c2_18dc_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1626_c7_beb6_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1630_c7_24e2_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1610_c2_18dc] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1610_c2_18dc_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1610_c2_18dc_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1610_c2_18dc_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1610_c2_18dc_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1610_c2_18dc_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1610_c2_18dc_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1610_c2_18dc_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1610_c2_18dc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1630_c7_24e2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1630_c7_24e2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1630_c7_24e2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1630_c7_24e2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1630_c7_24e2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1630_c7_24e2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1630_c7_24e2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1630_c7_24e2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1630_c7_24e2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1630_c7_24e2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1630_c7_24e2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1630_c7_24e2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1630_c7_24e2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1630_c7_24e2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1630_c7_24e2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1630_c7_24e2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1630_c7_24e2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1630_c7_24e2_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1626_c7_beb6] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1626_c7_beb6_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1626_c7_beb6_cond;
     tmp16_MUX_uxn_opcodes_h_l1626_c7_beb6_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1626_c7_beb6_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1626_c7_beb6_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1626_c7_beb6_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1626_c7_beb6_return_output := tmp16_MUX_uxn_opcodes_h_l1626_c7_beb6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1626_c7_beb6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1626_c7_beb6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1626_c7_beb6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1626_c7_beb6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1626_c7_beb6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1626_c7_beb6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1626_c7_beb6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1626_c7_beb6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1626_c7_beb6_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1630_c7_24e2] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1630_c7_24e2_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1630_c7_24e2_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1630_c7_24e2_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1630_c7_24e2_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1630_c7_24e2_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1630_c7_24e2_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1630_c7_24e2_return_output := result_u8_value_MUX_uxn_opcodes_h_l1630_c7_24e2_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1620_c7_b03d] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1620_c7_b03d_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1620_c7_b03d_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1620_c7_b03d_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1620_c7_b03d_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1620_c7_b03d_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1620_c7_b03d_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1620_c7_b03d_return_output := result_u16_value_MUX_uxn_opcodes_h_l1620_c7_b03d_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_beb6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1630_c7_24e2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1626_c7_beb6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1630_c7_24e2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1620_c7_b03d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1626_c7_beb6_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1617_c7_3d35_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1620_c7_b03d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1626_c7_beb6_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1630_c7_24e2_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1620_c7_b03d_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1626_c7_beb6_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1626_c7_beb6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_beb6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_beb6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_beb6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_beb6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_beb6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_beb6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_beb6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_beb6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1626_c7_beb6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1626_c7_beb6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1626_c7_beb6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1626_c7_beb6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1626_c7_beb6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1626_c7_beb6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1626_c7_beb6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1626_c7_beb6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1626_c7_beb6_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1617_c7_3d35] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1617_c7_3d35_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1617_c7_3d35_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1617_c7_3d35_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1617_c7_3d35_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1617_c7_3d35_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1617_c7_3d35_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1617_c7_3d35_return_output := result_u16_value_MUX_uxn_opcodes_h_l1617_c7_3d35_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1626_c7_beb6] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1626_c7_beb6_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1626_c7_beb6_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1626_c7_beb6_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1626_c7_beb6_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1626_c7_beb6_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1626_c7_beb6_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1626_c7_beb6_return_output := result_u8_value_MUX_uxn_opcodes_h_l1626_c7_beb6_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1620_c7_b03d] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1620_c7_b03d_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1620_c7_b03d_cond;
     tmp16_MUX_uxn_opcodes_h_l1620_c7_b03d_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1620_c7_b03d_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1620_c7_b03d_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1620_c7_b03d_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1620_c7_b03d_return_output := tmp16_MUX_uxn_opcodes_h_l1620_c7_b03d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1620_c7_b03d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1620_c7_b03d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1620_c7_b03d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1620_c7_b03d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1620_c7_b03d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1620_c7_b03d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1620_c7_b03d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1620_c7_b03d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1620_c7_b03d_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1620_c7_b03d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_beb6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1620_c7_b03d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1626_c7_beb6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1617_c7_3d35_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1620_c7_b03d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1610_c2_18dc_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1617_c7_3d35_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1620_c7_b03d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1626_c7_beb6_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1617_c7_3d35_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1620_c7_b03d_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1620_c7_b03d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1620_c7_b03d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1620_c7_b03d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1620_c7_b03d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1620_c7_b03d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1620_c7_b03d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1620_c7_b03d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1620_c7_b03d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1620_c7_b03d_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1617_c7_3d35] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1617_c7_3d35_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1617_c7_3d35_cond;
     tmp16_MUX_uxn_opcodes_h_l1617_c7_3d35_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1617_c7_3d35_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1617_c7_3d35_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1617_c7_3d35_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1617_c7_3d35_return_output := tmp16_MUX_uxn_opcodes_h_l1617_c7_3d35_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1620_c7_b03d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1620_c7_b03d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1620_c7_b03d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1620_c7_b03d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1620_c7_b03d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1620_c7_b03d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1620_c7_b03d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1620_c7_b03d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1620_c7_b03d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1620_c7_b03d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1620_c7_b03d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1620_c7_b03d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1620_c7_b03d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1620_c7_b03d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1620_c7_b03d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1620_c7_b03d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1620_c7_b03d_return_output := result_u8_value_MUX_uxn_opcodes_h_l1620_c7_b03d_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1610_c2_18dc] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1610_c2_18dc_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1610_c2_18dc_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1610_c2_18dc_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1610_c2_18dc_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1610_c2_18dc_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1610_c2_18dc_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1610_c2_18dc_return_output := result_u16_value_MUX_uxn_opcodes_h_l1610_c2_18dc_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1617_c7_3d35] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1617_c7_3d35_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1617_c7_3d35_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1617_c7_3d35_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1617_c7_3d35_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1617_c7_3d35_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1617_c7_3d35_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1617_c7_3d35_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1617_c7_3d35_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1617_c7_3d35_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1620_c7_b03d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1617_c7_3d35_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1620_c7_b03d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1610_c2_18dc_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1617_c7_3d35_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1617_c7_3d35_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1620_c7_b03d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1610_c2_18dc_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1617_c7_3d35_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1617_c7_3d35] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1617_c7_3d35_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1617_c7_3d35_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1617_c7_3d35_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1617_c7_3d35_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1617_c7_3d35_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1617_c7_3d35_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1617_c7_3d35_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1617_c7_3d35_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1617_c7_3d35] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1617_c7_3d35_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1617_c7_3d35_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1617_c7_3d35_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1617_c7_3d35_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1617_c7_3d35_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1617_c7_3d35_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1617_c7_3d35_return_output := result_u8_value_MUX_uxn_opcodes_h_l1617_c7_3d35_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1617_c7_3d35] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1617_c7_3d35_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1617_c7_3d35_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1617_c7_3d35_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1617_c7_3d35_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1617_c7_3d35_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1617_c7_3d35_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1617_c7_3d35_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1617_c7_3d35_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1610_c2_18dc] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1610_c2_18dc_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1610_c2_18dc_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1610_c2_18dc_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1610_c2_18dc_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1610_c2_18dc_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1610_c2_18dc_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1610_c2_18dc_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1610_c2_18dc_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1610_c2_18dc] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1610_c2_18dc_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1610_c2_18dc_cond;
     tmp16_MUX_uxn_opcodes_h_l1610_c2_18dc_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1610_c2_18dc_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1610_c2_18dc_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1610_c2_18dc_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1610_c2_18dc_return_output := tmp16_MUX_uxn_opcodes_h_l1610_c2_18dc_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1610_c2_18dc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1617_c7_3d35_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1610_c2_18dc_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1617_c7_3d35_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1610_c2_18dc_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1617_c7_3d35_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l1610_c2_18dc_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1610_c2_18dc] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1610_c2_18dc_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1610_c2_18dc_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1610_c2_18dc_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1610_c2_18dc_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1610_c2_18dc_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1610_c2_18dc_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1610_c2_18dc_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1610_c2_18dc_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1610_c2_18dc] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1610_c2_18dc_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1610_c2_18dc_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1610_c2_18dc_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1610_c2_18dc_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1610_c2_18dc_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1610_c2_18dc_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1610_c2_18dc_return_output := result_u8_value_MUX_uxn_opcodes_h_l1610_c2_18dc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1610_c2_18dc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1610_c2_18dc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1610_c2_18dc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1610_c2_18dc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1610_c2_18dc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1610_c2_18dc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1610_c2_18dc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1610_c2_18dc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1610_c2_18dc_return_output;

     -- Submodule level 9
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_e78e_uxn_opcodes_h_l1649_l1605_DUPLICATE_ace6 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e78e_uxn_opcodes_h_l1649_l1605_DUPLICATE_ace6_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_e78e(
     result,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1610_c2_18dc_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1610_c2_18dc_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1610_c2_18dc_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1610_c2_18dc_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1610_c2_18dc_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1610_c2_18dc_return_output);

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e78e_uxn_opcodes_h_l1649_l1605_DUPLICATE_ace6_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e78e_uxn_opcodes_h_l1649_l1605_DUPLICATE_ace6_return_output;
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
