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
-- Submodules: 82
entity lda2_0CLK_0d6e2712 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end lda2_0CLK_0d6e2712;
architecture arch of lda2_0CLK_0d6e2712 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1678_c6_ed4e]
signal BIN_OP_EQ_uxn_opcodes_h_l1678_c6_ed4e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1678_c6_ed4e_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1678_c6_ed4e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1678_c1_2fa4]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1678_c1_2fa4_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1678_c1_2fa4_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1678_c1_2fa4_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1678_c1_2fa4_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1678_c2_c7fc]
signal tmp16_MUX_uxn_opcodes_h_l1678_c2_c7fc_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1678_c2_c7fc_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1678_c2_c7fc_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1678_c2_c7fc_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1678_c2_c7fc]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1678_c2_c7fc_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1678_c2_c7fc_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1678_c2_c7fc_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1678_c2_c7fc_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1678_c2_c7fc]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1678_c2_c7fc_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1678_c2_c7fc_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1678_c2_c7fc_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1678_c2_c7fc_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1678_c2_c7fc]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1678_c2_c7fc_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1678_c2_c7fc_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1678_c2_c7fc_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1678_c2_c7fc_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1678_c2_c7fc]
signal result_u16_value_MUX_uxn_opcodes_h_l1678_c2_c7fc_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1678_c2_c7fc_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1678_c2_c7fc_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1678_c2_c7fc_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1678_c2_c7fc]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1678_c2_c7fc_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1678_c2_c7fc_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1678_c2_c7fc_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1678_c2_c7fc_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1678_c2_c7fc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1678_c2_c7fc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1678_c2_c7fc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1678_c2_c7fc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1678_c2_c7fc_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1678_c2_c7fc]
signal result_u8_value_MUX_uxn_opcodes_h_l1678_c2_c7fc_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1678_c2_c7fc_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1678_c2_c7fc_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1678_c2_c7fc_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1678_c2_c7fc]
signal t16_MUX_uxn_opcodes_h_l1678_c2_c7fc_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1678_c2_c7fc_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1678_c2_c7fc_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1678_c2_c7fc_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l1679_c3_7720[uxn_opcodes_h_l1679_c3_7720]
signal printf_uxn_opcodes_h_l1679_c3_7720_uxn_opcodes_h_l1679_c3_7720_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1683_c11_efed]
signal BIN_OP_EQ_uxn_opcodes_h_l1683_c11_efed_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1683_c11_efed_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1683_c11_efed_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1683_c7_6ec0]
signal tmp16_MUX_uxn_opcodes_h_l1683_c7_6ec0_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1683_c7_6ec0_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1683_c7_6ec0_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1683_c7_6ec0_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1683_c7_6ec0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c7_6ec0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c7_6ec0_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c7_6ec0_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c7_6ec0_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1683_c7_6ec0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1683_c7_6ec0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1683_c7_6ec0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1683_c7_6ec0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1683_c7_6ec0_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1683_c7_6ec0]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1683_c7_6ec0_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1683_c7_6ec0_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1683_c7_6ec0_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1683_c7_6ec0_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1683_c7_6ec0]
signal result_u16_value_MUX_uxn_opcodes_h_l1683_c7_6ec0_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1683_c7_6ec0_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1683_c7_6ec0_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1683_c7_6ec0_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1683_c7_6ec0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c7_6ec0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c7_6ec0_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c7_6ec0_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c7_6ec0_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1683_c7_6ec0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1683_c7_6ec0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1683_c7_6ec0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1683_c7_6ec0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1683_c7_6ec0_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1683_c7_6ec0]
signal result_u8_value_MUX_uxn_opcodes_h_l1683_c7_6ec0_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1683_c7_6ec0_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1683_c7_6ec0_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1683_c7_6ec0_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1683_c7_6ec0]
signal t16_MUX_uxn_opcodes_h_l1683_c7_6ec0_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1683_c7_6ec0_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1683_c7_6ec0_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1683_c7_6ec0_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1686_c11_f0b3]
signal BIN_OP_EQ_uxn_opcodes_h_l1686_c11_f0b3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1686_c11_f0b3_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1686_c11_f0b3_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1686_c7_4f6f]
signal tmp16_MUX_uxn_opcodes_h_l1686_c7_4f6f_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1686_c7_4f6f_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1686_c7_4f6f_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1686_c7_4f6f_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1686_c7_4f6f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c7_4f6f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c7_4f6f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c7_4f6f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c7_4f6f_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1686_c7_4f6f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1686_c7_4f6f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1686_c7_4f6f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1686_c7_4f6f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1686_c7_4f6f_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1686_c7_4f6f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c7_4f6f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c7_4f6f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c7_4f6f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c7_4f6f_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1686_c7_4f6f]
signal result_u16_value_MUX_uxn_opcodes_h_l1686_c7_4f6f_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1686_c7_4f6f_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1686_c7_4f6f_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1686_c7_4f6f_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1686_c7_4f6f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c7_4f6f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c7_4f6f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c7_4f6f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c7_4f6f_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1686_c7_4f6f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1686_c7_4f6f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1686_c7_4f6f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1686_c7_4f6f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1686_c7_4f6f_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1686_c7_4f6f]
signal result_u8_value_MUX_uxn_opcodes_h_l1686_c7_4f6f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1686_c7_4f6f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1686_c7_4f6f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1686_c7_4f6f_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1686_c7_4f6f]
signal t16_MUX_uxn_opcodes_h_l1686_c7_4f6f_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1686_c7_4f6f_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1686_c7_4f6f_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1686_c7_4f6f_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1688_c3_1ee5]
signal CONST_SL_8_uxn_opcodes_h_l1688_c3_1ee5_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1688_c3_1ee5_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1690_c11_2de1]
signal BIN_OP_EQ_uxn_opcodes_h_l1690_c11_2de1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1690_c11_2de1_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1690_c11_2de1_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1690_c7_e815]
signal tmp16_MUX_uxn_opcodes_h_l1690_c7_e815_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1690_c7_e815_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1690_c7_e815_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1690_c7_e815_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1690_c7_e815]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1690_c7_e815_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1690_c7_e815_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1690_c7_e815_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1690_c7_e815_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1690_c7_e815]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1690_c7_e815_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1690_c7_e815_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1690_c7_e815_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1690_c7_e815_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1690_c7_e815]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1690_c7_e815_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1690_c7_e815_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1690_c7_e815_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1690_c7_e815_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1690_c7_e815]
signal result_u16_value_MUX_uxn_opcodes_h_l1690_c7_e815_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1690_c7_e815_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1690_c7_e815_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1690_c7_e815_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1690_c7_e815]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1690_c7_e815_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1690_c7_e815_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1690_c7_e815_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1690_c7_e815_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1690_c7_e815]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1690_c7_e815_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1690_c7_e815_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1690_c7_e815_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1690_c7_e815_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1690_c7_e815]
signal result_u8_value_MUX_uxn_opcodes_h_l1690_c7_e815_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1690_c7_e815_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1690_c7_e815_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1690_c7_e815_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1690_c7_e815]
signal t16_MUX_uxn_opcodes_h_l1690_c7_e815_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1690_c7_e815_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1690_c7_e815_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1690_c7_e815_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1691_c3_076c]
signal BIN_OP_OR_uxn_opcodes_h_l1691_c3_076c_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1691_c3_076c_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1691_c3_076c_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1693_c30_878e]
signal sp_relative_shift_uxn_opcodes_h_l1693_c30_878e_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1693_c30_878e_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1693_c30_878e_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1693_c30_878e_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1696_c11_5243]
signal BIN_OP_EQ_uxn_opcodes_h_l1696_c11_5243_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1696_c11_5243_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1696_c11_5243_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1696_c7_9917]
signal tmp16_MUX_uxn_opcodes_h_l1696_c7_9917_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1696_c7_9917_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1696_c7_9917_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1696_c7_9917_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1696_c7_9917]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_9917_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_9917_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_9917_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_9917_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1696_c7_9917]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_9917_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_9917_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_9917_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_9917_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1696_c7_9917]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1696_c7_9917_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1696_c7_9917_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1696_c7_9917_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1696_c7_9917_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1696_c7_9917]
signal result_u16_value_MUX_uxn_opcodes_h_l1696_c7_9917_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1696_c7_9917_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1696_c7_9917_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1696_c7_9917_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1696_c7_9917]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_9917_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_9917_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_9917_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_9917_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1696_c7_9917]
signal result_u8_value_MUX_uxn_opcodes_h_l1696_c7_9917_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1696_c7_9917_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1696_c7_9917_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1696_c7_9917_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1698_c22_006f]
signal BIN_OP_PLUS_uxn_opcodes_h_l1698_c22_006f_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1698_c22_006f_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1698_c22_006f_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1700_c11_148e]
signal BIN_OP_EQ_uxn_opcodes_h_l1700_c11_148e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1700_c11_148e_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1700_c11_148e_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1700_c7_1bc6]
signal tmp16_MUX_uxn_opcodes_h_l1700_c7_1bc6_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1700_c7_1bc6_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1700_c7_1bc6_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1700_c7_1bc6_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1700_c7_1bc6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c7_1bc6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c7_1bc6_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c7_1bc6_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c7_1bc6_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1700_c7_1bc6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1700_c7_1bc6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1700_c7_1bc6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1700_c7_1bc6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1700_c7_1bc6_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1700_c7_1bc6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1700_c7_1bc6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1700_c7_1bc6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1700_c7_1bc6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1700_c7_1bc6_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1700_c7_1bc6]
signal result_u8_value_MUX_uxn_opcodes_h_l1700_c7_1bc6_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1700_c7_1bc6_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1700_c7_1bc6_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1700_c7_1bc6_return_output : unsigned(7 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1702_c3_fb86]
signal CONST_SL_8_uxn_opcodes_h_l1702_c3_fb86_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1702_c3_fb86_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1704_c11_5364]
signal BIN_OP_EQ_uxn_opcodes_h_l1704_c11_5364_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1704_c11_5364_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1704_c11_5364_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1704_c7_de65]
signal tmp16_MUX_uxn_opcodes_h_l1704_c7_de65_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1704_c7_de65_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1704_c7_de65_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1704_c7_de65_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1704_c7_de65]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1704_c7_de65_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1704_c7_de65_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1704_c7_de65_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1704_c7_de65_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1704_c7_de65]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1704_c7_de65_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1704_c7_de65_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1704_c7_de65_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1704_c7_de65_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1704_c7_de65]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1704_c7_de65_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1704_c7_de65_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1704_c7_de65_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1704_c7_de65_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1704_c7_de65]
signal result_u8_value_MUX_uxn_opcodes_h_l1704_c7_de65_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1704_c7_de65_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1704_c7_de65_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1704_c7_de65_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1705_c3_bb75]
signal BIN_OP_OR_uxn_opcodes_h_l1705_c3_bb75_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1705_c3_bb75_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1705_c3_bb75_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1710_c11_2d0b]
signal BIN_OP_EQ_uxn_opcodes_h_l1710_c11_2d0b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1710_c11_2d0b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1710_c11_2d0b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1710_c7_38d0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1710_c7_38d0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1710_c7_38d0_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1710_c7_38d0_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1710_c7_38d0_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1710_c7_38d0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1710_c7_38d0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1710_c7_38d0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1710_c7_38d0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1710_c7_38d0_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1710_c7_38d0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_38d0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_38d0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_38d0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_38d0_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1710_c7_38d0]
signal result_u8_value_MUX_uxn_opcodes_h_l1710_c7_38d0_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1710_c7_38d0_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1710_c7_38d0_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1710_c7_38d0_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1712_c31_a898]
signal CONST_SR_8_uxn_opcodes_h_l1712_c31_a898_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1712_c31_a898_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1714_c11_7d87]
signal BIN_OP_EQ_uxn_opcodes_h_l1714_c11_7d87_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1714_c11_7d87_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1714_c11_7d87_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1714_c7_15c1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1714_c7_15c1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1714_c7_15c1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1714_c7_15c1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1714_c7_15c1_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1714_c7_15c1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1714_c7_15c1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1714_c7_15c1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1714_c7_15c1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1714_c7_15c1_return_output : unsigned(0 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_5517( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : signed;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.stack_address_sp_offset := ref_toks_1;
      base.is_stack_write := ref_toks_2;
      base.is_sp_shift := ref_toks_3;
      base.u16_value := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.is_opc_done := ref_toks_6;
      base.u8_value := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1678_c6_ed4e
BIN_OP_EQ_uxn_opcodes_h_l1678_c6_ed4e : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1678_c6_ed4e_left,
BIN_OP_EQ_uxn_opcodes_h_l1678_c6_ed4e_right,
BIN_OP_EQ_uxn_opcodes_h_l1678_c6_ed4e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1678_c1_2fa4
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1678_c1_2fa4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1678_c1_2fa4_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1678_c1_2fa4_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1678_c1_2fa4_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1678_c1_2fa4_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1678_c2_c7fc
tmp16_MUX_uxn_opcodes_h_l1678_c2_c7fc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1678_c2_c7fc_cond,
tmp16_MUX_uxn_opcodes_h_l1678_c2_c7fc_iftrue,
tmp16_MUX_uxn_opcodes_h_l1678_c2_c7fc_iffalse,
tmp16_MUX_uxn_opcodes_h_l1678_c2_c7fc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1678_c2_c7fc
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1678_c2_c7fc : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1678_c2_c7fc_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1678_c2_c7fc_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1678_c2_c7fc_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1678_c2_c7fc_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1678_c2_c7fc
result_is_stack_write_MUX_uxn_opcodes_h_l1678_c2_c7fc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1678_c2_c7fc_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1678_c2_c7fc_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1678_c2_c7fc_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1678_c2_c7fc_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1678_c2_c7fc
result_is_sp_shift_MUX_uxn_opcodes_h_l1678_c2_c7fc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1678_c2_c7fc_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1678_c2_c7fc_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1678_c2_c7fc_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1678_c2_c7fc_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1678_c2_c7fc
result_u16_value_MUX_uxn_opcodes_h_l1678_c2_c7fc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1678_c2_c7fc_cond,
result_u16_value_MUX_uxn_opcodes_h_l1678_c2_c7fc_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1678_c2_c7fc_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1678_c2_c7fc_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1678_c2_c7fc
result_sp_relative_shift_MUX_uxn_opcodes_h_l1678_c2_c7fc : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1678_c2_c7fc_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1678_c2_c7fc_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1678_c2_c7fc_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1678_c2_c7fc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1678_c2_c7fc
result_is_opc_done_MUX_uxn_opcodes_h_l1678_c2_c7fc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1678_c2_c7fc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1678_c2_c7fc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1678_c2_c7fc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1678_c2_c7fc_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1678_c2_c7fc
result_u8_value_MUX_uxn_opcodes_h_l1678_c2_c7fc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1678_c2_c7fc_cond,
result_u8_value_MUX_uxn_opcodes_h_l1678_c2_c7fc_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1678_c2_c7fc_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1678_c2_c7fc_return_output);

-- t16_MUX_uxn_opcodes_h_l1678_c2_c7fc
t16_MUX_uxn_opcodes_h_l1678_c2_c7fc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1678_c2_c7fc_cond,
t16_MUX_uxn_opcodes_h_l1678_c2_c7fc_iftrue,
t16_MUX_uxn_opcodes_h_l1678_c2_c7fc_iffalse,
t16_MUX_uxn_opcodes_h_l1678_c2_c7fc_return_output);

