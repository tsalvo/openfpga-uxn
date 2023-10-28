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
-- Submodules: 101
entity lda2_0CLK_c8be2b47 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end lda2_0CLK_c8be2b47;
architecture arch of lda2_0CLK_c8be2b47 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1865_c6_9956]
signal BIN_OP_EQ_uxn_opcodes_h_l1865_c6_9956_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1865_c6_9956_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1865_c6_9956_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1865_c1_ffbe]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1865_c1_ffbe_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1865_c1_ffbe_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1865_c1_ffbe_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1865_c1_ffbe_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1865_c2_fde1]
signal t16_MUX_uxn_opcodes_h_l1865_c2_fde1_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1865_c2_fde1_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1865_c2_fde1_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1865_c2_fde1_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1865_c2_fde1]
signal tmp16_MUX_uxn_opcodes_h_l1865_c2_fde1_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1865_c2_fde1_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1865_c2_fde1_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1865_c2_fde1_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1865_c2_fde1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c2_fde1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c2_fde1_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c2_fde1_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c2_fde1_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1865_c2_fde1]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1865_c2_fde1_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1865_c2_fde1_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1865_c2_fde1_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1865_c2_fde1_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1865_c2_fde1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1865_c2_fde1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1865_c2_fde1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1865_c2_fde1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1865_c2_fde1_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1865_c2_fde1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1865_c2_fde1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1865_c2_fde1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1865_c2_fde1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1865_c2_fde1_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1865_c2_fde1]
signal result_u16_value_MUX_uxn_opcodes_h_l1865_c2_fde1_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1865_c2_fde1_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1865_c2_fde1_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1865_c2_fde1_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1865_c2_fde1]
signal result_u8_value_MUX_uxn_opcodes_h_l1865_c2_fde1_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1865_c2_fde1_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1865_c2_fde1_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1865_c2_fde1_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1865_c2_fde1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c2_fde1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c2_fde1_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c2_fde1_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c2_fde1_return_output : signed(3 downto 0);

-- printf_uxn_opcodes_h_l1866_c3_db7a[uxn_opcodes_h_l1866_c3_db7a]
signal printf_uxn_opcodes_h_l1866_c3_db7a_uxn_opcodes_h_l1866_c3_db7a_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1870_c11_bb1d]
signal BIN_OP_EQ_uxn_opcodes_h_l1870_c11_bb1d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1870_c11_bb1d_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1870_c11_bb1d_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1870_c7_089f]
signal t16_MUX_uxn_opcodes_h_l1870_c7_089f_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1870_c7_089f_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1870_c7_089f_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1870_c7_089f_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1870_c7_089f]
signal tmp16_MUX_uxn_opcodes_h_l1870_c7_089f_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1870_c7_089f_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1870_c7_089f_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1870_c7_089f_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1870_c7_089f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_089f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_089f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_089f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_089f_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1870_c7_089f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1870_c7_089f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1870_c7_089f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1870_c7_089f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1870_c7_089f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1870_c7_089f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_089f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_089f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_089f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_089f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1870_c7_089f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_089f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_089f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_089f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_089f_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1870_c7_089f]
signal result_u16_value_MUX_uxn_opcodes_h_l1870_c7_089f_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1870_c7_089f_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1870_c7_089f_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1870_c7_089f_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1870_c7_089f]
signal result_u8_value_MUX_uxn_opcodes_h_l1870_c7_089f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1870_c7_089f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1870_c7_089f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1870_c7_089f_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1870_c7_089f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_089f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_089f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_089f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_089f_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1873_c11_dcdf]
signal BIN_OP_EQ_uxn_opcodes_h_l1873_c11_dcdf_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1873_c11_dcdf_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1873_c11_dcdf_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1873_c7_d32e]
signal t16_MUX_uxn_opcodes_h_l1873_c7_d32e_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1873_c7_d32e_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1873_c7_d32e_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1873_c7_d32e_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1873_c7_d32e]
signal tmp16_MUX_uxn_opcodes_h_l1873_c7_d32e_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1873_c7_d32e_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1873_c7_d32e_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1873_c7_d32e_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1873_c7_d32e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_d32e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_d32e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_d32e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_d32e_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1873_c7_d32e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1873_c7_d32e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1873_c7_d32e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1873_c7_d32e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1873_c7_d32e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1873_c7_d32e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_d32e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_d32e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_d32e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_d32e_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1873_c7_d32e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_d32e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_d32e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_d32e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_d32e_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1873_c7_d32e]
signal result_u16_value_MUX_uxn_opcodes_h_l1873_c7_d32e_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1873_c7_d32e_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1873_c7_d32e_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1873_c7_d32e_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1873_c7_d32e]
signal result_u8_value_MUX_uxn_opcodes_h_l1873_c7_d32e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1873_c7_d32e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1873_c7_d32e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1873_c7_d32e_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1873_c7_d32e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_d32e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_d32e_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_d32e_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_d32e_return_output : signed(3 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1875_c3_8191]
signal CONST_SL_8_uxn_opcodes_h_l1875_c3_8191_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1875_c3_8191_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1878_c11_9c71]
signal BIN_OP_EQ_uxn_opcodes_h_l1878_c11_9c71_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1878_c11_9c71_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1878_c11_9c71_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1878_c7_7300]
signal t16_MUX_uxn_opcodes_h_l1878_c7_7300_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1878_c7_7300_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1878_c7_7300_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1878_c7_7300_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1878_c7_7300]
signal tmp16_MUX_uxn_opcodes_h_l1878_c7_7300_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1878_c7_7300_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1878_c7_7300_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1878_c7_7300_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1878_c7_7300]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1878_c7_7300_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1878_c7_7300_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1878_c7_7300_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1878_c7_7300_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1878_c7_7300]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1878_c7_7300_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1878_c7_7300_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1878_c7_7300_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1878_c7_7300_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1878_c7_7300]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1878_c7_7300_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1878_c7_7300_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1878_c7_7300_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1878_c7_7300_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1878_c7_7300]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1878_c7_7300_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1878_c7_7300_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1878_c7_7300_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1878_c7_7300_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1878_c7_7300]
signal result_u16_value_MUX_uxn_opcodes_h_l1878_c7_7300_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1878_c7_7300_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1878_c7_7300_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1878_c7_7300_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1878_c7_7300]
signal result_u8_value_MUX_uxn_opcodes_h_l1878_c7_7300_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1878_c7_7300_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1878_c7_7300_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1878_c7_7300_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1878_c7_7300]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1878_c7_7300_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1878_c7_7300_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1878_c7_7300_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1878_c7_7300_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1881_c11_f09d]
signal BIN_OP_EQ_uxn_opcodes_h_l1881_c11_f09d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1881_c11_f09d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1881_c11_f09d_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1881_c7_695d]
signal t16_MUX_uxn_opcodes_h_l1881_c7_695d_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1881_c7_695d_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1881_c7_695d_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1881_c7_695d_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1881_c7_695d]
signal tmp16_MUX_uxn_opcodes_h_l1881_c7_695d_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1881_c7_695d_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1881_c7_695d_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1881_c7_695d_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1881_c7_695d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1881_c7_695d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1881_c7_695d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1881_c7_695d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1881_c7_695d_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1881_c7_695d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1881_c7_695d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1881_c7_695d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1881_c7_695d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1881_c7_695d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1881_c7_695d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1881_c7_695d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1881_c7_695d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1881_c7_695d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1881_c7_695d_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1881_c7_695d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1881_c7_695d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1881_c7_695d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1881_c7_695d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1881_c7_695d_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1881_c7_695d]
signal result_u16_value_MUX_uxn_opcodes_h_l1881_c7_695d_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1881_c7_695d_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1881_c7_695d_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1881_c7_695d_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1881_c7_695d]
signal result_u8_value_MUX_uxn_opcodes_h_l1881_c7_695d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1881_c7_695d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1881_c7_695d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1881_c7_695d_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1881_c7_695d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1881_c7_695d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1881_c7_695d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1881_c7_695d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1881_c7_695d_return_output : signed(3 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1882_c3_f6dc]
signal BIN_OP_OR_uxn_opcodes_h_l1882_c3_f6dc_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1882_c3_f6dc_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1882_c3_f6dc_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1884_c30_6d90]
signal sp_relative_shift_uxn_opcodes_h_l1884_c30_6d90_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1884_c30_6d90_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1884_c30_6d90_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1884_c30_6d90_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1887_c11_94b8]
signal BIN_OP_EQ_uxn_opcodes_h_l1887_c11_94b8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1887_c11_94b8_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1887_c11_94b8_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1887_c7_e14f]
signal tmp16_MUX_uxn_opcodes_h_l1887_c7_e14f_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1887_c7_e14f_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1887_c7_e14f_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1887_c7_e14f_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1887_c7_e14f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1887_c7_e14f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1887_c7_e14f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1887_c7_e14f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1887_c7_e14f_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1887_c7_e14f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1887_c7_e14f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1887_c7_e14f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1887_c7_e14f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1887_c7_e14f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1887_c7_e14f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1887_c7_e14f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1887_c7_e14f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1887_c7_e14f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1887_c7_e14f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1887_c7_e14f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1887_c7_e14f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1887_c7_e14f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1887_c7_e14f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1887_c7_e14f_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1887_c7_e14f]
signal result_u16_value_MUX_uxn_opcodes_h_l1887_c7_e14f_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1887_c7_e14f_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1887_c7_e14f_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1887_c7_e14f_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1887_c7_e14f]
signal result_u8_value_MUX_uxn_opcodes_h_l1887_c7_e14f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1887_c7_e14f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1887_c7_e14f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1887_c7_e14f_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1891_c11_458e]
signal BIN_OP_EQ_uxn_opcodes_h_l1891_c11_458e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1891_c11_458e_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1891_c11_458e_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1891_c7_1c9b]
signal tmp16_MUX_uxn_opcodes_h_l1891_c7_1c9b_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1891_c7_1c9b_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1891_c7_1c9b_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1891_c7_1c9b_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1891_c7_1c9b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1891_c7_1c9b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1891_c7_1c9b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1891_c7_1c9b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1891_c7_1c9b_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1891_c7_1c9b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1891_c7_1c9b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1891_c7_1c9b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1891_c7_1c9b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1891_c7_1c9b_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1891_c7_1c9b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1891_c7_1c9b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1891_c7_1c9b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1891_c7_1c9b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1891_c7_1c9b_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1891_c7_1c9b]
signal result_u16_value_MUX_uxn_opcodes_h_l1891_c7_1c9b_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1891_c7_1c9b_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1891_c7_1c9b_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1891_c7_1c9b_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1891_c7_1c9b]
signal result_u8_value_MUX_uxn_opcodes_h_l1891_c7_1c9b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1891_c7_1c9b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1891_c7_1c9b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1891_c7_1c9b_return_output : unsigned(7 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1893_c3_0921]
signal CONST_SL_8_uxn_opcodes_h_l1893_c3_0921_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1893_c3_0921_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1894_c22_0870]
signal BIN_OP_PLUS_uxn_opcodes_h_l1894_c22_0870_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1894_c22_0870_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1894_c22_0870_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1896_c11_dad9]
signal BIN_OP_EQ_uxn_opcodes_h_l1896_c11_dad9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1896_c11_dad9_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1896_c11_dad9_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1896_c7_a5e3]
signal tmp16_MUX_uxn_opcodes_h_l1896_c7_a5e3_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1896_c7_a5e3_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1896_c7_a5e3_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1896_c7_a5e3_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1896_c7_a5e3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1896_c7_a5e3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1896_c7_a5e3_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1896_c7_a5e3_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1896_c7_a5e3_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1896_c7_a5e3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1896_c7_a5e3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1896_c7_a5e3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1896_c7_a5e3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1896_c7_a5e3_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1896_c7_a5e3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1896_c7_a5e3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1896_c7_a5e3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1896_c7_a5e3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1896_c7_a5e3_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1896_c7_a5e3]
signal result_u16_value_MUX_uxn_opcodes_h_l1896_c7_a5e3_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1896_c7_a5e3_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1896_c7_a5e3_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1896_c7_a5e3_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1896_c7_a5e3]
signal result_u8_value_MUX_uxn_opcodes_h_l1896_c7_a5e3_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1896_c7_a5e3_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1896_c7_a5e3_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1896_c7_a5e3_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1897_c22_e58e]
signal BIN_OP_PLUS_uxn_opcodes_h_l1897_c22_e58e_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1897_c22_e58e_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1897_c22_e58e_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1899_c11_4ac3]
signal BIN_OP_EQ_uxn_opcodes_h_l1899_c11_4ac3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1899_c11_4ac3_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1899_c11_4ac3_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1899_c7_6ce2]
signal tmp16_MUX_uxn_opcodes_h_l1899_c7_6ce2_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1899_c7_6ce2_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1899_c7_6ce2_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1899_c7_6ce2_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1899_c7_6ce2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1899_c7_6ce2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1899_c7_6ce2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1899_c7_6ce2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1899_c7_6ce2_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1899_c7_6ce2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1899_c7_6ce2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1899_c7_6ce2_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1899_c7_6ce2_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1899_c7_6ce2_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1899_c7_6ce2]
signal result_u8_value_MUX_uxn_opcodes_h_l1899_c7_6ce2_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1899_c7_6ce2_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1899_c7_6ce2_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1899_c7_6ce2_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1899_c7_6ce2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1899_c7_6ce2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1899_c7_6ce2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1899_c7_6ce2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1899_c7_6ce2_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1900_c3_46a9]
signal BIN_OP_OR_uxn_opcodes_h_l1900_c3_46a9_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1900_c3_46a9_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1900_c3_46a9_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1905_c11_b694]
signal BIN_OP_EQ_uxn_opcodes_h_l1905_c11_b694_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1905_c11_b694_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1905_c11_b694_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1905_c7_4f6a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1905_c7_4f6a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1905_c7_4f6a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1905_c7_4f6a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1905_c7_4f6a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1905_c7_4f6a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1905_c7_4f6a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1905_c7_4f6a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1905_c7_4f6a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1905_c7_4f6a_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1905_c7_4f6a]
signal result_u8_value_MUX_uxn_opcodes_h_l1905_c7_4f6a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1905_c7_4f6a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1905_c7_4f6a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1905_c7_4f6a_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1905_c7_4f6a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1905_c7_4f6a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1905_c7_4f6a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1905_c7_4f6a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1905_c7_4f6a_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1907_c31_1649]
signal CONST_SR_8_uxn_opcodes_h_l1907_c31_1649_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1907_c31_1649_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1909_c11_bdb2]
signal BIN_OP_EQ_uxn_opcodes_h_l1909_c11_bdb2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1909_c11_bdb2_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1909_c11_bdb2_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1909_c7_a7e9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1909_c7_a7e9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1909_c7_a7e9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1909_c7_a7e9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1909_c7_a7e9_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1909_c7_a7e9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1909_c7_a7e9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1909_c7_a7e9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1909_c7_a7e9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1909_c7_a7e9_return_output : unsigned(0 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_284d( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : signed) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.stack_address_sp_offset := ref_toks_1;
      base.is_sp_shift := ref_toks_2;
      base.is_opc_done := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.u16_value := ref_toks_5;
      base.u8_value := ref_toks_6;
      base.sp_relative_shift := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1865_c6_9956
BIN_OP_EQ_uxn_opcodes_h_l1865_c6_9956 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1865_c6_9956_left,
BIN_OP_EQ_uxn_opcodes_h_l1865_c6_9956_right,
BIN_OP_EQ_uxn_opcodes_h_l1865_c6_9956_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1865_c1_ffbe
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1865_c1_ffbe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1865_c1_ffbe_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1865_c1_ffbe_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1865_c1_ffbe_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1865_c1_ffbe_return_output);

