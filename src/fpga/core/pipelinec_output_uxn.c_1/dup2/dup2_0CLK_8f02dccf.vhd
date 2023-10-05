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
-- Submodules: 81
entity dup2_0CLK_8f02dccf is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end dup2_0CLK_8f02dccf;
architecture arch of dup2_0CLK_8f02dccf is
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
-- BIN_OP_EQ[uxn_opcodes_h_l2748_c6_bcc5]
signal BIN_OP_EQ_uxn_opcodes_h_l2748_c6_bcc5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2748_c6_bcc5_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2748_c6_bcc5_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2748_c1_3ddb]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c1_3ddb_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c1_3ddb_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c1_3ddb_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c1_3ddb_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2748_c2_3430]
signal result_stack_value_MUX_uxn_opcodes_h_l2748_c2_3430_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2748_c2_3430_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2748_c2_3430_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2748_c2_3430_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2748_c2_3430]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2748_c2_3430_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2748_c2_3430_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2748_c2_3430_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2748_c2_3430_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2748_c2_3430]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2748_c2_3430_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2748_c2_3430_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2748_c2_3430_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2748_c2_3430_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2748_c2_3430]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2748_c2_3430_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2748_c2_3430_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2748_c2_3430_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2748_c2_3430_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2748_c2_3430]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2748_c2_3430_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2748_c2_3430_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2748_c2_3430_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2748_c2_3430_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2748_c2_3430]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2748_c2_3430_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2748_c2_3430_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2748_c2_3430_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2748_c2_3430_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2748_c2_3430]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2748_c2_3430_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2748_c2_3430_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2748_c2_3430_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2748_c2_3430_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2748_c2_3430]
signal t16_MUX_uxn_opcodes_h_l2748_c2_3430_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2748_c2_3430_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2748_c2_3430_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2748_c2_3430_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l2749_c3_3e4e[uxn_opcodes_h_l2749_c3_3e4e]
signal printf_uxn_opcodes_h_l2749_c3_3e4e_uxn_opcodes_h_l2749_c3_3e4e_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2754_c11_01ee]
signal BIN_OP_EQ_uxn_opcodes_h_l2754_c11_01ee_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2754_c11_01ee_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2754_c11_01ee_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2754_c7_df8c]
signal result_stack_value_MUX_uxn_opcodes_h_l2754_c7_df8c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2754_c7_df8c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2754_c7_df8c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2754_c7_df8c_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2754_c7_df8c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2754_c7_df8c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2754_c7_df8c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2754_c7_df8c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2754_c7_df8c_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2754_c7_df8c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2754_c7_df8c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2754_c7_df8c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2754_c7_df8c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2754_c7_df8c_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2754_c7_df8c]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2754_c7_df8c_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2754_c7_df8c_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2754_c7_df8c_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2754_c7_df8c_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2754_c7_df8c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2754_c7_df8c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2754_c7_df8c_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2754_c7_df8c_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2754_c7_df8c_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2754_c7_df8c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2754_c7_df8c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2754_c7_df8c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2754_c7_df8c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2754_c7_df8c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2754_c7_df8c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2754_c7_df8c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2754_c7_df8c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2754_c7_df8c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2754_c7_df8c_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2754_c7_df8c]
signal t16_MUX_uxn_opcodes_h_l2754_c7_df8c_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2754_c7_df8c_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2754_c7_df8c_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2754_c7_df8c_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2757_c11_60b5]
signal BIN_OP_EQ_uxn_opcodes_h_l2757_c11_60b5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2757_c11_60b5_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2757_c11_60b5_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2757_c7_6bff]
signal result_stack_value_MUX_uxn_opcodes_h_l2757_c7_6bff_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2757_c7_6bff_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2757_c7_6bff_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2757_c7_6bff_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2757_c7_6bff]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2757_c7_6bff_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2757_c7_6bff_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2757_c7_6bff_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2757_c7_6bff_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2757_c7_6bff]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2757_c7_6bff_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2757_c7_6bff_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2757_c7_6bff_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2757_c7_6bff_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2757_c7_6bff]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2757_c7_6bff_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2757_c7_6bff_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2757_c7_6bff_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2757_c7_6bff_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2757_c7_6bff]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2757_c7_6bff_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2757_c7_6bff_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2757_c7_6bff_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2757_c7_6bff_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2757_c7_6bff]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2757_c7_6bff_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2757_c7_6bff_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2757_c7_6bff_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2757_c7_6bff_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2757_c7_6bff]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2757_c7_6bff_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2757_c7_6bff_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2757_c7_6bff_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2757_c7_6bff_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2757_c7_6bff]
signal t16_MUX_uxn_opcodes_h_l2757_c7_6bff_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2757_c7_6bff_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2757_c7_6bff_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2757_c7_6bff_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l2759_c3_de99]
signal CONST_SL_8_uxn_opcodes_h_l2759_c3_de99_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l2759_c3_de99_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2762_c11_e66d]
signal BIN_OP_EQ_uxn_opcodes_h_l2762_c11_e66d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2762_c11_e66d_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2762_c11_e66d_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2762_c7_d00e]
signal result_stack_value_MUX_uxn_opcodes_h_l2762_c7_d00e_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2762_c7_d00e_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2762_c7_d00e_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2762_c7_d00e_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2762_c7_d00e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2762_c7_d00e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2762_c7_d00e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2762_c7_d00e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2762_c7_d00e_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2762_c7_d00e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2762_c7_d00e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2762_c7_d00e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2762_c7_d00e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2762_c7_d00e_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2762_c7_d00e]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2762_c7_d00e_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2762_c7_d00e_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2762_c7_d00e_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2762_c7_d00e_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2762_c7_d00e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2762_c7_d00e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2762_c7_d00e_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2762_c7_d00e_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2762_c7_d00e_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2762_c7_d00e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2762_c7_d00e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2762_c7_d00e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2762_c7_d00e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2762_c7_d00e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2762_c7_d00e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2762_c7_d00e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2762_c7_d00e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2762_c7_d00e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2762_c7_d00e_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2762_c7_d00e]
signal t16_MUX_uxn_opcodes_h_l2762_c7_d00e_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2762_c7_d00e_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2762_c7_d00e_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2762_c7_d00e_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2765_c11_8343]
signal BIN_OP_EQ_uxn_opcodes_h_l2765_c11_8343_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2765_c11_8343_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2765_c11_8343_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2765_c7_1d31]
signal result_stack_value_MUX_uxn_opcodes_h_l2765_c7_1d31_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2765_c7_1d31_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2765_c7_1d31_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2765_c7_1d31_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2765_c7_1d31]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2765_c7_1d31_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2765_c7_1d31_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2765_c7_1d31_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2765_c7_1d31_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2765_c7_1d31]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2765_c7_1d31_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2765_c7_1d31_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2765_c7_1d31_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2765_c7_1d31_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2765_c7_1d31]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2765_c7_1d31_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2765_c7_1d31_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2765_c7_1d31_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2765_c7_1d31_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2765_c7_1d31]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2765_c7_1d31_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2765_c7_1d31_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2765_c7_1d31_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2765_c7_1d31_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2765_c7_1d31]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2765_c7_1d31_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2765_c7_1d31_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2765_c7_1d31_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2765_c7_1d31_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2765_c7_1d31]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2765_c7_1d31_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2765_c7_1d31_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2765_c7_1d31_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2765_c7_1d31_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2765_c7_1d31]
signal t16_MUX_uxn_opcodes_h_l2765_c7_1d31_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2765_c7_1d31_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2765_c7_1d31_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2765_c7_1d31_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2766_c3_e20e]
signal BIN_OP_OR_uxn_opcodes_h_l2766_c3_e20e_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2766_c3_e20e_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2766_c3_e20e_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2769_c32_e3d4]
signal BIN_OP_AND_uxn_opcodes_h_l2769_c32_e3d4_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2769_c32_e3d4_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2769_c32_e3d4_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l2769_c32_8380]
signal BIN_OP_GT_uxn_opcodes_h_l2769_c32_8380_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2769_c32_8380_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2769_c32_8380_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2769_c32_ccee]
signal MUX_uxn_opcodes_h_l2769_c32_ccee_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2769_c32_ccee_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2769_c32_ccee_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2769_c32_ccee_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2771_c11_cc47]
signal BIN_OP_EQ_uxn_opcodes_h_l2771_c11_cc47_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2771_c11_cc47_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2771_c11_cc47_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2771_c7_9e37]
signal result_stack_value_MUX_uxn_opcodes_h_l2771_c7_9e37_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2771_c7_9e37_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2771_c7_9e37_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2771_c7_9e37_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2771_c7_9e37]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2771_c7_9e37_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2771_c7_9e37_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2771_c7_9e37_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2771_c7_9e37_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2771_c7_9e37]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2771_c7_9e37_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2771_c7_9e37_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2771_c7_9e37_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2771_c7_9e37_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2771_c7_9e37]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2771_c7_9e37_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2771_c7_9e37_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2771_c7_9e37_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2771_c7_9e37_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2771_c7_9e37]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2771_c7_9e37_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2771_c7_9e37_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2771_c7_9e37_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2771_c7_9e37_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2777_c11_2da3]
signal BIN_OP_EQ_uxn_opcodes_h_l2777_c11_2da3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2777_c11_2da3_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2777_c11_2da3_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2777_c7_d750]
signal result_stack_value_MUX_uxn_opcodes_h_l2777_c7_d750_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2777_c7_d750_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2777_c7_d750_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2777_c7_d750_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2777_c7_d750]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2777_c7_d750_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2777_c7_d750_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2777_c7_d750_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2777_c7_d750_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2777_c7_d750]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2777_c7_d750_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2777_c7_d750_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2777_c7_d750_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2777_c7_d750_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2777_c7_d750]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2777_c7_d750_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2777_c7_d750_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2777_c7_d750_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2777_c7_d750_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2781_c11_cd8e]
signal BIN_OP_EQ_uxn_opcodes_h_l2781_c11_cd8e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2781_c11_cd8e_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2781_c11_cd8e_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2781_c7_95ed]
signal result_stack_value_MUX_uxn_opcodes_h_l2781_c7_95ed_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2781_c7_95ed_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2781_c7_95ed_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2781_c7_95ed_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2781_c7_95ed]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2781_c7_95ed_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2781_c7_95ed_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2781_c7_95ed_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2781_c7_95ed_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2781_c7_95ed]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2781_c7_95ed_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2781_c7_95ed_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2781_c7_95ed_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2781_c7_95ed_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2781_c7_95ed]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2781_c7_95ed_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2781_c7_95ed_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2781_c7_95ed_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2781_c7_95ed_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2785_c11_9d27]
signal BIN_OP_EQ_uxn_opcodes_h_l2785_c11_9d27_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2785_c11_9d27_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2785_c11_9d27_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2785_c7_ad1c]
signal result_stack_value_MUX_uxn_opcodes_h_l2785_c7_ad1c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2785_c7_ad1c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2785_c7_ad1c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2785_c7_ad1c_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2785_c7_ad1c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2785_c7_ad1c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2785_c7_ad1c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2785_c7_ad1c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2785_c7_ad1c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2785_c7_ad1c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2785_c7_ad1c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2785_c7_ad1c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2785_c7_ad1c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2785_c7_ad1c_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2785_c7_ad1c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2785_c7_ad1c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2785_c7_ad1c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2785_c7_ad1c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2785_c7_ad1c_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2789_c11_e697]
signal BIN_OP_EQ_uxn_opcodes_h_l2789_c11_e697_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2789_c11_e697_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2789_c11_e697_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2789_c7_358a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2789_c7_358a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2789_c7_358a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2789_c7_358a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2789_c7_358a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2789_c7_358a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2789_c7_358a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2789_c7_358a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2789_c7_358a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2789_c7_358a_return_output : unsigned(0 downto 0);