-- printf_uxn_opcodes_h_l1679_c3_7720_uxn_opcodes_h_l1679_c3_7720
printf_uxn_opcodes_h_l1679_c3_7720_uxn_opcodes_h_l1679_c3_7720 : entity work.printf_uxn_opcodes_h_l1679_c3_7720_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1679_c3_7720_uxn_opcodes_h_l1679_c3_7720_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1683_c11_efed
BIN_OP_EQ_uxn_opcodes_h_l1683_c11_efed : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1683_c11_efed_left,
BIN_OP_EQ_uxn_opcodes_h_l1683_c11_efed_right,
BIN_OP_EQ_uxn_opcodes_h_l1683_c11_efed_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1683_c7_6ec0
tmp16_MUX_uxn_opcodes_h_l1683_c7_6ec0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1683_c7_6ec0_cond,
tmp16_MUX_uxn_opcodes_h_l1683_c7_6ec0_iftrue,
tmp16_MUX_uxn_opcodes_h_l1683_c7_6ec0_iffalse,
tmp16_MUX_uxn_opcodes_h_l1683_c7_6ec0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c7_6ec0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c7_6ec0 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c7_6ec0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c7_6ec0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c7_6ec0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c7_6ec0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1683_c7_6ec0
result_is_stack_write_MUX_uxn_opcodes_h_l1683_c7_6ec0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1683_c7_6ec0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1683_c7_6ec0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1683_c7_6ec0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1683_c7_6ec0_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1683_c7_6ec0
result_is_sp_shift_MUX_uxn_opcodes_h_l1683_c7_6ec0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1683_c7_6ec0_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1683_c7_6ec0_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1683_c7_6ec0_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1683_c7_6ec0_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1683_c7_6ec0
result_u16_value_MUX_uxn_opcodes_h_l1683_c7_6ec0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1683_c7_6ec0_cond,
result_u16_value_MUX_uxn_opcodes_h_l1683_c7_6ec0_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1683_c7_6ec0_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1683_c7_6ec0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c7_6ec0
result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c7_6ec0 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c7_6ec0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c7_6ec0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c7_6ec0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c7_6ec0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1683_c7_6ec0
result_is_opc_done_MUX_uxn_opcodes_h_l1683_c7_6ec0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1683_c7_6ec0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1683_c7_6ec0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1683_c7_6ec0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1683_c7_6ec0_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1683_c7_6ec0
result_u8_value_MUX_uxn_opcodes_h_l1683_c7_6ec0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1683_c7_6ec0_cond,
result_u8_value_MUX_uxn_opcodes_h_l1683_c7_6ec0_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1683_c7_6ec0_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1683_c7_6ec0_return_output);

-- t16_MUX_uxn_opcodes_h_l1683_c7_6ec0
t16_MUX_uxn_opcodes_h_l1683_c7_6ec0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1683_c7_6ec0_cond,
t16_MUX_uxn_opcodes_h_l1683_c7_6ec0_iftrue,
t16_MUX_uxn_opcodes_h_l1683_c7_6ec0_iffalse,
t16_MUX_uxn_opcodes_h_l1683_c7_6ec0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1686_c11_f0b3
BIN_OP_EQ_uxn_opcodes_h_l1686_c11_f0b3 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1686_c11_f0b3_left,
BIN_OP_EQ_uxn_opcodes_h_l1686_c11_f0b3_right,
BIN_OP_EQ_uxn_opcodes_h_l1686_c11_f0b3_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1686_c7_4f6f
tmp16_MUX_uxn_opcodes_h_l1686_c7_4f6f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1686_c7_4f6f_cond,
tmp16_MUX_uxn_opcodes_h_l1686_c7_4f6f_iftrue,
tmp16_MUX_uxn_opcodes_h_l1686_c7_4f6f_iffalse,
tmp16_MUX_uxn_opcodes_h_l1686_c7_4f6f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c7_4f6f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c7_4f6f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c7_4f6f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c7_4f6f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c7_4f6f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c7_4f6f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1686_c7_4f6f
result_is_stack_write_MUX_uxn_opcodes_h_l1686_c7_4f6f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1686_c7_4f6f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1686_c7_4f6f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1686_c7_4f6f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1686_c7_4f6f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c7_4f6f
result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c7_4f6f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c7_4f6f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c7_4f6f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c7_4f6f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c7_4f6f_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1686_c7_4f6f
result_u16_value_MUX_uxn_opcodes_h_l1686_c7_4f6f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1686_c7_4f6f_cond,
result_u16_value_MUX_uxn_opcodes_h_l1686_c7_4f6f_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1686_c7_4f6f_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1686_c7_4f6f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c7_4f6f
result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c7_4f6f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c7_4f6f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c7_4f6f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c7_4f6f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c7_4f6f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1686_c7_4f6f
result_is_opc_done_MUX_uxn_opcodes_h_l1686_c7_4f6f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1686_c7_4f6f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1686_c7_4f6f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1686_c7_4f6f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1686_c7_4f6f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1686_c7_4f6f
result_u8_value_MUX_uxn_opcodes_h_l1686_c7_4f6f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1686_c7_4f6f_cond,
result_u8_value_MUX_uxn_opcodes_h_l1686_c7_4f6f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1686_c7_4f6f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1686_c7_4f6f_return_output);

