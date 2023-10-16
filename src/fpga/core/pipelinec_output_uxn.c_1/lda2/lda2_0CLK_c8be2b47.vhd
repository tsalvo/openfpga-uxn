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
-- BIN_OP_EQ[uxn_opcodes_h_l1860_c6_8cf6]
signal BIN_OP_EQ_uxn_opcodes_h_l1860_c6_8cf6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1860_c6_8cf6_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1860_c6_8cf6_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1860_c1_1759]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1860_c1_1759_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1860_c1_1759_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1860_c1_1759_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1860_c1_1759_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1860_c2_5500]
signal tmp16_MUX_uxn_opcodes_h_l1860_c2_5500_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1860_c2_5500_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1860_c2_5500_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1860_c2_5500_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1860_c2_5500]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c2_5500_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c2_5500_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c2_5500_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c2_5500_return_output : signed(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1860_c2_5500]
signal result_u16_value_MUX_uxn_opcodes_h_l1860_c2_5500_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1860_c2_5500_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1860_c2_5500_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1860_c2_5500_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1860_c2_5500]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c2_5500_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c2_5500_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c2_5500_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c2_5500_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1860_c2_5500]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1860_c2_5500_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1860_c2_5500_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1860_c2_5500_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1860_c2_5500_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1860_c2_5500]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1860_c2_5500_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1860_c2_5500_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1860_c2_5500_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1860_c2_5500_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1860_c2_5500]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1860_c2_5500_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1860_c2_5500_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1860_c2_5500_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1860_c2_5500_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1860_c2_5500]
signal result_u8_value_MUX_uxn_opcodes_h_l1860_c2_5500_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1860_c2_5500_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1860_c2_5500_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1860_c2_5500_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1860_c2_5500]
signal t16_MUX_uxn_opcodes_h_l1860_c2_5500_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1860_c2_5500_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1860_c2_5500_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1860_c2_5500_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l1861_c3_d9b6[uxn_opcodes_h_l1861_c3_d9b6]
signal printf_uxn_opcodes_h_l1861_c3_d9b6_uxn_opcodes_h_l1861_c3_d9b6_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1865_c11_414d]
signal BIN_OP_EQ_uxn_opcodes_h_l1865_c11_414d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1865_c11_414d_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1865_c11_414d_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1865_c7_4f42]
signal tmp16_MUX_uxn_opcodes_h_l1865_c7_4f42_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1865_c7_4f42_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1865_c7_4f42_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1865_c7_4f42_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1865_c7_4f42]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_4f42_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_4f42_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_4f42_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_4f42_return_output : signed(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1865_c7_4f42]
signal result_u16_value_MUX_uxn_opcodes_h_l1865_c7_4f42_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1865_c7_4f42_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1865_c7_4f42_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1865_c7_4f42_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1865_c7_4f42]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_4f42_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_4f42_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_4f42_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_4f42_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1865_c7_4f42]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1865_c7_4f42_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1865_c7_4f42_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1865_c7_4f42_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1865_c7_4f42_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1865_c7_4f42]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_4f42_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_4f42_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_4f42_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_4f42_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1865_c7_4f42]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_4f42_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_4f42_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_4f42_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_4f42_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1865_c7_4f42]
signal result_u8_value_MUX_uxn_opcodes_h_l1865_c7_4f42_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1865_c7_4f42_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1865_c7_4f42_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1865_c7_4f42_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1865_c7_4f42]
signal t16_MUX_uxn_opcodes_h_l1865_c7_4f42_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1865_c7_4f42_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1865_c7_4f42_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1865_c7_4f42_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1868_c11_530a]
signal BIN_OP_EQ_uxn_opcodes_h_l1868_c11_530a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1868_c11_530a_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1868_c11_530a_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1868_c7_c6e3]
signal tmp16_MUX_uxn_opcodes_h_l1868_c7_c6e3_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1868_c7_c6e3_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1868_c7_c6e3_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1868_c7_c6e3_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1868_c7_c6e3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1868_c7_c6e3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1868_c7_c6e3_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1868_c7_c6e3_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1868_c7_c6e3_return_output : signed(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1868_c7_c6e3]
signal result_u16_value_MUX_uxn_opcodes_h_l1868_c7_c6e3_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1868_c7_c6e3_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1868_c7_c6e3_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1868_c7_c6e3_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1868_c7_c6e3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1868_c7_c6e3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1868_c7_c6e3_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1868_c7_c6e3_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1868_c7_c6e3_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1868_c7_c6e3]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1868_c7_c6e3_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1868_c7_c6e3_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1868_c7_c6e3_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1868_c7_c6e3_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1868_c7_c6e3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1868_c7_c6e3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1868_c7_c6e3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1868_c7_c6e3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1868_c7_c6e3_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1868_c7_c6e3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1868_c7_c6e3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1868_c7_c6e3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1868_c7_c6e3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1868_c7_c6e3_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1868_c7_c6e3]
signal result_u8_value_MUX_uxn_opcodes_h_l1868_c7_c6e3_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1868_c7_c6e3_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1868_c7_c6e3_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1868_c7_c6e3_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1868_c7_c6e3]
signal t16_MUX_uxn_opcodes_h_l1868_c7_c6e3_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1868_c7_c6e3_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1868_c7_c6e3_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1868_c7_c6e3_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1870_c3_7213]
signal CONST_SL_8_uxn_opcodes_h_l1870_c3_7213_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1870_c3_7213_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1873_c11_f790]
signal BIN_OP_EQ_uxn_opcodes_h_l1873_c11_f790_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1873_c11_f790_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1873_c11_f790_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1873_c7_5b1c]
signal tmp16_MUX_uxn_opcodes_h_l1873_c7_5b1c_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1873_c7_5b1c_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1873_c7_5b1c_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1873_c7_5b1c_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1873_c7_5b1c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_5b1c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_5b1c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_5b1c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_5b1c_return_output : signed(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1873_c7_5b1c]
signal result_u16_value_MUX_uxn_opcodes_h_l1873_c7_5b1c_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1873_c7_5b1c_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1873_c7_5b1c_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1873_c7_5b1c_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1873_c7_5b1c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_5b1c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_5b1c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_5b1c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_5b1c_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1873_c7_5b1c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1873_c7_5b1c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1873_c7_5b1c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1873_c7_5b1c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1873_c7_5b1c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1873_c7_5b1c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_5b1c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_5b1c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_5b1c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_5b1c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1873_c7_5b1c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_5b1c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_5b1c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_5b1c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_5b1c_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1873_c7_5b1c]
signal result_u8_value_MUX_uxn_opcodes_h_l1873_c7_5b1c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1873_c7_5b1c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1873_c7_5b1c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1873_c7_5b1c_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1873_c7_5b1c]
signal t16_MUX_uxn_opcodes_h_l1873_c7_5b1c_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1873_c7_5b1c_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1873_c7_5b1c_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1873_c7_5b1c_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1876_c11_b4c3]
signal BIN_OP_EQ_uxn_opcodes_h_l1876_c11_b4c3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1876_c11_b4c3_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1876_c11_b4c3_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1876_c7_e274]
signal tmp16_MUX_uxn_opcodes_h_l1876_c7_e274_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1876_c7_e274_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1876_c7_e274_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1876_c7_e274_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1876_c7_e274]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1876_c7_e274_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1876_c7_e274_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1876_c7_e274_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1876_c7_e274_return_output : signed(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1876_c7_e274]
signal result_u16_value_MUX_uxn_opcodes_h_l1876_c7_e274_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1876_c7_e274_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1876_c7_e274_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1876_c7_e274_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1876_c7_e274]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1876_c7_e274_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1876_c7_e274_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1876_c7_e274_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1876_c7_e274_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1876_c7_e274]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1876_c7_e274_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1876_c7_e274_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1876_c7_e274_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1876_c7_e274_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1876_c7_e274]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1876_c7_e274_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1876_c7_e274_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1876_c7_e274_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1876_c7_e274_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1876_c7_e274]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1876_c7_e274_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1876_c7_e274_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1876_c7_e274_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1876_c7_e274_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1876_c7_e274]
signal result_u8_value_MUX_uxn_opcodes_h_l1876_c7_e274_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1876_c7_e274_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1876_c7_e274_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1876_c7_e274_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1876_c7_e274]
signal t16_MUX_uxn_opcodes_h_l1876_c7_e274_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1876_c7_e274_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1876_c7_e274_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1876_c7_e274_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1877_c3_043f]
signal BIN_OP_OR_uxn_opcodes_h_l1877_c3_043f_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1877_c3_043f_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1877_c3_043f_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1879_c30_fc0a]
signal sp_relative_shift_uxn_opcodes_h_l1879_c30_fc0a_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1879_c30_fc0a_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1879_c30_fc0a_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1879_c30_fc0a_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1882_c11_0c15]
signal BIN_OP_EQ_uxn_opcodes_h_l1882_c11_0c15_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1882_c11_0c15_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1882_c11_0c15_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1882_c7_54e2]
signal tmp16_MUX_uxn_opcodes_h_l1882_c7_54e2_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1882_c7_54e2_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1882_c7_54e2_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1882_c7_54e2_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1882_c7_54e2]
signal result_u16_value_MUX_uxn_opcodes_h_l1882_c7_54e2_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1882_c7_54e2_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1882_c7_54e2_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1882_c7_54e2_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1882_c7_54e2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1882_c7_54e2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1882_c7_54e2_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1882_c7_54e2_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1882_c7_54e2_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1882_c7_54e2]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1882_c7_54e2_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1882_c7_54e2_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1882_c7_54e2_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1882_c7_54e2_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1882_c7_54e2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_54e2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_54e2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_54e2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_54e2_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1882_c7_54e2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1882_c7_54e2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1882_c7_54e2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1882_c7_54e2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1882_c7_54e2_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1882_c7_54e2]
signal result_u8_value_MUX_uxn_opcodes_h_l1882_c7_54e2_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1882_c7_54e2_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1882_c7_54e2_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1882_c7_54e2_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1886_c11_e5fb]
signal BIN_OP_EQ_uxn_opcodes_h_l1886_c11_e5fb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1886_c11_e5fb_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1886_c11_e5fb_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1886_c7_a074]
signal tmp16_MUX_uxn_opcodes_h_l1886_c7_a074_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1886_c7_a074_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1886_c7_a074_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1886_c7_a074_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1886_c7_a074]
signal result_u16_value_MUX_uxn_opcodes_h_l1886_c7_a074_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1886_c7_a074_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1886_c7_a074_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1886_c7_a074_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1886_c7_a074]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1886_c7_a074_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1886_c7_a074_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1886_c7_a074_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1886_c7_a074_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1886_c7_a074]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1886_c7_a074_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1886_c7_a074_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1886_c7_a074_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1886_c7_a074_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1886_c7_a074]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1886_c7_a074_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1886_c7_a074_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1886_c7_a074_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1886_c7_a074_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1886_c7_a074]
signal result_u8_value_MUX_uxn_opcodes_h_l1886_c7_a074_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1886_c7_a074_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1886_c7_a074_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1886_c7_a074_return_output : unsigned(7 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1888_c3_1f36]
signal CONST_SL_8_uxn_opcodes_h_l1888_c3_1f36_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1888_c3_1f36_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1889_c22_8adb]
signal BIN_OP_PLUS_uxn_opcodes_h_l1889_c22_8adb_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1889_c22_8adb_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1889_c22_8adb_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1891_c11_5191]
signal BIN_OP_EQ_uxn_opcodes_h_l1891_c11_5191_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1891_c11_5191_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1891_c11_5191_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1891_c7_376e]
signal tmp16_MUX_uxn_opcodes_h_l1891_c7_376e_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1891_c7_376e_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1891_c7_376e_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1891_c7_376e_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1891_c7_376e]
signal result_u16_value_MUX_uxn_opcodes_h_l1891_c7_376e_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1891_c7_376e_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1891_c7_376e_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1891_c7_376e_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1891_c7_376e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1891_c7_376e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1891_c7_376e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1891_c7_376e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1891_c7_376e_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1891_c7_376e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1891_c7_376e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1891_c7_376e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1891_c7_376e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1891_c7_376e_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1891_c7_376e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1891_c7_376e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1891_c7_376e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1891_c7_376e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1891_c7_376e_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1891_c7_376e]
signal result_u8_value_MUX_uxn_opcodes_h_l1891_c7_376e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1891_c7_376e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1891_c7_376e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1891_c7_376e_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1892_c22_0315]
signal BIN_OP_PLUS_uxn_opcodes_h_l1892_c22_0315_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1892_c22_0315_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1892_c22_0315_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1894_c11_d4bb]
signal BIN_OP_EQ_uxn_opcodes_h_l1894_c11_d4bb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1894_c11_d4bb_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1894_c11_d4bb_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1894_c7_7ab8]
signal tmp16_MUX_uxn_opcodes_h_l1894_c7_7ab8_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1894_c7_7ab8_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1894_c7_7ab8_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1894_c7_7ab8_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1894_c7_7ab8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1894_c7_7ab8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1894_c7_7ab8_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1894_c7_7ab8_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1894_c7_7ab8_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1894_c7_7ab8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1894_c7_7ab8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1894_c7_7ab8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1894_c7_7ab8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1894_c7_7ab8_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1894_c7_7ab8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1894_c7_7ab8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1894_c7_7ab8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1894_c7_7ab8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1894_c7_7ab8_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1894_c7_7ab8]
signal result_u8_value_MUX_uxn_opcodes_h_l1894_c7_7ab8_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1894_c7_7ab8_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1894_c7_7ab8_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1894_c7_7ab8_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1895_c3_b484]
signal BIN_OP_OR_uxn_opcodes_h_l1895_c3_b484_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1895_c3_b484_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1895_c3_b484_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1900_c11_39fc]
signal BIN_OP_EQ_uxn_opcodes_h_l1900_c11_39fc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1900_c11_39fc_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1900_c11_39fc_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1900_c7_e3c9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1900_c7_e3c9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1900_c7_e3c9_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1900_c7_e3c9_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1900_c7_e3c9_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1900_c7_e3c9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1900_c7_e3c9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1900_c7_e3c9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1900_c7_e3c9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1900_c7_e3c9_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1900_c7_e3c9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1900_c7_e3c9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1900_c7_e3c9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1900_c7_e3c9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1900_c7_e3c9_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1900_c7_e3c9]
signal result_u8_value_MUX_uxn_opcodes_h_l1900_c7_e3c9_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1900_c7_e3c9_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1900_c7_e3c9_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1900_c7_e3c9_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1902_c31_878c]
signal CONST_SR_8_uxn_opcodes_h_l1902_c31_878c_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1902_c31_878c_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1904_c11_d907]
signal BIN_OP_EQ_uxn_opcodes_h_l1904_c11_d907_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1904_c11_d907_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1904_c11_d907_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1904_c7_7156]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1904_c7_7156_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1904_c7_7156_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1904_c7_7156_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1904_c7_7156_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1904_c7_7156]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1904_c7_7156_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1904_c7_7156_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1904_c7_7156_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1904_c7_7156_return_output : unsigned(0 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_1a88( ref_toks_0 : opcode_result_t;
 ref_toks_1 : signed;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.sp_relative_shift := ref_toks_1;
      base.u16_value := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.is_sp_shift := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.is_stack_write := ref_toks_6;
      base.u8_value := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1860_c6_8cf6
BIN_OP_EQ_uxn_opcodes_h_l1860_c6_8cf6 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1860_c6_8cf6_left,
BIN_OP_EQ_uxn_opcodes_h_l1860_c6_8cf6_right,
BIN_OP_EQ_uxn_opcodes_h_l1860_c6_8cf6_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1860_c1_1759
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1860_c1_1759 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1860_c1_1759_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1860_c1_1759_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1860_c1_1759_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1860_c1_1759_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1860_c2_5500
tmp16_MUX_uxn_opcodes_h_l1860_c2_5500 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1860_c2_5500_cond,
tmp16_MUX_uxn_opcodes_h_l1860_c2_5500_iftrue,
tmp16_MUX_uxn_opcodes_h_l1860_c2_5500_iffalse,
tmp16_MUX_uxn_opcodes_h_l1860_c2_5500_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c2_5500
result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c2_5500 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c2_5500_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c2_5500_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c2_5500_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c2_5500_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1860_c2_5500
result_u16_value_MUX_uxn_opcodes_h_l1860_c2_5500 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1860_c2_5500_cond,
result_u16_value_MUX_uxn_opcodes_h_l1860_c2_5500_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1860_c2_5500_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1860_c2_5500_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c2_5500
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c2_5500 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c2_5500_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c2_5500_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c2_5500_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c2_5500_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1860_c2_5500
result_is_sp_shift_MUX_uxn_opcodes_h_l1860_c2_5500 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1860_c2_5500_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1860_c2_5500_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1860_c2_5500_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1860_c2_5500_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1860_c2_5500
result_is_opc_done_MUX_uxn_opcodes_h_l1860_c2_5500 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1860_c2_5500_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1860_c2_5500_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1860_c2_5500_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1860_c2_5500_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1860_c2_5500
result_is_stack_write_MUX_uxn_opcodes_h_l1860_c2_5500 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1860_c2_5500_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1860_c2_5500_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1860_c2_5500_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1860_c2_5500_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1860_c2_5500
result_u8_value_MUX_uxn_opcodes_h_l1860_c2_5500 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1860_c2_5500_cond,
result_u8_value_MUX_uxn_opcodes_h_l1860_c2_5500_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1860_c2_5500_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1860_c2_5500_return_output);

-- t16_MUX_uxn_opcodes_h_l1860_c2_5500
t16_MUX_uxn_opcodes_h_l1860_c2_5500 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1860_c2_5500_cond,
t16_MUX_uxn_opcodes_h_l1860_c2_5500_iftrue,
t16_MUX_uxn_opcodes_h_l1860_c2_5500_iffalse,
t16_MUX_uxn_opcodes_h_l1860_c2_5500_return_output);