-- CONST_SR_8_uint16_t_uxn_opcodes_h_l2787_l2779_DUPLICATE_2ef4
signal CONST_SR_8_uint16_t_uxn_opcodes_h_l2787_l2779_DUPLICATE_2ef4_x : unsigned(15 downto 0);
signal CONST_SR_8_uint16_t_uxn_opcodes_h_l2787_l2779_DUPLICATE_2ef4_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
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

function CONST_REF_RD_opcode_result_t_opcode_result_t_df93( ref_toks_0 : opcode_result_t;
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
      base.stack_value := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.is_sp_shift := ref_toks_3;
      base.is_stack_read := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.is_stack_write := ref_toks_6;
      base.is_opc_done := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2748_c6_bcc5
BIN_OP_EQ_uxn_opcodes_h_l2748_c6_bcc5 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2748_c6_bcc5_left,
BIN_OP_EQ_uxn_opcodes_h_l2748_c6_bcc5_right,
BIN_OP_EQ_uxn_opcodes_h_l2748_c6_bcc5_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c1_3ddb
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c1_3ddb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c1_3ddb_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c1_3ddb_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c1_3ddb_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c1_3ddb_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2748_c2_3430
result_stack_value_MUX_uxn_opcodes_h_l2748_c2_3430 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2748_c2_3430_cond,
result_stack_value_MUX_uxn_opcodes_h_l2748_c2_3430_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2748_c2_3430_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2748_c2_3430_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2748_c2_3430
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2748_c2_3430 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2748_c2_3430_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2748_c2_3430_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2748_c2_3430_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2748_c2_3430_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2748_c2_3430
result_is_sp_shift_MUX_uxn_opcodes_h_l2748_c2_3430 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2748_c2_3430_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2748_c2_3430_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2748_c2_3430_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2748_c2_3430_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2748_c2_3430
result_is_stack_read_MUX_uxn_opcodes_h_l2748_c2_3430 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2748_c2_3430_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2748_c2_3430_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2748_c2_3430_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2748_c2_3430_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2748_c2_3430
result_sp_relative_shift_MUX_uxn_opcodes_h_l2748_c2_3430 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2748_c2_3430_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2748_c2_3430_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2748_c2_3430_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2748_c2_3430_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2748_c2_3430
result_is_stack_write_MUX_uxn_opcodes_h_l2748_c2_3430 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2748_c2_3430_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2748_c2_3430_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2748_c2_3430_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2748_c2_3430_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2748_c2_3430
result_is_opc_done_MUX_uxn_opcodes_h_l2748_c2_3430 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2748_c2_3430_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2748_c2_3430_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2748_c2_3430_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2748_c2_3430_return_output);

-- t16_MUX_uxn_opcodes_h_l2748_c2_3430
t16_MUX_uxn_opcodes_h_l2748_c2_3430 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2748_c2_3430_cond,
t16_MUX_uxn_opcodes_h_l2748_c2_3430_iftrue,
t16_MUX_uxn_opcodes_h_l2748_c2_3430_iffalse,
t16_MUX_uxn_opcodes_h_l2748_c2_3430_return_output);

-- printf_uxn_opcodes_h_l2749_c3_3e4e_uxn_opcodes_h_l2749_c3_3e4e
printf_uxn_opcodes_h_l2749_c3_3e4e_uxn_opcodes_h_l2749_c3_3e4e : entity work.printf_uxn_opcodes_h_l2749_c3_3e4e_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2749_c3_3e4e_uxn_opcodes_h_l2749_c3_3e4e_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2754_c11_01ee
BIN_OP_EQ_uxn_opcodes_h_l2754_c11_01ee : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2754_c11_01ee_left,
BIN_OP_EQ_uxn_opcodes_h_l2754_c11_01ee_right,
BIN_OP_EQ_uxn_opcodes_h_l2754_c11_01ee_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2754_c7_df8c
result_stack_value_MUX_uxn_opcodes_h_l2754_c7_df8c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2754_c7_df8c_cond,
result_stack_value_MUX_uxn_opcodes_h_l2754_c7_df8c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2754_c7_df8c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2754_c7_df8c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2754_c7_df8c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2754_c7_df8c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2754_c7_df8c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2754_c7_df8c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2754_c7_df8c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2754_c7_df8c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2754_c7_df8c
result_is_sp_shift_MUX_uxn_opcodes_h_l2754_c7_df8c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2754_c7_df8c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2754_c7_df8c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2754_c7_df8c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2754_c7_df8c_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2754_c7_df8c
result_is_stack_read_MUX_uxn_opcodes_h_l2754_c7_df8c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2754_c7_df8c_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2754_c7_df8c_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2754_c7_df8c_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2754_c7_df8c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2754_c7_df8c
result_sp_relative_shift_MUX_uxn_opcodes_h_l2754_c7_df8c : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2754_c7_df8c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2754_c7_df8c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2754_c7_df8c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2754_c7_df8c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2754_c7_df8c
result_is_stack_write_MUX_uxn_opcodes_h_l2754_c7_df8c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2754_c7_df8c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2754_c7_df8c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2754_c7_df8c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2754_c7_df8c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2754_c7_df8c
result_is_opc_done_MUX_uxn_opcodes_h_l2754_c7_df8c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2754_c7_df8c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2754_c7_df8c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2754_c7_df8c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2754_c7_df8c_return_output);

-- t16_MUX_uxn_opcodes_h_l2754_c7_df8c
t16_MUX_uxn_opcodes_h_l2754_c7_df8c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2754_c7_df8c_cond,
t16_MUX_uxn_opcodes_h_l2754_c7_df8c_iftrue,
t16_MUX_uxn_opcodes_h_l2754_c7_df8c_iffalse,
t16_MUX_uxn_opcodes_h_l2754_c7_df8c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2757_c11_60b5
BIN_OP_EQ_uxn_opcodes_h_l2757_c11_60b5 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2757_c11_60b5_left,
BIN_OP_EQ_uxn_opcodes_h_l2757_c11_60b5_right,
BIN_OP_EQ_uxn_opcodes_h_l2757_c11_60b5_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2757_c7_6bff
result_stack_value_MUX_uxn_opcodes_h_l2757_c7_6bff : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2757_c7_6bff_cond,
result_stack_value_MUX_uxn_opcodes_h_l2757_c7_6bff_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2757_c7_6bff_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2757_c7_6bff_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2757_c7_6bff
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2757_c7_6bff : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2757_c7_6bff_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2757_c7_6bff_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2757_c7_6bff_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2757_c7_6bff_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2757_c7_6bff
result_is_sp_shift_MUX_uxn_opcodes_h_l2757_c7_6bff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2757_c7_6bff_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2757_c7_6bff_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2757_c7_6bff_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2757_c7_6bff_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2757_c7_6bff
result_is_stack_read_MUX_uxn_opcodes_h_l2757_c7_6bff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2757_c7_6bff_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2757_c7_6bff_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2757_c7_6bff_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2757_c7_6bff_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2757_c7_6bff
result_sp_relative_shift_MUX_uxn_opcodes_h_l2757_c7_6bff : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2757_c7_6bff_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2757_c7_6bff_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2757_c7_6bff_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2757_c7_6bff_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2757_c7_6bff
result_is_stack_write_MUX_uxn_opcodes_h_l2757_c7_6bff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2757_c7_6bff_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2757_c7_6bff_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2757_c7_6bff_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2757_c7_6bff_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2757_c7_6bff
result_is_opc_done_MUX_uxn_opcodes_h_l2757_c7_6bff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2757_c7_6bff_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2757_c7_6bff_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2757_c7_6bff_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2757_c7_6bff_return_output);

-- t16_MUX_uxn_opcodes_h_l2757_c7_6bff
t16_MUX_uxn_opcodes_h_l2757_c7_6bff : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2757_c7_6bff_cond,
t16_MUX_uxn_opcodes_h_l2757_c7_6bff_iftrue,
t16_MUX_uxn_opcodes_h_l2757_c7_6bff_iffalse,
t16_MUX_uxn_opcodes_h_l2757_c7_6bff_return_output);