-- t16_MUX_uxn_opcodes_h_l1686_c7_4f6f
t16_MUX_uxn_opcodes_h_l1686_c7_4f6f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1686_c7_4f6f_cond,
t16_MUX_uxn_opcodes_h_l1686_c7_4f6f_iftrue,
t16_MUX_uxn_opcodes_h_l1686_c7_4f6f_iffalse,
t16_MUX_uxn_opcodes_h_l1686_c7_4f6f_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1688_c3_1ee5
CONST_SL_8_uxn_opcodes_h_l1688_c3_1ee5 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1688_c3_1ee5_x,
CONST_SL_8_uxn_opcodes_h_l1688_c3_1ee5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1690_c11_2de1
BIN_OP_EQ_uxn_opcodes_h_l1690_c11_2de1 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1690_c11_2de1_left,
BIN_OP_EQ_uxn_opcodes_h_l1690_c11_2de1_right,
BIN_OP_EQ_uxn_opcodes_h_l1690_c11_2de1_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1690_c7_e815
tmp16_MUX_uxn_opcodes_h_l1690_c7_e815 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1690_c7_e815_cond,
tmp16_MUX_uxn_opcodes_h_l1690_c7_e815_iftrue,
tmp16_MUX_uxn_opcodes_h_l1690_c7_e815_iffalse,
tmp16_MUX_uxn_opcodes_h_l1690_c7_e815_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1690_c7_e815
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1690_c7_e815 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1690_c7_e815_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1690_c7_e815_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1690_c7_e815_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1690_c7_e815_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1690_c7_e815
result_is_stack_write_MUX_uxn_opcodes_h_l1690_c7_e815 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1690_c7_e815_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1690_c7_e815_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1690_c7_e815_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1690_c7_e815_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1690_c7_e815
result_is_sp_shift_MUX_uxn_opcodes_h_l1690_c7_e815 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1690_c7_e815_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1690_c7_e815_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1690_c7_e815_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1690_c7_e815_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1690_c7_e815
result_u16_value_MUX_uxn_opcodes_h_l1690_c7_e815 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1690_c7_e815_cond,
result_u16_value_MUX_uxn_opcodes_h_l1690_c7_e815_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1690_c7_e815_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1690_c7_e815_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1690_c7_e815
result_sp_relative_shift_MUX_uxn_opcodes_h_l1690_c7_e815 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1690_c7_e815_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1690_c7_e815_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1690_c7_e815_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1690_c7_e815_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1690_c7_e815
result_is_opc_done_MUX_uxn_opcodes_h_l1690_c7_e815 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1690_c7_e815_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1690_c7_e815_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1690_c7_e815_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1690_c7_e815_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1690_c7_e815
result_u8_value_MUX_uxn_opcodes_h_l1690_c7_e815 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1690_c7_e815_cond,
result_u8_value_MUX_uxn_opcodes_h_l1690_c7_e815_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1690_c7_e815_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1690_c7_e815_return_output);