-- printf_uxn_opcodes_h_l1861_c3_d9b6_uxn_opcodes_h_l1861_c3_d9b6
printf_uxn_opcodes_h_l1861_c3_d9b6_uxn_opcodes_h_l1861_c3_d9b6 : entity work.printf_uxn_opcodes_h_l1861_c3_d9b6_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1861_c3_d9b6_uxn_opcodes_h_l1861_c3_d9b6_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1865_c11_414d
BIN_OP_EQ_uxn_opcodes_h_l1865_c11_414d : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1865_c11_414d_left,
BIN_OP_EQ_uxn_opcodes_h_l1865_c11_414d_right,
BIN_OP_EQ_uxn_opcodes_h_l1865_c11_414d_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1865_c7_4f42
tmp16_MUX_uxn_opcodes_h_l1865_c7_4f42 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1865_c7_4f42_cond,
tmp16_MUX_uxn_opcodes_h_l1865_c7_4f42_iftrue,
tmp16_MUX_uxn_opcodes_h_l1865_c7_4f42_iffalse,
tmp16_MUX_uxn_opcodes_h_l1865_c7_4f42_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_4f42
result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_4f42 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_4f42_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_4f42_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_4f42_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_4f42_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1865_c7_4f42
result_u16_value_MUX_uxn_opcodes_h_l1865_c7_4f42 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1865_c7_4f42_cond,
result_u16_value_MUX_uxn_opcodes_h_l1865_c7_4f42_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1865_c7_4f42_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1865_c7_4f42_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_4f42
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_4f42 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_4f42_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_4f42_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_4f42_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_4f42_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1865_c7_4f42
result_is_sp_shift_MUX_uxn_opcodes_h_l1865_c7_4f42 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1865_c7_4f42_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1865_c7_4f42_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1865_c7_4f42_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1865_c7_4f42_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_4f42
result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_4f42 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_4f42_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_4f42_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_4f42_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_4f42_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_4f42
result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_4f42 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_4f42_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_4f42_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_4f42_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_4f42_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1865_c7_4f42
result_u8_value_MUX_uxn_opcodes_h_l1865_c7_4f42 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1865_c7_4f42_cond,
result_u8_value_MUX_uxn_opcodes_h_l1865_c7_4f42_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1865_c7_4f42_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1865_c7_4f42_return_output);

-- t16_MUX_uxn_opcodes_h_l1865_c7_4f42
t16_MUX_uxn_opcodes_h_l1865_c7_4f42 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1865_c7_4f42_cond,
t16_MUX_uxn_opcodes_h_l1865_c7_4f42_iftrue,
t16_MUX_uxn_opcodes_h_l1865_c7_4f42_iffalse,
t16_MUX_uxn_opcodes_h_l1865_c7_4f42_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1868_c11_530a
BIN_OP_EQ_uxn_opcodes_h_l1868_c11_530a : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1868_c11_530a_left,
BIN_OP_EQ_uxn_opcodes_h_l1868_c11_530a_right,
BIN_OP_EQ_uxn_opcodes_h_l1868_c11_530a_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1868_c7_c6e3
tmp16_MUX_uxn_opcodes_h_l1868_c7_c6e3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1868_c7_c6e3_cond,
tmp16_MUX_uxn_opcodes_h_l1868_c7_c6e3_iftrue,
tmp16_MUX_uxn_opcodes_h_l1868_c7_c6e3_iffalse,
tmp16_MUX_uxn_opcodes_h_l1868_c7_c6e3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1868_c7_c6e3
result_sp_relative_shift_MUX_uxn_opcodes_h_l1868_c7_c6e3 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1868_c7_c6e3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1868_c7_c6e3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1868_c7_c6e3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1868_c7_c6e3_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1868_c7_c6e3
result_u16_value_MUX_uxn_opcodes_h_l1868_c7_c6e3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1868_c7_c6e3_cond,
result_u16_value_MUX_uxn_opcodes_h_l1868_c7_c6e3_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1868_c7_c6e3_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1868_c7_c6e3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1868_c7_c6e3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1868_c7_c6e3 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1868_c7_c6e3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1868_c7_c6e3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1868_c7_c6e3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1868_c7_c6e3_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1868_c7_c6e3
result_is_sp_shift_MUX_uxn_opcodes_h_l1868_c7_c6e3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1868_c7_c6e3_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1868_c7_c6e3_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1868_c7_c6e3_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1868_c7_c6e3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1868_c7_c6e3
result_is_opc_done_MUX_uxn_opcodes_h_l1868_c7_c6e3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1868_c7_c6e3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1868_c7_c6e3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1868_c7_c6e3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1868_c7_c6e3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1868_c7_c6e3
result_is_stack_write_MUX_uxn_opcodes_h_l1868_c7_c6e3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1868_c7_c6e3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1868_c7_c6e3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1868_c7_c6e3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1868_c7_c6e3_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1868_c7_c6e3
result_u8_value_MUX_uxn_opcodes_h_l1868_c7_c6e3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1868_c7_c6e3_cond,
result_u8_value_MUX_uxn_opcodes_h_l1868_c7_c6e3_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1868_c7_c6e3_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1868_c7_c6e3_return_output);

-- t16_MUX_uxn_opcodes_h_l1868_c7_c6e3
t16_MUX_uxn_opcodes_h_l1868_c7_c6e3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1868_c7_c6e3_cond,
t16_MUX_uxn_opcodes_h_l1868_c7_c6e3_iftrue,
t16_MUX_uxn_opcodes_h_l1868_c7_c6e3_iffalse,
t16_MUX_uxn_opcodes_h_l1868_c7_c6e3_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1870_c3_7213
CONST_SL_8_uxn_opcodes_h_l1870_c3_7213 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1870_c3_7213_x,
CONST_SL_8_uxn_opcodes_h_l1870_c3_7213_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1873_c11_f790
BIN_OP_EQ_uxn_opcodes_h_l1873_c11_f790 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1873_c11_f790_left,
BIN_OP_EQ_uxn_opcodes_h_l1873_c11_f790_right,
BIN_OP_EQ_uxn_opcodes_h_l1873_c11_f790_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1873_c7_5b1c
tmp16_MUX_uxn_opcodes_h_l1873_c7_5b1c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1873_c7_5b1c_cond,
tmp16_MUX_uxn_opcodes_h_l1873_c7_5b1c_iftrue,
tmp16_MUX_uxn_opcodes_h_l1873_c7_5b1c_iffalse,
tmp16_MUX_uxn_opcodes_h_l1873_c7_5b1c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_5b1c
result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_5b1c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_5b1c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_5b1c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_5b1c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_5b1c_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1873_c7_5b1c
result_u16_value_MUX_uxn_opcodes_h_l1873_c7_5b1c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1873_c7_5b1c_cond,
result_u16_value_MUX_uxn_opcodes_h_l1873_c7_5b1c_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1873_c7_5b1c_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1873_c7_5b1c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_5b1c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_5b1c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_5b1c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_5b1c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_5b1c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_5b1c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1873_c7_5b1c
result_is_sp_shift_MUX_uxn_opcodes_h_l1873_c7_5b1c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1873_c7_5b1c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1873_c7_5b1c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1873_c7_5b1c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1873_c7_5b1c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_5b1c
result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_5b1c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_5b1c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_5b1c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_5b1c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_5b1c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_5b1c
result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_5b1c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_5b1c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_5b1c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_5b1c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_5b1c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1873_c7_5b1c
result_u8_value_MUX_uxn_opcodes_h_l1873_c7_5b1c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1873_c7_5b1c_cond,
result_u8_value_MUX_uxn_opcodes_h_l1873_c7_5b1c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1873_c7_5b1c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1873_c7_5b1c_return_output);