-- t16_MUX_uxn_opcodes_h_l1865_c2_fde1
t16_MUX_uxn_opcodes_h_l1865_c2_fde1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1865_c2_fde1_cond,
t16_MUX_uxn_opcodes_h_l1865_c2_fde1_iftrue,
t16_MUX_uxn_opcodes_h_l1865_c2_fde1_iffalse,
t16_MUX_uxn_opcodes_h_l1865_c2_fde1_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1865_c2_fde1
tmp16_MUX_uxn_opcodes_h_l1865_c2_fde1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1865_c2_fde1_cond,
tmp16_MUX_uxn_opcodes_h_l1865_c2_fde1_iftrue,
tmp16_MUX_uxn_opcodes_h_l1865_c2_fde1_iffalse,
tmp16_MUX_uxn_opcodes_h_l1865_c2_fde1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c2_fde1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c2_fde1 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c2_fde1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c2_fde1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c2_fde1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c2_fde1_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1865_c2_fde1
result_is_sp_shift_MUX_uxn_opcodes_h_l1865_c2_fde1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1865_c2_fde1_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1865_c2_fde1_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1865_c2_fde1_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1865_c2_fde1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1865_c2_fde1
result_is_opc_done_MUX_uxn_opcodes_h_l1865_c2_fde1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1865_c2_fde1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1865_c2_fde1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1865_c2_fde1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1865_c2_fde1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1865_c2_fde1
result_is_stack_write_MUX_uxn_opcodes_h_l1865_c2_fde1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1865_c2_fde1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1865_c2_fde1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1865_c2_fde1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1865_c2_fde1_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1865_c2_fde1
result_u16_value_MUX_uxn_opcodes_h_l1865_c2_fde1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1865_c2_fde1_cond,
result_u16_value_MUX_uxn_opcodes_h_l1865_c2_fde1_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1865_c2_fde1_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1865_c2_fde1_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1865_c2_fde1
result_u8_value_MUX_uxn_opcodes_h_l1865_c2_fde1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1865_c2_fde1_cond,
result_u8_value_MUX_uxn_opcodes_h_l1865_c2_fde1_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1865_c2_fde1_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1865_c2_fde1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c2_fde1
result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c2_fde1 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c2_fde1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c2_fde1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c2_fde1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c2_fde1_return_output);

-- printf_uxn_opcodes_h_l1866_c3_db7a_uxn_opcodes_h_l1866_c3_db7a
printf_uxn_opcodes_h_l1866_c3_db7a_uxn_opcodes_h_l1866_c3_db7a : entity work.printf_uxn_opcodes_h_l1866_c3_db7a_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1866_c3_db7a_uxn_opcodes_h_l1866_c3_db7a_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1870_c11_bb1d
BIN_OP_EQ_uxn_opcodes_h_l1870_c11_bb1d : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1870_c11_bb1d_left,
BIN_OP_EQ_uxn_opcodes_h_l1870_c11_bb1d_right,
BIN_OP_EQ_uxn_opcodes_h_l1870_c11_bb1d_return_output);

-- t16_MUX_uxn_opcodes_h_l1870_c7_089f
t16_MUX_uxn_opcodes_h_l1870_c7_089f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1870_c7_089f_cond,
t16_MUX_uxn_opcodes_h_l1870_c7_089f_iftrue,
t16_MUX_uxn_opcodes_h_l1870_c7_089f_iffalse,
t16_MUX_uxn_opcodes_h_l1870_c7_089f_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1870_c7_089f
tmp16_MUX_uxn_opcodes_h_l1870_c7_089f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1870_c7_089f_cond,
tmp16_MUX_uxn_opcodes_h_l1870_c7_089f_iftrue,
tmp16_MUX_uxn_opcodes_h_l1870_c7_089f_iffalse,
tmp16_MUX_uxn_opcodes_h_l1870_c7_089f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_089f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_089f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_089f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_089f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_089f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_089f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1870_c7_089f
result_is_sp_shift_MUX_uxn_opcodes_h_l1870_c7_089f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1870_c7_089f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1870_c7_089f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1870_c7_089f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1870_c7_089f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_089f
result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_089f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_089f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_089f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_089f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_089f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_089f
result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_089f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_089f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_089f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_089f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_089f_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1870_c7_089f
result_u16_value_MUX_uxn_opcodes_h_l1870_c7_089f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1870_c7_089f_cond,
result_u16_value_MUX_uxn_opcodes_h_l1870_c7_089f_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1870_c7_089f_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1870_c7_089f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1870_c7_089f
result_u8_value_MUX_uxn_opcodes_h_l1870_c7_089f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1870_c7_089f_cond,
result_u8_value_MUX_uxn_opcodes_h_l1870_c7_089f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1870_c7_089f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1870_c7_089f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_089f
result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_089f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_089f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_089f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_089f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_089f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1873_c11_dcdf
BIN_OP_EQ_uxn_opcodes_h_l1873_c11_dcdf : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1873_c11_dcdf_left,
BIN_OP_EQ_uxn_opcodes_h_l1873_c11_dcdf_right,
BIN_OP_EQ_uxn_opcodes_h_l1873_c11_dcdf_return_output);

-- t16_MUX_uxn_opcodes_h_l1873_c7_d32e
t16_MUX_uxn_opcodes_h_l1873_c7_d32e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1873_c7_d32e_cond,
t16_MUX_uxn_opcodes_h_l1873_c7_d32e_iftrue,
t16_MUX_uxn_opcodes_h_l1873_c7_d32e_iffalse,
t16_MUX_uxn_opcodes_h_l1873_c7_d32e_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1873_c7_d32e
tmp16_MUX_uxn_opcodes_h_l1873_c7_d32e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1873_c7_d32e_cond,
tmp16_MUX_uxn_opcodes_h_l1873_c7_d32e_iftrue,
tmp16_MUX_uxn_opcodes_h_l1873_c7_d32e_iffalse,
tmp16_MUX_uxn_opcodes_h_l1873_c7_d32e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_d32e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_d32e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_d32e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_d32e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_d32e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_d32e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1873_c7_d32e
result_is_sp_shift_MUX_uxn_opcodes_h_l1873_c7_d32e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1873_c7_d32e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1873_c7_d32e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1873_c7_d32e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1873_c7_d32e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_d32e
result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_d32e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_d32e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_d32e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_d32e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_d32e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_d32e
result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_d32e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_d32e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_d32e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_d32e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_d32e_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1873_c7_d32e
result_u16_value_MUX_uxn_opcodes_h_l1873_c7_d32e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1873_c7_d32e_cond,
result_u16_value_MUX_uxn_opcodes_h_l1873_c7_d32e_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1873_c7_d32e_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1873_c7_d32e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1873_c7_d32e
result_u8_value_MUX_uxn_opcodes_h_l1873_c7_d32e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1873_c7_d32e_cond,
result_u8_value_MUX_uxn_opcodes_h_l1873_c7_d32e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1873_c7_d32e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1873_c7_d32e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_d32e
result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_d32e : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_d32e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_d32e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_d32e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_d32e_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1875_c3_8191
CONST_SL_8_uxn_opcodes_h_l1875_c3_8191 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1875_c3_8191_x,
CONST_SL_8_uxn_opcodes_h_l1875_c3_8191_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1878_c11_9c71
BIN_OP_EQ_uxn_opcodes_h_l1878_c11_9c71 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1878_c11_9c71_left,
BIN_OP_EQ_uxn_opcodes_h_l1878_c11_9c71_right,
BIN_OP_EQ_uxn_opcodes_h_l1878_c11_9c71_return_output);