-- t16_MUX_uxn_opcodes_h_l1690_c7_e815
t16_MUX_uxn_opcodes_h_l1690_c7_e815 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1690_c7_e815_cond,
t16_MUX_uxn_opcodes_h_l1690_c7_e815_iftrue,
t16_MUX_uxn_opcodes_h_l1690_c7_e815_iffalse,
t16_MUX_uxn_opcodes_h_l1690_c7_e815_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1691_c3_076c
BIN_OP_OR_uxn_opcodes_h_l1691_c3_076c : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1691_c3_076c_left,
BIN_OP_OR_uxn_opcodes_h_l1691_c3_076c_right,
BIN_OP_OR_uxn_opcodes_h_l1691_c3_076c_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1693_c30_878e
sp_relative_shift_uxn_opcodes_h_l1693_c30_878e : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1693_c30_878e_ins,
sp_relative_shift_uxn_opcodes_h_l1693_c30_878e_x,
sp_relative_shift_uxn_opcodes_h_l1693_c30_878e_y,
sp_relative_shift_uxn_opcodes_h_l1693_c30_878e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1696_c11_5243
BIN_OP_EQ_uxn_opcodes_h_l1696_c11_5243 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1696_c11_5243_left,
BIN_OP_EQ_uxn_opcodes_h_l1696_c11_5243_right,
BIN_OP_EQ_uxn_opcodes_h_l1696_c11_5243_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1696_c7_9917
tmp16_MUX_uxn_opcodes_h_l1696_c7_9917 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1696_c7_9917_cond,
tmp16_MUX_uxn_opcodes_h_l1696_c7_9917_iftrue,
tmp16_MUX_uxn_opcodes_h_l1696_c7_9917_iffalse,
tmp16_MUX_uxn_opcodes_h_l1696_c7_9917_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_9917
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_9917 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_9917_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_9917_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_9917_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_9917_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_9917
result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_9917 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_9917_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_9917_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_9917_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_9917_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1696_c7_9917
result_is_sp_shift_MUX_uxn_opcodes_h_l1696_c7_9917 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1696_c7_9917_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1696_c7_9917_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1696_c7_9917_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1696_c7_9917_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1696_c7_9917
result_u16_value_MUX_uxn_opcodes_h_l1696_c7_9917 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1696_c7_9917_cond,
result_u16_value_MUX_uxn_opcodes_h_l1696_c7_9917_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1696_c7_9917_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1696_c7_9917_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_9917
result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_9917 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_9917_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_9917_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_9917_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_9917_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1696_c7_9917
result_u8_value_MUX_uxn_opcodes_h_l1696_c7_9917 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1696_c7_9917_cond,
result_u8_value_MUX_uxn_opcodes_h_l1696_c7_9917_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1696_c7_9917_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1696_c7_9917_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1698_c22_006f
BIN_OP_PLUS_uxn_opcodes_h_l1698_c22_006f : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1698_c22_006f_left,
BIN_OP_PLUS_uxn_opcodes_h_l1698_c22_006f_right,
BIN_OP_PLUS_uxn_opcodes_h_l1698_c22_006f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1700_c11_148e
BIN_OP_EQ_uxn_opcodes_h_l1700_c11_148e : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1700_c11_148e_left,
BIN_OP_EQ_uxn_opcodes_h_l1700_c11_148e_right,
BIN_OP_EQ_uxn_opcodes_h_l1700_c11_148e_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1700_c7_1bc6
tmp16_MUX_uxn_opcodes_h_l1700_c7_1bc6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1700_c7_1bc6_cond,
tmp16_MUX_uxn_opcodes_h_l1700_c7_1bc6_iftrue,
tmp16_MUX_uxn_opcodes_h_l1700_c7_1bc6_iffalse,
tmp16_MUX_uxn_opcodes_h_l1700_c7_1bc6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c7_1bc6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c7_1bc6 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c7_1bc6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c7_1bc6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c7_1bc6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c7_1bc6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1700_c7_1bc6
result_is_stack_write_MUX_uxn_opcodes_h_l1700_c7_1bc6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1700_c7_1bc6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1700_c7_1bc6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1700_c7_1bc6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1700_c7_1bc6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1700_c7_1bc6
result_is_opc_done_MUX_uxn_opcodes_h_l1700_c7_1bc6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1700_c7_1bc6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1700_c7_1bc6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1700_c7_1bc6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1700_c7_1bc6_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1700_c7_1bc6
result_u8_value_MUX_uxn_opcodes_h_l1700_c7_1bc6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1700_c7_1bc6_cond,
result_u8_value_MUX_uxn_opcodes_h_l1700_c7_1bc6_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1700_c7_1bc6_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1700_c7_1bc6_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1702_c3_fb86
CONST_SL_8_uxn_opcodes_h_l1702_c3_fb86 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1702_c3_fb86_x,
CONST_SL_8_uxn_opcodes_h_l1702_c3_fb86_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1704_c11_5364
BIN_OP_EQ_uxn_opcodes_h_l1704_c11_5364 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1704_c11_5364_left,
BIN_OP_EQ_uxn_opcodes_h_l1704_c11_5364_right,
BIN_OP_EQ_uxn_opcodes_h_l1704_c11_5364_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1704_c7_de65
tmp16_MUX_uxn_opcodes_h_l1704_c7_de65 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1704_c7_de65_cond,
tmp16_MUX_uxn_opcodes_h_l1704_c7_de65_iftrue,
tmp16_MUX_uxn_opcodes_h_l1704_c7_de65_iffalse,
tmp16_MUX_uxn_opcodes_h_l1704_c7_de65_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1704_c7_de65
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1704_c7_de65 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1704_c7_de65_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1704_c7_de65_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1704_c7_de65_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1704_c7_de65_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1704_c7_de65
result_is_stack_write_MUX_uxn_opcodes_h_l1704_c7_de65 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1704_c7_de65_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1704_c7_de65_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1704_c7_de65_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1704_c7_de65_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1704_c7_de65
result_is_opc_done_MUX_uxn_opcodes_h_l1704_c7_de65 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1704_c7_de65_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1704_c7_de65_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1704_c7_de65_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1704_c7_de65_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1704_c7_de65
result_u8_value_MUX_uxn_opcodes_h_l1704_c7_de65 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1704_c7_de65_cond,
result_u8_value_MUX_uxn_opcodes_h_l1704_c7_de65_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1704_c7_de65_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1704_c7_de65_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1705_c3_bb75
BIN_OP_OR_uxn_opcodes_h_l1705_c3_bb75 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1705_c3_bb75_left,
BIN_OP_OR_uxn_opcodes_h_l1705_c3_bb75_right,
BIN_OP_OR_uxn_opcodes_h_l1705_c3_bb75_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1710_c11_2d0b
BIN_OP_EQ_uxn_opcodes_h_l1710_c11_2d0b : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1710_c11_2d0b_left,
BIN_OP_EQ_uxn_opcodes_h_l1710_c11_2d0b_right,
BIN_OP_EQ_uxn_opcodes_h_l1710_c11_2d0b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1710_c7_38d0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1710_c7_38d0 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1710_c7_38d0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1710_c7_38d0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1710_c7_38d0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1710_c7_38d0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1710_c7_38d0
result_is_stack_write_MUX_uxn_opcodes_h_l1710_c7_38d0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1710_c7_38d0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1710_c7_38d0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1710_c7_38d0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1710_c7_38d0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_38d0
result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_38d0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_38d0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_38d0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_38d0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_38d0_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1710_c7_38d0
result_u8_value_MUX_uxn_opcodes_h_l1710_c7_38d0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1710_c7_38d0_cond,
result_u8_value_MUX_uxn_opcodes_h_l1710_c7_38d0_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1710_c7_38d0_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1710_c7_38d0_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1712_c31_a898
CONST_SR_8_uxn_opcodes_h_l1712_c31_a898 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1712_c31_a898_x,
CONST_SR_8_uxn_opcodes_h_l1712_c31_a898_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1714_c11_7d87
BIN_OP_EQ_uxn_opcodes_h_l1714_c11_7d87 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1714_c11_7d87_left,
BIN_OP_EQ_uxn_opcodes_h_l1714_c11_7d87_right,
BIN_OP_EQ_uxn_opcodes_h_l1714_c11_7d87_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1714_c7_15c1
result_is_stack_write_MUX_uxn_opcodes_h_l1714_c7_15c1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1714_c7_15c1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1714_c7_15c1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1714_c7_15c1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1714_c7_15c1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1714_c7_15c1
result_is_opc_done_MUX_uxn_opcodes_h_l1714_c7_15c1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1714_c7_15c1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1714_c7_15c1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1714_c7_15c1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1714_c7_15c1_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1678_c6_ed4e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1678_c1_2fa4_return_output,
 tmp16_MUX_uxn_opcodes_h_l1678_c2_c7fc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1678_c2_c7fc_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1678_c2_c7fc_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1678_c2_c7fc_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1678_c2_c7fc_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1678_c2_c7fc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1678_c2_c7fc_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1678_c2_c7fc_return_output,
 t16_MUX_uxn_opcodes_h_l1678_c2_c7fc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1683_c11_efed_return_output,
 tmp16_MUX_uxn_opcodes_h_l1683_c7_6ec0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c7_6ec0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1683_c7_6ec0_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1683_c7_6ec0_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1683_c7_6ec0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c7_6ec0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1683_c7_6ec0_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1683_c7_6ec0_return_output,
 t16_MUX_uxn_opcodes_h_l1683_c7_6ec0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1686_c11_f0b3_return_output,
 tmp16_MUX_uxn_opcodes_h_l1686_c7_4f6f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c7_4f6f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1686_c7_4f6f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c7_4f6f_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1686_c7_4f6f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c7_4f6f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1686_c7_4f6f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1686_c7_4f6f_return_output,
 t16_MUX_uxn_opcodes_h_l1686_c7_4f6f_return_output,
 CONST_SL_8_uxn_opcodes_h_l1688_c3_1ee5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1690_c11_2de1_return_output,
 tmp16_MUX_uxn_opcodes_h_l1690_c7_e815_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1690_c7_e815_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1690_c7_e815_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1690_c7_e815_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1690_c7_e815_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1690_c7_e815_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1690_c7_e815_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1690_c7_e815_return_output,
 t16_MUX_uxn_opcodes_h_l1690_c7_e815_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1691_c3_076c_return_output,
 sp_relative_shift_uxn_opcodes_h_l1693_c30_878e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1696_c11_5243_return_output,
 tmp16_MUX_uxn_opcodes_h_l1696_c7_9917_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_9917_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_9917_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1696_c7_9917_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1696_c7_9917_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_9917_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1696_c7_9917_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1698_c22_006f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1700_c11_148e_return_output,
 tmp16_MUX_uxn_opcodes_h_l1700_c7_1bc6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c7_1bc6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1700_c7_1bc6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1700_c7_1bc6_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1700_c7_1bc6_return_output,
 CONST_SL_8_uxn_opcodes_h_l1702_c3_fb86_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1704_c11_5364_return_output,
 tmp16_MUX_uxn_opcodes_h_l1704_c7_de65_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1704_c7_de65_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1704_c7_de65_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1704_c7_de65_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1704_c7_de65_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1705_c3_bb75_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1710_c11_2d0b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1710_c7_38d0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1710_c7_38d0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_38d0_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1710_c7_38d0_return_output,
 CONST_SR_8_uxn_opcodes_h_l1712_c31_a898_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1714_c11_7d87_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1714_c7_15c1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1714_c7_15c1_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1678_c6_ed4e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1678_c6_ed4e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1678_c6_ed4e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1678_c1_2fa4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1678_c1_2fa4_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1678_c1_2fa4_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1678_c1_2fa4_iffalse : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1678_c2_c7fc_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1678_c2_c7fc_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1683_c7_6ec0_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1678_c2_c7fc_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1678_c2_c7fc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1678_c2_c7fc_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1680_c3_3db6 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1678_c2_c7fc_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c7_6ec0_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1678_c2_c7fc_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1678_c2_c7fc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1678_c2_c7fc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1678_c2_c7fc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1683_c7_6ec0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1678_c2_c7fc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1678_c2_c7fc_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1678_c2_c7fc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1678_c2_c7fc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1683_c7_6ec0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1678_c2_c7fc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1678_c2_c7fc_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1678_c2_c7fc_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1678_c2_c7fc_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1683_c7_6ec0_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1678_c2_c7fc_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1678_c2_c7fc_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1678_c2_c7fc_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1678_c2_c7fc_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c7_6ec0_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1678_c2_c7fc_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1678_c2_c7fc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1678_c2_c7fc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1678_c2_c7fc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1683_c7_6ec0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1678_c2_c7fc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1678_c2_c7fc_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1678_c2_c7fc_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1678_c2_c7fc_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1683_c7_6ec0_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1678_c2_c7fc_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1678_c2_c7fc_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1678_c2_c7fc_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1678_c2_c7fc_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1683_c7_6ec0_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1678_c2_c7fc_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1678_c2_c7fc_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1679_c3_7720_uxn_opcodes_h_l1679_c3_7720_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1683_c11_efed_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1683_c11_efed_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1683_c11_efed_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1683_c7_6ec0_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1683_c7_6ec0_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1686_c7_4f6f_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1683_c7_6ec0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c7_6ec0_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1684_c3_23ab : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c7_6ec0_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c7_4f6f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c7_6ec0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1683_c7_6ec0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1683_c7_6ec0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1686_c7_4f6f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1683_c7_6ec0_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1683_c7_6ec0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1683_c7_6ec0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c7_4f6f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1683_c7_6ec0_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1683_c7_6ec0_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1683_c7_6ec0_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1686_c7_4f6f_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1683_c7_6ec0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c7_6ec0_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c7_6ec0_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c7_4f6f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c7_6ec0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1683_c7_6ec0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1683_c7_6ec0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1686_c7_4f6f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1683_c7_6ec0_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1683_c7_6ec0_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1683_c7_6ec0_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1686_c7_4f6f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1683_c7_6ec0_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1683_c7_6ec0_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1683_c7_6ec0_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1686_c7_4f6f_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1683_c7_6ec0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1686_c11_f0b3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1686_c11_f0b3_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1686_c11_f0b3_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1686_c7_4f6f_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1686_c7_4f6f_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1690_c7_e815_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1686_c7_4f6f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c7_4f6f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c7_4f6f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1690_c7_e815_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c7_4f6f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1686_c7_4f6f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1686_c7_4f6f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1690_c7_e815_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1686_c7_4f6f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c7_4f6f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c7_4f6f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1690_c7_e815_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c7_4f6f_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1686_c7_4f6f_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1686_c7_4f6f_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1690_c7_e815_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1686_c7_4f6f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c7_4f6f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c7_4f6f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1690_c7_e815_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c7_4f6f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1686_c7_4f6f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1686_c7_4f6f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1690_c7_e815_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1686_c7_4f6f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1686_c7_4f6f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1686_c7_4f6f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1690_c7_e815_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1686_c7_4f6f_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1686_c7_4f6f_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1686_c7_4f6f_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1690_c7_e815_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1686_c7_4f6f_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1688_c3_1ee5_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1688_c3_1ee5_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1690_c11_2de1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1690_c11_2de1_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1690_c11_2de1_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1690_c7_e815_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1690_c7_e815_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1696_c7_9917_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1690_c7_e815_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1690_c7_e815_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1690_c7_e815_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_9917_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1690_c7_e815_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1690_c7_e815_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1690_c7_e815_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_9917_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1690_c7_e815_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1690_c7_e815_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1690_c7_e815_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1696_c7_9917_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1690_c7_e815_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1690_c7_e815_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1690_c7_e815_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1696_c7_9917_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1690_c7_e815_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1690_c7_e815_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1690_c7_e815_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1690_c7_e815_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1690_c7_e815_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1690_c7_e815_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_9917_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1690_c7_e815_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1690_c7_e815_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1690_c7_e815_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1696_c7_9917_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1690_c7_e815_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1690_c7_e815_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1690_c7_e815_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1690_c7_e815_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1691_c3_076c_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1691_c3_076c_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1691_c3_076c_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1693_c30_878e_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1693_c30_878e_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1693_c30_878e_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1693_c30_878e_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1696_c11_5243_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1696_c11_5243_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1696_c11_5243_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1696_c7_9917_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1696_c7_9917_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1700_c7_1bc6_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1696_c7_9917_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_9917_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_9917_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c7_1bc6_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_9917_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_9917_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_9917_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1700_c7_1bc6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_9917_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1696_c7_9917_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1696_c7_9917_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1696_c7_9917_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1696_c7_9917_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l1698_c3_f3e2 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1696_c7_9917_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1696_c7_9917_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_9917_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_9917_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1700_c7_1bc6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_9917_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1696_c7_9917_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1696_c7_9917_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1700_c7_1bc6_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1696_c7_9917_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1698_c22_006f_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1698_c22_006f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1698_c22_006f_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1700_c11_148e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1700_c11_148e_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1700_c11_148e_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1700_c7_1bc6_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1700_c7_1bc6_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1704_c7_de65_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1700_c7_1bc6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c7_1bc6_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c7_1bc6_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1704_c7_de65_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c7_1bc6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1700_c7_1bc6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1700_c7_1bc6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1704_c7_de65_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1700_c7_1bc6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1700_c7_1bc6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1700_c7_1bc6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1704_c7_de65_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1700_c7_1bc6_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1700_c7_1bc6_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1700_c7_1bc6_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1704_c7_de65_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1700_c7_1bc6_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1702_c3_fb86_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1702_c3_fb86_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1704_c11_5364_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1704_c11_5364_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1704_c11_5364_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1704_c7_de65_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1704_c7_de65_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1704_c7_de65_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1704_c7_de65_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1707_c3_52d2 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1704_c7_de65_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1710_c7_38d0_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1704_c7_de65_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1704_c7_de65_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1704_c7_de65_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1710_c7_38d0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1704_c7_de65_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1704_c7_de65_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1704_c7_de65_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_38d0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1704_c7_de65_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1704_c7_de65_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1704_c7_de65_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1710_c7_38d0_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1704_c7_de65_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1705_c3_bb75_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1705_c3_bb75_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1705_c3_bb75_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1708_c21_0bd8_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1710_c11_2d0b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1710_c11_2d0b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1710_c11_2d0b_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1710_c7_38d0_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1711_c3_1b5d : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1710_c7_38d0_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1710_c7_38d0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1710_c7_38d0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1710_c7_38d0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1714_c7_15c1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1710_c7_38d0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_38d0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_38d0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1714_c7_15c1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_38d0_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1710_c7_38d0_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1710_c7_38d0_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1710_c7_38d0_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1712_c31_a898_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1712_c31_a898_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1712_c21_e1a7_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1714_c11_7d87_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1714_c11_7d87_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1714_c11_7d87_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1714_c7_15c1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1714_c7_15c1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1714_c7_15c1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1714_c7_15c1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1714_c7_15c1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1714_c7_15c1_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1686_l1714_l1683_l1710_l1678_l1700_l1696_l1690_DUPLICATE_f7eb_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1686_l1678_l1683_l1696_DUPLICATE_afa3_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1686_l1678_l1683_l1696_DUPLICATE_7fd6_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1686_l1678_l1690_l1683_DUPLICATE_dbc7_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1686_l1683_l1710_l1678_l1700_l1696_l1690_DUPLICATE_c3d7_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1686_l1714_l1683_l1710_l1704_l1700_l1696_l1690_DUPLICATE_31e9_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1691_l1687_DUPLICATE_e2c7_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1686_l1710_l1700_l1696_l1690_DUPLICATE_d37d_return_output : unsigned(3 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1705_l1701_DUPLICATE_b770_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5517_uxn_opcodes_h_l1674_l1719_DUPLICATE_8a3b_return_output : opcode_result_t;
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
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1704_c7_de65_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1693_c30_878e_y := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1690_c7_e815_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1686_c11_f0b3_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1704_c11_5364_right := to_unsigned(6, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1714_c7_15c1_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1707_c3_52d2 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1704_c7_de65_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1707_c3_52d2;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1696_c11_5243_right := to_unsigned(4, 3);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1698_c22_006f_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1714_c11_7d87_right := to_unsigned(8, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1710_c11_2d0b_right := to_unsigned(7, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1680_c3_3db6 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1678_c2_c7fc_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1680_c3_3db6;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1683_c11_efed_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1678_c6_ed4e_right := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1696_c7_9917_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1690_c11_2de1_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1700_c11_148e_right := to_unsigned(5, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1678_c2_c7fc_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1693_c30_878e_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1678_c1_2fa4_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1684_c3_23ab := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c7_6ec0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1684_c3_23ab;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1711_c3_1b5d := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1710_c7_38d0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1711_c3_1b5d;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1714_c7_15c1_iftrue := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1678_c1_2fa4_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l1693_c30_878e_ins := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1678_c6_ed4e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1683_c11_efed_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1686_c11_f0b3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1690_c11_2de1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1696_c11_5243_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1700_c11_148e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1704_c11_5364_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1710_c11_2d0b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1714_c11_7d87_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1691_c3_076c_left := t16;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1698_c22_006f_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1678_c2_c7fc_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1683_c7_6ec0_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1690_c7_e815_iffalse := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1705_c3_bb75_left := tmp16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1712_c31_a898_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1678_c2_c7fc_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1683_c7_6ec0_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1686_c7_4f6f_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1690_c7_e815_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1696_c7_9917_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1704_c7_de65_iffalse := tmp16;
     -- BIN_OP_PLUS[uxn_opcodes_h_l1698_c22_006f] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1698_c22_006f_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1698_c22_006f_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1698_c22_006f_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1698_c22_006f_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1698_c22_006f_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1698_c22_006f_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1686_l1714_l1683_l1710_l1678_l1700_l1696_l1690_DUPLICATE_f7eb LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1686_l1714_l1683_l1710_l1678_l1700_l1696_l1690_DUPLICATE_f7eb_return_output := result.is_stack_write;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1691_l1687_DUPLICATE_e2c7 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1691_l1687_DUPLICATE_e2c7_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1690_c11_2de1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1690_c11_2de1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1690_c11_2de1_left;
     BIN_OP_EQ_uxn_opcodes_h_l1690_c11_2de1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1690_c11_2de1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1690_c11_2de1_return_output := BIN_OP_EQ_uxn_opcodes_h_l1690_c11_2de1_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1686_l1678_l1690_l1683_DUPLICATE_dbc7 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1686_l1678_l1690_l1683_DUPLICATE_dbc7_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1696_c11_5243] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1696_c11_5243_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1696_c11_5243_left;
     BIN_OP_EQ_uxn_opcodes_h_l1696_c11_5243_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1696_c11_5243_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1696_c11_5243_return_output := BIN_OP_EQ_uxn_opcodes_h_l1696_c11_5243_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l1693_c30_878e] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1693_c30_878e_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1693_c30_878e_ins;
     sp_relative_shift_uxn_opcodes_h_l1693_c30_878e_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1693_c30_878e_x;
     sp_relative_shift_uxn_opcodes_h_l1693_c30_878e_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1693_c30_878e_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1693_c30_878e_return_output := sp_relative_shift_uxn_opcodes_h_l1693_c30_878e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1686_c11_f0b3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1686_c11_f0b3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1686_c11_f0b3_left;
     BIN_OP_EQ_uxn_opcodes_h_l1686_c11_f0b3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1686_c11_f0b3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1686_c11_f0b3_return_output := BIN_OP_EQ_uxn_opcodes_h_l1686_c11_f0b3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1683_c11_efed] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1683_c11_efed_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1683_c11_efed_left;
     BIN_OP_EQ_uxn_opcodes_h_l1683_c11_efed_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1683_c11_efed_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1683_c11_efed_return_output := BIN_OP_EQ_uxn_opcodes_h_l1683_c11_efed_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1686_l1710_l1700_l1696_l1690_DUPLICATE_d37d LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1686_l1710_l1700_l1696_l1690_DUPLICATE_d37d_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1686_l1678_l1683_l1696_DUPLICATE_afa3 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1686_l1678_l1683_l1696_DUPLICATE_afa3_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1704_c11_5364] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1704_c11_5364_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1704_c11_5364_left;
     BIN_OP_EQ_uxn_opcodes_h_l1704_c11_5364_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1704_c11_5364_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1704_c11_5364_return_output := BIN_OP_EQ_uxn_opcodes_h_l1704_c11_5364_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1686_l1714_l1683_l1710_l1704_l1700_l1696_l1690_DUPLICATE_31e9 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1686_l1714_l1683_l1710_l1704_l1700_l1696_l1690_DUPLICATE_31e9_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1686_l1683_l1710_l1678_l1700_l1696_l1690_DUPLICATE_c3d7 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1686_l1683_l1710_l1678_l1700_l1696_l1690_DUPLICATE_c3d7_return_output := result.u8_value;

     -- CONST_SR_8[uxn_opcodes_h_l1712_c31_a898] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1712_c31_a898_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1712_c31_a898_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1712_c31_a898_return_output := CONST_SR_8_uxn_opcodes_h_l1712_c31_a898_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1700_c11_148e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1700_c11_148e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1700_c11_148e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1700_c11_148e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1700_c11_148e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1700_c11_148e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1700_c11_148e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1714_c11_7d87] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1714_c11_7d87_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1714_c11_7d87_left;
     BIN_OP_EQ_uxn_opcodes_h_l1714_c11_7d87_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1714_c11_7d87_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1714_c11_7d87_return_output := BIN_OP_EQ_uxn_opcodes_h_l1714_c11_7d87_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1686_l1678_l1683_l1696_DUPLICATE_7fd6 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1686_l1678_l1683_l1696_DUPLICATE_7fd6_return_output := result.u16_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1710_c11_2d0b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1710_c11_2d0b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1710_c11_2d0b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1710_c11_2d0b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1710_c11_2d0b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1710_c11_2d0b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1710_c11_2d0b_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1705_l1701_DUPLICATE_b770 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1705_l1701_DUPLICATE_b770_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1678_c6_ed4e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1678_c6_ed4e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1678_c6_ed4e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1678_c6_ed4e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1678_c6_ed4e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1678_c6_ed4e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1678_c6_ed4e_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1678_c1_2fa4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1678_c6_ed4e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1678_c2_c7fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1678_c6_ed4e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1678_c2_c7fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1678_c6_ed4e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1678_c2_c7fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1678_c6_ed4e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1678_c2_c7fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1678_c6_ed4e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1678_c2_c7fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1678_c6_ed4e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1678_c2_c7fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1678_c6_ed4e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1678_c2_c7fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1678_c6_ed4e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1678_c2_c7fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1678_c6_ed4e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1678_c2_c7fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1678_c6_ed4e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1683_c7_6ec0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1683_c11_efed_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1683_c7_6ec0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1683_c11_efed_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1683_c7_6ec0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1683_c11_efed_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c7_6ec0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1683_c11_efed_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c7_6ec0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1683_c11_efed_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1683_c7_6ec0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1683_c11_efed_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1683_c7_6ec0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1683_c11_efed_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1683_c7_6ec0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1683_c11_efed_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1683_c7_6ec0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1683_c11_efed_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1686_c7_4f6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1686_c11_f0b3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c7_4f6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1686_c11_f0b3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1686_c7_4f6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1686_c11_f0b3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c7_4f6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1686_c11_f0b3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c7_4f6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1686_c11_f0b3_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1686_c7_4f6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1686_c11_f0b3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1686_c7_4f6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1686_c11_f0b3_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1686_c7_4f6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1686_c11_f0b3_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1686_c7_4f6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1686_c11_f0b3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1690_c7_e815_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1690_c11_2de1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1690_c7_e815_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1690_c11_2de1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1690_c7_e815_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1690_c11_2de1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1690_c7_e815_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1690_c11_2de1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1690_c7_e815_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1690_c11_2de1_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1690_c7_e815_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1690_c11_2de1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1690_c7_e815_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1690_c11_2de1_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1690_c7_e815_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1690_c11_2de1_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1690_c7_e815_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1690_c11_2de1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_9917_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1696_c11_5243_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1696_c7_9917_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1696_c11_5243_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_9917_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1696_c11_5243_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_9917_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1696_c11_5243_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1696_c7_9917_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1696_c11_5243_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1696_c7_9917_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1696_c11_5243_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1696_c7_9917_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1696_c11_5243_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1700_c7_1bc6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1700_c11_148e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1700_c7_1bc6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1700_c11_148e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c7_1bc6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1700_c11_148e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1700_c7_1bc6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1700_c11_148e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1700_c7_1bc6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1700_c11_148e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1704_c7_de65_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1704_c11_5364_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1704_c7_de65_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1704_c11_5364_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1704_c7_de65_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1704_c11_5364_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1704_c7_de65_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1704_c11_5364_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1704_c7_de65_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1704_c11_5364_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_38d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1710_c11_2d0b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1710_c7_38d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1710_c11_2d0b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1710_c7_38d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1710_c11_2d0b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1710_c7_38d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1710_c11_2d0b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1714_c7_15c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1714_c11_7d87_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1714_c7_15c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1714_c11_7d87_return_output;
     VAR_result_u16_value_uxn_opcodes_h_l1698_c3_f3e2 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1698_c22_006f_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l1691_c3_076c_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1691_l1687_DUPLICATE_e2c7_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1688_c3_1ee5_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1691_l1687_DUPLICATE_e2c7_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1705_c3_bb75_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1705_l1701_DUPLICATE_b770_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1702_c3_fb86_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1705_l1701_DUPLICATE_b770_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1678_c2_c7fc_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1686_l1678_l1690_l1683_DUPLICATE_dbc7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c7_6ec0_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1686_l1678_l1690_l1683_DUPLICATE_dbc7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c7_4f6f_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1686_l1678_l1690_l1683_DUPLICATE_dbc7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1690_c7_e815_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1686_l1678_l1690_l1683_DUPLICATE_dbc7_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1678_c2_c7fc_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1686_l1678_l1683_l1696_DUPLICATE_7fd6_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1683_c7_6ec0_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1686_l1678_l1683_l1696_DUPLICATE_7fd6_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1686_c7_4f6f_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1686_l1678_l1683_l1696_DUPLICATE_7fd6_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1696_c7_9917_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1686_l1678_l1683_l1696_DUPLICATE_7fd6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1683_c7_6ec0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1686_l1714_l1683_l1710_l1704_l1700_l1696_l1690_DUPLICATE_31e9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1686_c7_4f6f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1686_l1714_l1683_l1710_l1704_l1700_l1696_l1690_DUPLICATE_31e9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1690_c7_e815_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1686_l1714_l1683_l1710_l1704_l1700_l1696_l1690_DUPLICATE_31e9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_9917_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1686_l1714_l1683_l1710_l1704_l1700_l1696_l1690_DUPLICATE_31e9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1700_c7_1bc6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1686_l1714_l1683_l1710_l1704_l1700_l1696_l1690_DUPLICATE_31e9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1704_c7_de65_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1686_l1714_l1683_l1710_l1704_l1700_l1696_l1690_DUPLICATE_31e9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_38d0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1686_l1714_l1683_l1710_l1704_l1700_l1696_l1690_DUPLICATE_31e9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1714_c7_15c1_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1686_l1714_l1683_l1710_l1704_l1700_l1696_l1690_DUPLICATE_31e9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1678_c2_c7fc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1686_l1678_l1683_l1696_DUPLICATE_afa3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1683_c7_6ec0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1686_l1678_l1683_l1696_DUPLICATE_afa3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c7_4f6f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1686_l1678_l1683_l1696_DUPLICATE_afa3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1696_c7_9917_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1686_l1678_l1683_l1696_DUPLICATE_afa3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1678_c2_c7fc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1686_l1714_l1683_l1710_l1678_l1700_l1696_l1690_DUPLICATE_f7eb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1683_c7_6ec0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1686_l1714_l1683_l1710_l1678_l1700_l1696_l1690_DUPLICATE_f7eb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1686_c7_4f6f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1686_l1714_l1683_l1710_l1678_l1700_l1696_l1690_DUPLICATE_f7eb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1690_c7_e815_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1686_l1714_l1683_l1710_l1678_l1700_l1696_l1690_DUPLICATE_f7eb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_9917_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1686_l1714_l1683_l1710_l1678_l1700_l1696_l1690_DUPLICATE_f7eb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1700_c7_1bc6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1686_l1714_l1683_l1710_l1678_l1700_l1696_l1690_DUPLICATE_f7eb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1710_c7_38d0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1686_l1714_l1683_l1710_l1678_l1700_l1696_l1690_DUPLICATE_f7eb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1714_c7_15c1_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1686_l1714_l1683_l1710_l1678_l1700_l1696_l1690_DUPLICATE_f7eb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c7_4f6f_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1686_l1710_l1700_l1696_l1690_DUPLICATE_d37d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1690_c7_e815_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1686_l1710_l1700_l1696_l1690_DUPLICATE_d37d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_9917_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1686_l1710_l1700_l1696_l1690_DUPLICATE_d37d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c7_1bc6_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1686_l1710_l1700_l1696_l1690_DUPLICATE_d37d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1710_c7_38d0_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1686_l1710_l1700_l1696_l1690_DUPLICATE_d37d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1678_c2_c7fc_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1686_l1683_l1710_l1678_l1700_l1696_l1690_DUPLICATE_c3d7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1683_c7_6ec0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1686_l1683_l1710_l1678_l1700_l1696_l1690_DUPLICATE_c3d7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1686_c7_4f6f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1686_l1683_l1710_l1678_l1700_l1696_l1690_DUPLICATE_c3d7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1690_c7_e815_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1686_l1683_l1710_l1678_l1700_l1696_l1690_DUPLICATE_c3d7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1696_c7_9917_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1686_l1683_l1710_l1678_l1700_l1696_l1690_DUPLICATE_c3d7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1700_c7_1bc6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1686_l1683_l1710_l1678_l1700_l1696_l1690_DUPLICATE_c3d7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1710_c7_38d0_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1686_l1683_l1710_l1678_l1700_l1696_l1690_DUPLICATE_c3d7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1690_c7_e815_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1693_c30_878e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1696_c7_9917_iftrue := VAR_result_u16_value_uxn_opcodes_h_l1698_c3_f3e2;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1696_c7_9917] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1696_c7_9917_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1696_c7_9917_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1696_c7_9917_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1696_c7_9917_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1696_c7_9917_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1696_c7_9917_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1696_c7_9917_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1696_c7_9917_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1696_c7_9917] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1696_c7_9917_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1696_c7_9917_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1696_c7_9917_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1696_c7_9917_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1696_c7_9917_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1696_c7_9917_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1696_c7_9917_return_output := result_u16_value_MUX_uxn_opcodes_h_l1696_c7_9917_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1714_c7_15c1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1714_c7_15c1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1714_c7_15c1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1714_c7_15c1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1714_c7_15c1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1714_c7_15c1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1714_c7_15c1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1714_c7_15c1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1714_c7_15c1_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1691_c3_076c] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1691_c3_076c_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1691_c3_076c_left;
     BIN_OP_OR_uxn_opcodes_h_l1691_c3_076c_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1691_c3_076c_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1691_c3_076c_return_output := BIN_OP_OR_uxn_opcodes_h_l1691_c3_076c_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1705_c3_bb75] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1705_c3_bb75_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1705_c3_bb75_left;
     BIN_OP_OR_uxn_opcodes_h_l1705_c3_bb75_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1705_c3_bb75_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1705_c3_bb75_return_output := BIN_OP_OR_uxn_opcodes_h_l1705_c3_bb75_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1714_c7_15c1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1714_c7_15c1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1714_c7_15c1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1714_c7_15c1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1714_c7_15c1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1714_c7_15c1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1714_c7_15c1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1714_c7_15c1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1714_c7_15c1_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1690_c7_e815] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1690_c7_e815_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1690_c7_e815_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1690_c7_e815_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1690_c7_e815_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1690_c7_e815_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1690_c7_e815_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1690_c7_e815_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1690_c7_e815_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l1702_c3_fb86] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1702_c3_fb86_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1702_c3_fb86_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1702_c3_fb86_return_output := CONST_SL_8_uxn_opcodes_h_l1702_c3_fb86_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1710_c7_38d0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1710_c7_38d0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1710_c7_38d0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1710_c7_38d0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1710_c7_38d0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1710_c7_38d0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1710_c7_38d0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1710_c7_38d0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1710_c7_38d0_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1678_c1_2fa4] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1678_c1_2fa4_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1678_c1_2fa4_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1678_c1_2fa4_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1678_c1_2fa4_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1678_c1_2fa4_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1678_c1_2fa4_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1678_c1_2fa4_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1678_c1_2fa4_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1712_c21_e1a7] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1712_c21_e1a7_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1712_c31_a898_return_output);

     -- CONST_SL_8[uxn_opcodes_h_l1688_c3_1ee5] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1688_c3_1ee5_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1688_c3_1ee5_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1688_c3_1ee5_return_output := CONST_SL_8_uxn_opcodes_h_l1688_c3_1ee5_return_output;

     -- Submodule level 2
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1690_c7_e815_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1691_c3_076c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1690_c7_e815_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1691_c3_076c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1704_c7_de65_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1705_c3_bb75_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1710_c7_38d0_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1712_c21_e1a7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1686_c7_4f6f_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1688_c3_1ee5_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1700_c7_1bc6_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1702_c3_fb86_return_output;
     VAR_printf_uxn_opcodes_h_l1679_c3_7720_uxn_opcodes_h_l1679_c3_7720_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1678_c1_2fa4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_38d0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1714_c7_15c1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1690_c7_e815_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1696_c7_9917_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1710_c7_38d0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1714_c7_15c1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c7_4f6f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1690_c7_e815_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1704_c7_de65_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1710_c7_38d0_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1690_c7_e815_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1696_c7_9917_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1710_c7_38d0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1710_c7_38d0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1710_c7_38d0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1710_c7_38d0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1710_c7_38d0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1710_c7_38d0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1710_c7_38d0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1710_c7_38d0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1710_c7_38d0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1704_c7_de65] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1704_c7_de65_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1704_c7_de65_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1704_c7_de65_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1704_c7_de65_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1704_c7_de65_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1704_c7_de65_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1704_c7_de65_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1704_c7_de65_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1690_c7_e815] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1690_c7_e815_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1690_c7_e815_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1690_c7_e815_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1690_c7_e815_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1690_c7_e815_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1690_c7_e815_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1690_c7_e815_return_output := result_u16_value_MUX_uxn_opcodes_h_l1690_c7_e815_return_output;

     -- t16_MUX[uxn_opcodes_h_l1690_c7_e815] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1690_c7_e815_cond <= VAR_t16_MUX_uxn_opcodes_h_l1690_c7_e815_cond;
     t16_MUX_uxn_opcodes_h_l1690_c7_e815_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1690_c7_e815_iftrue;
     t16_MUX_uxn_opcodes_h_l1690_c7_e815_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1690_c7_e815_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1690_c7_e815_return_output := t16_MUX_uxn_opcodes_h_l1690_c7_e815_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1710_c7_38d0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_38d0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_38d0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_38d0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_38d0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_38d0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_38d0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_38d0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_38d0_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1710_c7_38d0] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1710_c7_38d0_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1710_c7_38d0_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1710_c7_38d0_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1710_c7_38d0_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1710_c7_38d0_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1710_c7_38d0_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1710_c7_38d0_return_output := result_u8_value_MUX_uxn_opcodes_h_l1710_c7_38d0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1686_c7_4f6f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c7_4f6f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c7_4f6f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c7_4f6f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c7_4f6f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c7_4f6f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c7_4f6f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c7_4f6f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c7_4f6f_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1704_c7_de65] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1704_c7_de65_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1704_c7_de65_cond;
     tmp16_MUX_uxn_opcodes_h_l1704_c7_de65_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1704_c7_de65_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1704_c7_de65_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1704_c7_de65_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1704_c7_de65_return_output := tmp16_MUX_uxn_opcodes_h_l1704_c7_de65_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1708_c21_0bd8] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1708_c21_0bd8_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_OR_uxn_opcodes_h_l1705_c3_bb75_return_output);

     -- printf_uxn_opcodes_h_l1679_c3_7720[uxn_opcodes_h_l1679_c3_7720] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1679_c3_7720_uxn_opcodes_h_l1679_c3_7720_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1679_c3_7720_uxn_opcodes_h_l1679_c3_7720_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1690_c7_e815] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1690_c7_e815_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1690_c7_e815_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1690_c7_e815_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1690_c7_e815_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1690_c7_e815_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1690_c7_e815_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1690_c7_e815_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1690_c7_e815_return_output;

     -- Submodule level 3
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1704_c7_de65_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1708_c21_0bd8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1704_c7_de65_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1710_c7_38d0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c7_4f6f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1690_c7_e815_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1704_c7_de65_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1710_c7_38d0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c7_6ec0_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1686_c7_4f6f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c7_1bc6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1704_c7_de65_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1686_c7_4f6f_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1690_c7_e815_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1704_c7_de65_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1710_c7_38d0_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1686_c7_4f6f_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1690_c7_e815_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1700_c7_1bc6_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1704_c7_de65_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1700_c7_1bc6] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1700_c7_1bc6_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1700_c7_1bc6_cond;
     tmp16_MUX_uxn_opcodes_h_l1700_c7_1bc6_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1700_c7_1bc6_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1700_c7_1bc6_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1700_c7_1bc6_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1700_c7_1bc6_return_output := tmp16_MUX_uxn_opcodes_h_l1700_c7_1bc6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1704_c7_de65] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1704_c7_de65_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1704_c7_de65_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1704_c7_de65_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1704_c7_de65_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1704_c7_de65_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1704_c7_de65_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1704_c7_de65_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1704_c7_de65_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1683_c7_6ec0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c7_6ec0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c7_6ec0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c7_6ec0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c7_6ec0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c7_6ec0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c7_6ec0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c7_6ec0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c7_6ec0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1704_c7_de65] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1704_c7_de65_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1704_c7_de65_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1704_c7_de65_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1704_c7_de65_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1704_c7_de65_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1704_c7_de65_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1704_c7_de65_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1704_c7_de65_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1686_c7_4f6f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c7_4f6f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c7_4f6f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c7_4f6f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c7_4f6f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c7_4f6f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c7_4f6f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c7_4f6f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c7_4f6f_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1704_c7_de65] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1704_c7_de65_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1704_c7_de65_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1704_c7_de65_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1704_c7_de65_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1704_c7_de65_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1704_c7_de65_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1704_c7_de65_return_output := result_u8_value_MUX_uxn_opcodes_h_l1704_c7_de65_return_output;

     -- t16_MUX[uxn_opcodes_h_l1686_c7_4f6f] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1686_c7_4f6f_cond <= VAR_t16_MUX_uxn_opcodes_h_l1686_c7_4f6f_cond;
     t16_MUX_uxn_opcodes_h_l1686_c7_4f6f_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1686_c7_4f6f_iftrue;
     t16_MUX_uxn_opcodes_h_l1686_c7_4f6f_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1686_c7_4f6f_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1686_c7_4f6f_return_output := t16_MUX_uxn_opcodes_h_l1686_c7_4f6f_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1686_c7_4f6f] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1686_c7_4f6f_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1686_c7_4f6f_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1686_c7_4f6f_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1686_c7_4f6f_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1686_c7_4f6f_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1686_c7_4f6f_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1686_c7_4f6f_return_output := result_u16_value_MUX_uxn_opcodes_h_l1686_c7_4f6f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1700_c7_1bc6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c7_1bc6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c7_1bc6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c7_1bc6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c7_1bc6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c7_1bc6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c7_1bc6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c7_1bc6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c7_1bc6_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1700_c7_1bc6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1704_c7_de65_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1683_c7_6ec0_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1686_c7_4f6f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1700_c7_1bc6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1704_c7_de65_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1678_c2_c7fc_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1683_c7_6ec0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_9917_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c7_1bc6_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1683_c7_6ec0_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1686_c7_4f6f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1700_c7_1bc6_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1704_c7_de65_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1683_c7_6ec0_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1686_c7_4f6f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1696_c7_9917_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1700_c7_1bc6_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1700_c7_1bc6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1700_c7_1bc6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1700_c7_1bc6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1700_c7_1bc6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1700_c7_1bc6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1700_c7_1bc6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1700_c7_1bc6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1700_c7_1bc6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1700_c7_1bc6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1696_c7_9917] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_9917_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_9917_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_9917_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_9917_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_9917_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_9917_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_9917_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_9917_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1696_c7_9917] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1696_c7_9917_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1696_c7_9917_cond;
     tmp16_MUX_uxn_opcodes_h_l1696_c7_9917_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1696_c7_9917_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1696_c7_9917_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1696_c7_9917_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1696_c7_9917_return_output := tmp16_MUX_uxn_opcodes_h_l1696_c7_9917_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1683_c7_6ec0] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1683_c7_6ec0_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1683_c7_6ec0_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1683_c7_6ec0_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1683_c7_6ec0_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1683_c7_6ec0_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1683_c7_6ec0_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1683_c7_6ec0_return_output := result_u16_value_MUX_uxn_opcodes_h_l1683_c7_6ec0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1678_c2_c7fc] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1678_c2_c7fc_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1678_c2_c7fc_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1678_c2_c7fc_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1678_c2_c7fc_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1678_c2_c7fc_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1678_c2_c7fc_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1678_c2_c7fc_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1678_c2_c7fc_return_output;

     -- t16_MUX[uxn_opcodes_h_l1683_c7_6ec0] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1683_c7_6ec0_cond <= VAR_t16_MUX_uxn_opcodes_h_l1683_c7_6ec0_cond;
     t16_MUX_uxn_opcodes_h_l1683_c7_6ec0_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1683_c7_6ec0_iftrue;
     t16_MUX_uxn_opcodes_h_l1683_c7_6ec0_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1683_c7_6ec0_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1683_c7_6ec0_return_output := t16_MUX_uxn_opcodes_h_l1683_c7_6ec0_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1683_c7_6ec0] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1683_c7_6ec0_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1683_c7_6ec0_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1683_c7_6ec0_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1683_c7_6ec0_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1683_c7_6ec0_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1683_c7_6ec0_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1683_c7_6ec0_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1683_c7_6ec0_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1700_c7_1bc6] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1700_c7_1bc6_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1700_c7_1bc6_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1700_c7_1bc6_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1700_c7_1bc6_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1700_c7_1bc6_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1700_c7_1bc6_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1700_c7_1bc6_return_output := result_u8_value_MUX_uxn_opcodes_h_l1700_c7_1bc6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1700_c7_1bc6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1700_c7_1bc6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1700_c7_1bc6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1700_c7_1bc6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1700_c7_1bc6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1700_c7_1bc6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1700_c7_1bc6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1700_c7_1bc6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1700_c7_1bc6_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_9917_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1700_c7_1bc6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1678_c2_c7fc_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1683_c7_6ec0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_9917_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1700_c7_1bc6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1690_c7_e815_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_9917_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1678_c2_c7fc_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1683_c7_6ec0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1696_c7_9917_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1700_c7_1bc6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1678_c2_c7fc_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1683_c7_6ec0_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1690_c7_e815_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1696_c7_9917_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l1678_c2_c7fc] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1678_c2_c7fc_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1678_c2_c7fc_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1678_c2_c7fc_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1678_c2_c7fc_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1678_c2_c7fc_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1678_c2_c7fc_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1678_c2_c7fc_return_output := result_u16_value_MUX_uxn_opcodes_h_l1678_c2_c7fc_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1696_c7_9917] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1696_c7_9917_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1696_c7_9917_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1696_c7_9917_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1696_c7_9917_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1696_c7_9917_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1696_c7_9917_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1696_c7_9917_return_output := result_u8_value_MUX_uxn_opcodes_h_l1696_c7_9917_return_output;

     -- t16_MUX[uxn_opcodes_h_l1678_c2_c7fc] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1678_c2_c7fc_cond <= VAR_t16_MUX_uxn_opcodes_h_l1678_c2_c7fc_cond;
     t16_MUX_uxn_opcodes_h_l1678_c2_c7fc_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1678_c2_c7fc_iftrue;
     t16_MUX_uxn_opcodes_h_l1678_c2_c7fc_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1678_c2_c7fc_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1678_c2_c7fc_return_output := t16_MUX_uxn_opcodes_h_l1678_c2_c7fc_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1690_c7_e815] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1690_c7_e815_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1690_c7_e815_cond;
     tmp16_MUX_uxn_opcodes_h_l1690_c7_e815_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1690_c7_e815_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1690_c7_e815_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1690_c7_e815_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1690_c7_e815_return_output := tmp16_MUX_uxn_opcodes_h_l1690_c7_e815_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1678_c2_c7fc] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1678_c2_c7fc_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1678_c2_c7fc_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1678_c2_c7fc_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1678_c2_c7fc_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1678_c2_c7fc_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1678_c2_c7fc_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1678_c2_c7fc_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1678_c2_c7fc_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1696_c7_9917] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_9917_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_9917_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_9917_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_9917_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_9917_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_9917_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_9917_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_9917_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1690_c7_e815] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1690_c7_e815_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1690_c7_e815_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1690_c7_e815_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1690_c7_e815_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1690_c7_e815_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1690_c7_e815_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1690_c7_e815_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1690_c7_e815_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1696_c7_9917] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_9917_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_9917_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_9917_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_9917_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_9917_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_9917_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_9917_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_9917_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1690_c7_e815_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_9917_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1690_c7_e815_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1696_c7_9917_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c7_4f6f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1690_c7_e815_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1690_c7_e815_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1696_c7_9917_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1678_c2_c7fc_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1686_c7_4f6f_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1690_c7_e815_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1690_c7_e815] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1690_c7_e815_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1690_c7_e815_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1690_c7_e815_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1690_c7_e815_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1690_c7_e815_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1690_c7_e815_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1690_c7_e815_return_output := result_u8_value_MUX_uxn_opcodes_h_l1690_c7_e815_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1690_c7_e815] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1690_c7_e815_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1690_c7_e815_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1690_c7_e815_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1690_c7_e815_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1690_c7_e815_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1690_c7_e815_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1690_c7_e815_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1690_c7_e815_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1686_c7_4f6f] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1686_c7_4f6f_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1686_c7_4f6f_cond;
     tmp16_MUX_uxn_opcodes_h_l1686_c7_4f6f_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1686_c7_4f6f_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1686_c7_4f6f_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1686_c7_4f6f_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1686_c7_4f6f_return_output := tmp16_MUX_uxn_opcodes_h_l1686_c7_4f6f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1690_c7_e815] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1690_c7_e815_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1690_c7_e815_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1690_c7_e815_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1690_c7_e815_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1690_c7_e815_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1690_c7_e815_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1690_c7_e815_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1690_c7_e815_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1686_c7_4f6f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c7_4f6f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c7_4f6f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c7_4f6f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c7_4f6f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c7_4f6f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c7_4f6f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c7_4f6f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c7_4f6f_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1686_c7_4f6f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1690_c7_e815_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1686_c7_4f6f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1690_c7_e815_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c7_6ec0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1686_c7_4f6f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1686_c7_4f6f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1690_c7_e815_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1683_c7_6ec0_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1686_c7_4f6f_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1683_c7_6ec0] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1683_c7_6ec0_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1683_c7_6ec0_cond;
     tmp16_MUX_uxn_opcodes_h_l1683_c7_6ec0_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1683_c7_6ec0_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1683_c7_6ec0_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1683_c7_6ec0_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1683_c7_6ec0_return_output := tmp16_MUX_uxn_opcodes_h_l1683_c7_6ec0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1683_c7_6ec0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c7_6ec0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c7_6ec0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c7_6ec0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c7_6ec0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c7_6ec0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c7_6ec0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c7_6ec0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c7_6ec0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1686_c7_4f6f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1686_c7_4f6f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1686_c7_4f6f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1686_c7_4f6f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1686_c7_4f6f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1686_c7_4f6f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1686_c7_4f6f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1686_c7_4f6f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1686_c7_4f6f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1686_c7_4f6f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1686_c7_4f6f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1686_c7_4f6f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1686_c7_4f6f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1686_c7_4f6f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1686_c7_4f6f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1686_c7_4f6f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1686_c7_4f6f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1686_c7_4f6f_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1686_c7_4f6f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1686_c7_4f6f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1686_c7_4f6f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1686_c7_4f6f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1686_c7_4f6f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1686_c7_4f6f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1686_c7_4f6f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1686_c7_4f6f_return_output := result_u8_value_MUX_uxn_opcodes_h_l1686_c7_4f6f_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1683_c7_6ec0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1686_c7_4f6f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1683_c7_6ec0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1686_c7_4f6f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1678_c2_c7fc_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1683_c7_6ec0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1683_c7_6ec0_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1686_c7_4f6f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1678_c2_c7fc_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1683_c7_6ec0_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1678_c2_c7fc] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1678_c2_c7fc_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1678_c2_c7fc_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1678_c2_c7fc_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1678_c2_c7fc_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1678_c2_c7fc_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1678_c2_c7fc_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1678_c2_c7fc_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1678_c2_c7fc_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1683_c7_6ec0] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1683_c7_6ec0_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1683_c7_6ec0_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1683_c7_6ec0_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1683_c7_6ec0_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1683_c7_6ec0_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1683_c7_6ec0_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1683_c7_6ec0_return_output := result_u8_value_MUX_uxn_opcodes_h_l1683_c7_6ec0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1683_c7_6ec0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1683_c7_6ec0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1683_c7_6ec0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1683_c7_6ec0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1683_c7_6ec0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1683_c7_6ec0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1683_c7_6ec0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1683_c7_6ec0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1683_c7_6ec0_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1678_c2_c7fc] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1678_c2_c7fc_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1678_c2_c7fc_cond;
     tmp16_MUX_uxn_opcodes_h_l1678_c2_c7fc_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1678_c2_c7fc_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1678_c2_c7fc_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1678_c2_c7fc_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1678_c2_c7fc_return_output := tmp16_MUX_uxn_opcodes_h_l1678_c2_c7fc_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1683_c7_6ec0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1683_c7_6ec0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1683_c7_6ec0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1683_c7_6ec0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1683_c7_6ec0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1683_c7_6ec0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1683_c7_6ec0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1683_c7_6ec0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1683_c7_6ec0_return_output;

     -- Submodule level 9
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1678_c2_c7fc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1683_c7_6ec0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1678_c2_c7fc_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1683_c7_6ec0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1678_c2_c7fc_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1683_c7_6ec0_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l1678_c2_c7fc_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1678_c2_c7fc] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1678_c2_c7fc_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1678_c2_c7fc_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1678_c2_c7fc_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1678_c2_c7fc_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1678_c2_c7fc_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1678_c2_c7fc_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1678_c2_c7fc_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1678_c2_c7fc_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1678_c2_c7fc] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1678_c2_c7fc_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1678_c2_c7fc_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1678_c2_c7fc_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1678_c2_c7fc_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1678_c2_c7fc_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1678_c2_c7fc_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1678_c2_c7fc_return_output := result_u8_value_MUX_uxn_opcodes_h_l1678_c2_c7fc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1678_c2_c7fc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1678_c2_c7fc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1678_c2_c7fc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1678_c2_c7fc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1678_c2_c7fc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1678_c2_c7fc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1678_c2_c7fc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1678_c2_c7fc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1678_c2_c7fc_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_5517_uxn_opcodes_h_l1674_l1719_DUPLICATE_8a3b LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5517_uxn_opcodes_h_l1674_l1719_DUPLICATE_8a3b_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_5517(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1678_c2_c7fc_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1678_c2_c7fc_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1678_c2_c7fc_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1678_c2_c7fc_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1678_c2_c7fc_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1678_c2_c7fc_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1678_c2_c7fc_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5517_uxn_opcodes_h_l1674_l1719_DUPLICATE_8a3b_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5517_uxn_opcodes_h_l1674_l1719_DUPLICATE_8a3b_return_output;
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