-- t16_MUX_uxn_opcodes_h_l1873_c7_5b1c
t16_MUX_uxn_opcodes_h_l1873_c7_5b1c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1873_c7_5b1c_cond,
t16_MUX_uxn_opcodes_h_l1873_c7_5b1c_iftrue,
t16_MUX_uxn_opcodes_h_l1873_c7_5b1c_iffalse,
t16_MUX_uxn_opcodes_h_l1873_c7_5b1c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1876_c11_b4c3
BIN_OP_EQ_uxn_opcodes_h_l1876_c11_b4c3 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1876_c11_b4c3_left,
BIN_OP_EQ_uxn_opcodes_h_l1876_c11_b4c3_right,
BIN_OP_EQ_uxn_opcodes_h_l1876_c11_b4c3_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1876_c7_e274
tmp16_MUX_uxn_opcodes_h_l1876_c7_e274 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1876_c7_e274_cond,
tmp16_MUX_uxn_opcodes_h_l1876_c7_e274_iftrue,
tmp16_MUX_uxn_opcodes_h_l1876_c7_e274_iffalse,
tmp16_MUX_uxn_opcodes_h_l1876_c7_e274_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1876_c7_e274
result_sp_relative_shift_MUX_uxn_opcodes_h_l1876_c7_e274 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1876_c7_e274_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1876_c7_e274_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1876_c7_e274_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1876_c7_e274_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1876_c7_e274
result_u16_value_MUX_uxn_opcodes_h_l1876_c7_e274 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1876_c7_e274_cond,
result_u16_value_MUX_uxn_opcodes_h_l1876_c7_e274_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1876_c7_e274_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1876_c7_e274_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1876_c7_e274
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1876_c7_e274 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1876_c7_e274_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1876_c7_e274_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1876_c7_e274_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1876_c7_e274_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1876_c7_e274
result_is_sp_shift_MUX_uxn_opcodes_h_l1876_c7_e274 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1876_c7_e274_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1876_c7_e274_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1876_c7_e274_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1876_c7_e274_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1876_c7_e274
result_is_opc_done_MUX_uxn_opcodes_h_l1876_c7_e274 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1876_c7_e274_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1876_c7_e274_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1876_c7_e274_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1876_c7_e274_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1876_c7_e274
result_is_stack_write_MUX_uxn_opcodes_h_l1876_c7_e274 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1876_c7_e274_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1876_c7_e274_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1876_c7_e274_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1876_c7_e274_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1876_c7_e274
result_u8_value_MUX_uxn_opcodes_h_l1876_c7_e274 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1876_c7_e274_cond,
result_u8_value_MUX_uxn_opcodes_h_l1876_c7_e274_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1876_c7_e274_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1876_c7_e274_return_output);