-- t16_MUX_uxn_opcodes_h_l1878_c7_7300
t16_MUX_uxn_opcodes_h_l1878_c7_7300 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1878_c7_7300_cond,
t16_MUX_uxn_opcodes_h_l1878_c7_7300_iftrue,
t16_MUX_uxn_opcodes_h_l1878_c7_7300_iffalse,
t16_MUX_uxn_opcodes_h_l1878_c7_7300_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1878_c7_7300
tmp16_MUX_uxn_opcodes_h_l1878_c7_7300 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1878_c7_7300_cond,
tmp16_MUX_uxn_opcodes_h_l1878_c7_7300_iftrue,
tmp16_MUX_uxn_opcodes_h_l1878_c7_7300_iffalse,
tmp16_MUX_uxn_opcodes_h_l1878_c7_7300_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1878_c7_7300
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1878_c7_7300 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1878_c7_7300_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1878_c7_7300_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1878_c7_7300_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1878_c7_7300_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1878_c7_7300
result_is_sp_shift_MUX_uxn_opcodes_h_l1878_c7_7300 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1878_c7_7300_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1878_c7_7300_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1878_c7_7300_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1878_c7_7300_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1878_c7_7300
result_is_opc_done_MUX_uxn_opcodes_h_l1878_c7_7300 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1878_c7_7300_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1878_c7_7300_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1878_c7_7300_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1878_c7_7300_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1878_c7_7300
result_is_stack_write_MUX_uxn_opcodes_h_l1878_c7_7300 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1878_c7_7300_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1878_c7_7300_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1878_c7_7300_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1878_c7_7300_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1878_c7_7300
result_u16_value_MUX_uxn_opcodes_h_l1878_c7_7300 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1878_c7_7300_cond,
result_u16_value_MUX_uxn_opcodes_h_l1878_c7_7300_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1878_c7_7300_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1878_c7_7300_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1878_c7_7300
result_u8_value_MUX_uxn_opcodes_h_l1878_c7_7300 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1878_c7_7300_cond,
result_u8_value_MUX_uxn_opcodes_h_l1878_c7_7300_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1878_c7_7300_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1878_c7_7300_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1878_c7_7300
result_sp_relative_shift_MUX_uxn_opcodes_h_l1878_c7_7300 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1878_c7_7300_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1878_c7_7300_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1878_c7_7300_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1878_c7_7300_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1881_c11_f09d
BIN_OP_EQ_uxn_opcodes_h_l1881_c11_f09d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1881_c11_f09d_left,
BIN_OP_EQ_uxn_opcodes_h_l1881_c11_f09d_right,
BIN_OP_EQ_uxn_opcodes_h_l1881_c11_f09d_return_output);