-- CONST_SL_8_uxn_opcodes_h_l2759_c3_de99
CONST_SL_8_uxn_opcodes_h_l2759_c3_de99 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l2759_c3_de99_x,
CONST_SL_8_uxn_opcodes_h_l2759_c3_de99_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2762_c11_e66d
BIN_OP_EQ_uxn_opcodes_h_l2762_c11_e66d : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2762_c11_e66d_left,
BIN_OP_EQ_uxn_opcodes_h_l2762_c11_e66d_right,
BIN_OP_EQ_uxn_opcodes_h_l2762_c11_e66d_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2762_c7_d00e
result_stack_value_MUX_uxn_opcodes_h_l2762_c7_d00e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2762_c7_d00e_cond,
result_stack_value_MUX_uxn_opcodes_h_l2762_c7_d00e_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2762_c7_d00e_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2762_c7_d00e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2762_c7_d00e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2762_c7_d00e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2762_c7_d00e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2762_c7_d00e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2762_c7_d00e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2762_c7_d00e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2762_c7_d00e
result_is_sp_shift_MUX_uxn_opcodes_h_l2762_c7_d00e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2762_c7_d00e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2762_c7_d00e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2762_c7_d00e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2762_c7_d00e_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2762_c7_d00e
result_is_stack_read_MUX_uxn_opcodes_h_l2762_c7_d00e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2762_c7_d00e_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2762_c7_d00e_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2762_c7_d00e_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2762_c7_d00e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2762_c7_d00e
result_sp_relative_shift_MUX_uxn_opcodes_h_l2762_c7_d00e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2762_c7_d00e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2762_c7_d00e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2762_c7_d00e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2762_c7_d00e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2762_c7_d00e
result_is_stack_write_MUX_uxn_opcodes_h_l2762_c7_d00e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2762_c7_d00e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2762_c7_d00e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2762_c7_d00e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2762_c7_d00e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2762_c7_d00e
result_is_opc_done_MUX_uxn_opcodes_h_l2762_c7_d00e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2762_c7_d00e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2762_c7_d00e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2762_c7_d00e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2762_c7_d00e_return_output);

-- t16_MUX_uxn_opcodes_h_l2762_c7_d00e
t16_MUX_uxn_opcodes_h_l2762_c7_d00e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2762_c7_d00e_cond,
t16_MUX_uxn_opcodes_h_l2762_c7_d00e_iftrue,
t16_MUX_uxn_opcodes_h_l2762_c7_d00e_iffalse,
t16_MUX_uxn_opcodes_h_l2762_c7_d00e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2765_c11_8343
BIN_OP_EQ_uxn_opcodes_h_l2765_c11_8343 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2765_c11_8343_left,
BIN_OP_EQ_uxn_opcodes_h_l2765_c11_8343_right,
BIN_OP_EQ_uxn_opcodes_h_l2765_c11_8343_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2765_c7_1d31
result_stack_value_MUX_uxn_opcodes_h_l2765_c7_1d31 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2765_c7_1d31_cond,
result_stack_value_MUX_uxn_opcodes_h_l2765_c7_1d31_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2765_c7_1d31_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2765_c7_1d31_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2765_c7_1d31
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2765_c7_1d31 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2765_c7_1d31_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2765_c7_1d31_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2765_c7_1d31_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2765_c7_1d31_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2765_c7_1d31
result_is_sp_shift_MUX_uxn_opcodes_h_l2765_c7_1d31 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2765_c7_1d31_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2765_c7_1d31_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2765_c7_1d31_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2765_c7_1d31_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2765_c7_1d31
result_is_stack_read_MUX_uxn_opcodes_h_l2765_c7_1d31 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2765_c7_1d31_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2765_c7_1d31_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2765_c7_1d31_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2765_c7_1d31_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2765_c7_1d31
result_sp_relative_shift_MUX_uxn_opcodes_h_l2765_c7_1d31 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2765_c7_1d31_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2765_c7_1d31_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2765_c7_1d31_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2765_c7_1d31_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2765_c7_1d31
result_is_stack_write_MUX_uxn_opcodes_h_l2765_c7_1d31 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2765_c7_1d31_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2765_c7_1d31_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2765_c7_1d31_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2765_c7_1d31_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2765_c7_1d31
result_is_opc_done_MUX_uxn_opcodes_h_l2765_c7_1d31 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2765_c7_1d31_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2765_c7_1d31_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2765_c7_1d31_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2765_c7_1d31_return_output);

-- t16_MUX_uxn_opcodes_h_l2765_c7_1d31
t16_MUX_uxn_opcodes_h_l2765_c7_1d31 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2765_c7_1d31_cond,
t16_MUX_uxn_opcodes_h_l2765_c7_1d31_iftrue,
t16_MUX_uxn_opcodes_h_l2765_c7_1d31_iffalse,
t16_MUX_uxn_opcodes_h_l2765_c7_1d31_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2766_c3_e20e
BIN_OP_OR_uxn_opcodes_h_l2766_c3_e20e : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2766_c3_e20e_left,
BIN_OP_OR_uxn_opcodes_h_l2766_c3_e20e_right,
BIN_OP_OR_uxn_opcodes_h_l2766_c3_e20e_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2769_c32_e3d4
BIN_OP_AND_uxn_opcodes_h_l2769_c32_e3d4 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2769_c32_e3d4_left,
BIN_OP_AND_uxn_opcodes_h_l2769_c32_e3d4_right,
BIN_OP_AND_uxn_opcodes_h_l2769_c32_e3d4_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l2769_c32_8380
BIN_OP_GT_uxn_opcodes_h_l2769_c32_8380 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l2769_c32_8380_left,
BIN_OP_GT_uxn_opcodes_h_l2769_c32_8380_right,
BIN_OP_GT_uxn_opcodes_h_l2769_c32_8380_return_output);

-- MUX_uxn_opcodes_h_l2769_c32_ccee
MUX_uxn_opcodes_h_l2769_c32_ccee : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2769_c32_ccee_cond,
MUX_uxn_opcodes_h_l2769_c32_ccee_iftrue,
MUX_uxn_opcodes_h_l2769_c32_ccee_iffalse,
MUX_uxn_opcodes_h_l2769_c32_ccee_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2771_c11_cc47
BIN_OP_EQ_uxn_opcodes_h_l2771_c11_cc47 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2771_c11_cc47_left,
BIN_OP_EQ_uxn_opcodes_h_l2771_c11_cc47_right,
BIN_OP_EQ_uxn_opcodes_h_l2771_c11_cc47_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2771_c7_9e37
result_stack_value_MUX_uxn_opcodes_h_l2771_c7_9e37 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2771_c7_9e37_cond,
result_stack_value_MUX_uxn_opcodes_h_l2771_c7_9e37_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2771_c7_9e37_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2771_c7_9e37_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2771_c7_9e37
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2771_c7_9e37 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2771_c7_9e37_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2771_c7_9e37_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2771_c7_9e37_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2771_c7_9e37_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2771_c7_9e37
result_is_sp_shift_MUX_uxn_opcodes_h_l2771_c7_9e37 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2771_c7_9e37_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2771_c7_9e37_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2771_c7_9e37_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2771_c7_9e37_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2771_c7_9e37
result_is_stack_write_MUX_uxn_opcodes_h_l2771_c7_9e37 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2771_c7_9e37_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2771_c7_9e37_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2771_c7_9e37_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2771_c7_9e37_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2771_c7_9e37
result_is_opc_done_MUX_uxn_opcodes_h_l2771_c7_9e37 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2771_c7_9e37_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2771_c7_9e37_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2771_c7_9e37_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2771_c7_9e37_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2777_c11_2da3
BIN_OP_EQ_uxn_opcodes_h_l2777_c11_2da3 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2777_c11_2da3_left,
BIN_OP_EQ_uxn_opcodes_h_l2777_c11_2da3_right,
BIN_OP_EQ_uxn_opcodes_h_l2777_c11_2da3_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2777_c7_d750
result_stack_value_MUX_uxn_opcodes_h_l2777_c7_d750 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2777_c7_d750_cond,
result_stack_value_MUX_uxn_opcodes_h_l2777_c7_d750_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2777_c7_d750_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2777_c7_d750_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2777_c7_d750
result_is_stack_write_MUX_uxn_opcodes_h_l2777_c7_d750 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2777_c7_d750_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2777_c7_d750_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2777_c7_d750_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2777_c7_d750_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2777_c7_d750
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2777_c7_d750 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2777_c7_d750_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2777_c7_d750_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2777_c7_d750_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2777_c7_d750_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2777_c7_d750
result_is_opc_done_MUX_uxn_opcodes_h_l2777_c7_d750 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2777_c7_d750_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2777_c7_d750_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2777_c7_d750_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2777_c7_d750_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2781_c11_cd8e
BIN_OP_EQ_uxn_opcodes_h_l2781_c11_cd8e : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2781_c11_cd8e_left,
BIN_OP_EQ_uxn_opcodes_h_l2781_c11_cd8e_right,
BIN_OP_EQ_uxn_opcodes_h_l2781_c11_cd8e_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2781_c7_95ed
result_stack_value_MUX_uxn_opcodes_h_l2781_c7_95ed : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2781_c7_95ed_cond,
result_stack_value_MUX_uxn_opcodes_h_l2781_c7_95ed_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2781_c7_95ed_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2781_c7_95ed_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2781_c7_95ed
result_is_stack_write_MUX_uxn_opcodes_h_l2781_c7_95ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2781_c7_95ed_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2781_c7_95ed_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2781_c7_95ed_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2781_c7_95ed_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2781_c7_95ed
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2781_c7_95ed : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2781_c7_95ed_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2781_c7_95ed_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2781_c7_95ed_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2781_c7_95ed_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2781_c7_95ed
result_is_opc_done_MUX_uxn_opcodes_h_l2781_c7_95ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2781_c7_95ed_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2781_c7_95ed_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2781_c7_95ed_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2781_c7_95ed_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2785_c11_9d27
BIN_OP_EQ_uxn_opcodes_h_l2785_c11_9d27 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2785_c11_9d27_left,
BIN_OP_EQ_uxn_opcodes_h_l2785_c11_9d27_right,
BIN_OP_EQ_uxn_opcodes_h_l2785_c11_9d27_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2785_c7_ad1c
result_stack_value_MUX_uxn_opcodes_h_l2785_c7_ad1c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2785_c7_ad1c_cond,
result_stack_value_MUX_uxn_opcodes_h_l2785_c7_ad1c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2785_c7_ad1c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2785_c7_ad1c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2785_c7_ad1c
result_is_stack_write_MUX_uxn_opcodes_h_l2785_c7_ad1c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2785_c7_ad1c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2785_c7_ad1c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2785_c7_ad1c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2785_c7_ad1c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2785_c7_ad1c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2785_c7_ad1c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2785_c7_ad1c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2785_c7_ad1c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2785_c7_ad1c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2785_c7_ad1c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2785_c7_ad1c
result_is_opc_done_MUX_uxn_opcodes_h_l2785_c7_ad1c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2785_c7_ad1c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2785_c7_ad1c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2785_c7_ad1c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2785_c7_ad1c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2789_c11_e697
BIN_OP_EQ_uxn_opcodes_h_l2789_c11_e697 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2789_c11_e697_left,
BIN_OP_EQ_uxn_opcodes_h_l2789_c11_e697_right,
BIN_OP_EQ_uxn_opcodes_h_l2789_c11_e697_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2789_c7_358a
result_is_stack_write_MUX_uxn_opcodes_h_l2789_c7_358a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2789_c7_358a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2789_c7_358a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2789_c7_358a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2789_c7_358a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2789_c7_358a
result_is_opc_done_MUX_uxn_opcodes_h_l2789_c7_358a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2789_c7_358a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2789_c7_358a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2789_c7_358a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2789_c7_358a_return_output);