-- t16_MUX_uxn_opcodes_h_l1876_c7_e274
t16_MUX_uxn_opcodes_h_l1876_c7_e274 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1876_c7_e274_cond,
t16_MUX_uxn_opcodes_h_l1876_c7_e274_iftrue,
t16_MUX_uxn_opcodes_h_l1876_c7_e274_iffalse,
t16_MUX_uxn_opcodes_h_l1876_c7_e274_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1877_c3_043f
BIN_OP_OR_uxn_opcodes_h_l1877_c3_043f : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1877_c3_043f_left,
BIN_OP_OR_uxn_opcodes_h_l1877_c3_043f_right,
BIN_OP_OR_uxn_opcodes_h_l1877_c3_043f_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1879_c30_fc0a
sp_relative_shift_uxn_opcodes_h_l1879_c30_fc0a : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1879_c30_fc0a_ins,
sp_relative_shift_uxn_opcodes_h_l1879_c30_fc0a_x,
sp_relative_shift_uxn_opcodes_h_l1879_c30_fc0a_y,
sp_relative_shift_uxn_opcodes_h_l1879_c30_fc0a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1882_c11_0c15
BIN_OP_EQ_uxn_opcodes_h_l1882_c11_0c15 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1882_c11_0c15_left,
BIN_OP_EQ_uxn_opcodes_h_l1882_c11_0c15_right,
BIN_OP_EQ_uxn_opcodes_h_l1882_c11_0c15_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1882_c7_54e2
tmp16_MUX_uxn_opcodes_h_l1882_c7_54e2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1882_c7_54e2_cond,
tmp16_MUX_uxn_opcodes_h_l1882_c7_54e2_iftrue,
tmp16_MUX_uxn_opcodes_h_l1882_c7_54e2_iffalse,
tmp16_MUX_uxn_opcodes_h_l1882_c7_54e2_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1882_c7_54e2
result_u16_value_MUX_uxn_opcodes_h_l1882_c7_54e2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1882_c7_54e2_cond,
result_u16_value_MUX_uxn_opcodes_h_l1882_c7_54e2_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1882_c7_54e2_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1882_c7_54e2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1882_c7_54e2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1882_c7_54e2 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1882_c7_54e2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1882_c7_54e2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1882_c7_54e2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1882_c7_54e2_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1882_c7_54e2
result_is_sp_shift_MUX_uxn_opcodes_h_l1882_c7_54e2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1882_c7_54e2_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1882_c7_54e2_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1882_c7_54e2_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1882_c7_54e2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_54e2
result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_54e2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_54e2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_54e2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_54e2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_54e2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1882_c7_54e2
result_is_stack_write_MUX_uxn_opcodes_h_l1882_c7_54e2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1882_c7_54e2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1882_c7_54e2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1882_c7_54e2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1882_c7_54e2_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1882_c7_54e2
result_u8_value_MUX_uxn_opcodes_h_l1882_c7_54e2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1882_c7_54e2_cond,
result_u8_value_MUX_uxn_opcodes_h_l1882_c7_54e2_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1882_c7_54e2_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1882_c7_54e2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1886_c11_e5fb
BIN_OP_EQ_uxn_opcodes_h_l1886_c11_e5fb : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1886_c11_e5fb_left,
BIN_OP_EQ_uxn_opcodes_h_l1886_c11_e5fb_right,
BIN_OP_EQ_uxn_opcodes_h_l1886_c11_e5fb_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1886_c7_a074
tmp16_MUX_uxn_opcodes_h_l1886_c7_a074 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1886_c7_a074_cond,
tmp16_MUX_uxn_opcodes_h_l1886_c7_a074_iftrue,
tmp16_MUX_uxn_opcodes_h_l1886_c7_a074_iffalse,
tmp16_MUX_uxn_opcodes_h_l1886_c7_a074_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1886_c7_a074
result_u16_value_MUX_uxn_opcodes_h_l1886_c7_a074 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1886_c7_a074_cond,
result_u16_value_MUX_uxn_opcodes_h_l1886_c7_a074_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1886_c7_a074_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1886_c7_a074_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1886_c7_a074
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1886_c7_a074 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1886_c7_a074_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1886_c7_a074_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1886_c7_a074_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1886_c7_a074_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1886_c7_a074
result_is_opc_done_MUX_uxn_opcodes_h_l1886_c7_a074 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1886_c7_a074_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1886_c7_a074_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1886_c7_a074_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1886_c7_a074_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1886_c7_a074
result_is_stack_write_MUX_uxn_opcodes_h_l1886_c7_a074 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1886_c7_a074_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1886_c7_a074_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1886_c7_a074_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1886_c7_a074_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1886_c7_a074
result_u8_value_MUX_uxn_opcodes_h_l1886_c7_a074 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1886_c7_a074_cond,
result_u8_value_MUX_uxn_opcodes_h_l1886_c7_a074_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1886_c7_a074_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1886_c7_a074_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1888_c3_1f36
CONST_SL_8_uxn_opcodes_h_l1888_c3_1f36 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1888_c3_1f36_x,
CONST_SL_8_uxn_opcodes_h_l1888_c3_1f36_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1889_c22_8adb
BIN_OP_PLUS_uxn_opcodes_h_l1889_c22_8adb : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1889_c22_8adb_left,
BIN_OP_PLUS_uxn_opcodes_h_l1889_c22_8adb_right,
BIN_OP_PLUS_uxn_opcodes_h_l1889_c22_8adb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1891_c11_5191
BIN_OP_EQ_uxn_opcodes_h_l1891_c11_5191 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1891_c11_5191_left,
BIN_OP_EQ_uxn_opcodes_h_l1891_c11_5191_right,
BIN_OP_EQ_uxn_opcodes_h_l1891_c11_5191_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1891_c7_376e
tmp16_MUX_uxn_opcodes_h_l1891_c7_376e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1891_c7_376e_cond,
tmp16_MUX_uxn_opcodes_h_l1891_c7_376e_iftrue,
tmp16_MUX_uxn_opcodes_h_l1891_c7_376e_iffalse,
tmp16_MUX_uxn_opcodes_h_l1891_c7_376e_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1891_c7_376e
result_u16_value_MUX_uxn_opcodes_h_l1891_c7_376e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1891_c7_376e_cond,
result_u16_value_MUX_uxn_opcodes_h_l1891_c7_376e_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1891_c7_376e_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1891_c7_376e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1891_c7_376e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1891_c7_376e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1891_c7_376e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1891_c7_376e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1891_c7_376e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1891_c7_376e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1891_c7_376e
result_is_opc_done_MUX_uxn_opcodes_h_l1891_c7_376e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1891_c7_376e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1891_c7_376e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1891_c7_376e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1891_c7_376e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1891_c7_376e
result_is_stack_write_MUX_uxn_opcodes_h_l1891_c7_376e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1891_c7_376e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1891_c7_376e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1891_c7_376e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1891_c7_376e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1891_c7_376e
result_u8_value_MUX_uxn_opcodes_h_l1891_c7_376e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1891_c7_376e_cond,
result_u8_value_MUX_uxn_opcodes_h_l1891_c7_376e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1891_c7_376e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1891_c7_376e_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1892_c22_0315
BIN_OP_PLUS_uxn_opcodes_h_l1892_c22_0315 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1892_c22_0315_left,
BIN_OP_PLUS_uxn_opcodes_h_l1892_c22_0315_right,
BIN_OP_PLUS_uxn_opcodes_h_l1892_c22_0315_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1894_c11_d4bb
BIN_OP_EQ_uxn_opcodes_h_l1894_c11_d4bb : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1894_c11_d4bb_left,
BIN_OP_EQ_uxn_opcodes_h_l1894_c11_d4bb_right,
BIN_OP_EQ_uxn_opcodes_h_l1894_c11_d4bb_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1894_c7_7ab8
tmp16_MUX_uxn_opcodes_h_l1894_c7_7ab8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1894_c7_7ab8_cond,
tmp16_MUX_uxn_opcodes_h_l1894_c7_7ab8_iftrue,
tmp16_MUX_uxn_opcodes_h_l1894_c7_7ab8_iffalse,
tmp16_MUX_uxn_opcodes_h_l1894_c7_7ab8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1894_c7_7ab8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1894_c7_7ab8 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1894_c7_7ab8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1894_c7_7ab8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1894_c7_7ab8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1894_c7_7ab8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1894_c7_7ab8
result_is_opc_done_MUX_uxn_opcodes_h_l1894_c7_7ab8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1894_c7_7ab8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1894_c7_7ab8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1894_c7_7ab8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1894_c7_7ab8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1894_c7_7ab8
result_is_stack_write_MUX_uxn_opcodes_h_l1894_c7_7ab8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1894_c7_7ab8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1894_c7_7ab8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1894_c7_7ab8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1894_c7_7ab8_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1894_c7_7ab8
result_u8_value_MUX_uxn_opcodes_h_l1894_c7_7ab8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1894_c7_7ab8_cond,
result_u8_value_MUX_uxn_opcodes_h_l1894_c7_7ab8_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1894_c7_7ab8_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1894_c7_7ab8_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1895_c3_b484
BIN_OP_OR_uxn_opcodes_h_l1895_c3_b484 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1895_c3_b484_left,
BIN_OP_OR_uxn_opcodes_h_l1895_c3_b484_right,
BIN_OP_OR_uxn_opcodes_h_l1895_c3_b484_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1900_c11_39fc
BIN_OP_EQ_uxn_opcodes_h_l1900_c11_39fc : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1900_c11_39fc_left,
BIN_OP_EQ_uxn_opcodes_h_l1900_c11_39fc_right,
BIN_OP_EQ_uxn_opcodes_h_l1900_c11_39fc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1900_c7_e3c9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1900_c7_e3c9 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1900_c7_e3c9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1900_c7_e3c9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1900_c7_e3c9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1900_c7_e3c9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1900_c7_e3c9
result_is_opc_done_MUX_uxn_opcodes_h_l1900_c7_e3c9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1900_c7_e3c9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1900_c7_e3c9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1900_c7_e3c9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1900_c7_e3c9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1900_c7_e3c9
result_is_stack_write_MUX_uxn_opcodes_h_l1900_c7_e3c9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1900_c7_e3c9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1900_c7_e3c9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1900_c7_e3c9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1900_c7_e3c9_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1900_c7_e3c9
result_u8_value_MUX_uxn_opcodes_h_l1900_c7_e3c9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1900_c7_e3c9_cond,
result_u8_value_MUX_uxn_opcodes_h_l1900_c7_e3c9_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1900_c7_e3c9_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1900_c7_e3c9_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1902_c31_878c
CONST_SR_8_uxn_opcodes_h_l1902_c31_878c : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1902_c31_878c_x,
CONST_SR_8_uxn_opcodes_h_l1902_c31_878c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1904_c11_d907
BIN_OP_EQ_uxn_opcodes_h_l1904_c11_d907 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1904_c11_d907_left,
BIN_OP_EQ_uxn_opcodes_h_l1904_c11_d907_right,
BIN_OP_EQ_uxn_opcodes_h_l1904_c11_d907_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1904_c7_7156
result_is_opc_done_MUX_uxn_opcodes_h_l1904_c7_7156 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1904_c7_7156_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1904_c7_7156_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1904_c7_7156_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1904_c7_7156_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1904_c7_7156
result_is_stack_write_MUX_uxn_opcodes_h_l1904_c7_7156 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1904_c7_7156_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1904_c7_7156_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1904_c7_7156_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1904_c7_7156_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1860_c6_8cf6_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1860_c1_1759_return_output,
 tmp16_MUX_uxn_opcodes_h_l1860_c2_5500_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c2_5500_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1860_c2_5500_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c2_5500_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1860_c2_5500_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1860_c2_5500_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1860_c2_5500_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1860_c2_5500_return_output,
 t16_MUX_uxn_opcodes_h_l1860_c2_5500_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1865_c11_414d_return_output,
 tmp16_MUX_uxn_opcodes_h_l1865_c7_4f42_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_4f42_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1865_c7_4f42_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_4f42_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1865_c7_4f42_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_4f42_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_4f42_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1865_c7_4f42_return_output,
 t16_MUX_uxn_opcodes_h_l1865_c7_4f42_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1868_c11_530a_return_output,
 tmp16_MUX_uxn_opcodes_h_l1868_c7_c6e3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1868_c7_c6e3_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1868_c7_c6e3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1868_c7_c6e3_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1868_c7_c6e3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1868_c7_c6e3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1868_c7_c6e3_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1868_c7_c6e3_return_output,
 t16_MUX_uxn_opcodes_h_l1868_c7_c6e3_return_output,
 CONST_SL_8_uxn_opcodes_h_l1870_c3_7213_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1873_c11_f790_return_output,
 tmp16_MUX_uxn_opcodes_h_l1873_c7_5b1c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_5b1c_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1873_c7_5b1c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_5b1c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1873_c7_5b1c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_5b1c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_5b1c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1873_c7_5b1c_return_output,
 t16_MUX_uxn_opcodes_h_l1873_c7_5b1c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1876_c11_b4c3_return_output,
 tmp16_MUX_uxn_opcodes_h_l1876_c7_e274_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1876_c7_e274_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1876_c7_e274_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1876_c7_e274_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1876_c7_e274_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1876_c7_e274_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1876_c7_e274_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1876_c7_e274_return_output,
 t16_MUX_uxn_opcodes_h_l1876_c7_e274_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1877_c3_043f_return_output,
 sp_relative_shift_uxn_opcodes_h_l1879_c30_fc0a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1882_c11_0c15_return_output,
 tmp16_MUX_uxn_opcodes_h_l1882_c7_54e2_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1882_c7_54e2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1882_c7_54e2_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1882_c7_54e2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_54e2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1882_c7_54e2_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1882_c7_54e2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1886_c11_e5fb_return_output,
 tmp16_MUX_uxn_opcodes_h_l1886_c7_a074_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1886_c7_a074_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1886_c7_a074_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1886_c7_a074_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1886_c7_a074_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1886_c7_a074_return_output,
 CONST_SL_8_uxn_opcodes_h_l1888_c3_1f36_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1889_c22_8adb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1891_c11_5191_return_output,
 tmp16_MUX_uxn_opcodes_h_l1891_c7_376e_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1891_c7_376e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1891_c7_376e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1891_c7_376e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1891_c7_376e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1891_c7_376e_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1892_c22_0315_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1894_c11_d4bb_return_output,
 tmp16_MUX_uxn_opcodes_h_l1894_c7_7ab8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1894_c7_7ab8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1894_c7_7ab8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1894_c7_7ab8_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1894_c7_7ab8_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1895_c3_b484_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1900_c11_39fc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1900_c7_e3c9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1900_c7_e3c9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1900_c7_e3c9_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1900_c7_e3c9_return_output,
 CONST_SR_8_uxn_opcodes_h_l1902_c31_878c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1904_c11_d907_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1904_c7_7156_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1904_c7_7156_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1860_c6_8cf6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1860_c6_8cf6_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1860_c6_8cf6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1860_c1_1759_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1860_c1_1759_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1860_c1_1759_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1860_c1_1759_iffalse : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1860_c2_5500_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1860_c2_5500_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1865_c7_4f42_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1860_c2_5500_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1860_c2_5500_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c2_5500_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c2_5500_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_4f42_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c2_5500_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c2_5500_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1860_c2_5500_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1860_c2_5500_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1865_c7_4f42_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1860_c2_5500_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1860_c2_5500_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c2_5500_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1862_c3_c865 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c2_5500_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_4f42_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c2_5500_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c2_5500_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1860_c2_5500_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1860_c2_5500_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1865_c7_4f42_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1860_c2_5500_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1860_c2_5500_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1860_c2_5500_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1860_c2_5500_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_4f42_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1860_c2_5500_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1860_c2_5500_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1860_c2_5500_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1860_c2_5500_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_4f42_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1860_c2_5500_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1860_c2_5500_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1860_c2_5500_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1860_c2_5500_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1865_c7_4f42_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1860_c2_5500_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1860_c2_5500_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1860_c2_5500_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1860_c2_5500_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1865_c7_4f42_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1860_c2_5500_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1860_c2_5500_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1861_c3_d9b6_uxn_opcodes_h_l1861_c3_d9b6_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c11_414d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c11_414d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c11_414d_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1865_c7_4f42_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1865_c7_4f42_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1868_c7_c6e3_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1865_c7_4f42_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_4f42_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_4f42_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1868_c7_c6e3_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_4f42_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1865_c7_4f42_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1865_c7_4f42_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1868_c7_c6e3_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1865_c7_4f42_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_4f42_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1866_c3_d28b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_4f42_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1868_c7_c6e3_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_4f42_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1865_c7_4f42_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1865_c7_4f42_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1868_c7_c6e3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1865_c7_4f42_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_4f42_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_4f42_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1868_c7_c6e3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_4f42_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_4f42_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_4f42_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1868_c7_c6e3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_4f42_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1865_c7_4f42_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1865_c7_4f42_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1868_c7_c6e3_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1865_c7_4f42_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1865_c7_4f42_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1865_c7_4f42_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1868_c7_c6e3_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1865_c7_4f42_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1868_c11_530a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1868_c11_530a_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1868_c11_530a_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1868_c7_c6e3_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1868_c7_c6e3_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1873_c7_5b1c_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1868_c7_c6e3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1868_c7_c6e3_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1868_c7_c6e3_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_5b1c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1868_c7_c6e3_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1868_c7_c6e3_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1868_c7_c6e3_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1873_c7_5b1c_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1868_c7_c6e3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1868_c7_c6e3_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1871_c3_5bf2 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1868_c7_c6e3_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_5b1c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1868_c7_c6e3_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1868_c7_c6e3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1868_c7_c6e3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1873_c7_5b1c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1868_c7_c6e3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1868_c7_c6e3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1868_c7_c6e3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_5b1c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1868_c7_c6e3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1868_c7_c6e3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1868_c7_c6e3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_5b1c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1868_c7_c6e3_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1868_c7_c6e3_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1868_c7_c6e3_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1873_c7_5b1c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1868_c7_c6e3_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1868_c7_c6e3_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1868_c7_c6e3_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1873_c7_5b1c_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1868_c7_c6e3_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1870_c3_7213_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1870_c3_7213_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_f790_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_f790_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_f790_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1873_c7_5b1c_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1873_c7_5b1c_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1876_c7_e274_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1873_c7_5b1c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_5b1c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_5b1c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1876_c7_e274_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_5b1c_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1873_c7_5b1c_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1873_c7_5b1c_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1876_c7_e274_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1873_c7_5b1c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_5b1c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1874_c3_b129 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_5b1c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1876_c7_e274_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_5b1c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1873_c7_5b1c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1873_c7_5b1c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1876_c7_e274_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1873_c7_5b1c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_5b1c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_5b1c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1876_c7_e274_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_5b1c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_5b1c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_5b1c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1876_c7_e274_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_5b1c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1873_c7_5b1c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1873_c7_5b1c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1876_c7_e274_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1873_c7_5b1c_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1873_c7_5b1c_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1873_c7_5b1c_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1876_c7_e274_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1873_c7_5b1c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1876_c11_b4c3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1876_c11_b4c3_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1876_c11_b4c3_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1876_c7_e274_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1876_c7_e274_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1882_c7_54e2_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1876_c7_e274_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1876_c7_e274_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1876_c7_e274_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1876_c7_e274_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1876_c7_e274_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1876_c7_e274_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1882_c7_54e2_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1876_c7_e274_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1876_c7_e274_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1876_c7_e274_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1882_c7_54e2_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1876_c7_e274_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1876_c7_e274_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1876_c7_e274_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1882_c7_54e2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1876_c7_e274_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1876_c7_e274_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1876_c7_e274_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_54e2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1876_c7_e274_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1876_c7_e274_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1876_c7_e274_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1882_c7_54e2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1876_c7_e274_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1876_c7_e274_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1876_c7_e274_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1882_c7_54e2_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1876_c7_e274_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1876_c7_e274_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1876_c7_e274_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1876_c7_e274_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1877_c3_043f_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1877_c3_043f_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1877_c3_043f_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1879_c30_fc0a_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1879_c30_fc0a_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1879_c30_fc0a_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1879_c30_fc0a_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1882_c11_0c15_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1882_c11_0c15_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1882_c11_0c15_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1882_c7_54e2_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1882_c7_54e2_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1886_c7_a074_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1882_c7_54e2_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1882_c7_54e2_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1882_c7_54e2_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1886_c7_a074_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1882_c7_54e2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1882_c7_54e2_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1882_c7_54e2_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1886_c7_a074_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1882_c7_54e2_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1882_c7_54e2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1882_c7_54e2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1882_c7_54e2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_54e2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_54e2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1886_c7_a074_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_54e2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1882_c7_54e2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1882_c7_54e2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1886_c7_a074_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1882_c7_54e2_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1882_c7_54e2_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1882_c7_54e2_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1886_c7_a074_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1882_c7_54e2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1886_c11_e5fb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1886_c11_e5fb_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1886_c11_e5fb_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1886_c7_a074_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1886_c7_a074_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1891_c7_376e_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1886_c7_a074_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1886_c7_a074_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l1889_c3_4d61 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1886_c7_a074_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1891_c7_376e_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1886_c7_a074_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1886_c7_a074_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1886_c7_a074_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1891_c7_376e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1886_c7_a074_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1886_c7_a074_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1886_c7_a074_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1891_c7_376e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1886_c7_a074_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1886_c7_a074_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1886_c7_a074_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1891_c7_376e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1886_c7_a074_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1886_c7_a074_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1886_c7_a074_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1891_c7_376e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1886_c7_a074_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1888_c3_1f36_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1888_c3_1f36_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1889_c22_8adb_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1889_c22_8adb_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1889_c22_8adb_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1891_c11_5191_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1891_c11_5191_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1891_c11_5191_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1891_c7_376e_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1891_c7_376e_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1894_c7_7ab8_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1891_c7_376e_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1891_c7_376e_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l1892_c3_5e15 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1891_c7_376e_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1891_c7_376e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1891_c7_376e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1891_c7_376e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1894_c7_7ab8_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1891_c7_376e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1891_c7_376e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1891_c7_376e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1894_c7_7ab8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1891_c7_376e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1891_c7_376e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1891_c7_376e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1894_c7_7ab8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1891_c7_376e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1891_c7_376e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1891_c7_376e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1894_c7_7ab8_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1891_c7_376e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1892_c22_0315_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1892_c22_0315_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1892_c22_0315_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1894_c11_d4bb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1894_c11_d4bb_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1894_c11_d4bb_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1894_c7_7ab8_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1894_c7_7ab8_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1894_c7_7ab8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1894_c7_7ab8_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1897_c3_f862 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1894_c7_7ab8_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1900_c7_e3c9_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1894_c7_7ab8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1894_c7_7ab8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1894_c7_7ab8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1900_c7_e3c9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1894_c7_7ab8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1894_c7_7ab8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1894_c7_7ab8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1900_c7_e3c9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1894_c7_7ab8_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1894_c7_7ab8_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1894_c7_7ab8_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1900_c7_e3c9_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1894_c7_7ab8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1895_c3_b484_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1895_c3_b484_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1895_c3_b484_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1898_c21_47ed_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1900_c11_39fc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1900_c11_39fc_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1900_c11_39fc_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1900_c7_e3c9_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1901_c3_ed14 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1900_c7_e3c9_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1900_c7_e3c9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1900_c7_e3c9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1900_c7_e3c9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1904_c7_7156_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1900_c7_e3c9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1900_c7_e3c9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1900_c7_e3c9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1904_c7_7156_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1900_c7_e3c9_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1900_c7_e3c9_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1900_c7_e3c9_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1900_c7_e3c9_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1902_c31_878c_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1902_c31_878c_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1902_c21_6a44_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1904_c11_d907_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1904_c11_d907_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1904_c11_d907_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1904_c7_7156_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1904_c7_7156_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1904_c7_7156_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1904_c7_7156_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1904_c7_7156_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1904_c7_7156_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1876_l1873_l1868_l1865_l1860_DUPLICATE_3431_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1873_l1868_l1865_l1891_l1860_DUPLICATE_7129_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1882_l1873_l1868_l1865_l1860_DUPLICATE_fac2_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1882_l1876_l1904_l1873_l1900_l1868_l1865_l1891_l1860_l1886_DUPLICATE_51b6_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1882_l1876_l1873_l1900_l1868_l1865_l1891_l1860_l1886_DUPLICATE_1903_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1882_l1876_l1904_l1873_l1900_l1868_l1894_l1865_l1891_l1886_DUPLICATE_b9ed_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1877_l1869_DUPLICATE_05a1_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1882_l1876_l1900_l1891_l1886_DUPLICATE_e01e_return_output : unsigned(3 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1887_l1895_DUPLICATE_27e9_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1a88_uxn_opcodes_h_l1909_l1856_DUPLICATE_2d7a_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_f790_right := to_unsigned(3, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1894_c7_7ab8_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1897_c3_f862 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1894_c7_7ab8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1897_c3_f862;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1876_c11_b4c3_right := to_unsigned(4, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1904_c7_7156_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1889_c22_8adb_right := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1860_c1_1759_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1866_c3_d28b := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_4f42_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1866_c3_d28b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1900_c11_39fc_right := to_unsigned(9, 4);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1860_c2_5500_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1879_c30_fc0a_y := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1901_c3_ed14 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1900_c7_e3c9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1901_c3_ed14;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1868_c11_530a_right := to_unsigned(2, 2);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1892_c22_0315_right := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1876_c7_e274_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1904_c11_d907_right := to_unsigned(10, 4);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1882_c7_54e2_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1882_c11_0c15_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1874_c3_b129 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_5b1c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1874_c3_b129;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1871_c3_5bf2 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1868_c7_c6e3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1871_c3_5bf2;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1862_c3_c865 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c2_5500_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1862_c3_c865;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1886_c11_e5fb_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1891_c11_5191_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1860_c6_8cf6_right := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1879_c30_fc0a_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c11_414d_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1894_c11_d4bb_right := to_unsigned(8, 4);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1904_c7_7156_iftrue := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1860_c1_1759_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l1879_c30_fc0a_ins := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1860_c6_8cf6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c11_414d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1868_c11_530a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_f790_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1876_c11_b4c3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1882_c11_0c15_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1886_c11_e5fb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1891_c11_5191_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1894_c11_d4bb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1900_c11_39fc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1904_c11_d907_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1877_c3_043f_left := t16;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1889_c22_8adb_left := t16;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1892_c22_0315_left := t16;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1882_c7_54e2_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1860_c2_5500_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1865_c7_4f42_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1873_c7_5b1c_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1876_c7_e274_iffalse := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1895_c3_b484_left := tmp16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1902_c31_878c_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1860_c2_5500_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1865_c7_4f42_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1868_c7_c6e3_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1873_c7_5b1c_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1876_c7_e274_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1882_c7_54e2_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1891_c7_376e_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1894_c7_7ab8_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l1894_c11_d4bb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1894_c11_d4bb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1894_c11_d4bb_left;
     BIN_OP_EQ_uxn_opcodes_h_l1894_c11_d4bb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1894_c11_d4bb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1894_c11_d4bb_return_output := BIN_OP_EQ_uxn_opcodes_h_l1894_c11_d4bb_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1882_l1876_l1904_l1873_l1900_l1868_l1894_l1865_l1891_l1886_DUPLICATE_b9ed LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1882_l1876_l1904_l1873_l1900_l1868_l1894_l1865_l1891_l1886_DUPLICATE_b9ed_return_output := result.is_opc_done;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1892_c22_0315] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1892_c22_0315_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1892_c22_0315_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1892_c22_0315_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1892_c22_0315_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1892_c22_0315_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1892_c22_0315_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1882_c11_0c15] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1882_c11_0c15_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1882_c11_0c15_left;
     BIN_OP_EQ_uxn_opcodes_h_l1882_c11_0c15_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1882_c11_0c15_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1882_c11_0c15_return_output := BIN_OP_EQ_uxn_opcodes_h_l1882_c11_0c15_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1873_l1868_l1865_l1891_l1860_DUPLICATE_7129 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1873_l1868_l1865_l1891_l1860_DUPLICATE_7129_return_output := result.u16_value;

     -- CONST_SR_8[uxn_opcodes_h_l1902_c31_878c] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1902_c31_878c_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1902_c31_878c_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1902_c31_878c_return_output := CONST_SR_8_uxn_opcodes_h_l1902_c31_878c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1891_c11_5191] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1891_c11_5191_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1891_c11_5191_left;
     BIN_OP_EQ_uxn_opcodes_h_l1891_c11_5191_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1891_c11_5191_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1891_c11_5191_return_output := BIN_OP_EQ_uxn_opcodes_h_l1891_c11_5191_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1886_c11_e5fb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1886_c11_e5fb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1886_c11_e5fb_left;
     BIN_OP_EQ_uxn_opcodes_h_l1886_c11_e5fb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1886_c11_e5fb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1886_c11_e5fb_return_output := BIN_OP_EQ_uxn_opcodes_h_l1886_c11_e5fb_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1882_l1876_l1900_l1891_l1886_DUPLICATE_e01e LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1882_l1876_l1900_l1891_l1886_DUPLICATE_e01e_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1882_l1876_l1873_l1900_l1868_l1865_l1891_l1860_l1886_DUPLICATE_1903 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1882_l1876_l1873_l1900_l1868_l1865_l1891_l1860_l1886_DUPLICATE_1903_return_output := result.u8_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1882_l1873_l1868_l1865_l1860_DUPLICATE_fac2 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1882_l1873_l1868_l1865_l1860_DUPLICATE_fac2_return_output := result.is_sp_shift;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1887_l1895_DUPLICATE_27e9 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1887_l1895_DUPLICATE_27e9_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1876_c11_b4c3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1876_c11_b4c3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1876_c11_b4c3_left;
     BIN_OP_EQ_uxn_opcodes_h_l1876_c11_b4c3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1876_c11_b4c3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1876_c11_b4c3_return_output := BIN_OP_EQ_uxn_opcodes_h_l1876_c11_b4c3_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1882_l1876_l1904_l1873_l1900_l1868_l1865_l1891_l1860_l1886_DUPLICATE_51b6 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1882_l1876_l1904_l1873_l1900_l1868_l1865_l1891_l1860_l1886_DUPLICATE_51b6_return_output := result.is_stack_write;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1877_l1869_DUPLICATE_05a1 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1877_l1869_DUPLICATE_05a1_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1900_c11_39fc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1900_c11_39fc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1900_c11_39fc_left;
     BIN_OP_EQ_uxn_opcodes_h_l1900_c11_39fc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1900_c11_39fc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1900_c11_39fc_return_output := BIN_OP_EQ_uxn_opcodes_h_l1900_c11_39fc_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1860_c6_8cf6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1860_c6_8cf6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1860_c6_8cf6_left;
     BIN_OP_EQ_uxn_opcodes_h_l1860_c6_8cf6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1860_c6_8cf6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1860_c6_8cf6_return_output := BIN_OP_EQ_uxn_opcodes_h_l1860_c6_8cf6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1865_c11_414d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1865_c11_414d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c11_414d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1865_c11_414d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c11_414d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c11_414d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1865_c11_414d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1904_c11_d907] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1904_c11_d907_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1904_c11_d907_left;
     BIN_OP_EQ_uxn_opcodes_h_l1904_c11_d907_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1904_c11_d907_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1904_c11_d907_return_output := BIN_OP_EQ_uxn_opcodes_h_l1904_c11_d907_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1889_c22_8adb] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1889_c22_8adb_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1889_c22_8adb_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1889_c22_8adb_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1889_c22_8adb_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1889_c22_8adb_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1889_c22_8adb_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1868_c11_530a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1868_c11_530a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1868_c11_530a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1868_c11_530a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1868_c11_530a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1868_c11_530a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1868_c11_530a_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l1879_c30_fc0a] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1879_c30_fc0a_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1879_c30_fc0a_ins;
     sp_relative_shift_uxn_opcodes_h_l1879_c30_fc0a_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1879_c30_fc0a_x;
     sp_relative_shift_uxn_opcodes_h_l1879_c30_fc0a_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1879_c30_fc0a_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1879_c30_fc0a_return_output := sp_relative_shift_uxn_opcodes_h_l1879_c30_fc0a_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1876_l1873_l1868_l1865_l1860_DUPLICATE_3431 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1876_l1873_l1868_l1865_l1860_DUPLICATE_3431_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1873_c11_f790] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1873_c11_f790_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_f790_left;
     BIN_OP_EQ_uxn_opcodes_h_l1873_c11_f790_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_f790_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_f790_return_output := BIN_OP_EQ_uxn_opcodes_h_l1873_c11_f790_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1860_c1_1759_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1860_c6_8cf6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1860_c2_5500_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1860_c6_8cf6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1860_c2_5500_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1860_c6_8cf6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1860_c2_5500_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1860_c6_8cf6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c2_5500_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1860_c6_8cf6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c2_5500_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1860_c6_8cf6_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1860_c2_5500_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1860_c6_8cf6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1860_c2_5500_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1860_c6_8cf6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1860_c2_5500_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1860_c6_8cf6_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1860_c2_5500_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1860_c6_8cf6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_4f42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c11_414d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1865_c7_4f42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c11_414d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_4f42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c11_414d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_4f42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c11_414d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_4f42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c11_414d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1865_c7_4f42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c11_414d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1865_c7_4f42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c11_414d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1865_c7_4f42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c11_414d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1865_c7_4f42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c11_414d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1868_c7_c6e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1868_c11_530a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1868_c7_c6e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1868_c11_530a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1868_c7_c6e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1868_c11_530a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1868_c7_c6e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1868_c11_530a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1868_c7_c6e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1868_c11_530a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1868_c7_c6e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1868_c11_530a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1868_c7_c6e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1868_c11_530a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1868_c7_c6e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1868_c11_530a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1868_c7_c6e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1868_c11_530a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_5b1c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_f790_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1873_c7_5b1c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_f790_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_5b1c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_f790_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_5b1c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_f790_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_5b1c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_f790_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1873_c7_5b1c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_f790_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1873_c7_5b1c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_f790_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1873_c7_5b1c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_f790_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1873_c7_5b1c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_f790_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1876_c7_e274_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1876_c11_b4c3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1876_c7_e274_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1876_c11_b4c3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1876_c7_e274_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1876_c11_b4c3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1876_c7_e274_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1876_c11_b4c3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1876_c7_e274_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1876_c11_b4c3_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1876_c7_e274_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1876_c11_b4c3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1876_c7_e274_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1876_c11_b4c3_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1876_c7_e274_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1876_c11_b4c3_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1876_c7_e274_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1876_c11_b4c3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_54e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1882_c11_0c15_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1882_c7_54e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1882_c11_0c15_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1882_c7_54e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1882_c11_0c15_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1882_c7_54e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1882_c11_0c15_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1882_c7_54e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1882_c11_0c15_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1882_c7_54e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1882_c11_0c15_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1882_c7_54e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1882_c11_0c15_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1886_c7_a074_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1886_c11_e5fb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1886_c7_a074_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1886_c11_e5fb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1886_c7_a074_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1886_c11_e5fb_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1886_c7_a074_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1886_c11_e5fb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1886_c7_a074_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1886_c11_e5fb_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1886_c7_a074_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1886_c11_e5fb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1891_c7_376e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1891_c11_5191_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1891_c7_376e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1891_c11_5191_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1891_c7_376e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1891_c11_5191_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1891_c7_376e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1891_c11_5191_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1891_c7_376e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1891_c11_5191_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1891_c7_376e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1891_c11_5191_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1894_c7_7ab8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1894_c11_d4bb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1894_c7_7ab8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1894_c11_d4bb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1894_c7_7ab8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1894_c11_d4bb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1894_c7_7ab8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1894_c11_d4bb_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1894_c7_7ab8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1894_c11_d4bb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1900_c7_e3c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1900_c11_39fc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1900_c7_e3c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1900_c11_39fc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1900_c7_e3c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1900_c11_39fc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1900_c7_e3c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1900_c11_39fc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1904_c7_7156_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1904_c11_d907_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1904_c7_7156_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1904_c11_d907_return_output;
     VAR_result_u16_value_uxn_opcodes_h_l1889_c3_4d61 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1889_c22_8adb_return_output, 16);
     VAR_result_u16_value_uxn_opcodes_h_l1892_c3_5e15 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1892_c22_0315_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l1877_c3_043f_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1877_l1869_DUPLICATE_05a1_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1870_c3_7213_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1877_l1869_DUPLICATE_05a1_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1895_c3_b484_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1887_l1895_DUPLICATE_27e9_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1888_c3_1f36_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1887_l1895_DUPLICATE_27e9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c2_5500_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1876_l1873_l1868_l1865_l1860_DUPLICATE_3431_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_4f42_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1876_l1873_l1868_l1865_l1860_DUPLICATE_3431_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1868_c7_c6e3_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1876_l1873_l1868_l1865_l1860_DUPLICATE_3431_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_5b1c_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1876_l1873_l1868_l1865_l1860_DUPLICATE_3431_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1876_c7_e274_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1876_l1873_l1868_l1865_l1860_DUPLICATE_3431_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1860_c2_5500_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1873_l1868_l1865_l1891_l1860_DUPLICATE_7129_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1865_c7_4f42_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1873_l1868_l1865_l1891_l1860_DUPLICATE_7129_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1868_c7_c6e3_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1873_l1868_l1865_l1891_l1860_DUPLICATE_7129_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1873_c7_5b1c_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1873_l1868_l1865_l1891_l1860_DUPLICATE_7129_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1891_c7_376e_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1873_l1868_l1865_l1891_l1860_DUPLICATE_7129_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_4f42_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1882_l1876_l1904_l1873_l1900_l1868_l1894_l1865_l1891_l1886_DUPLICATE_b9ed_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1868_c7_c6e3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1882_l1876_l1904_l1873_l1900_l1868_l1894_l1865_l1891_l1886_DUPLICATE_b9ed_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_5b1c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1882_l1876_l1904_l1873_l1900_l1868_l1894_l1865_l1891_l1886_DUPLICATE_b9ed_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1876_c7_e274_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1882_l1876_l1904_l1873_l1900_l1868_l1894_l1865_l1891_l1886_DUPLICATE_b9ed_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_54e2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1882_l1876_l1904_l1873_l1900_l1868_l1894_l1865_l1891_l1886_DUPLICATE_b9ed_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1886_c7_a074_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1882_l1876_l1904_l1873_l1900_l1868_l1894_l1865_l1891_l1886_DUPLICATE_b9ed_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1891_c7_376e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1882_l1876_l1904_l1873_l1900_l1868_l1894_l1865_l1891_l1886_DUPLICATE_b9ed_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1894_c7_7ab8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1882_l1876_l1904_l1873_l1900_l1868_l1894_l1865_l1891_l1886_DUPLICATE_b9ed_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1900_c7_e3c9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1882_l1876_l1904_l1873_l1900_l1868_l1894_l1865_l1891_l1886_DUPLICATE_b9ed_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1904_c7_7156_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1882_l1876_l1904_l1873_l1900_l1868_l1894_l1865_l1891_l1886_DUPLICATE_b9ed_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1860_c2_5500_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1882_l1873_l1868_l1865_l1860_DUPLICATE_fac2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1865_c7_4f42_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1882_l1873_l1868_l1865_l1860_DUPLICATE_fac2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1868_c7_c6e3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1882_l1873_l1868_l1865_l1860_DUPLICATE_fac2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1873_c7_5b1c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1882_l1873_l1868_l1865_l1860_DUPLICATE_fac2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1882_c7_54e2_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1882_l1873_l1868_l1865_l1860_DUPLICATE_fac2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1860_c2_5500_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1882_l1876_l1904_l1873_l1900_l1868_l1865_l1891_l1860_l1886_DUPLICATE_51b6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_4f42_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1882_l1876_l1904_l1873_l1900_l1868_l1865_l1891_l1860_l1886_DUPLICATE_51b6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1868_c7_c6e3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1882_l1876_l1904_l1873_l1900_l1868_l1865_l1891_l1860_l1886_DUPLICATE_51b6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_5b1c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1882_l1876_l1904_l1873_l1900_l1868_l1865_l1891_l1860_l1886_DUPLICATE_51b6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1876_c7_e274_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1882_l1876_l1904_l1873_l1900_l1868_l1865_l1891_l1860_l1886_DUPLICATE_51b6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1882_c7_54e2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1882_l1876_l1904_l1873_l1900_l1868_l1865_l1891_l1860_l1886_DUPLICATE_51b6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1886_c7_a074_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1882_l1876_l1904_l1873_l1900_l1868_l1865_l1891_l1860_l1886_DUPLICATE_51b6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1891_c7_376e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1882_l1876_l1904_l1873_l1900_l1868_l1865_l1891_l1860_l1886_DUPLICATE_51b6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1900_c7_e3c9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1882_l1876_l1904_l1873_l1900_l1868_l1865_l1891_l1860_l1886_DUPLICATE_51b6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1904_c7_7156_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1882_l1876_l1904_l1873_l1900_l1868_l1865_l1891_l1860_l1886_DUPLICATE_51b6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1876_c7_e274_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1882_l1876_l1900_l1891_l1886_DUPLICATE_e01e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1882_c7_54e2_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1882_l1876_l1900_l1891_l1886_DUPLICATE_e01e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1886_c7_a074_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1882_l1876_l1900_l1891_l1886_DUPLICATE_e01e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1891_c7_376e_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1882_l1876_l1900_l1891_l1886_DUPLICATE_e01e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1900_c7_e3c9_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1882_l1876_l1900_l1891_l1886_DUPLICATE_e01e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1860_c2_5500_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1882_l1876_l1873_l1900_l1868_l1865_l1891_l1860_l1886_DUPLICATE_1903_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1865_c7_4f42_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1882_l1876_l1873_l1900_l1868_l1865_l1891_l1860_l1886_DUPLICATE_1903_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1868_c7_c6e3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1882_l1876_l1873_l1900_l1868_l1865_l1891_l1860_l1886_DUPLICATE_1903_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1873_c7_5b1c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1882_l1876_l1873_l1900_l1868_l1865_l1891_l1860_l1886_DUPLICATE_1903_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1876_c7_e274_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1882_l1876_l1873_l1900_l1868_l1865_l1891_l1860_l1886_DUPLICATE_1903_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1882_c7_54e2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1882_l1876_l1873_l1900_l1868_l1865_l1891_l1860_l1886_DUPLICATE_1903_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1886_c7_a074_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1882_l1876_l1873_l1900_l1868_l1865_l1891_l1860_l1886_DUPLICATE_1903_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1891_c7_376e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1882_l1876_l1873_l1900_l1868_l1865_l1891_l1860_l1886_DUPLICATE_1903_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1900_c7_e3c9_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1882_l1876_l1873_l1900_l1868_l1865_l1891_l1860_l1886_DUPLICATE_1903_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1876_c7_e274_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1879_c30_fc0a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1886_c7_a074_iftrue := VAR_result_u16_value_uxn_opcodes_h_l1889_c3_4d61;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1891_c7_376e_iftrue := VAR_result_u16_value_uxn_opcodes_h_l1892_c3_5e15;
     -- BIN_OP_OR[uxn_opcodes_h_l1895_c3_b484] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1895_c3_b484_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1895_c3_b484_left;
     BIN_OP_OR_uxn_opcodes_h_l1895_c3_b484_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1895_c3_b484_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1895_c3_b484_return_output := BIN_OP_OR_uxn_opcodes_h_l1895_c3_b484_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1891_c7_376e] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1891_c7_376e_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1891_c7_376e_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1891_c7_376e_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1891_c7_376e_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1891_c7_376e_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1891_c7_376e_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1891_c7_376e_return_output := result_u16_value_MUX_uxn_opcodes_h_l1891_c7_376e_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1902_c21_6a44] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1902_c21_6a44_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1902_c31_878c_return_output);

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1900_c7_e3c9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1900_c7_e3c9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1900_c7_e3c9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1900_c7_e3c9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1900_c7_e3c9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1900_c7_e3c9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1900_c7_e3c9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1900_c7_e3c9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1900_c7_e3c9_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1882_c7_54e2] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1882_c7_54e2_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1882_c7_54e2_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1882_c7_54e2_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1882_c7_54e2_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1882_c7_54e2_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1882_c7_54e2_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1882_c7_54e2_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1882_c7_54e2_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1877_c3_043f] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1877_c3_043f_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1877_c3_043f_left;
     BIN_OP_OR_uxn_opcodes_h_l1877_c3_043f_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1877_c3_043f_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1877_c3_043f_return_output := BIN_OP_OR_uxn_opcodes_h_l1877_c3_043f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1904_c7_7156] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1904_c7_7156_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1904_c7_7156_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1904_c7_7156_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1904_c7_7156_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1904_c7_7156_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1904_c7_7156_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1904_c7_7156_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1904_c7_7156_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l1888_c3_1f36] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1888_c3_1f36_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1888_c3_1f36_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1888_c3_1f36_return_output := CONST_SL_8_uxn_opcodes_h_l1888_c3_1f36_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1904_c7_7156] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1904_c7_7156_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1904_c7_7156_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1904_c7_7156_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1904_c7_7156_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1904_c7_7156_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1904_c7_7156_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1904_c7_7156_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1904_c7_7156_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1876_c7_e274] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1876_c7_e274_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1876_c7_e274_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1876_c7_e274_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1876_c7_e274_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1876_c7_e274_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1876_c7_e274_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1876_c7_e274_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1876_c7_e274_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l1870_c3_7213] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1870_c3_7213_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1870_c3_7213_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1870_c3_7213_return_output := CONST_SL_8_uxn_opcodes_h_l1870_c3_7213_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1860_c1_1759] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1860_c1_1759_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1860_c1_1759_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1860_c1_1759_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1860_c1_1759_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1860_c1_1759_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1860_c1_1759_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1860_c1_1759_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1860_c1_1759_return_output;

     -- Submodule level 2
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1876_c7_e274_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1877_c3_043f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1876_c7_e274_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1877_c3_043f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1894_c7_7ab8_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1895_c3_b484_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1900_c7_e3c9_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1902_c21_6a44_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1868_c7_c6e3_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1870_c3_7213_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1886_c7_a074_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1888_c3_1f36_return_output;
     VAR_printf_uxn_opcodes_h_l1861_c3_d9b6_uxn_opcodes_h_l1861_c3_d9b6_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1860_c1_1759_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1900_c7_e3c9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1904_c7_7156_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1876_c7_e274_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1882_c7_54e2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1900_c7_e3c9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1904_c7_7156_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_5b1c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1876_c7_e274_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1894_c7_7ab8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1900_c7_e3c9_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1886_c7_a074_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1891_c7_376e_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l1886_c7_a074] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1886_c7_a074_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1886_c7_a074_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1886_c7_a074_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1886_c7_a074_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1886_c7_a074_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1886_c7_a074_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1886_c7_a074_return_output := result_u16_value_MUX_uxn_opcodes_h_l1886_c7_a074_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1873_c7_5b1c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_5b1c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_5b1c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_5b1c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_5b1c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_5b1c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_5b1c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_5b1c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_5b1c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1894_c7_7ab8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1894_c7_7ab8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1894_c7_7ab8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1894_c7_7ab8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1894_c7_7ab8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1894_c7_7ab8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1894_c7_7ab8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1894_c7_7ab8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1894_c7_7ab8_return_output;

     -- t16_MUX[uxn_opcodes_h_l1876_c7_e274] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1876_c7_e274_cond <= VAR_t16_MUX_uxn_opcodes_h_l1876_c7_e274_cond;
     t16_MUX_uxn_opcodes_h_l1876_c7_e274_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1876_c7_e274_iftrue;
     t16_MUX_uxn_opcodes_h_l1876_c7_e274_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1876_c7_e274_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1876_c7_e274_return_output := t16_MUX_uxn_opcodes_h_l1876_c7_e274_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1900_c7_e3c9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1900_c7_e3c9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1900_c7_e3c9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1900_c7_e3c9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1900_c7_e3c9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1900_c7_e3c9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1900_c7_e3c9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1900_c7_e3c9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1900_c7_e3c9_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1900_c7_e3c9] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1900_c7_e3c9_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1900_c7_e3c9_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1900_c7_e3c9_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1900_c7_e3c9_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1900_c7_e3c9_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1900_c7_e3c9_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1900_c7_e3c9_return_output := result_u8_value_MUX_uxn_opcodes_h_l1900_c7_e3c9_return_output;

     -- printf_uxn_opcodes_h_l1861_c3_d9b6[uxn_opcodes_h_l1861_c3_d9b6] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1861_c3_d9b6_uxn_opcodes_h_l1861_c3_d9b6_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1861_c3_d9b6_uxn_opcodes_h_l1861_c3_d9b6_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- tmp16_MUX[uxn_opcodes_h_l1894_c7_7ab8] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1894_c7_7ab8_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1894_c7_7ab8_cond;
     tmp16_MUX_uxn_opcodes_h_l1894_c7_7ab8_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1894_c7_7ab8_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1894_c7_7ab8_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1894_c7_7ab8_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1894_c7_7ab8_return_output := tmp16_MUX_uxn_opcodes_h_l1894_c7_7ab8_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1898_c21_47ed] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1898_c21_47ed_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_OR_uxn_opcodes_h_l1895_c3_b484_return_output);

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1876_c7_e274] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1876_c7_e274_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1876_c7_e274_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1876_c7_e274_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1876_c7_e274_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1876_c7_e274_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1876_c7_e274_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1876_c7_e274_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1876_c7_e274_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1900_c7_e3c9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1900_c7_e3c9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1900_c7_e3c9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1900_c7_e3c9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1900_c7_e3c9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1900_c7_e3c9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1900_c7_e3c9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1900_c7_e3c9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1900_c7_e3c9_return_output;

     -- Submodule level 3
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1894_c7_7ab8_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1898_c21_47ed_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1894_c7_7ab8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1900_c7_e3c9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1873_c7_5b1c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1876_c7_e274_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1894_c7_7ab8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1900_c7_e3c9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1868_c7_c6e3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_5b1c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1891_c7_376e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1894_c7_7ab8_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1882_c7_54e2_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1886_c7_a074_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1894_c7_7ab8_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1900_c7_e3c9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1873_c7_5b1c_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1876_c7_e274_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1891_c7_376e_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1894_c7_7ab8_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1894_c7_7ab8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1894_c7_7ab8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1894_c7_7ab8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1894_c7_7ab8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1894_c7_7ab8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1894_c7_7ab8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1894_c7_7ab8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1894_c7_7ab8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1894_c7_7ab8_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1894_c7_7ab8] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1894_c7_7ab8_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1894_c7_7ab8_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1894_c7_7ab8_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1894_c7_7ab8_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1894_c7_7ab8_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1894_c7_7ab8_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1894_c7_7ab8_return_output := result_u8_value_MUX_uxn_opcodes_h_l1894_c7_7ab8_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1868_c7_c6e3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1868_c7_c6e3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1868_c7_c6e3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1868_c7_c6e3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1868_c7_c6e3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1868_c7_c6e3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1868_c7_c6e3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1868_c7_c6e3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1868_c7_c6e3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1894_c7_7ab8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1894_c7_7ab8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1894_c7_7ab8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1894_c7_7ab8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1894_c7_7ab8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1894_c7_7ab8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1894_c7_7ab8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1894_c7_7ab8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1894_c7_7ab8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1891_c7_376e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1891_c7_376e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1891_c7_376e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1891_c7_376e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1891_c7_376e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1891_c7_376e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1891_c7_376e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1891_c7_376e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1891_c7_376e_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1891_c7_376e] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1891_c7_376e_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1891_c7_376e_cond;
     tmp16_MUX_uxn_opcodes_h_l1891_c7_376e_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1891_c7_376e_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1891_c7_376e_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1891_c7_376e_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1891_c7_376e_return_output := tmp16_MUX_uxn_opcodes_h_l1891_c7_376e_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1882_c7_54e2] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1882_c7_54e2_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1882_c7_54e2_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1882_c7_54e2_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1882_c7_54e2_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1882_c7_54e2_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1882_c7_54e2_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1882_c7_54e2_return_output := result_u16_value_MUX_uxn_opcodes_h_l1882_c7_54e2_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1873_c7_5b1c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1873_c7_5b1c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1873_c7_5b1c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1873_c7_5b1c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1873_c7_5b1c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1873_c7_5b1c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1873_c7_5b1c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1873_c7_5b1c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1873_c7_5b1c_return_output;

     -- t16_MUX[uxn_opcodes_h_l1873_c7_5b1c] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1873_c7_5b1c_cond <= VAR_t16_MUX_uxn_opcodes_h_l1873_c7_5b1c_cond;
     t16_MUX_uxn_opcodes_h_l1873_c7_5b1c_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1873_c7_5b1c_iftrue;
     t16_MUX_uxn_opcodes_h_l1873_c7_5b1c_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1873_c7_5b1c_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1873_c7_5b1c_return_output := t16_MUX_uxn_opcodes_h_l1873_c7_5b1c_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1891_c7_376e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1894_c7_7ab8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1868_c7_c6e3_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1873_c7_5b1c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1891_c7_376e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1894_c7_7ab8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_4f42_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1868_c7_c6e3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1886_c7_a074_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1891_c7_376e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1876_c7_e274_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1882_c7_54e2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1891_c7_376e_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1894_c7_7ab8_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1868_c7_c6e3_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1873_c7_5b1c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1886_c7_a074_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1891_c7_376e_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1886_c7_a074] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1886_c7_a074_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1886_c7_a074_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1886_c7_a074_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1886_c7_a074_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1886_c7_a074_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1886_c7_a074_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1886_c7_a074_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1886_c7_a074_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1876_c7_e274] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1876_c7_e274_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1876_c7_e274_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1876_c7_e274_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1876_c7_e274_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1876_c7_e274_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1876_c7_e274_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1876_c7_e274_return_output := result_u16_value_MUX_uxn_opcodes_h_l1876_c7_e274_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1891_c7_376e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1891_c7_376e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1891_c7_376e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1891_c7_376e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1891_c7_376e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1891_c7_376e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1891_c7_376e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1891_c7_376e_return_output := result_u8_value_MUX_uxn_opcodes_h_l1891_c7_376e_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1886_c7_a074] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1886_c7_a074_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1886_c7_a074_cond;
     tmp16_MUX_uxn_opcodes_h_l1886_c7_a074_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1886_c7_a074_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1886_c7_a074_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1886_c7_a074_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1886_c7_a074_return_output := tmp16_MUX_uxn_opcodes_h_l1886_c7_a074_return_output;

     -- t16_MUX[uxn_opcodes_h_l1868_c7_c6e3] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1868_c7_c6e3_cond <= VAR_t16_MUX_uxn_opcodes_h_l1868_c7_c6e3_cond;
     t16_MUX_uxn_opcodes_h_l1868_c7_c6e3_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1868_c7_c6e3_iftrue;
     t16_MUX_uxn_opcodes_h_l1868_c7_c6e3_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1868_c7_c6e3_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1868_c7_c6e3_return_output := t16_MUX_uxn_opcodes_h_l1868_c7_c6e3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1891_c7_376e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1891_c7_376e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1891_c7_376e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1891_c7_376e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1891_c7_376e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1891_c7_376e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1891_c7_376e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1891_c7_376e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1891_c7_376e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1891_c7_376e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1891_c7_376e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1891_c7_376e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1891_c7_376e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1891_c7_376e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1891_c7_376e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1891_c7_376e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1891_c7_376e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1891_c7_376e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1868_c7_c6e3] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1868_c7_c6e3_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1868_c7_c6e3_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1868_c7_c6e3_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1868_c7_c6e3_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1868_c7_c6e3_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1868_c7_c6e3_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1868_c7_c6e3_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1868_c7_c6e3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1865_c7_4f42] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_4f42_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_4f42_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_4f42_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_4f42_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_4f42_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_4f42_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_4f42_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_4f42_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1886_c7_a074_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1891_c7_376e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1865_c7_4f42_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1868_c7_c6e3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1886_c7_a074_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1891_c7_376e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c2_5500_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_4f42_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1882_c7_54e2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1886_c7_a074_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1873_c7_5b1c_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1876_c7_e274_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1886_c7_a074_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1891_c7_376e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1865_c7_4f42_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1868_c7_c6e3_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1882_c7_54e2_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1886_c7_a074_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1882_c7_54e2] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1882_c7_54e2_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1882_c7_54e2_cond;
     tmp16_MUX_uxn_opcodes_h_l1882_c7_54e2_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1882_c7_54e2_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1882_c7_54e2_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1882_c7_54e2_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1882_c7_54e2_return_output := tmp16_MUX_uxn_opcodes_h_l1882_c7_54e2_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1865_c7_4f42] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1865_c7_4f42_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1865_c7_4f42_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1865_c7_4f42_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1865_c7_4f42_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1865_c7_4f42_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1865_c7_4f42_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1865_c7_4f42_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1865_c7_4f42_return_output;

     -- t16_MUX[uxn_opcodes_h_l1865_c7_4f42] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1865_c7_4f42_cond <= VAR_t16_MUX_uxn_opcodes_h_l1865_c7_4f42_cond;
     t16_MUX_uxn_opcodes_h_l1865_c7_4f42_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1865_c7_4f42_iftrue;
     t16_MUX_uxn_opcodes_h_l1865_c7_4f42_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1865_c7_4f42_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1865_c7_4f42_return_output := t16_MUX_uxn_opcodes_h_l1865_c7_4f42_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1873_c7_5b1c] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1873_c7_5b1c_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1873_c7_5b1c_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1873_c7_5b1c_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1873_c7_5b1c_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1873_c7_5b1c_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1873_c7_5b1c_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1873_c7_5b1c_return_output := result_u16_value_MUX_uxn_opcodes_h_l1873_c7_5b1c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1886_c7_a074] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1886_c7_a074_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1886_c7_a074_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1886_c7_a074_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1886_c7_a074_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1886_c7_a074_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1886_c7_a074_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1886_c7_a074_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1886_c7_a074_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1886_c7_a074] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1886_c7_a074_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1886_c7_a074_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1886_c7_a074_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1886_c7_a074_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1886_c7_a074_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1886_c7_a074_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1886_c7_a074_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1886_c7_a074_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1886_c7_a074] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1886_c7_a074_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1886_c7_a074_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1886_c7_a074_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1886_c7_a074_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1886_c7_a074_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1886_c7_a074_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1886_c7_a074_return_output := result_u8_value_MUX_uxn_opcodes_h_l1886_c7_a074_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1882_c7_54e2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1882_c7_54e2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1882_c7_54e2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1882_c7_54e2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1882_c7_54e2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1882_c7_54e2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1882_c7_54e2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1882_c7_54e2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1882_c7_54e2_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1860_c2_5500] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c2_5500_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c2_5500_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c2_5500_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c2_5500_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c2_5500_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c2_5500_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c2_5500_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c2_5500_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_54e2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1886_c7_a074_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1860_c2_5500_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1865_c7_4f42_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1882_c7_54e2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1886_c7_a074_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1876_c7_e274_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1882_c7_54e2_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1868_c7_c6e3_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1873_c7_5b1c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1882_c7_54e2_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1886_c7_a074_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1860_c2_5500_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1865_c7_4f42_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1876_c7_e274_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1882_c7_54e2_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1860_c2_5500] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1860_c2_5500_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1860_c2_5500_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1860_c2_5500_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1860_c2_5500_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1860_c2_5500_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1860_c2_5500_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1860_c2_5500_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1860_c2_5500_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1882_c7_54e2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_54e2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_54e2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_54e2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_54e2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_54e2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_54e2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_54e2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_54e2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1876_c7_e274] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1876_c7_e274_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1876_c7_e274_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1876_c7_e274_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1876_c7_e274_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1876_c7_e274_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1876_c7_e274_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1876_c7_e274_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1876_c7_e274_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1882_c7_54e2] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1882_c7_54e2_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1882_c7_54e2_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1882_c7_54e2_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1882_c7_54e2_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1882_c7_54e2_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1882_c7_54e2_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1882_c7_54e2_return_output := result_u8_value_MUX_uxn_opcodes_h_l1882_c7_54e2_return_output;

     -- t16_MUX[uxn_opcodes_h_l1860_c2_5500] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1860_c2_5500_cond <= VAR_t16_MUX_uxn_opcodes_h_l1860_c2_5500_cond;
     t16_MUX_uxn_opcodes_h_l1860_c2_5500_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1860_c2_5500_iftrue;
     t16_MUX_uxn_opcodes_h_l1860_c2_5500_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1860_c2_5500_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1860_c2_5500_return_output := t16_MUX_uxn_opcodes_h_l1860_c2_5500_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1876_c7_e274] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1876_c7_e274_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1876_c7_e274_cond;
     tmp16_MUX_uxn_opcodes_h_l1876_c7_e274_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1876_c7_e274_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1876_c7_e274_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1876_c7_e274_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1876_c7_e274_return_output := tmp16_MUX_uxn_opcodes_h_l1876_c7_e274_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1868_c7_c6e3] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1868_c7_c6e3_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1868_c7_c6e3_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1868_c7_c6e3_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1868_c7_c6e3_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1868_c7_c6e3_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1868_c7_c6e3_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1868_c7_c6e3_return_output := result_u16_value_MUX_uxn_opcodes_h_l1868_c7_c6e3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1882_c7_54e2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1882_c7_54e2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1882_c7_54e2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1882_c7_54e2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1882_c7_54e2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1882_c7_54e2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1882_c7_54e2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1882_c7_54e2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1882_c7_54e2_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1876_c7_e274_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_54e2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1876_c7_e274_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1882_c7_54e2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_5b1c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1876_c7_e274_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1865_c7_4f42_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1868_c7_c6e3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1876_c7_e274_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1882_c7_54e2_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1860_c2_5500_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1873_c7_5b1c_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1876_c7_e274_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1876_c7_e274] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1876_c7_e274_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1876_c7_e274_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1876_c7_e274_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1876_c7_e274_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1876_c7_e274_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1876_c7_e274_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1876_c7_e274_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1876_c7_e274_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1865_c7_4f42] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1865_c7_4f42_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1865_c7_4f42_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1865_c7_4f42_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1865_c7_4f42_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1865_c7_4f42_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1865_c7_4f42_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1865_c7_4f42_return_output := result_u16_value_MUX_uxn_opcodes_h_l1865_c7_4f42_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1873_c7_5b1c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_5b1c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_5b1c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_5b1c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_5b1c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_5b1c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_5b1c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_5b1c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_5b1c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1876_c7_e274] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1876_c7_e274_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1876_c7_e274_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1876_c7_e274_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1876_c7_e274_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1876_c7_e274_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1876_c7_e274_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1876_c7_e274_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1876_c7_e274_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1876_c7_e274] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1876_c7_e274_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1876_c7_e274_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1876_c7_e274_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1876_c7_e274_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1876_c7_e274_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1876_c7_e274_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1876_c7_e274_return_output := result_u8_value_MUX_uxn_opcodes_h_l1876_c7_e274_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1873_c7_5b1c] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1873_c7_5b1c_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1873_c7_5b1c_cond;
     tmp16_MUX_uxn_opcodes_h_l1873_c7_5b1c_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1873_c7_5b1c_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1873_c7_5b1c_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1873_c7_5b1c_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1873_c7_5b1c_return_output := tmp16_MUX_uxn_opcodes_h_l1873_c7_5b1c_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_5b1c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1876_c7_e274_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_5b1c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1876_c7_e274_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1868_c7_c6e3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_5b1c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1860_c2_5500_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1865_c7_4f42_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1873_c7_5b1c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1876_c7_e274_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1868_c7_c6e3_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1873_c7_5b1c_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1873_c7_5b1c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_5b1c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_5b1c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_5b1c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_5b1c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_5b1c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_5b1c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_5b1c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_5b1c_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1868_c7_c6e3] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1868_c7_c6e3_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1868_c7_c6e3_cond;
     tmp16_MUX_uxn_opcodes_h_l1868_c7_c6e3_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1868_c7_c6e3_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1868_c7_c6e3_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1868_c7_c6e3_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1868_c7_c6e3_return_output := tmp16_MUX_uxn_opcodes_h_l1868_c7_c6e3_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1873_c7_5b1c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1873_c7_5b1c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1873_c7_5b1c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1873_c7_5b1c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1873_c7_5b1c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1873_c7_5b1c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1873_c7_5b1c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1873_c7_5b1c_return_output := result_u8_value_MUX_uxn_opcodes_h_l1873_c7_5b1c_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1860_c2_5500] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1860_c2_5500_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1860_c2_5500_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1860_c2_5500_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1860_c2_5500_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1860_c2_5500_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1860_c2_5500_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1860_c2_5500_return_output := result_u16_value_MUX_uxn_opcodes_h_l1860_c2_5500_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1868_c7_c6e3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1868_c7_c6e3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1868_c7_c6e3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1868_c7_c6e3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1868_c7_c6e3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1868_c7_c6e3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1868_c7_c6e3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1868_c7_c6e3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1868_c7_c6e3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1873_c7_5b1c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_5b1c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_5b1c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_5b1c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_5b1c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_5b1c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_5b1c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_5b1c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_5b1c_return_output;

     -- Submodule level 9
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1868_c7_c6e3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_5b1c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1868_c7_c6e3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_5b1c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_4f42_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1868_c7_c6e3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1868_c7_c6e3_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1873_c7_5b1c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1865_c7_4f42_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1868_c7_c6e3_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1865_c7_4f42] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1865_c7_4f42_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1865_c7_4f42_cond;
     tmp16_MUX_uxn_opcodes_h_l1865_c7_4f42_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1865_c7_4f42_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1865_c7_4f42_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1865_c7_4f42_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1865_c7_4f42_return_output := tmp16_MUX_uxn_opcodes_h_l1865_c7_4f42_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1868_c7_c6e3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1868_c7_c6e3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1868_c7_c6e3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1868_c7_c6e3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1868_c7_c6e3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1868_c7_c6e3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1868_c7_c6e3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1868_c7_c6e3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1868_c7_c6e3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1865_c7_4f42] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_4f42_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_4f42_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_4f42_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_4f42_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_4f42_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_4f42_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_4f42_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_4f42_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1868_c7_c6e3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1868_c7_c6e3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1868_c7_c6e3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1868_c7_c6e3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1868_c7_c6e3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1868_c7_c6e3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1868_c7_c6e3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1868_c7_c6e3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1868_c7_c6e3_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1868_c7_c6e3] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1868_c7_c6e3_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1868_c7_c6e3_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1868_c7_c6e3_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1868_c7_c6e3_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1868_c7_c6e3_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1868_c7_c6e3_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1868_c7_c6e3_return_output := result_u8_value_MUX_uxn_opcodes_h_l1868_c7_c6e3_return_output;

     -- Submodule level 10
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_4f42_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1868_c7_c6e3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_4f42_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1868_c7_c6e3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c2_5500_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_4f42_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1865_c7_4f42_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1868_c7_c6e3_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1860_c2_5500_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1865_c7_4f42_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1865_c7_4f42] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1865_c7_4f42_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1865_c7_4f42_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1865_c7_4f42_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1865_c7_4f42_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1865_c7_4f42_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1865_c7_4f42_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1865_c7_4f42_return_output := result_u8_value_MUX_uxn_opcodes_h_l1865_c7_4f42_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1865_c7_4f42] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_4f42_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_4f42_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_4f42_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_4f42_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_4f42_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_4f42_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_4f42_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_4f42_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1860_c2_5500] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c2_5500_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c2_5500_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c2_5500_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c2_5500_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c2_5500_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c2_5500_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c2_5500_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c2_5500_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1860_c2_5500] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1860_c2_5500_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1860_c2_5500_cond;
     tmp16_MUX_uxn_opcodes_h_l1860_c2_5500_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1860_c2_5500_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1860_c2_5500_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1860_c2_5500_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1860_c2_5500_return_output := tmp16_MUX_uxn_opcodes_h_l1860_c2_5500_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1865_c7_4f42] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_4f42_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_4f42_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_4f42_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_4f42_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_4f42_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_4f42_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_4f42_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_4f42_return_output;

     -- Submodule level 11
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1860_c2_5500_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_4f42_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1860_c2_5500_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_4f42_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1860_c2_5500_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1865_c7_4f42_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l1860_c2_5500_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1860_c2_5500] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1860_c2_5500_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1860_c2_5500_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1860_c2_5500_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1860_c2_5500_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1860_c2_5500_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1860_c2_5500_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1860_c2_5500_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1860_c2_5500_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1860_c2_5500] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1860_c2_5500_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1860_c2_5500_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1860_c2_5500_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1860_c2_5500_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1860_c2_5500_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1860_c2_5500_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1860_c2_5500_return_output := result_u8_value_MUX_uxn_opcodes_h_l1860_c2_5500_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1860_c2_5500] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1860_c2_5500_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1860_c2_5500_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1860_c2_5500_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1860_c2_5500_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1860_c2_5500_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1860_c2_5500_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1860_c2_5500_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1860_c2_5500_return_output;

     -- Submodule level 12
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_1a88_uxn_opcodes_h_l1909_l1856_DUPLICATE_2d7a LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1a88_uxn_opcodes_h_l1909_l1856_DUPLICATE_2d7a_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_1a88(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c2_5500_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1860_c2_5500_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c2_5500_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1860_c2_5500_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1860_c2_5500_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1860_c2_5500_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1860_c2_5500_return_output);

     -- Submodule level 13
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1a88_uxn_opcodes_h_l1909_l1856_DUPLICATE_2d7a_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1a88_uxn_opcodes_h_l1909_l1856_DUPLICATE_2d7a_return_output;
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