-- t16_MUX_uxn_opcodes_h_l1881_c7_695d
t16_MUX_uxn_opcodes_h_l1881_c7_695d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1881_c7_695d_cond,
t16_MUX_uxn_opcodes_h_l1881_c7_695d_iftrue,
t16_MUX_uxn_opcodes_h_l1881_c7_695d_iffalse,
t16_MUX_uxn_opcodes_h_l1881_c7_695d_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1881_c7_695d
tmp16_MUX_uxn_opcodes_h_l1881_c7_695d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1881_c7_695d_cond,
tmp16_MUX_uxn_opcodes_h_l1881_c7_695d_iftrue,
tmp16_MUX_uxn_opcodes_h_l1881_c7_695d_iffalse,
tmp16_MUX_uxn_opcodes_h_l1881_c7_695d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1881_c7_695d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1881_c7_695d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1881_c7_695d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1881_c7_695d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1881_c7_695d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1881_c7_695d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1881_c7_695d
result_is_sp_shift_MUX_uxn_opcodes_h_l1881_c7_695d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1881_c7_695d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1881_c7_695d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1881_c7_695d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1881_c7_695d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1881_c7_695d
result_is_opc_done_MUX_uxn_opcodes_h_l1881_c7_695d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1881_c7_695d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1881_c7_695d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1881_c7_695d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1881_c7_695d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1881_c7_695d
result_is_stack_write_MUX_uxn_opcodes_h_l1881_c7_695d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1881_c7_695d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1881_c7_695d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1881_c7_695d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1881_c7_695d_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1881_c7_695d
result_u16_value_MUX_uxn_opcodes_h_l1881_c7_695d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1881_c7_695d_cond,
result_u16_value_MUX_uxn_opcodes_h_l1881_c7_695d_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1881_c7_695d_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1881_c7_695d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1881_c7_695d
result_u8_value_MUX_uxn_opcodes_h_l1881_c7_695d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1881_c7_695d_cond,
result_u8_value_MUX_uxn_opcodes_h_l1881_c7_695d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1881_c7_695d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1881_c7_695d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1881_c7_695d
result_sp_relative_shift_MUX_uxn_opcodes_h_l1881_c7_695d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1881_c7_695d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1881_c7_695d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1881_c7_695d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1881_c7_695d_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1882_c3_f6dc
BIN_OP_OR_uxn_opcodes_h_l1882_c3_f6dc : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1882_c3_f6dc_left,
BIN_OP_OR_uxn_opcodes_h_l1882_c3_f6dc_right,
BIN_OP_OR_uxn_opcodes_h_l1882_c3_f6dc_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1884_c30_6d90
sp_relative_shift_uxn_opcodes_h_l1884_c30_6d90 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1884_c30_6d90_ins,
sp_relative_shift_uxn_opcodes_h_l1884_c30_6d90_x,
sp_relative_shift_uxn_opcodes_h_l1884_c30_6d90_y,
sp_relative_shift_uxn_opcodes_h_l1884_c30_6d90_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1887_c11_94b8
BIN_OP_EQ_uxn_opcodes_h_l1887_c11_94b8 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1887_c11_94b8_left,
BIN_OP_EQ_uxn_opcodes_h_l1887_c11_94b8_right,
BIN_OP_EQ_uxn_opcodes_h_l1887_c11_94b8_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1887_c7_e14f
tmp16_MUX_uxn_opcodes_h_l1887_c7_e14f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1887_c7_e14f_cond,
tmp16_MUX_uxn_opcodes_h_l1887_c7_e14f_iftrue,
tmp16_MUX_uxn_opcodes_h_l1887_c7_e14f_iffalse,
tmp16_MUX_uxn_opcodes_h_l1887_c7_e14f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1887_c7_e14f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1887_c7_e14f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1887_c7_e14f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1887_c7_e14f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1887_c7_e14f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1887_c7_e14f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1887_c7_e14f
result_is_sp_shift_MUX_uxn_opcodes_h_l1887_c7_e14f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1887_c7_e14f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1887_c7_e14f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1887_c7_e14f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1887_c7_e14f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1887_c7_e14f
result_is_opc_done_MUX_uxn_opcodes_h_l1887_c7_e14f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1887_c7_e14f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1887_c7_e14f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1887_c7_e14f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1887_c7_e14f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1887_c7_e14f
result_is_stack_write_MUX_uxn_opcodes_h_l1887_c7_e14f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1887_c7_e14f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1887_c7_e14f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1887_c7_e14f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1887_c7_e14f_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1887_c7_e14f
result_u16_value_MUX_uxn_opcodes_h_l1887_c7_e14f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1887_c7_e14f_cond,
result_u16_value_MUX_uxn_opcodes_h_l1887_c7_e14f_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1887_c7_e14f_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1887_c7_e14f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1887_c7_e14f
result_u8_value_MUX_uxn_opcodes_h_l1887_c7_e14f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1887_c7_e14f_cond,
result_u8_value_MUX_uxn_opcodes_h_l1887_c7_e14f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1887_c7_e14f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1887_c7_e14f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1891_c11_458e
BIN_OP_EQ_uxn_opcodes_h_l1891_c11_458e : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1891_c11_458e_left,
BIN_OP_EQ_uxn_opcodes_h_l1891_c11_458e_right,
BIN_OP_EQ_uxn_opcodes_h_l1891_c11_458e_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1891_c7_1c9b
tmp16_MUX_uxn_opcodes_h_l1891_c7_1c9b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1891_c7_1c9b_cond,
tmp16_MUX_uxn_opcodes_h_l1891_c7_1c9b_iftrue,
tmp16_MUX_uxn_opcodes_h_l1891_c7_1c9b_iffalse,
tmp16_MUX_uxn_opcodes_h_l1891_c7_1c9b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1891_c7_1c9b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1891_c7_1c9b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1891_c7_1c9b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1891_c7_1c9b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1891_c7_1c9b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1891_c7_1c9b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1891_c7_1c9b
result_is_opc_done_MUX_uxn_opcodes_h_l1891_c7_1c9b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1891_c7_1c9b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1891_c7_1c9b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1891_c7_1c9b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1891_c7_1c9b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1891_c7_1c9b
result_is_stack_write_MUX_uxn_opcodes_h_l1891_c7_1c9b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1891_c7_1c9b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1891_c7_1c9b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1891_c7_1c9b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1891_c7_1c9b_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1891_c7_1c9b
result_u16_value_MUX_uxn_opcodes_h_l1891_c7_1c9b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1891_c7_1c9b_cond,
result_u16_value_MUX_uxn_opcodes_h_l1891_c7_1c9b_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1891_c7_1c9b_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1891_c7_1c9b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1891_c7_1c9b
result_u8_value_MUX_uxn_opcodes_h_l1891_c7_1c9b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1891_c7_1c9b_cond,
result_u8_value_MUX_uxn_opcodes_h_l1891_c7_1c9b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1891_c7_1c9b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1891_c7_1c9b_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1893_c3_0921
CONST_SL_8_uxn_opcodes_h_l1893_c3_0921 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1893_c3_0921_x,
CONST_SL_8_uxn_opcodes_h_l1893_c3_0921_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1894_c22_0870
BIN_OP_PLUS_uxn_opcodes_h_l1894_c22_0870 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1894_c22_0870_left,
BIN_OP_PLUS_uxn_opcodes_h_l1894_c22_0870_right,
BIN_OP_PLUS_uxn_opcodes_h_l1894_c22_0870_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1896_c11_dad9
BIN_OP_EQ_uxn_opcodes_h_l1896_c11_dad9 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1896_c11_dad9_left,
BIN_OP_EQ_uxn_opcodes_h_l1896_c11_dad9_right,
BIN_OP_EQ_uxn_opcodes_h_l1896_c11_dad9_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1896_c7_a5e3
tmp16_MUX_uxn_opcodes_h_l1896_c7_a5e3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1896_c7_a5e3_cond,
tmp16_MUX_uxn_opcodes_h_l1896_c7_a5e3_iftrue,
tmp16_MUX_uxn_opcodes_h_l1896_c7_a5e3_iffalse,
tmp16_MUX_uxn_opcodes_h_l1896_c7_a5e3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1896_c7_a5e3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1896_c7_a5e3 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1896_c7_a5e3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1896_c7_a5e3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1896_c7_a5e3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1896_c7_a5e3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1896_c7_a5e3
result_is_opc_done_MUX_uxn_opcodes_h_l1896_c7_a5e3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1896_c7_a5e3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1896_c7_a5e3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1896_c7_a5e3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1896_c7_a5e3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1896_c7_a5e3
result_is_stack_write_MUX_uxn_opcodes_h_l1896_c7_a5e3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1896_c7_a5e3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1896_c7_a5e3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1896_c7_a5e3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1896_c7_a5e3_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1896_c7_a5e3
result_u16_value_MUX_uxn_opcodes_h_l1896_c7_a5e3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1896_c7_a5e3_cond,
result_u16_value_MUX_uxn_opcodes_h_l1896_c7_a5e3_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1896_c7_a5e3_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1896_c7_a5e3_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1896_c7_a5e3
result_u8_value_MUX_uxn_opcodes_h_l1896_c7_a5e3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1896_c7_a5e3_cond,
result_u8_value_MUX_uxn_opcodes_h_l1896_c7_a5e3_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1896_c7_a5e3_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1896_c7_a5e3_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1897_c22_e58e
BIN_OP_PLUS_uxn_opcodes_h_l1897_c22_e58e : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1897_c22_e58e_left,
BIN_OP_PLUS_uxn_opcodes_h_l1897_c22_e58e_right,
BIN_OP_PLUS_uxn_opcodes_h_l1897_c22_e58e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1899_c11_4ac3
BIN_OP_EQ_uxn_opcodes_h_l1899_c11_4ac3 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1899_c11_4ac3_left,
BIN_OP_EQ_uxn_opcodes_h_l1899_c11_4ac3_right,
BIN_OP_EQ_uxn_opcodes_h_l1899_c11_4ac3_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1899_c7_6ce2
tmp16_MUX_uxn_opcodes_h_l1899_c7_6ce2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1899_c7_6ce2_cond,
tmp16_MUX_uxn_opcodes_h_l1899_c7_6ce2_iftrue,
tmp16_MUX_uxn_opcodes_h_l1899_c7_6ce2_iffalse,
tmp16_MUX_uxn_opcodes_h_l1899_c7_6ce2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1899_c7_6ce2
result_is_stack_write_MUX_uxn_opcodes_h_l1899_c7_6ce2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1899_c7_6ce2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1899_c7_6ce2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1899_c7_6ce2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1899_c7_6ce2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1899_c7_6ce2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1899_c7_6ce2 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1899_c7_6ce2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1899_c7_6ce2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1899_c7_6ce2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1899_c7_6ce2_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1899_c7_6ce2
result_u8_value_MUX_uxn_opcodes_h_l1899_c7_6ce2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1899_c7_6ce2_cond,
result_u8_value_MUX_uxn_opcodes_h_l1899_c7_6ce2_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1899_c7_6ce2_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1899_c7_6ce2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1899_c7_6ce2
result_is_opc_done_MUX_uxn_opcodes_h_l1899_c7_6ce2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1899_c7_6ce2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1899_c7_6ce2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1899_c7_6ce2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1899_c7_6ce2_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1900_c3_46a9
BIN_OP_OR_uxn_opcodes_h_l1900_c3_46a9 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1900_c3_46a9_left,
BIN_OP_OR_uxn_opcodes_h_l1900_c3_46a9_right,
BIN_OP_OR_uxn_opcodes_h_l1900_c3_46a9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1905_c11_b694
BIN_OP_EQ_uxn_opcodes_h_l1905_c11_b694 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1905_c11_b694_left,
BIN_OP_EQ_uxn_opcodes_h_l1905_c11_b694_right,
BIN_OP_EQ_uxn_opcodes_h_l1905_c11_b694_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1905_c7_4f6a
result_is_stack_write_MUX_uxn_opcodes_h_l1905_c7_4f6a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1905_c7_4f6a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1905_c7_4f6a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1905_c7_4f6a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1905_c7_4f6a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1905_c7_4f6a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1905_c7_4f6a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1905_c7_4f6a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1905_c7_4f6a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1905_c7_4f6a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1905_c7_4f6a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1905_c7_4f6a
result_u8_value_MUX_uxn_opcodes_h_l1905_c7_4f6a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1905_c7_4f6a_cond,
result_u8_value_MUX_uxn_opcodes_h_l1905_c7_4f6a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1905_c7_4f6a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1905_c7_4f6a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1905_c7_4f6a
result_is_opc_done_MUX_uxn_opcodes_h_l1905_c7_4f6a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1905_c7_4f6a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1905_c7_4f6a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1905_c7_4f6a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1905_c7_4f6a_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1907_c31_1649
CONST_SR_8_uxn_opcodes_h_l1907_c31_1649 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1907_c31_1649_x,
CONST_SR_8_uxn_opcodes_h_l1907_c31_1649_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1909_c11_bdb2
BIN_OP_EQ_uxn_opcodes_h_l1909_c11_bdb2 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1909_c11_bdb2_left,
BIN_OP_EQ_uxn_opcodes_h_l1909_c11_bdb2_right,
BIN_OP_EQ_uxn_opcodes_h_l1909_c11_bdb2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1909_c7_a7e9
result_is_stack_write_MUX_uxn_opcodes_h_l1909_c7_a7e9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1909_c7_a7e9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1909_c7_a7e9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1909_c7_a7e9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1909_c7_a7e9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1909_c7_a7e9
result_is_opc_done_MUX_uxn_opcodes_h_l1909_c7_a7e9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1909_c7_a7e9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1909_c7_a7e9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1909_c7_a7e9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1909_c7_a7e9_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1865_c6_9956_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1865_c1_ffbe_return_output,
 t16_MUX_uxn_opcodes_h_l1865_c2_fde1_return_output,
 tmp16_MUX_uxn_opcodes_h_l1865_c2_fde1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c2_fde1_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1865_c2_fde1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1865_c2_fde1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1865_c2_fde1_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1865_c2_fde1_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1865_c2_fde1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c2_fde1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1870_c11_bb1d_return_output,
 t16_MUX_uxn_opcodes_h_l1870_c7_089f_return_output,
 tmp16_MUX_uxn_opcodes_h_l1870_c7_089f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_089f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1870_c7_089f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_089f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_089f_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1870_c7_089f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1870_c7_089f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_089f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1873_c11_dcdf_return_output,
 t16_MUX_uxn_opcodes_h_l1873_c7_d32e_return_output,
 tmp16_MUX_uxn_opcodes_h_l1873_c7_d32e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_d32e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1873_c7_d32e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_d32e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_d32e_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1873_c7_d32e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1873_c7_d32e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_d32e_return_output,
 CONST_SL_8_uxn_opcodes_h_l1875_c3_8191_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1878_c11_9c71_return_output,
 t16_MUX_uxn_opcodes_h_l1878_c7_7300_return_output,
 tmp16_MUX_uxn_opcodes_h_l1878_c7_7300_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1878_c7_7300_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1878_c7_7300_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1878_c7_7300_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1878_c7_7300_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1878_c7_7300_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1878_c7_7300_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1878_c7_7300_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1881_c11_f09d_return_output,
 t16_MUX_uxn_opcodes_h_l1881_c7_695d_return_output,
 tmp16_MUX_uxn_opcodes_h_l1881_c7_695d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1881_c7_695d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1881_c7_695d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1881_c7_695d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1881_c7_695d_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1881_c7_695d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1881_c7_695d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1881_c7_695d_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1882_c3_f6dc_return_output,
 sp_relative_shift_uxn_opcodes_h_l1884_c30_6d90_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1887_c11_94b8_return_output,
 tmp16_MUX_uxn_opcodes_h_l1887_c7_e14f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1887_c7_e14f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1887_c7_e14f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1887_c7_e14f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1887_c7_e14f_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1887_c7_e14f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1887_c7_e14f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1891_c11_458e_return_output,
 tmp16_MUX_uxn_opcodes_h_l1891_c7_1c9b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1891_c7_1c9b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1891_c7_1c9b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1891_c7_1c9b_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1891_c7_1c9b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1891_c7_1c9b_return_output,
 CONST_SL_8_uxn_opcodes_h_l1893_c3_0921_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1894_c22_0870_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1896_c11_dad9_return_output,
 tmp16_MUX_uxn_opcodes_h_l1896_c7_a5e3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1896_c7_a5e3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1896_c7_a5e3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1896_c7_a5e3_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1896_c7_a5e3_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1896_c7_a5e3_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1897_c22_e58e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1899_c11_4ac3_return_output,
 tmp16_MUX_uxn_opcodes_h_l1899_c7_6ce2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1899_c7_6ce2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1899_c7_6ce2_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1899_c7_6ce2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1899_c7_6ce2_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1900_c3_46a9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1905_c11_b694_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1905_c7_4f6a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1905_c7_4f6a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1905_c7_4f6a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1905_c7_4f6a_return_output,
 CONST_SR_8_uxn_opcodes_h_l1907_c31_1649_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1909_c11_bdb2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1909_c7_a7e9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1909_c7_a7e9_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c6_9956_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c6_9956_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c6_9956_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1865_c1_ffbe_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1865_c1_ffbe_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1865_c1_ffbe_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1865_c1_ffbe_iffalse : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1865_c2_fde1_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1865_c2_fde1_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1870_c7_089f_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1865_c2_fde1_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1865_c2_fde1_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1865_c2_fde1_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1865_c2_fde1_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1870_c7_089f_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1865_c2_fde1_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1865_c2_fde1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c2_fde1_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1867_c3_902e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c2_fde1_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_089f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c2_fde1_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c2_fde1_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1865_c2_fde1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1865_c2_fde1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1870_c7_089f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1865_c2_fde1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1865_c2_fde1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1865_c2_fde1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1865_c2_fde1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_089f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1865_c2_fde1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1865_c2_fde1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1865_c2_fde1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1865_c2_fde1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_089f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1865_c2_fde1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1865_c2_fde1_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1865_c2_fde1_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1865_c2_fde1_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1870_c7_089f_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1865_c2_fde1_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1865_c2_fde1_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1865_c2_fde1_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1865_c2_fde1_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1870_c7_089f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1865_c2_fde1_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1865_c2_fde1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c2_fde1_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c2_fde1_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_089f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c2_fde1_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c2_fde1_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1866_c3_db7a_uxn_opcodes_h_l1866_c3_db7a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1870_c11_bb1d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1870_c11_bb1d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1870_c11_bb1d_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1870_c7_089f_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1870_c7_089f_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1873_c7_d32e_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1870_c7_089f_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1870_c7_089f_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1870_c7_089f_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1873_c7_d32e_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1870_c7_089f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_089f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1871_c3_580c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_089f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_d32e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_089f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1870_c7_089f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1870_c7_089f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1873_c7_d32e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1870_c7_089f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_089f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_089f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_d32e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_089f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_089f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_089f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_d32e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_089f_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1870_c7_089f_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1870_c7_089f_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1873_c7_d32e_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1870_c7_089f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1870_c7_089f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1870_c7_089f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1873_c7_d32e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1870_c7_089f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_089f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_089f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_d32e_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_089f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_dcdf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_dcdf_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_dcdf_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1873_c7_d32e_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1873_c7_d32e_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1878_c7_7300_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1873_c7_d32e_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1873_c7_d32e_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1873_c7_d32e_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1878_c7_7300_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1873_c7_d32e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_d32e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1876_c3_b2f4 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_d32e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1878_c7_7300_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_d32e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1873_c7_d32e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1873_c7_d32e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1878_c7_7300_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1873_c7_d32e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_d32e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_d32e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1878_c7_7300_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_d32e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_d32e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_d32e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1878_c7_7300_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_d32e_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1873_c7_d32e_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1873_c7_d32e_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1878_c7_7300_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1873_c7_d32e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1873_c7_d32e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1873_c7_d32e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1878_c7_7300_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1873_c7_d32e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_d32e_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_d32e_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1878_c7_7300_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_d32e_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1875_c3_8191_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1875_c3_8191_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1878_c11_9c71_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1878_c11_9c71_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1878_c11_9c71_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1878_c7_7300_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1878_c7_7300_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1881_c7_695d_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1878_c7_7300_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1878_c7_7300_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1878_c7_7300_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1881_c7_695d_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1878_c7_7300_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1878_c7_7300_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1879_c3_0b09 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1878_c7_7300_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1881_c7_695d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1878_c7_7300_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1878_c7_7300_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1878_c7_7300_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1881_c7_695d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1878_c7_7300_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1878_c7_7300_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1878_c7_7300_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1881_c7_695d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1878_c7_7300_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1878_c7_7300_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1878_c7_7300_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1881_c7_695d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1878_c7_7300_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1878_c7_7300_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1878_c7_7300_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1881_c7_695d_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1878_c7_7300_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1878_c7_7300_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1878_c7_7300_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1881_c7_695d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1878_c7_7300_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1878_c7_7300_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1878_c7_7300_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1881_c7_695d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1878_c7_7300_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1881_c11_f09d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1881_c11_f09d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1881_c11_f09d_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1881_c7_695d_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1881_c7_695d_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1881_c7_695d_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1881_c7_695d_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1881_c7_695d_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1887_c7_e14f_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1881_c7_695d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1881_c7_695d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1881_c7_695d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1887_c7_e14f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1881_c7_695d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1881_c7_695d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1881_c7_695d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1887_c7_e14f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1881_c7_695d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1881_c7_695d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1881_c7_695d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1887_c7_e14f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1881_c7_695d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1881_c7_695d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1881_c7_695d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1887_c7_e14f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1881_c7_695d_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1881_c7_695d_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1881_c7_695d_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1887_c7_e14f_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1881_c7_695d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1881_c7_695d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1881_c7_695d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1887_c7_e14f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1881_c7_695d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1881_c7_695d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1881_c7_695d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1881_c7_695d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1882_c3_f6dc_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1882_c3_f6dc_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1882_c3_f6dc_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1884_c30_6d90_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1884_c30_6d90_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1884_c30_6d90_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1884_c30_6d90_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1887_c11_94b8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1887_c11_94b8_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1887_c11_94b8_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1887_c7_e14f_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1887_c7_e14f_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1891_c7_1c9b_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1887_c7_e14f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1887_c7_e14f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1887_c7_e14f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1891_c7_1c9b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1887_c7_e14f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1887_c7_e14f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1887_c7_e14f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1887_c7_e14f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1887_c7_e14f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1887_c7_e14f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1891_c7_1c9b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1887_c7_e14f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1887_c7_e14f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1887_c7_e14f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1891_c7_1c9b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1887_c7_e14f_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1887_c7_e14f_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1887_c7_e14f_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1891_c7_1c9b_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1887_c7_e14f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1887_c7_e14f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1887_c7_e14f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1891_c7_1c9b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1887_c7_e14f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1891_c11_458e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1891_c11_458e_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1891_c11_458e_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1891_c7_1c9b_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1891_c7_1c9b_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1896_c7_a5e3_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1891_c7_1c9b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1891_c7_1c9b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1891_c7_1c9b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1896_c7_a5e3_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1891_c7_1c9b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1891_c7_1c9b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1891_c7_1c9b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1896_c7_a5e3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1891_c7_1c9b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1891_c7_1c9b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1891_c7_1c9b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1896_c7_a5e3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1891_c7_1c9b_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1891_c7_1c9b_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l1894_c3_2d90 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1891_c7_1c9b_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1896_c7_a5e3_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1891_c7_1c9b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1891_c7_1c9b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1891_c7_1c9b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1896_c7_a5e3_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1891_c7_1c9b_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1893_c3_0921_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1893_c3_0921_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1894_c22_0870_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1894_c22_0870_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1894_c22_0870_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1896_c11_dad9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1896_c11_dad9_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1896_c11_dad9_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1896_c7_a5e3_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1896_c7_a5e3_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1899_c7_6ce2_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1896_c7_a5e3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1896_c7_a5e3_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1896_c7_a5e3_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1899_c7_6ce2_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1896_c7_a5e3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1896_c7_a5e3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1896_c7_a5e3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1899_c7_6ce2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1896_c7_a5e3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1896_c7_a5e3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1896_c7_a5e3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1899_c7_6ce2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1896_c7_a5e3_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1896_c7_a5e3_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l1897_c3_2525 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1896_c7_a5e3_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1896_c7_a5e3_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1896_c7_a5e3_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1896_c7_a5e3_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1899_c7_6ce2_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1896_c7_a5e3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1897_c22_e58e_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1897_c22_e58e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1897_c22_e58e_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1899_c11_4ac3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1899_c11_4ac3_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1899_c11_4ac3_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1899_c7_6ce2_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1899_c7_6ce2_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1899_c7_6ce2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1899_c7_6ce2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1899_c7_6ce2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1905_c7_4f6a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1899_c7_6ce2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1899_c7_6ce2_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1902_c3_2968 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1899_c7_6ce2_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1905_c7_4f6a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1899_c7_6ce2_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1899_c7_6ce2_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1899_c7_6ce2_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1905_c7_4f6a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1899_c7_6ce2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1899_c7_6ce2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1899_c7_6ce2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1905_c7_4f6a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1899_c7_6ce2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1900_c3_46a9_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1900_c3_46a9_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1900_c3_46a9_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1903_c21_723b_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1905_c11_b694_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1905_c11_b694_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1905_c11_b694_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1905_c7_4f6a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1905_c7_4f6a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1909_c7_a7e9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1905_c7_4f6a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1905_c7_4f6a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1906_c3_c2aa : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1905_c7_4f6a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1905_c7_4f6a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1905_c7_4f6a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1905_c7_4f6a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1905_c7_4f6a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1905_c7_4f6a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1905_c7_4f6a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1909_c7_a7e9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1905_c7_4f6a_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1907_c31_1649_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1907_c31_1649_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1907_c21_a807_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1909_c11_bdb2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1909_c11_bdb2_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1909_c11_bdb2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1909_c7_a7e9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1909_c7_a7e9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1909_c7_a7e9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1909_c7_a7e9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1909_c7_a7e9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1909_c7_a7e9_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1887_l1878_l1873_l1870_l1865_DUPLICATE_c00d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1887_l1881_l1909_l1878_l1905_l1873_l1870_l1896_l1865_l1891_DUPLICATE_2c54_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1878_l1873_l1870_l1896_l1865_DUPLICATE_8c02_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1887_l1881_l1878_l1905_l1873_l1870_l1896_l1865_l1891_DUPLICATE_163c_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1881_l1878_l1873_l1870_l1865_DUPLICATE_031a_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1887_l1881_l1909_l1878_l1905_l1873_l1899_l1870_l1896_l1891_DUPLICATE_efb6_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1874_l1882_DUPLICATE_e374_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1887_l1881_l1905_l1896_l1891_DUPLICATE_8bb0_return_output : unsigned(3 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1892_l1900_DUPLICATE_2901_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_284d_uxn_opcodes_h_l1914_l1861_DUPLICATE_8b63_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1887_c11_94b8_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1902_c3_2968 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1899_c7_6ce2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1902_c3_2968;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c6_9956_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1881_c11_f09d_right := to_unsigned(4, 3);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1897_c22_e58e_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1909_c7_a7e9_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1909_c11_bdb2_right := to_unsigned(10, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1891_c11_458e_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1879_c3_0b09 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1878_c7_7300_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1879_c3_0b09;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1871_c3_580c := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_089f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1871_c3_580c;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1887_c7_e14f_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1870_c11_bb1d_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1878_c11_9c71_right := to_unsigned(3, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1865_c2_fde1_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1876_c3_b2f4 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_d32e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1876_c3_b2f4;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1909_c7_a7e9_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1899_c11_4ac3_right := to_unsigned(8, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1905_c11_b694_right := to_unsigned(9, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1896_c11_dad9_right := to_unsigned(7, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l1884_c30_6d90_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1894_c22_0870_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1906_c3_c2aa := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1905_c7_4f6a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1906_c3_c2aa;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1867_c3_902e := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c2_fde1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1867_c3_902e;
     VAR_sp_relative_shift_uxn_opcodes_h_l1884_c30_6d90_y := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1899_c7_6ce2_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1865_c1_ffbe_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_dcdf_right := to_unsigned(2, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1881_c7_695d_iftrue := to_unsigned(1, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1865_c1_ffbe_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l1884_c30_6d90_ins := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c6_9956_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1870_c11_bb1d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_dcdf_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1878_c11_9c71_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1881_c11_f09d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1887_c11_94b8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1891_c11_458e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1896_c11_dad9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1899_c11_4ac3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1905_c11_b694_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1909_c11_bdb2_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1882_c3_f6dc_left := t16;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1894_c22_0870_left := t16;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1897_c22_e58e_left := t16;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1887_c7_e14f_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1865_c2_fde1_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1870_c7_089f_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1878_c7_7300_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1881_c7_695d_iffalse := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1900_c3_46a9_left := tmp16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1907_c31_1649_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1865_c2_fde1_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1870_c7_089f_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1873_c7_d32e_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1878_c7_7300_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1881_c7_695d_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1887_c7_e14f_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1896_c7_a5e3_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1899_c7_6ce2_iffalse := tmp16;
     -- CONST_SR_8[uxn_opcodes_h_l1907_c31_1649] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1907_c31_1649_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1907_c31_1649_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1907_c31_1649_return_output := CONST_SR_8_uxn_opcodes_h_l1907_c31_1649_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1896_c11_dad9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1896_c11_dad9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1896_c11_dad9_left;
     BIN_OP_EQ_uxn_opcodes_h_l1896_c11_dad9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1896_c11_dad9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1896_c11_dad9_return_output := BIN_OP_EQ_uxn_opcodes_h_l1896_c11_dad9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1878_c11_9c71] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1878_c11_9c71_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1878_c11_9c71_left;
     BIN_OP_EQ_uxn_opcodes_h_l1878_c11_9c71_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1878_c11_9c71_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1878_c11_9c71_return_output := BIN_OP_EQ_uxn_opcodes_h_l1878_c11_9c71_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1897_c22_e58e] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1897_c22_e58e_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1897_c22_e58e_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1897_c22_e58e_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1897_c22_e58e_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1897_c22_e58e_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1897_c22_e58e_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1887_l1881_l1878_l1905_l1873_l1870_l1896_l1865_l1891_DUPLICATE_163c LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1887_l1881_l1878_l1905_l1873_l1870_l1896_l1865_l1891_DUPLICATE_163c_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1887_c11_94b8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1887_c11_94b8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1887_c11_94b8_left;
     BIN_OP_EQ_uxn_opcodes_h_l1887_c11_94b8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1887_c11_94b8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1887_c11_94b8_return_output := BIN_OP_EQ_uxn_opcodes_h_l1887_c11_94b8_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1878_l1873_l1870_l1896_l1865_DUPLICATE_8c02 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1878_l1873_l1870_l1896_l1865_DUPLICATE_8c02_return_output := result.u16_value;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1892_l1900_DUPLICATE_2901 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1892_l1900_DUPLICATE_2901_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1909_c11_bdb2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1909_c11_bdb2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1909_c11_bdb2_left;
     BIN_OP_EQ_uxn_opcodes_h_l1909_c11_bdb2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1909_c11_bdb2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1909_c11_bdb2_return_output := BIN_OP_EQ_uxn_opcodes_h_l1909_c11_bdb2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1899_c11_4ac3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1899_c11_4ac3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1899_c11_4ac3_left;
     BIN_OP_EQ_uxn_opcodes_h_l1899_c11_4ac3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1899_c11_4ac3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1899_c11_4ac3_return_output := BIN_OP_EQ_uxn_opcodes_h_l1899_c11_4ac3_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l1884_c30_6d90] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1884_c30_6d90_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1884_c30_6d90_ins;
     sp_relative_shift_uxn_opcodes_h_l1884_c30_6d90_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1884_c30_6d90_x;
     sp_relative_shift_uxn_opcodes_h_l1884_c30_6d90_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1884_c30_6d90_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1884_c30_6d90_return_output := sp_relative_shift_uxn_opcodes_h_l1884_c30_6d90_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1887_l1878_l1873_l1870_l1865_DUPLICATE_c00d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1887_l1878_l1873_l1870_l1865_DUPLICATE_c00d_return_output := result.is_sp_shift;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1894_c22_0870] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1894_c22_0870_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1894_c22_0870_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1894_c22_0870_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1894_c22_0870_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1894_c22_0870_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1894_c22_0870_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1891_c11_458e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1891_c11_458e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1891_c11_458e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1891_c11_458e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1891_c11_458e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1891_c11_458e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1891_c11_458e_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1874_l1882_DUPLICATE_e374 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1874_l1882_DUPLICATE_e374_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1887_l1881_l1909_l1878_l1905_l1873_l1899_l1870_l1896_l1891_DUPLICATE_efb6 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1887_l1881_l1909_l1878_l1905_l1873_l1899_l1870_l1896_l1891_DUPLICATE_efb6_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1905_c11_b694] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1905_c11_b694_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1905_c11_b694_left;
     BIN_OP_EQ_uxn_opcodes_h_l1905_c11_b694_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1905_c11_b694_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1905_c11_b694_return_output := BIN_OP_EQ_uxn_opcodes_h_l1905_c11_b694_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1865_c6_9956] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1865_c6_9956_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c6_9956_left;
     BIN_OP_EQ_uxn_opcodes_h_l1865_c6_9956_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c6_9956_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c6_9956_return_output := BIN_OP_EQ_uxn_opcodes_h_l1865_c6_9956_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1873_c11_dcdf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1873_c11_dcdf_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_dcdf_left;
     BIN_OP_EQ_uxn_opcodes_h_l1873_c11_dcdf_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_dcdf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_dcdf_return_output := BIN_OP_EQ_uxn_opcodes_h_l1873_c11_dcdf_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1881_c11_f09d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1881_c11_f09d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1881_c11_f09d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1881_c11_f09d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1881_c11_f09d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1881_c11_f09d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1881_c11_f09d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1870_c11_bb1d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1870_c11_bb1d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1870_c11_bb1d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1870_c11_bb1d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1870_c11_bb1d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1870_c11_bb1d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1870_c11_bb1d_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1887_l1881_l1905_l1896_l1891_DUPLICATE_8bb0 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1887_l1881_l1905_l1896_l1891_DUPLICATE_8bb0_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1887_l1881_l1909_l1878_l1905_l1873_l1870_l1896_l1865_l1891_DUPLICATE_2c54 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1887_l1881_l1909_l1878_l1905_l1873_l1870_l1896_l1865_l1891_DUPLICATE_2c54_return_output := result.is_stack_write;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1881_l1878_l1873_l1870_l1865_DUPLICATE_031a LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1881_l1878_l1873_l1870_l1865_DUPLICATE_031a_return_output := result.sp_relative_shift;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1865_c1_ffbe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c6_9956_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1865_c2_fde1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c6_9956_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1865_c2_fde1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c6_9956_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1865_c2_fde1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c6_9956_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c2_fde1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c6_9956_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c2_fde1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c6_9956_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1865_c2_fde1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c6_9956_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1865_c2_fde1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c6_9956_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1865_c2_fde1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c6_9956_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1865_c2_fde1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c6_9956_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_089f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1870_c11_bb1d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1870_c7_089f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1870_c11_bb1d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_089f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1870_c11_bb1d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_089f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1870_c11_bb1d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_089f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1870_c11_bb1d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1870_c7_089f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1870_c11_bb1d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1870_c7_089f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1870_c11_bb1d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1870_c7_089f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1870_c11_bb1d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1870_c7_089f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1870_c11_bb1d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_d32e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_dcdf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1873_c7_d32e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_dcdf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_d32e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_dcdf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_d32e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_dcdf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_d32e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_dcdf_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1873_c7_d32e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_dcdf_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1873_c7_d32e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_dcdf_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1873_c7_d32e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_dcdf_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1873_c7_d32e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_dcdf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1878_c7_7300_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1878_c11_9c71_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1878_c7_7300_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1878_c11_9c71_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1878_c7_7300_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1878_c11_9c71_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1878_c7_7300_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1878_c11_9c71_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1878_c7_7300_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1878_c11_9c71_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1878_c7_7300_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1878_c11_9c71_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1878_c7_7300_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1878_c11_9c71_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1878_c7_7300_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1878_c11_9c71_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1878_c7_7300_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1878_c11_9c71_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1881_c7_695d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1881_c11_f09d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1881_c7_695d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1881_c11_f09d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1881_c7_695d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1881_c11_f09d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1881_c7_695d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1881_c11_f09d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1881_c7_695d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1881_c11_f09d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1881_c7_695d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1881_c11_f09d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1881_c7_695d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1881_c11_f09d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1881_c7_695d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1881_c11_f09d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1881_c7_695d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1881_c11_f09d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1887_c7_e14f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1887_c11_94b8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1887_c7_e14f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1887_c11_94b8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1887_c7_e14f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1887_c11_94b8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1887_c7_e14f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1887_c11_94b8_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1887_c7_e14f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1887_c11_94b8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1887_c7_e14f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1887_c11_94b8_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1887_c7_e14f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1887_c11_94b8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1891_c7_1c9b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1891_c11_458e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1891_c7_1c9b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1891_c11_458e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1891_c7_1c9b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1891_c11_458e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1891_c7_1c9b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1891_c11_458e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1891_c7_1c9b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1891_c11_458e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1891_c7_1c9b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1891_c11_458e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1896_c7_a5e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1896_c11_dad9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1896_c7_a5e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1896_c11_dad9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1896_c7_a5e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1896_c11_dad9_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1896_c7_a5e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1896_c11_dad9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1896_c7_a5e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1896_c11_dad9_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1896_c7_a5e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1896_c11_dad9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1899_c7_6ce2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1899_c11_4ac3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1899_c7_6ce2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1899_c11_4ac3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1899_c7_6ce2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1899_c11_4ac3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1899_c7_6ce2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1899_c11_4ac3_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1899_c7_6ce2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1899_c11_4ac3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1905_c7_4f6a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1905_c11_b694_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1905_c7_4f6a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1905_c11_b694_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1905_c7_4f6a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1905_c11_b694_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1905_c7_4f6a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1905_c11_b694_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1909_c7_a7e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1909_c11_bdb2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1909_c7_a7e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1909_c11_bdb2_return_output;
     VAR_result_u16_value_uxn_opcodes_h_l1894_c3_2d90 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1894_c22_0870_return_output, 16);
     VAR_result_u16_value_uxn_opcodes_h_l1897_c3_2525 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1897_c22_e58e_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l1882_c3_f6dc_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1874_l1882_DUPLICATE_e374_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1875_c3_8191_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1874_l1882_DUPLICATE_e374_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1900_c3_46a9_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1892_l1900_DUPLICATE_2901_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1893_c3_0921_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1892_l1900_DUPLICATE_2901_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c2_fde1_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1881_l1878_l1873_l1870_l1865_DUPLICATE_031a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_089f_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1881_l1878_l1873_l1870_l1865_DUPLICATE_031a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_d32e_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1881_l1878_l1873_l1870_l1865_DUPLICATE_031a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1878_c7_7300_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1881_l1878_l1873_l1870_l1865_DUPLICATE_031a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1881_c7_695d_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1881_l1878_l1873_l1870_l1865_DUPLICATE_031a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1865_c2_fde1_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1878_l1873_l1870_l1896_l1865_DUPLICATE_8c02_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1870_c7_089f_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1878_l1873_l1870_l1896_l1865_DUPLICATE_8c02_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1873_c7_d32e_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1878_l1873_l1870_l1896_l1865_DUPLICATE_8c02_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1878_c7_7300_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1878_l1873_l1870_l1896_l1865_DUPLICATE_8c02_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1896_c7_a5e3_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1878_l1873_l1870_l1896_l1865_DUPLICATE_8c02_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_089f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1887_l1881_l1909_l1878_l1905_l1873_l1899_l1870_l1896_l1891_DUPLICATE_efb6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_d32e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1887_l1881_l1909_l1878_l1905_l1873_l1899_l1870_l1896_l1891_DUPLICATE_efb6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1878_c7_7300_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1887_l1881_l1909_l1878_l1905_l1873_l1899_l1870_l1896_l1891_DUPLICATE_efb6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1881_c7_695d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1887_l1881_l1909_l1878_l1905_l1873_l1899_l1870_l1896_l1891_DUPLICATE_efb6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1887_c7_e14f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1887_l1881_l1909_l1878_l1905_l1873_l1899_l1870_l1896_l1891_DUPLICATE_efb6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1891_c7_1c9b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1887_l1881_l1909_l1878_l1905_l1873_l1899_l1870_l1896_l1891_DUPLICATE_efb6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1896_c7_a5e3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1887_l1881_l1909_l1878_l1905_l1873_l1899_l1870_l1896_l1891_DUPLICATE_efb6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1899_c7_6ce2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1887_l1881_l1909_l1878_l1905_l1873_l1899_l1870_l1896_l1891_DUPLICATE_efb6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1905_c7_4f6a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1887_l1881_l1909_l1878_l1905_l1873_l1899_l1870_l1896_l1891_DUPLICATE_efb6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1909_c7_a7e9_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1887_l1881_l1909_l1878_l1905_l1873_l1899_l1870_l1896_l1891_DUPLICATE_efb6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1865_c2_fde1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1887_l1878_l1873_l1870_l1865_DUPLICATE_c00d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1870_c7_089f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1887_l1878_l1873_l1870_l1865_DUPLICATE_c00d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1873_c7_d32e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1887_l1878_l1873_l1870_l1865_DUPLICATE_c00d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1878_c7_7300_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1887_l1878_l1873_l1870_l1865_DUPLICATE_c00d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1887_c7_e14f_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1887_l1878_l1873_l1870_l1865_DUPLICATE_c00d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1865_c2_fde1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1887_l1881_l1909_l1878_l1905_l1873_l1870_l1896_l1865_l1891_DUPLICATE_2c54_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_089f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1887_l1881_l1909_l1878_l1905_l1873_l1870_l1896_l1865_l1891_DUPLICATE_2c54_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_d32e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1887_l1881_l1909_l1878_l1905_l1873_l1870_l1896_l1865_l1891_DUPLICATE_2c54_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1878_c7_7300_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1887_l1881_l1909_l1878_l1905_l1873_l1870_l1896_l1865_l1891_DUPLICATE_2c54_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1881_c7_695d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1887_l1881_l1909_l1878_l1905_l1873_l1870_l1896_l1865_l1891_DUPLICATE_2c54_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1887_c7_e14f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1887_l1881_l1909_l1878_l1905_l1873_l1870_l1896_l1865_l1891_DUPLICATE_2c54_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1891_c7_1c9b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1887_l1881_l1909_l1878_l1905_l1873_l1870_l1896_l1865_l1891_DUPLICATE_2c54_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1896_c7_a5e3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1887_l1881_l1909_l1878_l1905_l1873_l1870_l1896_l1865_l1891_DUPLICATE_2c54_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1905_c7_4f6a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1887_l1881_l1909_l1878_l1905_l1873_l1870_l1896_l1865_l1891_DUPLICATE_2c54_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1909_c7_a7e9_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1887_l1881_l1909_l1878_l1905_l1873_l1870_l1896_l1865_l1891_DUPLICATE_2c54_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1881_c7_695d_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1887_l1881_l1905_l1896_l1891_DUPLICATE_8bb0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1887_c7_e14f_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1887_l1881_l1905_l1896_l1891_DUPLICATE_8bb0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1891_c7_1c9b_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1887_l1881_l1905_l1896_l1891_DUPLICATE_8bb0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1896_c7_a5e3_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1887_l1881_l1905_l1896_l1891_DUPLICATE_8bb0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1905_c7_4f6a_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1887_l1881_l1905_l1896_l1891_DUPLICATE_8bb0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1865_c2_fde1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1887_l1881_l1878_l1905_l1873_l1870_l1896_l1865_l1891_DUPLICATE_163c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1870_c7_089f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1887_l1881_l1878_l1905_l1873_l1870_l1896_l1865_l1891_DUPLICATE_163c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1873_c7_d32e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1887_l1881_l1878_l1905_l1873_l1870_l1896_l1865_l1891_DUPLICATE_163c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1878_c7_7300_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1887_l1881_l1878_l1905_l1873_l1870_l1896_l1865_l1891_DUPLICATE_163c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1881_c7_695d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1887_l1881_l1878_l1905_l1873_l1870_l1896_l1865_l1891_DUPLICATE_163c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1887_c7_e14f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1887_l1881_l1878_l1905_l1873_l1870_l1896_l1865_l1891_DUPLICATE_163c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1891_c7_1c9b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1887_l1881_l1878_l1905_l1873_l1870_l1896_l1865_l1891_DUPLICATE_163c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1896_c7_a5e3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1887_l1881_l1878_l1905_l1873_l1870_l1896_l1865_l1891_DUPLICATE_163c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1905_c7_4f6a_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1887_l1881_l1878_l1905_l1873_l1870_l1896_l1865_l1891_DUPLICATE_163c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1881_c7_695d_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1884_c30_6d90_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1891_c7_1c9b_iftrue := VAR_result_u16_value_uxn_opcodes_h_l1894_c3_2d90;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1896_c7_a5e3_iftrue := VAR_result_u16_value_uxn_opcodes_h_l1897_c3_2525;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1881_c7_695d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1881_c7_695d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1881_c7_695d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1881_c7_695d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1881_c7_695d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1881_c7_695d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1881_c7_695d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1881_c7_695d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1881_c7_695d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1887_c7_e14f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1887_c7_e14f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1887_c7_e14f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1887_c7_e14f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1887_c7_e14f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1887_c7_e14f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1887_c7_e14f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1887_c7_e14f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1887_c7_e14f_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1907_c21_a807] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1907_c21_a807_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1907_c31_1649_return_output);

     -- BIN_OP_OR[uxn_opcodes_h_l1900_c3_46a9] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1900_c3_46a9_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1900_c3_46a9_left;
     BIN_OP_OR_uxn_opcodes_h_l1900_c3_46a9_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1900_c3_46a9_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1900_c3_46a9_return_output := BIN_OP_OR_uxn_opcodes_h_l1900_c3_46a9_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1896_c7_a5e3] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1896_c7_a5e3_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1896_c7_a5e3_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1896_c7_a5e3_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1896_c7_a5e3_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1896_c7_a5e3_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1896_c7_a5e3_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1896_c7_a5e3_return_output := result_u16_value_MUX_uxn_opcodes_h_l1896_c7_a5e3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1909_c7_a7e9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1909_c7_a7e9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1909_c7_a7e9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1909_c7_a7e9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1909_c7_a7e9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1909_c7_a7e9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1909_c7_a7e9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1909_c7_a7e9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1909_c7_a7e9_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1882_c3_f6dc] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1882_c3_f6dc_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1882_c3_f6dc_left;
     BIN_OP_OR_uxn_opcodes_h_l1882_c3_f6dc_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1882_c3_f6dc_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1882_c3_f6dc_return_output := BIN_OP_OR_uxn_opcodes_h_l1882_c3_f6dc_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l1893_c3_0921] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1893_c3_0921_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1893_c3_0921_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1893_c3_0921_return_output := CONST_SL_8_uxn_opcodes_h_l1893_c3_0921_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1905_c7_4f6a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1905_c7_4f6a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1905_c7_4f6a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1905_c7_4f6a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1905_c7_4f6a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1905_c7_4f6a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1905_c7_4f6a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1905_c7_4f6a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1905_c7_4f6a_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1865_c1_ffbe] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1865_c1_ffbe_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1865_c1_ffbe_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1865_c1_ffbe_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1865_c1_ffbe_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1865_c1_ffbe_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1865_c1_ffbe_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1865_c1_ffbe_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1865_c1_ffbe_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l1875_c3_8191] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1875_c3_8191_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1875_c3_8191_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1875_c3_8191_return_output := CONST_SL_8_uxn_opcodes_h_l1875_c3_8191_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1909_c7_a7e9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1909_c7_a7e9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1909_c7_a7e9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1909_c7_a7e9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1909_c7_a7e9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1909_c7_a7e9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1909_c7_a7e9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1909_c7_a7e9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1909_c7_a7e9_return_output;

     -- Submodule level 2
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1881_c7_695d_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1882_c3_f6dc_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1881_c7_695d_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1882_c3_f6dc_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1899_c7_6ce2_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1900_c3_46a9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1905_c7_4f6a_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1907_c21_a807_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1873_c7_d32e_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1875_c3_8191_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1891_c7_1c9b_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1893_c3_0921_return_output;
     VAR_printf_uxn_opcodes_h_l1866_c3_db7a_uxn_opcodes_h_l1866_c3_db7a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1865_c1_ffbe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1905_c7_4f6a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1909_c7_a7e9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1881_c7_695d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1887_c7_e14f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1905_c7_4f6a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1909_c7_a7e9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1878_c7_7300_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1881_c7_695d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1899_c7_6ce2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1905_c7_4f6a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1891_c7_1c9b_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1896_c7_a5e3_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l1891_c7_1c9b] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1891_c7_1c9b_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1891_c7_1c9b_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1891_c7_1c9b_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1891_c7_1c9b_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1891_c7_1c9b_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1891_c7_1c9b_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1891_c7_1c9b_return_output := result_u16_value_MUX_uxn_opcodes_h_l1891_c7_1c9b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1905_c7_4f6a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1905_c7_4f6a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1905_c7_4f6a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1905_c7_4f6a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1905_c7_4f6a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1905_c7_4f6a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1905_c7_4f6a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1905_c7_4f6a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1905_c7_4f6a_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1905_c7_4f6a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1905_c7_4f6a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1905_c7_4f6a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1905_c7_4f6a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1905_c7_4f6a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1905_c7_4f6a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1905_c7_4f6a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1905_c7_4f6a_return_output := result_u8_value_MUX_uxn_opcodes_h_l1905_c7_4f6a_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1903_c21_723b] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1903_c21_723b_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_OR_uxn_opcodes_h_l1900_c3_46a9_return_output);

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1899_c7_6ce2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1899_c7_6ce2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1899_c7_6ce2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1899_c7_6ce2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1899_c7_6ce2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1899_c7_6ce2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1899_c7_6ce2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1899_c7_6ce2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1899_c7_6ce2_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1899_c7_6ce2] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1899_c7_6ce2_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1899_c7_6ce2_cond;
     tmp16_MUX_uxn_opcodes_h_l1899_c7_6ce2_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1899_c7_6ce2_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1899_c7_6ce2_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1899_c7_6ce2_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1899_c7_6ce2_return_output := tmp16_MUX_uxn_opcodes_h_l1899_c7_6ce2_return_output;

     -- t16_MUX[uxn_opcodes_h_l1881_c7_695d] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1881_c7_695d_cond <= VAR_t16_MUX_uxn_opcodes_h_l1881_c7_695d_cond;
     t16_MUX_uxn_opcodes_h_l1881_c7_695d_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1881_c7_695d_iftrue;
     t16_MUX_uxn_opcodes_h_l1881_c7_695d_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1881_c7_695d_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1881_c7_695d_return_output := t16_MUX_uxn_opcodes_h_l1881_c7_695d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1905_c7_4f6a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1905_c7_4f6a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1905_c7_4f6a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1905_c7_4f6a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1905_c7_4f6a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1905_c7_4f6a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1905_c7_4f6a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1905_c7_4f6a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1905_c7_4f6a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1878_c7_7300] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1878_c7_7300_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1878_c7_7300_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1878_c7_7300_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1878_c7_7300_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1878_c7_7300_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1878_c7_7300_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1878_c7_7300_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1878_c7_7300_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1881_c7_695d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1881_c7_695d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1881_c7_695d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1881_c7_695d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1881_c7_695d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1881_c7_695d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1881_c7_695d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1881_c7_695d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1881_c7_695d_return_output;

     -- printf_uxn_opcodes_h_l1866_c3_db7a[uxn_opcodes_h_l1866_c3_db7a] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1866_c3_db7a_uxn_opcodes_h_l1866_c3_db7a_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1866_c3_db7a_uxn_opcodes_h_l1866_c3_db7a_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- Submodule level 3
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1899_c7_6ce2_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1903_c21_723b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1899_c7_6ce2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1905_c7_4f6a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1878_c7_7300_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1881_c7_695d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1899_c7_6ce2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1905_c7_4f6a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_d32e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1878_c7_7300_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1896_c7_a5e3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1899_c7_6ce2_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1887_c7_e14f_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1891_c7_1c9b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1899_c7_6ce2_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1905_c7_4f6a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1878_c7_7300_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1881_c7_695d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1896_c7_a5e3_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1899_c7_6ce2_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1899_c7_6ce2] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1899_c7_6ce2_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1899_c7_6ce2_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1899_c7_6ce2_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1899_c7_6ce2_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1899_c7_6ce2_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1899_c7_6ce2_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1899_c7_6ce2_return_output := result_u8_value_MUX_uxn_opcodes_h_l1899_c7_6ce2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1899_c7_6ce2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1899_c7_6ce2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1899_c7_6ce2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1899_c7_6ce2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1899_c7_6ce2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1899_c7_6ce2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1899_c7_6ce2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1899_c7_6ce2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1899_c7_6ce2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1896_c7_a5e3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1896_c7_a5e3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1896_c7_a5e3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1896_c7_a5e3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1896_c7_a5e3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1896_c7_a5e3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1896_c7_a5e3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1896_c7_a5e3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1896_c7_a5e3_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1896_c7_a5e3] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1896_c7_a5e3_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1896_c7_a5e3_cond;
     tmp16_MUX_uxn_opcodes_h_l1896_c7_a5e3_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1896_c7_a5e3_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1896_c7_a5e3_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1896_c7_a5e3_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1896_c7_a5e3_return_output := tmp16_MUX_uxn_opcodes_h_l1896_c7_a5e3_return_output;

     -- t16_MUX[uxn_opcodes_h_l1878_c7_7300] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1878_c7_7300_cond <= VAR_t16_MUX_uxn_opcodes_h_l1878_c7_7300_cond;
     t16_MUX_uxn_opcodes_h_l1878_c7_7300_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1878_c7_7300_iftrue;
     t16_MUX_uxn_opcodes_h_l1878_c7_7300_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1878_c7_7300_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1878_c7_7300_return_output := t16_MUX_uxn_opcodes_h_l1878_c7_7300_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1878_c7_7300] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1878_c7_7300_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1878_c7_7300_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1878_c7_7300_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1878_c7_7300_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1878_c7_7300_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1878_c7_7300_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1878_c7_7300_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1878_c7_7300_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1873_c7_d32e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_d32e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_d32e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_d32e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_d32e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_d32e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_d32e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_d32e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_d32e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1899_c7_6ce2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1899_c7_6ce2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1899_c7_6ce2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1899_c7_6ce2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1899_c7_6ce2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1899_c7_6ce2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1899_c7_6ce2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1899_c7_6ce2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1899_c7_6ce2_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1887_c7_e14f] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1887_c7_e14f_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1887_c7_e14f_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1887_c7_e14f_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1887_c7_e14f_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1887_c7_e14f_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1887_c7_e14f_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1887_c7_e14f_return_output := result_u16_value_MUX_uxn_opcodes_h_l1887_c7_e14f_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1896_c7_a5e3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1899_c7_6ce2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1873_c7_d32e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1878_c7_7300_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1896_c7_a5e3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1899_c7_6ce2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_089f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_d32e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1891_c7_1c9b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1896_c7_a5e3_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1881_c7_695d_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1887_c7_e14f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1896_c7_a5e3_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1899_c7_6ce2_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1873_c7_d32e_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1878_c7_7300_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1891_c7_1c9b_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1896_c7_a5e3_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1896_c7_a5e3] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1896_c7_a5e3_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1896_c7_a5e3_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1896_c7_a5e3_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1896_c7_a5e3_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1896_c7_a5e3_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1896_c7_a5e3_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1896_c7_a5e3_return_output := result_u8_value_MUX_uxn_opcodes_h_l1896_c7_a5e3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1891_c7_1c9b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1891_c7_1c9b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1891_c7_1c9b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1891_c7_1c9b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1891_c7_1c9b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1891_c7_1c9b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1891_c7_1c9b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1891_c7_1c9b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1891_c7_1c9b_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1881_c7_695d] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1881_c7_695d_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1881_c7_695d_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1881_c7_695d_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1881_c7_695d_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1881_c7_695d_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1881_c7_695d_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1881_c7_695d_return_output := result_u16_value_MUX_uxn_opcodes_h_l1881_c7_695d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1896_c7_a5e3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1896_c7_a5e3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1896_c7_a5e3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1896_c7_a5e3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1896_c7_a5e3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1896_c7_a5e3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1896_c7_a5e3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1896_c7_a5e3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1896_c7_a5e3_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1891_c7_1c9b] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1891_c7_1c9b_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1891_c7_1c9b_cond;
     tmp16_MUX_uxn_opcodes_h_l1891_c7_1c9b_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1891_c7_1c9b_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1891_c7_1c9b_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1891_c7_1c9b_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1891_c7_1c9b_return_output := tmp16_MUX_uxn_opcodes_h_l1891_c7_1c9b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1873_c7_d32e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1873_c7_d32e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1873_c7_d32e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1873_c7_d32e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1873_c7_d32e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1873_c7_d32e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1873_c7_d32e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1873_c7_d32e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1873_c7_d32e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1870_c7_089f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_089f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_089f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_089f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_089f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_089f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_089f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_089f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_089f_return_output;

     -- t16_MUX[uxn_opcodes_h_l1873_c7_d32e] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1873_c7_d32e_cond <= VAR_t16_MUX_uxn_opcodes_h_l1873_c7_d32e_cond;
     t16_MUX_uxn_opcodes_h_l1873_c7_d32e_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1873_c7_d32e_iftrue;
     t16_MUX_uxn_opcodes_h_l1873_c7_d32e_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1873_c7_d32e_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1873_c7_d32e_return_output := t16_MUX_uxn_opcodes_h_l1873_c7_d32e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1896_c7_a5e3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1896_c7_a5e3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1896_c7_a5e3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1896_c7_a5e3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1896_c7_a5e3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1896_c7_a5e3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1896_c7_a5e3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1896_c7_a5e3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1896_c7_a5e3_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1891_c7_1c9b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1896_c7_a5e3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1870_c7_089f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1873_c7_d32e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1891_c7_1c9b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1896_c7_a5e3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c2_fde1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_089f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1887_c7_e14f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1891_c7_1c9b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1878_c7_7300_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1881_c7_695d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1891_c7_1c9b_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1896_c7_a5e3_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1870_c7_089f_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1873_c7_d32e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1887_c7_e14f_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1891_c7_1c9b_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1891_c7_1c9b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1891_c7_1c9b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1891_c7_1c9b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1891_c7_1c9b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1891_c7_1c9b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1891_c7_1c9b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1891_c7_1c9b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1891_c7_1c9b_return_output := result_u8_value_MUX_uxn_opcodes_h_l1891_c7_1c9b_return_output;

     -- t16_MUX[uxn_opcodes_h_l1870_c7_089f] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1870_c7_089f_cond <= VAR_t16_MUX_uxn_opcodes_h_l1870_c7_089f_cond;
     t16_MUX_uxn_opcodes_h_l1870_c7_089f_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1870_c7_089f_iftrue;
     t16_MUX_uxn_opcodes_h_l1870_c7_089f_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1870_c7_089f_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1870_c7_089f_return_output := t16_MUX_uxn_opcodes_h_l1870_c7_089f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1887_c7_e14f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1887_c7_e14f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1887_c7_e14f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1887_c7_e14f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1887_c7_e14f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1887_c7_e14f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1887_c7_e14f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1887_c7_e14f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1887_c7_e14f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1891_c7_1c9b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1891_c7_1c9b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1891_c7_1c9b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1891_c7_1c9b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1891_c7_1c9b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1891_c7_1c9b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1891_c7_1c9b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1891_c7_1c9b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1891_c7_1c9b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1865_c2_fde1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c2_fde1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c2_fde1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c2_fde1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c2_fde1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c2_fde1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c2_fde1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c2_fde1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c2_fde1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1891_c7_1c9b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1891_c7_1c9b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1891_c7_1c9b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1891_c7_1c9b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1891_c7_1c9b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1891_c7_1c9b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1891_c7_1c9b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1891_c7_1c9b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1891_c7_1c9b_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1887_c7_e14f] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1887_c7_e14f_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1887_c7_e14f_cond;
     tmp16_MUX_uxn_opcodes_h_l1887_c7_e14f_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1887_c7_e14f_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1887_c7_e14f_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1887_c7_e14f_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1887_c7_e14f_return_output := tmp16_MUX_uxn_opcodes_h_l1887_c7_e14f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1870_c7_089f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1870_c7_089f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1870_c7_089f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1870_c7_089f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1870_c7_089f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1870_c7_089f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1870_c7_089f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1870_c7_089f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1870_c7_089f_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1878_c7_7300] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1878_c7_7300_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1878_c7_7300_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1878_c7_7300_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1878_c7_7300_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1878_c7_7300_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1878_c7_7300_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1878_c7_7300_return_output := result_u16_value_MUX_uxn_opcodes_h_l1878_c7_7300_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1887_c7_e14f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1891_c7_1c9b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1865_c2_fde1_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1870_c7_089f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1887_c7_e14f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1891_c7_1c9b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1881_c7_695d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1887_c7_e14f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1873_c7_d32e_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1878_c7_7300_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1887_c7_e14f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1891_c7_1c9b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1865_c2_fde1_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1870_c7_089f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1881_c7_695d_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1887_c7_e14f_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1881_c7_695d] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1881_c7_695d_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1881_c7_695d_cond;
     tmp16_MUX_uxn_opcodes_h_l1881_c7_695d_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1881_c7_695d_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1881_c7_695d_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1881_c7_695d_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1881_c7_695d_return_output := tmp16_MUX_uxn_opcodes_h_l1881_c7_695d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1887_c7_e14f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1887_c7_e14f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1887_c7_e14f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1887_c7_e14f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1887_c7_e14f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1887_c7_e14f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1887_c7_e14f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1887_c7_e14f_return_output := result_u8_value_MUX_uxn_opcodes_h_l1887_c7_e14f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1865_c2_fde1] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1865_c2_fde1_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1865_c2_fde1_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1865_c2_fde1_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1865_c2_fde1_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1865_c2_fde1_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1865_c2_fde1_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1865_c2_fde1_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1865_c2_fde1_return_output;

     -- t16_MUX[uxn_opcodes_h_l1865_c2_fde1] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1865_c2_fde1_cond <= VAR_t16_MUX_uxn_opcodes_h_l1865_c2_fde1_cond;
     t16_MUX_uxn_opcodes_h_l1865_c2_fde1_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1865_c2_fde1_iftrue;
     t16_MUX_uxn_opcodes_h_l1865_c2_fde1_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1865_c2_fde1_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1865_c2_fde1_return_output := t16_MUX_uxn_opcodes_h_l1865_c2_fde1_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1873_c7_d32e] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1873_c7_d32e_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1873_c7_d32e_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1873_c7_d32e_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1873_c7_d32e_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1873_c7_d32e_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1873_c7_d32e_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1873_c7_d32e_return_output := result_u16_value_MUX_uxn_opcodes_h_l1873_c7_d32e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1887_c7_e14f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1887_c7_e14f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1887_c7_e14f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1887_c7_e14f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1887_c7_e14f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1887_c7_e14f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1887_c7_e14f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1887_c7_e14f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1887_c7_e14f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1887_c7_e14f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1887_c7_e14f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1887_c7_e14f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1887_c7_e14f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1887_c7_e14f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1887_c7_e14f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1887_c7_e14f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1887_c7_e14f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1887_c7_e14f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1881_c7_695d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1881_c7_695d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1881_c7_695d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1881_c7_695d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1881_c7_695d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1881_c7_695d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1881_c7_695d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1881_c7_695d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1881_c7_695d_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1881_c7_695d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1887_c7_e14f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1881_c7_695d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1887_c7_e14f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1878_c7_7300_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1881_c7_695d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1870_c7_089f_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1873_c7_d32e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1881_c7_695d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1887_c7_e14f_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1865_c2_fde1_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1878_c7_7300_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1881_c7_695d_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1881_c7_695d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1881_c7_695d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1881_c7_695d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1881_c7_695d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1881_c7_695d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1881_c7_695d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1881_c7_695d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1881_c7_695d_return_output := result_u8_value_MUX_uxn_opcodes_h_l1881_c7_695d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1881_c7_695d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1881_c7_695d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1881_c7_695d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1881_c7_695d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1881_c7_695d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1881_c7_695d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1881_c7_695d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1881_c7_695d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1881_c7_695d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1878_c7_7300] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1878_c7_7300_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1878_c7_7300_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1878_c7_7300_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1878_c7_7300_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1878_c7_7300_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1878_c7_7300_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1878_c7_7300_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1878_c7_7300_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1870_c7_089f] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1870_c7_089f_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1870_c7_089f_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1870_c7_089f_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1870_c7_089f_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1870_c7_089f_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1870_c7_089f_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1870_c7_089f_return_output := result_u16_value_MUX_uxn_opcodes_h_l1870_c7_089f_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1878_c7_7300] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1878_c7_7300_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1878_c7_7300_cond;
     tmp16_MUX_uxn_opcodes_h_l1878_c7_7300_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1878_c7_7300_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1878_c7_7300_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1878_c7_7300_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1878_c7_7300_return_output := tmp16_MUX_uxn_opcodes_h_l1878_c7_7300_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1881_c7_695d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1881_c7_695d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1881_c7_695d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1881_c7_695d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1881_c7_695d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1881_c7_695d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1881_c7_695d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1881_c7_695d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1881_c7_695d_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1878_c7_7300_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1881_c7_695d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1878_c7_7300_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1881_c7_695d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_d32e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1878_c7_7300_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1865_c2_fde1_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1870_c7_089f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1878_c7_7300_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1881_c7_695d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1873_c7_d32e_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1878_c7_7300_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1873_c7_d32e] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1873_c7_d32e_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1873_c7_d32e_cond;
     tmp16_MUX_uxn_opcodes_h_l1873_c7_d32e_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1873_c7_d32e_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1873_c7_d32e_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1873_c7_d32e_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1873_c7_d32e_return_output := tmp16_MUX_uxn_opcodes_h_l1873_c7_d32e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1873_c7_d32e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_d32e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_d32e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_d32e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_d32e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_d32e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_d32e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_d32e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_d32e_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1865_c2_fde1] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1865_c2_fde1_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1865_c2_fde1_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1865_c2_fde1_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1865_c2_fde1_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1865_c2_fde1_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1865_c2_fde1_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1865_c2_fde1_return_output := result_u16_value_MUX_uxn_opcodes_h_l1865_c2_fde1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1878_c7_7300] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1878_c7_7300_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1878_c7_7300_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1878_c7_7300_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1878_c7_7300_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1878_c7_7300_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1878_c7_7300_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1878_c7_7300_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1878_c7_7300_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1878_c7_7300] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1878_c7_7300_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1878_c7_7300_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1878_c7_7300_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1878_c7_7300_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1878_c7_7300_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1878_c7_7300_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1878_c7_7300_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1878_c7_7300_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1878_c7_7300] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1878_c7_7300_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1878_c7_7300_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1878_c7_7300_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1878_c7_7300_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1878_c7_7300_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1878_c7_7300_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1878_c7_7300_return_output := result_u8_value_MUX_uxn_opcodes_h_l1878_c7_7300_return_output;

     -- Submodule level 9
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_d32e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1878_c7_7300_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_d32e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1878_c7_7300_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_089f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_d32e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1873_c7_d32e_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1878_c7_7300_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1870_c7_089f_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1873_c7_d32e_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1870_c7_089f] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1870_c7_089f_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1870_c7_089f_cond;
     tmp16_MUX_uxn_opcodes_h_l1870_c7_089f_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1870_c7_089f_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1870_c7_089f_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1870_c7_089f_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1870_c7_089f_return_output := tmp16_MUX_uxn_opcodes_h_l1870_c7_089f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1873_c7_d32e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_d32e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_d32e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_d32e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_d32e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_d32e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_d32e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_d32e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_d32e_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1873_c7_d32e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1873_c7_d32e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1873_c7_d32e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1873_c7_d32e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1873_c7_d32e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1873_c7_d32e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1873_c7_d32e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1873_c7_d32e_return_output := result_u8_value_MUX_uxn_opcodes_h_l1873_c7_d32e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1870_c7_089f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_089f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_089f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_089f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_089f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_089f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_089f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_089f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_089f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1873_c7_d32e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_d32e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_d32e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_d32e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_d32e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_d32e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_d32e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_d32e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_d32e_return_output;

     -- Submodule level 10
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_089f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_d32e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_089f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_d32e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c2_fde1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_089f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1870_c7_089f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1873_c7_d32e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1865_c2_fde1_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1870_c7_089f_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1870_c7_089f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_089f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_089f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_089f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_089f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_089f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_089f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_089f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_089f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1865_c2_fde1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c2_fde1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c2_fde1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c2_fde1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c2_fde1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c2_fde1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c2_fde1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c2_fde1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c2_fde1_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1870_c7_089f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1870_c7_089f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1870_c7_089f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1870_c7_089f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1870_c7_089f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1870_c7_089f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1870_c7_089f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1870_c7_089f_return_output := result_u8_value_MUX_uxn_opcodes_h_l1870_c7_089f_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1865_c2_fde1] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1865_c2_fde1_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1865_c2_fde1_cond;
     tmp16_MUX_uxn_opcodes_h_l1865_c2_fde1_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1865_c2_fde1_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1865_c2_fde1_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1865_c2_fde1_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1865_c2_fde1_return_output := tmp16_MUX_uxn_opcodes_h_l1865_c2_fde1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1870_c7_089f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_089f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_089f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_089f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_089f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_089f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_089f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_089f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_089f_return_output;

     -- Submodule level 11
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1865_c2_fde1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_089f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1865_c2_fde1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_089f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1865_c2_fde1_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1870_c7_089f_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l1865_c2_fde1_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1865_c2_fde1] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1865_c2_fde1_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1865_c2_fde1_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1865_c2_fde1_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1865_c2_fde1_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1865_c2_fde1_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1865_c2_fde1_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1865_c2_fde1_return_output := result_u8_value_MUX_uxn_opcodes_h_l1865_c2_fde1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1865_c2_fde1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1865_c2_fde1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1865_c2_fde1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1865_c2_fde1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1865_c2_fde1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1865_c2_fde1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1865_c2_fde1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1865_c2_fde1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1865_c2_fde1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1865_c2_fde1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1865_c2_fde1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1865_c2_fde1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1865_c2_fde1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1865_c2_fde1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1865_c2_fde1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1865_c2_fde1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1865_c2_fde1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1865_c2_fde1_return_output;

     -- Submodule level 12
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_284d_uxn_opcodes_h_l1914_l1861_DUPLICATE_8b63 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_284d_uxn_opcodes_h_l1914_l1861_DUPLICATE_8b63_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_284d(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c2_fde1_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1865_c2_fde1_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1865_c2_fde1_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1865_c2_fde1_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1865_c2_fde1_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1865_c2_fde1_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c2_fde1_return_output);

     -- Submodule level 13
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_284d_uxn_opcodes_h_l1914_l1861_DUPLICATE_8b63_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_284d_uxn_opcodes_h_l1914_l1861_DUPLICATE_8b63_return_output;
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