-- CONST_SR_8_uint16_t_uxn_opcodes_h_l2787_l2779_DUPLICATE_2ef4
CONST_SR_8_uint16_t_uxn_opcodes_h_l2787_l2779_DUPLICATE_2ef4 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uint16_t_uxn_opcodes_h_l2787_l2779_DUPLICATE_2ef4_x,
CONST_SR_8_uint16_t_uxn_opcodes_h_l2787_l2779_DUPLICATE_2ef4_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l2748_c6_bcc5_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c1_3ddb_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2748_c2_3430_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2748_c2_3430_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2748_c2_3430_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2748_c2_3430_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2748_c2_3430_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2748_c2_3430_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2748_c2_3430_return_output,
 t16_MUX_uxn_opcodes_h_l2748_c2_3430_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2754_c11_01ee_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2754_c7_df8c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2754_c7_df8c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2754_c7_df8c_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2754_c7_df8c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2754_c7_df8c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2754_c7_df8c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2754_c7_df8c_return_output,
 t16_MUX_uxn_opcodes_h_l2754_c7_df8c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2757_c11_60b5_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2757_c7_6bff_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2757_c7_6bff_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2757_c7_6bff_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2757_c7_6bff_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2757_c7_6bff_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2757_c7_6bff_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2757_c7_6bff_return_output,
 t16_MUX_uxn_opcodes_h_l2757_c7_6bff_return_output,
 CONST_SL_8_uxn_opcodes_h_l2759_c3_de99_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2762_c11_e66d_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2762_c7_d00e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2762_c7_d00e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2762_c7_d00e_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2762_c7_d00e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2762_c7_d00e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2762_c7_d00e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2762_c7_d00e_return_output,
 t16_MUX_uxn_opcodes_h_l2762_c7_d00e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2765_c11_8343_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2765_c7_1d31_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2765_c7_1d31_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2765_c7_1d31_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2765_c7_1d31_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2765_c7_1d31_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2765_c7_1d31_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2765_c7_1d31_return_output,
 t16_MUX_uxn_opcodes_h_l2765_c7_1d31_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2766_c3_e20e_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2769_c32_e3d4_return_output,
 BIN_OP_GT_uxn_opcodes_h_l2769_c32_8380_return_output,
 MUX_uxn_opcodes_h_l2769_c32_ccee_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2771_c11_cc47_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2771_c7_9e37_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2771_c7_9e37_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2771_c7_9e37_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2771_c7_9e37_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2771_c7_9e37_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2777_c11_2da3_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2777_c7_d750_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2777_c7_d750_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2777_c7_d750_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2777_c7_d750_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2781_c11_cd8e_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2781_c7_95ed_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2781_c7_95ed_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2781_c7_95ed_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2781_c7_95ed_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2785_c11_9d27_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2785_c7_ad1c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2785_c7_ad1c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2785_c7_ad1c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2785_c7_ad1c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2789_c11_e697_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2789_c7_358a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2789_c7_358a_return_output,
 CONST_SR_8_uint16_t_uxn_opcodes_h_l2787_l2779_DUPLICATE_2ef4_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2748_c6_bcc5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2748_c6_bcc5_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2748_c6_bcc5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c1_3ddb_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c1_3ddb_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c1_3ddb_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c1_3ddb_iffalse : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2748_c2_3430_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2748_c2_3430_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2754_c7_df8c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2748_c2_3430_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2748_c2_3430_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2748_c2_3430_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2751_c3_ea63 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2748_c2_3430_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2754_c7_df8c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2748_c2_3430_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2748_c2_3430_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2748_c2_3430_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2748_c2_3430_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2754_c7_df8c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2748_c2_3430_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2748_c2_3430_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2748_c2_3430_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2748_c2_3430_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2754_c7_df8c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2748_c2_3430_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2748_c2_3430_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2748_c2_3430_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2748_c2_3430_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2754_c7_df8c_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2748_c2_3430_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2748_c2_3430_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2748_c2_3430_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2748_c2_3430_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2754_c7_df8c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2748_c2_3430_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2748_c2_3430_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2748_c2_3430_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2748_c2_3430_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2754_c7_df8c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2748_c2_3430_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2748_c2_3430_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2748_c2_3430_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2748_c2_3430_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2754_c7_df8c_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2748_c2_3430_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2748_c2_3430_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2749_c3_3e4e_uxn_opcodes_h_l2749_c3_3e4e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2754_c11_01ee_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2754_c11_01ee_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2754_c11_01ee_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2754_c7_df8c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2754_c7_df8c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2757_c7_6bff_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2754_c7_df8c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2754_c7_df8c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2755_c3_4cd0 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2754_c7_df8c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2757_c7_6bff_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2754_c7_df8c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2754_c7_df8c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2754_c7_df8c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2757_c7_6bff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2754_c7_df8c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2754_c7_df8c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2754_c7_df8c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2757_c7_6bff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2754_c7_df8c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2754_c7_df8c_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2754_c7_df8c_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2757_c7_6bff_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2754_c7_df8c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2754_c7_df8c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2754_c7_df8c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2757_c7_6bff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2754_c7_df8c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2754_c7_df8c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2754_c7_df8c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2757_c7_6bff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2754_c7_df8c_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2754_c7_df8c_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2754_c7_df8c_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2757_c7_6bff_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2754_c7_df8c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2757_c11_60b5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2757_c11_60b5_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2757_c11_60b5_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2757_c7_6bff_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2757_c7_6bff_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2762_c7_d00e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2757_c7_6bff_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2757_c7_6bff_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2760_c3_d7a1 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2757_c7_6bff_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2762_c7_d00e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2757_c7_6bff_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2757_c7_6bff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2757_c7_6bff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2762_c7_d00e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2757_c7_6bff_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2757_c7_6bff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2757_c7_6bff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2762_c7_d00e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2757_c7_6bff_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2757_c7_6bff_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2757_c7_6bff_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2762_c7_d00e_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2757_c7_6bff_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2757_c7_6bff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2757_c7_6bff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2762_c7_d00e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2757_c7_6bff_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2757_c7_6bff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2757_c7_6bff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2762_c7_d00e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2757_c7_6bff_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2757_c7_6bff_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2757_c7_6bff_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2762_c7_d00e_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2757_c7_6bff_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2759_c3_de99_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2759_c3_de99_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2762_c11_e66d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2762_c11_e66d_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2762_c11_e66d_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2762_c7_d00e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2762_c7_d00e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2765_c7_1d31_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2762_c7_d00e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2762_c7_d00e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2763_c3_44fd : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2762_c7_d00e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2765_c7_1d31_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2762_c7_d00e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2762_c7_d00e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2762_c7_d00e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2765_c7_1d31_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2762_c7_d00e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2762_c7_d00e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2762_c7_d00e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2765_c7_1d31_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2762_c7_d00e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2762_c7_d00e_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2762_c7_d00e_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2765_c7_1d31_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2762_c7_d00e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2762_c7_d00e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2762_c7_d00e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2765_c7_1d31_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2762_c7_d00e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2762_c7_d00e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2762_c7_d00e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2765_c7_1d31_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2762_c7_d00e_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2762_c7_d00e_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2762_c7_d00e_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2765_c7_1d31_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2762_c7_d00e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2765_c11_8343_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2765_c11_8343_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2765_c11_8343_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2765_c7_1d31_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2765_c7_1d31_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2771_c7_9e37_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2765_c7_1d31_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2765_c7_1d31_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2765_c7_1d31_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2771_c7_9e37_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2765_c7_1d31_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2765_c7_1d31_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2765_c7_1d31_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2771_c7_9e37_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2765_c7_1d31_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2765_c7_1d31_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2765_c7_1d31_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2765_c7_1d31_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2765_c7_1d31_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2765_c7_1d31_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2765_c7_1d31_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2765_c7_1d31_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2765_c7_1d31_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2771_c7_9e37_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2765_c7_1d31_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2765_c7_1d31_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2765_c7_1d31_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2771_c7_9e37_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2765_c7_1d31_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2765_c7_1d31_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2765_c7_1d31_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2765_c7_1d31_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2766_c3_e20e_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2766_c3_e20e_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2766_c3_e20e_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2769_c32_ccee_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2769_c32_ccee_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2769_c32_ccee_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2769_c32_e3d4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2769_c32_e3d4_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2769_c32_e3d4_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2769_c32_8380_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2769_c32_8380_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2769_c32_8380_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2769_c32_ccee_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2771_c11_cc47_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2771_c11_cc47_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2771_c11_cc47_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2771_c7_9e37_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2771_c7_9e37_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2777_c7_d750_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2771_c7_9e37_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2771_c7_9e37_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2774_c3_80de : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2771_c7_9e37_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2777_c7_d750_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2771_c7_9e37_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2771_c7_9e37_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2771_c7_9e37_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2771_c7_9e37_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2771_c7_9e37_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2771_c7_9e37_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2777_c7_d750_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2771_c7_9e37_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2771_c7_9e37_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2771_c7_9e37_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2777_c7_d750_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2771_c7_9e37_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2777_c11_2da3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2777_c11_2da3_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2777_c11_2da3_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2777_c7_d750_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2777_c7_d750_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2781_c7_95ed_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2777_c7_d750_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2777_c7_d750_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2777_c7_d750_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2781_c7_95ed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2777_c7_d750_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2777_c7_d750_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2778_c3_f921 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2777_c7_d750_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2781_c7_95ed_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2777_c7_d750_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2777_c7_d750_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2777_c7_d750_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2781_c7_95ed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2777_c7_d750_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2781_c11_cd8e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2781_c11_cd8e_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2781_c11_cd8e_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2781_c7_95ed_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2781_c7_95ed_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2785_c7_ad1c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2781_c7_95ed_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2781_c7_95ed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2781_c7_95ed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2785_c7_ad1c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2781_c7_95ed_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2781_c7_95ed_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2782_c3_1f5e : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2781_c7_95ed_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2785_c7_ad1c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2781_c7_95ed_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2781_c7_95ed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2781_c7_95ed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2785_c7_ad1c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2781_c7_95ed_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2785_c11_9d27_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2785_c11_9d27_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2785_c11_9d27_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2785_c7_ad1c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2785_c7_ad1c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2785_c7_ad1c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2785_c7_ad1c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2785_c7_ad1c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2789_c7_358a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2785_c7_ad1c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2785_c7_ad1c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2786_c3_34a4 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2785_c7_ad1c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2785_c7_ad1c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2785_c7_ad1c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2785_c7_ad1c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2789_c7_358a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2785_c7_ad1c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2789_c11_e697_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2789_c11_e697_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2789_c11_e697_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2789_c7_358a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2789_c7_358a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2789_c7_358a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2789_c7_358a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2789_c7_358a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2789_c7_358a_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2748_l2765_l2762_l2757_l2785_l2754_DUPLICATE_b870_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2748_l2771_l2762_l2757_l2754_DUPLICATE_f350_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2748_l2765_l2762_l2757_l2754_DUPLICATE_1ec4_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2781_l2748_l2777_l2765_l2762_l2789_l2757_l2785_l2754_DUPLICATE_084f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2757_l2762_l2754_l2765_DUPLICATE_2850_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2781_l2777_l2771_l2765_l2762_l2789_l2757_l2785_l2754_DUPLICATE_0a97_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2758_l2766_DUPLICATE_daea_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2785_l2765_DUPLICATE_c48c_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l2775_l2783_DUPLICATE_2314_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l2787_l2779_DUPLICATE_2ef4_x : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l2787_l2779_DUPLICATE_2ef4_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l2787_l2779_DUPLICATE_35fb_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_df93_uxn_opcodes_h_l2794_l2744_DUPLICATE_5ea0_return_output : opcode_result_t;
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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c1_3ddb_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2762_c11_e66d_right := to_unsigned(3, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2771_c7_9e37_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2760_c3_d7a1 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2757_c7_6bff_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2760_c3_d7a1;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2765_c7_1d31_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2778_c3_f921 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2777_c7_d750_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2778_c3_f921;
     VAR_BIN_OP_GT_uxn_opcodes_h_l2769_c32_8380_right := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l2769_c32_ccee_iftrue := signed(std_logic_vector(resize(to_unsigned(4, 3), 8)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2782_c3_1f5e := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2781_c7_95ed_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2782_c3_1f5e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2777_c11_2da3_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2785_c11_9d27_right := to_unsigned(8, 4);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2769_c32_e3d4_right := to_unsigned(128, 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2751_c3_ea63 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2748_c2_3430_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2751_c3_ea63;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2789_c7_358a_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2748_c2_3430_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2771_c11_cc47_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2763_c3_44fd := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2762_c7_d00e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2763_c3_44fd;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2786_c3_34a4 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2785_c7_ad1c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2786_c3_34a4;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2765_c11_8343_right := to_unsigned(4, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2789_c7_358a_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2755_c3_4cd0 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2754_c7_df8c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2755_c3_4cd0;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2771_c7_9e37_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2789_c11_e697_right := to_unsigned(9, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2781_c11_cd8e_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2748_c6_bcc5_right := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2748_c2_3430_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2765_c7_1d31_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l2769_c32_ccee_iffalse := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2757_c11_60b5_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2774_c3_80de := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2771_c7_9e37_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2774_c3_80de;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2754_c11_01ee_right := to_unsigned(1, 1);

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

     -- Submodule level 0
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c1_3ddb_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2769_c32_e3d4_left := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2748_c6_bcc5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2754_c11_01ee_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2757_c11_60b5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2762_c11_e66d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2765_c11_8343_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2771_c11_cc47_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2777_c11_2da3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2781_c11_cd8e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2785_c11_9d27_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2789_c11_e697_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2766_c3_e20e_left := t16;
     VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l2787_l2779_DUPLICATE_2ef4_x := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2748_c2_3430_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2754_c7_df8c_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2762_c7_d00e_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2765_c7_1d31_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l2785_c11_9d27] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2785_c11_9d27_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2785_c11_9d27_left;
     BIN_OP_EQ_uxn_opcodes_h_l2785_c11_9d27_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2785_c11_9d27_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2785_c11_9d27_return_output := BIN_OP_EQ_uxn_opcodes_h_l2785_c11_9d27_return_output;

     -- CONST_SR_8_uint16_t_uxn_opcodes_h_l2787_l2779_DUPLICATE_2ef4 LATENCY=0
     -- Inputs
     CONST_SR_8_uint16_t_uxn_opcodes_h_l2787_l2779_DUPLICATE_2ef4_x <= VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l2787_l2779_DUPLICATE_2ef4_x;
     -- Outputs
     VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l2787_l2779_DUPLICATE_2ef4_return_output := CONST_SR_8_uint16_t_uxn_opcodes_h_l2787_l2779_DUPLICATE_2ef4_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2748_l2765_l2762_l2757_l2785_l2754_DUPLICATE_b870 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2748_l2765_l2762_l2757_l2785_l2754_DUPLICATE_b870_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2754_c11_01ee] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2754_c11_01ee_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2754_c11_01ee_left;
     BIN_OP_EQ_uxn_opcodes_h_l2754_c11_01ee_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2754_c11_01ee_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2754_c11_01ee_return_output := BIN_OP_EQ_uxn_opcodes_h_l2754_c11_01ee_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2781_l2777_l2771_l2765_l2762_l2789_l2757_l2785_l2754_DUPLICATE_0a97 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2781_l2777_l2771_l2765_l2762_l2789_l2757_l2785_l2754_DUPLICATE_0a97_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l2762_c11_e66d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2762_c11_e66d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2762_c11_e66d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2762_c11_e66d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2762_c11_e66d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2762_c11_e66d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2762_c11_e66d_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2748_l2771_l2762_l2757_l2754_DUPLICATE_f350 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2748_l2771_l2762_l2757_l2754_DUPLICATE_f350_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2757_l2762_l2754_l2765_DUPLICATE_2850 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2757_l2762_l2754_l2765_DUPLICATE_2850_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l2777_c11_2da3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2777_c11_2da3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2777_c11_2da3_left;
     BIN_OP_EQ_uxn_opcodes_h_l2777_c11_2da3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2777_c11_2da3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2777_c11_2da3_return_output := BIN_OP_EQ_uxn_opcodes_h_l2777_c11_2da3_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l2769_c32_e3d4] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2769_c32_e3d4_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2769_c32_e3d4_left;
     BIN_OP_AND_uxn_opcodes_h_l2769_c32_e3d4_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2769_c32_e3d4_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2769_c32_e3d4_return_output := BIN_OP_AND_uxn_opcodes_h_l2769_c32_e3d4_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2781_l2748_l2777_l2765_l2762_l2789_l2757_l2785_l2754_DUPLICATE_084f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2781_l2748_l2777_l2765_l2762_l2789_l2757_l2785_l2754_DUPLICATE_084f_return_output := result.is_stack_write;

     -- CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l2775_l2783_DUPLICATE_2314 LATENCY=0
     VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l2775_l2783_DUPLICATE_2314_return_output := CAST_TO_uint8_t_uint16_t(
     t16);

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2785_l2765_DUPLICATE_c48c LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2785_l2765_DUPLICATE_c48c_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2765_c11_8343] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2765_c11_8343_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2765_c11_8343_left;
     BIN_OP_EQ_uxn_opcodes_h_l2765_c11_8343_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2765_c11_8343_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2765_c11_8343_return_output := BIN_OP_EQ_uxn_opcodes_h_l2765_c11_8343_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2789_c11_e697] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2789_c11_e697_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2789_c11_e697_left;
     BIN_OP_EQ_uxn_opcodes_h_l2789_c11_e697_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2789_c11_e697_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2789_c11_e697_return_output := BIN_OP_EQ_uxn_opcodes_h_l2789_c11_e697_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2757_c11_60b5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2757_c11_60b5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2757_c11_60b5_left;
     BIN_OP_EQ_uxn_opcodes_h_l2757_c11_60b5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2757_c11_60b5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2757_c11_60b5_return_output := BIN_OP_EQ_uxn_opcodes_h_l2757_c11_60b5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2781_c11_cd8e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2781_c11_cd8e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2781_c11_cd8e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2781_c11_cd8e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2781_c11_cd8e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2781_c11_cd8e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2781_c11_cd8e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2771_c11_cc47] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2771_c11_cc47_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2771_c11_cc47_left;
     BIN_OP_EQ_uxn_opcodes_h_l2771_c11_cc47_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2771_c11_cc47_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2771_c11_cc47_return_output := BIN_OP_EQ_uxn_opcodes_h_l2771_c11_cc47_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2758_l2766_DUPLICATE_daea LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2758_l2766_DUPLICATE_daea_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2748_l2765_l2762_l2757_l2754_DUPLICATE_1ec4 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2748_l2765_l2762_l2757_l2754_DUPLICATE_1ec4_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2748_c6_bcc5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2748_c6_bcc5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2748_c6_bcc5_left;
     BIN_OP_EQ_uxn_opcodes_h_l2748_c6_bcc5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2748_c6_bcc5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2748_c6_bcc5_return_output := BIN_OP_EQ_uxn_opcodes_h_l2748_c6_bcc5_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l2769_c32_8380_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2769_c32_e3d4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c1_3ddb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2748_c6_bcc5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2748_c2_3430_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2748_c6_bcc5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2748_c2_3430_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2748_c6_bcc5_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2748_c2_3430_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2748_c6_bcc5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2748_c2_3430_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2748_c6_bcc5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2748_c2_3430_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2748_c6_bcc5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2748_c2_3430_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2748_c6_bcc5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2748_c2_3430_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2748_c6_bcc5_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2748_c2_3430_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2748_c6_bcc5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2754_c7_df8c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2754_c11_01ee_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2754_c7_df8c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2754_c11_01ee_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2754_c7_df8c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2754_c11_01ee_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2754_c7_df8c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2754_c11_01ee_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2754_c7_df8c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2754_c11_01ee_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2754_c7_df8c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2754_c11_01ee_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2754_c7_df8c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2754_c11_01ee_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2754_c7_df8c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2754_c11_01ee_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2757_c7_6bff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2757_c11_60b5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2757_c7_6bff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2757_c11_60b5_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2757_c7_6bff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2757_c11_60b5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2757_c7_6bff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2757_c11_60b5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2757_c7_6bff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2757_c11_60b5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2757_c7_6bff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2757_c11_60b5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2757_c7_6bff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2757_c11_60b5_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2757_c7_6bff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2757_c11_60b5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2762_c7_d00e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2762_c11_e66d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2762_c7_d00e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2762_c11_e66d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2762_c7_d00e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2762_c11_e66d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2762_c7_d00e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2762_c11_e66d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2762_c7_d00e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2762_c11_e66d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2762_c7_d00e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2762_c11_e66d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2762_c7_d00e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2762_c11_e66d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2762_c7_d00e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2762_c11_e66d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2765_c7_1d31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2765_c11_8343_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2765_c7_1d31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2765_c11_8343_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2765_c7_1d31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2765_c11_8343_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2765_c7_1d31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2765_c11_8343_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2765_c7_1d31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2765_c11_8343_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2765_c7_1d31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2765_c11_8343_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2765_c7_1d31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2765_c11_8343_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2765_c7_1d31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2765_c11_8343_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2771_c7_9e37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2771_c11_cc47_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2771_c7_9e37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2771_c11_cc47_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2771_c7_9e37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2771_c11_cc47_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2771_c7_9e37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2771_c11_cc47_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2771_c7_9e37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2771_c11_cc47_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2777_c7_d750_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2777_c11_2da3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2777_c7_d750_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2777_c11_2da3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2777_c7_d750_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2777_c11_2da3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2777_c7_d750_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2777_c11_2da3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2781_c7_95ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2781_c11_cd8e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2781_c7_95ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2781_c11_cd8e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2781_c7_95ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2781_c11_cd8e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2781_c7_95ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2781_c11_cd8e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2785_c7_ad1c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2785_c11_9d27_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2785_c7_ad1c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2785_c11_9d27_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2785_c7_ad1c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2785_c11_9d27_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2785_c7_ad1c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2785_c11_9d27_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2789_c7_358a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2789_c11_e697_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2789_c7_358a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2789_c11_e697_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2766_c3_e20e_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2758_l2766_DUPLICATE_daea_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l2759_c3_de99_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2758_l2766_DUPLICATE_daea_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2771_c7_9e37_iftrue := VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l2775_l2783_DUPLICATE_2314_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2781_c7_95ed_iftrue := VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l2775_l2783_DUPLICATE_2314_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2748_c2_3430_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2748_l2765_l2762_l2757_l2754_DUPLICATE_1ec4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2754_c7_df8c_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2748_l2765_l2762_l2757_l2754_DUPLICATE_1ec4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2757_c7_6bff_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2748_l2765_l2762_l2757_l2754_DUPLICATE_1ec4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2762_c7_d00e_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2748_l2765_l2762_l2757_l2754_DUPLICATE_1ec4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2765_c7_1d31_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2748_l2765_l2762_l2757_l2754_DUPLICATE_1ec4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2754_c7_df8c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2781_l2777_l2771_l2765_l2762_l2789_l2757_l2785_l2754_DUPLICATE_0a97_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2757_c7_6bff_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2781_l2777_l2771_l2765_l2762_l2789_l2757_l2785_l2754_DUPLICATE_0a97_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2762_c7_d00e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2781_l2777_l2771_l2765_l2762_l2789_l2757_l2785_l2754_DUPLICATE_0a97_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2765_c7_1d31_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2781_l2777_l2771_l2765_l2762_l2789_l2757_l2785_l2754_DUPLICATE_0a97_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2771_c7_9e37_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2781_l2777_l2771_l2765_l2762_l2789_l2757_l2785_l2754_DUPLICATE_0a97_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2777_c7_d750_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2781_l2777_l2771_l2765_l2762_l2789_l2757_l2785_l2754_DUPLICATE_0a97_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2781_c7_95ed_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2781_l2777_l2771_l2765_l2762_l2789_l2757_l2785_l2754_DUPLICATE_0a97_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2785_c7_ad1c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2781_l2777_l2771_l2765_l2762_l2789_l2757_l2785_l2754_DUPLICATE_0a97_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2789_c7_358a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2781_l2777_l2771_l2765_l2762_l2789_l2757_l2785_l2754_DUPLICATE_0a97_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2748_c2_3430_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2748_l2771_l2762_l2757_l2754_DUPLICATE_f350_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2754_c7_df8c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2748_l2771_l2762_l2757_l2754_DUPLICATE_f350_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2757_c7_6bff_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2748_l2771_l2762_l2757_l2754_DUPLICATE_f350_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2762_c7_d00e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2748_l2771_l2762_l2757_l2754_DUPLICATE_f350_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2771_c7_9e37_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2748_l2771_l2762_l2757_l2754_DUPLICATE_f350_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2754_c7_df8c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2757_l2762_l2754_l2765_DUPLICATE_2850_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2757_c7_6bff_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2757_l2762_l2754_l2765_DUPLICATE_2850_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2762_c7_d00e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2757_l2762_l2754_l2765_DUPLICATE_2850_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2765_c7_1d31_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2757_l2762_l2754_l2765_DUPLICATE_2850_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2748_c2_3430_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2781_l2748_l2777_l2765_l2762_l2789_l2757_l2785_l2754_DUPLICATE_084f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2754_c7_df8c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2781_l2748_l2777_l2765_l2762_l2789_l2757_l2785_l2754_DUPLICATE_084f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2757_c7_6bff_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2781_l2748_l2777_l2765_l2762_l2789_l2757_l2785_l2754_DUPLICATE_084f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2762_c7_d00e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2781_l2748_l2777_l2765_l2762_l2789_l2757_l2785_l2754_DUPLICATE_084f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2765_c7_1d31_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2781_l2748_l2777_l2765_l2762_l2789_l2757_l2785_l2754_DUPLICATE_084f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2777_c7_d750_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2781_l2748_l2777_l2765_l2762_l2789_l2757_l2785_l2754_DUPLICATE_084f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2781_c7_95ed_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2781_l2748_l2777_l2765_l2762_l2789_l2757_l2785_l2754_DUPLICATE_084f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2785_c7_ad1c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2781_l2748_l2777_l2765_l2762_l2789_l2757_l2785_l2754_DUPLICATE_084f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2789_c7_358a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2781_l2748_l2777_l2765_l2762_l2789_l2757_l2785_l2754_DUPLICATE_084f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2765_c7_1d31_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2785_l2765_DUPLICATE_c48c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2785_c7_ad1c_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2785_l2765_DUPLICATE_c48c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2748_c2_3430_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2748_l2765_l2762_l2757_l2785_l2754_DUPLICATE_b870_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2754_c7_df8c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2748_l2765_l2762_l2757_l2785_l2754_DUPLICATE_b870_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2757_c7_6bff_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2748_l2765_l2762_l2757_l2785_l2754_DUPLICATE_b870_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2762_c7_d00e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2748_l2765_l2762_l2757_l2785_l2754_DUPLICATE_b870_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2765_c7_1d31_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2748_l2765_l2762_l2757_l2785_l2754_DUPLICATE_b870_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2785_c7_ad1c_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2748_l2765_l2762_l2757_l2785_l2754_DUPLICATE_b870_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2785_c7_ad1c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2785_c7_ad1c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2785_c7_ad1c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2785_c7_ad1c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2785_c7_ad1c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2785_c7_ad1c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2785_c7_ad1c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2785_c7_ad1c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2785_c7_ad1c_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l2759_c3_de99] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l2759_c3_de99_x <= VAR_CONST_SL_8_uxn_opcodes_h_l2759_c3_de99_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l2759_c3_de99_return_output := CONST_SL_8_uxn_opcodes_h_l2759_c3_de99_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2789_c7_358a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2789_c7_358a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2789_c7_358a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2789_c7_358a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2789_c7_358a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2789_c7_358a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2789_c7_358a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2789_c7_358a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2789_c7_358a_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2765_c7_1d31] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2765_c7_1d31_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2765_c7_1d31_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2765_c7_1d31_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2765_c7_1d31_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2765_c7_1d31_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2765_c7_1d31_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2765_c7_1d31_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2765_c7_1d31_return_output;

     -- CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l2787_l2779_DUPLICATE_35fb LATENCY=0
     VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l2787_l2779_DUPLICATE_35fb_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l2787_l2779_DUPLICATE_2ef4_return_output);

     -- BIN_OP_OR[uxn_opcodes_h_l2766_c3_e20e] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2766_c3_e20e_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2766_c3_e20e_left;
     BIN_OP_OR_uxn_opcodes_h_l2766_c3_e20e_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2766_c3_e20e_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2766_c3_e20e_return_output := BIN_OP_OR_uxn_opcodes_h_l2766_c3_e20e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2789_c7_358a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2789_c7_358a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2789_c7_358a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2789_c7_358a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2789_c7_358a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2789_c7_358a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2789_c7_358a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2789_c7_358a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2789_c7_358a_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l2769_c32_8380] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l2769_c32_8380_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l2769_c32_8380_left;
     BIN_OP_GT_uxn_opcodes_h_l2769_c32_8380_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l2769_c32_8380_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l2769_c32_8380_return_output := BIN_OP_GT_uxn_opcodes_h_l2769_c32_8380_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2748_c1_3ddb] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c1_3ddb_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c1_3ddb_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c1_3ddb_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c1_3ddb_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c1_3ddb_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c1_3ddb_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c1_3ddb_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c1_3ddb_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2771_c7_9e37] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2771_c7_9e37_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2771_c7_9e37_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2771_c7_9e37_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2771_c7_9e37_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2771_c7_9e37_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2771_c7_9e37_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2771_c7_9e37_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2771_c7_9e37_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l2769_c32_ccee_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l2769_c32_8380_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2765_c7_1d31_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2766_c3_e20e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2777_c7_d750_iftrue := VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l2787_l2779_DUPLICATE_35fb_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2785_c7_ad1c_iftrue := VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l2787_l2779_DUPLICATE_35fb_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2757_c7_6bff_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l2759_c3_de99_return_output;
     VAR_printf_uxn_opcodes_h_l2749_c3_3e4e_uxn_opcodes_h_l2749_c3_3e4e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c1_3ddb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2785_c7_ad1c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2789_c7_358a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2765_c7_1d31_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2771_c7_9e37_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2762_c7_d00e_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2765_c7_1d31_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2785_c7_ad1c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2789_c7_358a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2781_c7_95ed_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2785_c7_ad1c_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2785_c7_ad1c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2785_c7_ad1c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2785_c7_ad1c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2785_c7_ad1c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2785_c7_ad1c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2785_c7_ad1c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2785_c7_ad1c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2785_c7_ad1c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2785_c7_ad1c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2781_c7_95ed] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2781_c7_95ed_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2781_c7_95ed_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2781_c7_95ed_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2781_c7_95ed_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2781_c7_95ed_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2781_c7_95ed_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2781_c7_95ed_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2781_c7_95ed_return_output;

     -- printf_uxn_opcodes_h_l2749_c3_3e4e[uxn_opcodes_h_l2749_c3_3e4e] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2749_c3_3e4e_uxn_opcodes_h_l2749_c3_3e4e_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2749_c3_3e4e_uxn_opcodes_h_l2749_c3_3e4e_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2765_c7_1d31] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2765_c7_1d31_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2765_c7_1d31_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2765_c7_1d31_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2765_c7_1d31_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2765_c7_1d31_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2765_c7_1d31_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2765_c7_1d31_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2765_c7_1d31_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2785_c7_ad1c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2785_c7_ad1c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2785_c7_ad1c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2785_c7_ad1c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2785_c7_ad1c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2785_c7_ad1c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2785_c7_ad1c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2785_c7_ad1c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2785_c7_ad1c_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2785_c7_ad1c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2785_c7_ad1c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2785_c7_ad1c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2785_c7_ad1c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2785_c7_ad1c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2785_c7_ad1c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2785_c7_ad1c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2785_c7_ad1c_return_output := result_stack_value_MUX_uxn_opcodes_h_l2785_c7_ad1c_return_output;

     -- t16_MUX[uxn_opcodes_h_l2765_c7_1d31] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2765_c7_1d31_cond <= VAR_t16_MUX_uxn_opcodes_h_l2765_c7_1d31_cond;
     t16_MUX_uxn_opcodes_h_l2765_c7_1d31_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2765_c7_1d31_iftrue;
     t16_MUX_uxn_opcodes_h_l2765_c7_1d31_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2765_c7_1d31_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2765_c7_1d31_return_output := t16_MUX_uxn_opcodes_h_l2765_c7_1d31_return_output;

     -- MUX[uxn_opcodes_h_l2769_c32_ccee] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2769_c32_ccee_cond <= VAR_MUX_uxn_opcodes_h_l2769_c32_ccee_cond;
     MUX_uxn_opcodes_h_l2769_c32_ccee_iftrue <= VAR_MUX_uxn_opcodes_h_l2769_c32_ccee_iftrue;
     MUX_uxn_opcodes_h_l2769_c32_ccee_iffalse <= VAR_MUX_uxn_opcodes_h_l2769_c32_ccee_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2769_c32_ccee_return_output := MUX_uxn_opcodes_h_l2769_c32_ccee_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2762_c7_d00e] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2762_c7_d00e_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2762_c7_d00e_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2762_c7_d00e_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2762_c7_d00e_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2762_c7_d00e_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2762_c7_d00e_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2762_c7_d00e_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2762_c7_d00e_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2765_c7_1d31_iftrue := VAR_MUX_uxn_opcodes_h_l2769_c32_ccee_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2781_c7_95ed_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2785_c7_ad1c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2762_c7_d00e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2765_c7_1d31_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2757_c7_6bff_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2762_c7_d00e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2781_c7_95ed_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2785_c7_ad1c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2777_c7_d750_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2781_c7_95ed_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2781_c7_95ed_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2785_c7_ad1c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2762_c7_d00e_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2765_c7_1d31_return_output;
     -- t16_MUX[uxn_opcodes_h_l2762_c7_d00e] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2762_c7_d00e_cond <= VAR_t16_MUX_uxn_opcodes_h_l2762_c7_d00e_cond;
     t16_MUX_uxn_opcodes_h_l2762_c7_d00e_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2762_c7_d00e_iftrue;
     t16_MUX_uxn_opcodes_h_l2762_c7_d00e_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2762_c7_d00e_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2762_c7_d00e_return_output := t16_MUX_uxn_opcodes_h_l2762_c7_d00e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2762_c7_d00e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2762_c7_d00e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2762_c7_d00e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2762_c7_d00e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2762_c7_d00e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2762_c7_d00e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2762_c7_d00e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2762_c7_d00e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2762_c7_d00e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2781_c7_95ed] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2781_c7_95ed_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2781_c7_95ed_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2781_c7_95ed_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2781_c7_95ed_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2781_c7_95ed_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2781_c7_95ed_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2781_c7_95ed_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2781_c7_95ed_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2781_c7_95ed] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2781_c7_95ed_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2781_c7_95ed_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2781_c7_95ed_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2781_c7_95ed_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2781_c7_95ed_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2781_c7_95ed_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2781_c7_95ed_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2781_c7_95ed_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2765_c7_1d31] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2765_c7_1d31_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2765_c7_1d31_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2765_c7_1d31_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2765_c7_1d31_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2765_c7_1d31_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2765_c7_1d31_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2765_c7_1d31_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2765_c7_1d31_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2777_c7_d750] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2777_c7_d750_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2777_c7_d750_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2777_c7_d750_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2777_c7_d750_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2777_c7_d750_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2777_c7_d750_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2777_c7_d750_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2777_c7_d750_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2781_c7_95ed] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2781_c7_95ed_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2781_c7_95ed_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2781_c7_95ed_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2781_c7_95ed_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2781_c7_95ed_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2781_c7_95ed_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2781_c7_95ed_return_output := result_stack_value_MUX_uxn_opcodes_h_l2781_c7_95ed_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2757_c7_6bff] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2757_c7_6bff_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2757_c7_6bff_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2757_c7_6bff_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2757_c7_6bff_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2757_c7_6bff_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2757_c7_6bff_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2757_c7_6bff_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2757_c7_6bff_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2777_c7_d750_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2781_c7_95ed_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2757_c7_6bff_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2762_c7_d00e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2754_c7_df8c_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2757_c7_6bff_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2777_c7_d750_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2781_c7_95ed_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2762_c7_d00e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2765_c7_1d31_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2771_c7_9e37_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2777_c7_d750_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2777_c7_d750_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2781_c7_95ed_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2757_c7_6bff_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2762_c7_d00e_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l2777_c7_d750] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2777_c7_d750_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2777_c7_d750_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2777_c7_d750_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2777_c7_d750_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2777_c7_d750_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2777_c7_d750_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2777_c7_d750_return_output := result_stack_value_MUX_uxn_opcodes_h_l2777_c7_d750_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2757_c7_6bff] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2757_c7_6bff_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2757_c7_6bff_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2757_c7_6bff_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2757_c7_6bff_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2757_c7_6bff_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2757_c7_6bff_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2757_c7_6bff_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2757_c7_6bff_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2771_c7_9e37] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2771_c7_9e37_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2771_c7_9e37_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2771_c7_9e37_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2771_c7_9e37_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2771_c7_9e37_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2771_c7_9e37_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2771_c7_9e37_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2771_c7_9e37_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2754_c7_df8c] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2754_c7_df8c_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2754_c7_df8c_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2754_c7_df8c_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2754_c7_df8c_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2754_c7_df8c_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2754_c7_df8c_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2754_c7_df8c_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2754_c7_df8c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2762_c7_d00e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2762_c7_d00e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2762_c7_d00e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2762_c7_d00e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2762_c7_d00e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2762_c7_d00e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2762_c7_d00e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2762_c7_d00e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2762_c7_d00e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2777_c7_d750] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2777_c7_d750_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2777_c7_d750_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2777_c7_d750_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2777_c7_d750_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2777_c7_d750_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2777_c7_d750_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2777_c7_d750_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2777_c7_d750_return_output;

     -- t16_MUX[uxn_opcodes_h_l2757_c7_6bff] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2757_c7_6bff_cond <= VAR_t16_MUX_uxn_opcodes_h_l2757_c7_6bff_cond;
     t16_MUX_uxn_opcodes_h_l2757_c7_6bff_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2757_c7_6bff_iftrue;
     t16_MUX_uxn_opcodes_h_l2757_c7_6bff_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2757_c7_6bff_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2757_c7_6bff_return_output := t16_MUX_uxn_opcodes_h_l2757_c7_6bff_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2777_c7_d750] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2777_c7_d750_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2777_c7_d750_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2777_c7_d750_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2777_c7_d750_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2777_c7_d750_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2777_c7_d750_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2777_c7_d750_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2777_c7_d750_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2771_c7_9e37_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2777_c7_d750_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2754_c7_df8c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2757_c7_6bff_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2748_c2_3430_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2754_c7_df8c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2771_c7_9e37_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2777_c7_d750_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2757_c7_6bff_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2762_c7_d00e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2765_c7_1d31_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2771_c7_9e37_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2771_c7_9e37_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2777_c7_d750_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2754_c7_df8c_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2757_c7_6bff_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2771_c7_9e37] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2771_c7_9e37_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2771_c7_9e37_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2771_c7_9e37_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2771_c7_9e37_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2771_c7_9e37_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2771_c7_9e37_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2771_c7_9e37_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2771_c7_9e37_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2771_c7_9e37] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2771_c7_9e37_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2771_c7_9e37_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2771_c7_9e37_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2771_c7_9e37_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2771_c7_9e37_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2771_c7_9e37_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2771_c7_9e37_return_output := result_stack_value_MUX_uxn_opcodes_h_l2771_c7_9e37_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2754_c7_df8c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2754_c7_df8c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2754_c7_df8c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2754_c7_df8c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2754_c7_df8c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2754_c7_df8c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2754_c7_df8c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2754_c7_df8c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2754_c7_df8c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2757_c7_6bff] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2757_c7_6bff_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2757_c7_6bff_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2757_c7_6bff_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2757_c7_6bff_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2757_c7_6bff_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2757_c7_6bff_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2757_c7_6bff_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2757_c7_6bff_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2748_c2_3430] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2748_c2_3430_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2748_c2_3430_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2748_c2_3430_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2748_c2_3430_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2748_c2_3430_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2748_c2_3430_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2748_c2_3430_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2748_c2_3430_return_output;

     -- t16_MUX[uxn_opcodes_h_l2754_c7_df8c] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2754_c7_df8c_cond <= VAR_t16_MUX_uxn_opcodes_h_l2754_c7_df8c_cond;
     t16_MUX_uxn_opcodes_h_l2754_c7_df8c_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2754_c7_df8c_iftrue;
     t16_MUX_uxn_opcodes_h_l2754_c7_df8c_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2754_c7_df8c_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2754_c7_df8c_return_output := t16_MUX_uxn_opcodes_h_l2754_c7_df8c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2765_c7_1d31] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2765_c7_1d31_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2765_c7_1d31_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2765_c7_1d31_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2765_c7_1d31_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2765_c7_1d31_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2765_c7_1d31_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2765_c7_1d31_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2765_c7_1d31_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2771_c7_9e37] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2771_c7_9e37_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2771_c7_9e37_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2771_c7_9e37_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2771_c7_9e37_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2771_c7_9e37_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2771_c7_9e37_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2771_c7_9e37_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2771_c7_9e37_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2765_c7_1d31_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2771_c7_9e37_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2748_c2_3430_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2754_c7_df8c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2765_c7_1d31_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2771_c7_9e37_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2754_c7_df8c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2757_c7_6bff_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2762_c7_d00e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2765_c7_1d31_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2765_c7_1d31_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2771_c7_9e37_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2748_c2_3430_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2754_c7_df8c_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l2765_c7_1d31] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2765_c7_1d31_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2765_c7_1d31_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2765_c7_1d31_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2765_c7_1d31_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2765_c7_1d31_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2765_c7_1d31_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2765_c7_1d31_return_output := result_stack_value_MUX_uxn_opcodes_h_l2765_c7_1d31_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2748_c2_3430] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2748_c2_3430_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2748_c2_3430_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2748_c2_3430_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2748_c2_3430_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2748_c2_3430_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2748_c2_3430_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2748_c2_3430_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2748_c2_3430_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2765_c7_1d31] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2765_c7_1d31_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2765_c7_1d31_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2765_c7_1d31_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2765_c7_1d31_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2765_c7_1d31_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2765_c7_1d31_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2765_c7_1d31_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2765_c7_1d31_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2762_c7_d00e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2762_c7_d00e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2762_c7_d00e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2762_c7_d00e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2762_c7_d00e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2762_c7_d00e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2762_c7_d00e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2762_c7_d00e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2762_c7_d00e_return_output;

     -- t16_MUX[uxn_opcodes_h_l2748_c2_3430] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2748_c2_3430_cond <= VAR_t16_MUX_uxn_opcodes_h_l2748_c2_3430_cond;
     t16_MUX_uxn_opcodes_h_l2748_c2_3430_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2748_c2_3430_iftrue;
     t16_MUX_uxn_opcodes_h_l2748_c2_3430_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2748_c2_3430_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2748_c2_3430_return_output := t16_MUX_uxn_opcodes_h_l2748_c2_3430_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2765_c7_1d31] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2765_c7_1d31_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2765_c7_1d31_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2765_c7_1d31_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2765_c7_1d31_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2765_c7_1d31_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2765_c7_1d31_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2765_c7_1d31_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2765_c7_1d31_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2754_c7_df8c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2754_c7_df8c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2754_c7_df8c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2754_c7_df8c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2754_c7_df8c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2754_c7_df8c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2754_c7_df8c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2754_c7_df8c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2754_c7_df8c_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2762_c7_d00e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2765_c7_1d31_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2762_c7_d00e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2765_c7_1d31_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2748_c2_3430_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2754_c7_df8c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2757_c7_6bff_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2762_c7_d00e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2762_c7_d00e_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2765_c7_1d31_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2748_c2_3430_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2762_c7_d00e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2762_c7_d00e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2762_c7_d00e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2762_c7_d00e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2762_c7_d00e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2762_c7_d00e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2762_c7_d00e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2762_c7_d00e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2762_c7_d00e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2757_c7_6bff] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2757_c7_6bff_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2757_c7_6bff_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2757_c7_6bff_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2757_c7_6bff_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2757_c7_6bff_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2757_c7_6bff_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2757_c7_6bff_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2757_c7_6bff_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2762_c7_d00e] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2762_c7_d00e_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2762_c7_d00e_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2762_c7_d00e_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2762_c7_d00e_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2762_c7_d00e_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2762_c7_d00e_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2762_c7_d00e_return_output := result_stack_value_MUX_uxn_opcodes_h_l2762_c7_d00e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2748_c2_3430] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2748_c2_3430_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2748_c2_3430_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2748_c2_3430_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2748_c2_3430_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2748_c2_3430_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2748_c2_3430_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2748_c2_3430_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2748_c2_3430_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2762_c7_d00e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2762_c7_d00e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2762_c7_d00e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2762_c7_d00e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2762_c7_d00e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2762_c7_d00e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2762_c7_d00e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2762_c7_d00e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2762_c7_d00e_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2757_c7_6bff_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2762_c7_d00e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2757_c7_6bff_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2762_c7_d00e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2754_c7_df8c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2757_c7_6bff_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2757_c7_6bff_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2762_c7_d00e_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2757_c7_6bff] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2757_c7_6bff_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2757_c7_6bff_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2757_c7_6bff_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2757_c7_6bff_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2757_c7_6bff_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2757_c7_6bff_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2757_c7_6bff_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2757_c7_6bff_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2754_c7_df8c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2754_c7_df8c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2754_c7_df8c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2754_c7_df8c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2754_c7_df8c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2754_c7_df8c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2754_c7_df8c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2754_c7_df8c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2754_c7_df8c_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2757_c7_6bff] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2757_c7_6bff_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2757_c7_6bff_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2757_c7_6bff_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2757_c7_6bff_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2757_c7_6bff_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2757_c7_6bff_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2757_c7_6bff_return_output := result_stack_value_MUX_uxn_opcodes_h_l2757_c7_6bff_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2757_c7_6bff] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2757_c7_6bff_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2757_c7_6bff_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2757_c7_6bff_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2757_c7_6bff_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2757_c7_6bff_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2757_c7_6bff_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2757_c7_6bff_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2757_c7_6bff_return_output;

     -- Submodule level 9
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2754_c7_df8c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2757_c7_6bff_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2754_c7_df8c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2757_c7_6bff_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2748_c2_3430_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2754_c7_df8c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2754_c7_df8c_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2757_c7_6bff_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2754_c7_df8c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2754_c7_df8c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2754_c7_df8c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2754_c7_df8c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2754_c7_df8c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2754_c7_df8c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2754_c7_df8c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2754_c7_df8c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2754_c7_df8c_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2754_c7_df8c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2754_c7_df8c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2754_c7_df8c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2754_c7_df8c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2754_c7_df8c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2754_c7_df8c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2754_c7_df8c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2754_c7_df8c_return_output := result_stack_value_MUX_uxn_opcodes_h_l2754_c7_df8c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2748_c2_3430] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2748_c2_3430_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2748_c2_3430_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2748_c2_3430_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2748_c2_3430_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2748_c2_3430_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2748_c2_3430_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2748_c2_3430_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2748_c2_3430_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2754_c7_df8c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2754_c7_df8c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2754_c7_df8c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2754_c7_df8c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2754_c7_df8c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2754_c7_df8c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2754_c7_df8c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2754_c7_df8c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2754_c7_df8c_return_output;

     -- Submodule level 10
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2748_c2_3430_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2754_c7_df8c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2748_c2_3430_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2754_c7_df8c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2748_c2_3430_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2754_c7_df8c_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l2748_c2_3430] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2748_c2_3430_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2748_c2_3430_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2748_c2_3430_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2748_c2_3430_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2748_c2_3430_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2748_c2_3430_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2748_c2_3430_return_output := result_stack_value_MUX_uxn_opcodes_h_l2748_c2_3430_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2748_c2_3430] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2748_c2_3430_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2748_c2_3430_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2748_c2_3430_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2748_c2_3430_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2748_c2_3430_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2748_c2_3430_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2748_c2_3430_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2748_c2_3430_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2748_c2_3430] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2748_c2_3430_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2748_c2_3430_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2748_c2_3430_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2748_c2_3430_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2748_c2_3430_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2748_c2_3430_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2748_c2_3430_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2748_c2_3430_return_output;

     -- Submodule level 11
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_df93_uxn_opcodes_h_l2794_l2744_DUPLICATE_5ea0 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_df93_uxn_opcodes_h_l2794_l2744_DUPLICATE_5ea0_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_df93(
     result,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2748_c2_3430_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2748_c2_3430_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2748_c2_3430_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2748_c2_3430_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2748_c2_3430_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2748_c2_3430_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2748_c2_3430_return_output);

     -- Submodule level 12
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_df93_uxn_opcodes_h_l2794_l2744_DUPLICATE_5ea0_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_df93_uxn_opcodes_h_l2794_l2744_DUPLICATE_5ea0_return_output;
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
