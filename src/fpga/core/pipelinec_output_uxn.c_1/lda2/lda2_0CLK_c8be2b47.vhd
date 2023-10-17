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
-- BIN_OP_EQ[uxn_opcodes_h_l1860_c6_8071]
signal BIN_OP_EQ_uxn_opcodes_h_l1860_c6_8071_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1860_c6_8071_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1860_c6_8071_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1860_c1_d658]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1860_c1_d658_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1860_c1_d658_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1860_c1_d658_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1860_c1_d658_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1860_c2_b437]
signal tmp16_MUX_uxn_opcodes_h_l1860_c2_b437_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1860_c2_b437_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1860_c2_b437_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1860_c2_b437_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1860_c2_b437]
signal result_u8_value_MUX_uxn_opcodes_h_l1860_c2_b437_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1860_c2_b437_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1860_c2_b437_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1860_c2_b437_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1860_c2_b437]
signal result_u16_value_MUX_uxn_opcodes_h_l1860_c2_b437_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1860_c2_b437_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1860_c2_b437_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1860_c2_b437_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1860_c2_b437]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1860_c2_b437_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1860_c2_b437_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1860_c2_b437_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1860_c2_b437_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1860_c2_b437]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c2_b437_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c2_b437_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c2_b437_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c2_b437_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1860_c2_b437]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1860_c2_b437_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1860_c2_b437_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1860_c2_b437_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1860_c2_b437_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1860_c2_b437]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1860_c2_b437_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1860_c2_b437_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1860_c2_b437_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1860_c2_b437_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1860_c2_b437]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c2_b437_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c2_b437_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c2_b437_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c2_b437_return_output : unsigned(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l1860_c2_b437]
signal t16_MUX_uxn_opcodes_h_l1860_c2_b437_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1860_c2_b437_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1860_c2_b437_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1860_c2_b437_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l1861_c3_0c85[uxn_opcodes_h_l1861_c3_0c85]
signal printf_uxn_opcodes_h_l1861_c3_0c85_uxn_opcodes_h_l1861_c3_0c85_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1865_c11_2538]
signal BIN_OP_EQ_uxn_opcodes_h_l1865_c11_2538_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1865_c11_2538_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1865_c11_2538_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1865_c7_21b9]
signal tmp16_MUX_uxn_opcodes_h_l1865_c7_21b9_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1865_c7_21b9_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1865_c7_21b9_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1865_c7_21b9_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1865_c7_21b9]
signal result_u8_value_MUX_uxn_opcodes_h_l1865_c7_21b9_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1865_c7_21b9_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1865_c7_21b9_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1865_c7_21b9_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1865_c7_21b9]
signal result_u16_value_MUX_uxn_opcodes_h_l1865_c7_21b9_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1865_c7_21b9_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1865_c7_21b9_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1865_c7_21b9_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1865_c7_21b9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_21b9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_21b9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_21b9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_21b9_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1865_c7_21b9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_21b9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_21b9_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_21b9_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_21b9_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1865_c7_21b9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_21b9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_21b9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_21b9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_21b9_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1865_c7_21b9]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1865_c7_21b9_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1865_c7_21b9_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1865_c7_21b9_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1865_c7_21b9_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1865_c7_21b9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_21b9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_21b9_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_21b9_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_21b9_return_output : unsigned(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l1865_c7_21b9]
signal t16_MUX_uxn_opcodes_h_l1865_c7_21b9_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1865_c7_21b9_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1865_c7_21b9_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1865_c7_21b9_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1868_c11_2d11]
signal BIN_OP_EQ_uxn_opcodes_h_l1868_c11_2d11_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1868_c11_2d11_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1868_c11_2d11_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1868_c7_e198]
signal tmp16_MUX_uxn_opcodes_h_l1868_c7_e198_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1868_c7_e198_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1868_c7_e198_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1868_c7_e198_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1868_c7_e198]
signal result_u8_value_MUX_uxn_opcodes_h_l1868_c7_e198_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1868_c7_e198_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1868_c7_e198_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1868_c7_e198_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1868_c7_e198]
signal result_u16_value_MUX_uxn_opcodes_h_l1868_c7_e198_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1868_c7_e198_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1868_c7_e198_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1868_c7_e198_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1868_c7_e198]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1868_c7_e198_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1868_c7_e198_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1868_c7_e198_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1868_c7_e198_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1868_c7_e198]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1868_c7_e198_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1868_c7_e198_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1868_c7_e198_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1868_c7_e198_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1868_c7_e198]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1868_c7_e198_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1868_c7_e198_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1868_c7_e198_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1868_c7_e198_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1868_c7_e198]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1868_c7_e198_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1868_c7_e198_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1868_c7_e198_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1868_c7_e198_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1868_c7_e198]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1868_c7_e198_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1868_c7_e198_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1868_c7_e198_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1868_c7_e198_return_output : unsigned(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l1868_c7_e198]
signal t16_MUX_uxn_opcodes_h_l1868_c7_e198_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1868_c7_e198_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1868_c7_e198_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1868_c7_e198_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1870_c3_6de9]
signal CONST_SL_8_uxn_opcodes_h_l1870_c3_6de9_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1870_c3_6de9_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1873_c11_6762]
signal BIN_OP_EQ_uxn_opcodes_h_l1873_c11_6762_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1873_c11_6762_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1873_c11_6762_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1873_c7_0f34]
signal tmp16_MUX_uxn_opcodes_h_l1873_c7_0f34_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1873_c7_0f34_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1873_c7_0f34_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1873_c7_0f34_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1873_c7_0f34]
signal result_u8_value_MUX_uxn_opcodes_h_l1873_c7_0f34_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1873_c7_0f34_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1873_c7_0f34_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1873_c7_0f34_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1873_c7_0f34]
signal result_u16_value_MUX_uxn_opcodes_h_l1873_c7_0f34_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1873_c7_0f34_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1873_c7_0f34_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1873_c7_0f34_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1873_c7_0f34]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_0f34_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_0f34_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_0f34_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_0f34_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1873_c7_0f34]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_0f34_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_0f34_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_0f34_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_0f34_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1873_c7_0f34]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_0f34_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_0f34_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_0f34_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_0f34_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1873_c7_0f34]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1873_c7_0f34_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1873_c7_0f34_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1873_c7_0f34_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1873_c7_0f34_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1873_c7_0f34]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_0f34_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_0f34_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_0f34_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_0f34_return_output : unsigned(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l1873_c7_0f34]
signal t16_MUX_uxn_opcodes_h_l1873_c7_0f34_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1873_c7_0f34_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1873_c7_0f34_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1873_c7_0f34_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1876_c11_ebc7]
signal BIN_OP_EQ_uxn_opcodes_h_l1876_c11_ebc7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1876_c11_ebc7_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1876_c11_ebc7_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1876_c7_48b4]
signal tmp16_MUX_uxn_opcodes_h_l1876_c7_48b4_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1876_c7_48b4_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1876_c7_48b4_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1876_c7_48b4_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1876_c7_48b4]
signal result_u8_value_MUX_uxn_opcodes_h_l1876_c7_48b4_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1876_c7_48b4_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1876_c7_48b4_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1876_c7_48b4_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1876_c7_48b4]
signal result_u16_value_MUX_uxn_opcodes_h_l1876_c7_48b4_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1876_c7_48b4_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1876_c7_48b4_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1876_c7_48b4_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1876_c7_48b4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1876_c7_48b4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1876_c7_48b4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1876_c7_48b4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1876_c7_48b4_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1876_c7_48b4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1876_c7_48b4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1876_c7_48b4_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1876_c7_48b4_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1876_c7_48b4_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1876_c7_48b4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1876_c7_48b4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1876_c7_48b4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1876_c7_48b4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1876_c7_48b4_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1876_c7_48b4]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1876_c7_48b4_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1876_c7_48b4_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1876_c7_48b4_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1876_c7_48b4_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1876_c7_48b4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1876_c7_48b4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1876_c7_48b4_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1876_c7_48b4_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1876_c7_48b4_return_output : unsigned(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l1876_c7_48b4]
signal t16_MUX_uxn_opcodes_h_l1876_c7_48b4_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1876_c7_48b4_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1876_c7_48b4_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1876_c7_48b4_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1877_c3_9b94]
signal BIN_OP_OR_uxn_opcodes_h_l1877_c3_9b94_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1877_c3_9b94_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1877_c3_9b94_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1879_c30_74d8]
signal sp_relative_shift_uxn_opcodes_h_l1879_c30_74d8_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1879_c30_74d8_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1879_c30_74d8_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1879_c30_74d8_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1882_c11_0437]
signal BIN_OP_EQ_uxn_opcodes_h_l1882_c11_0437_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1882_c11_0437_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1882_c11_0437_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1882_c7_2a91]
signal tmp16_MUX_uxn_opcodes_h_l1882_c7_2a91_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1882_c7_2a91_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1882_c7_2a91_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1882_c7_2a91_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1882_c7_2a91]
signal result_u8_value_MUX_uxn_opcodes_h_l1882_c7_2a91_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1882_c7_2a91_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1882_c7_2a91_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1882_c7_2a91_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1882_c7_2a91]
signal result_u16_value_MUX_uxn_opcodes_h_l1882_c7_2a91_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1882_c7_2a91_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1882_c7_2a91_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1882_c7_2a91_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1882_c7_2a91]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_2a91_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_2a91_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_2a91_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_2a91_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1882_c7_2a91]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1882_c7_2a91_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1882_c7_2a91_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1882_c7_2a91_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1882_c7_2a91_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1882_c7_2a91]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1882_c7_2a91_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1882_c7_2a91_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1882_c7_2a91_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1882_c7_2a91_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1882_c7_2a91]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1882_c7_2a91_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1882_c7_2a91_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1882_c7_2a91_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1882_c7_2a91_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1886_c11_c25e]
signal BIN_OP_EQ_uxn_opcodes_h_l1886_c11_c25e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1886_c11_c25e_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1886_c11_c25e_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1886_c7_e3c1]
signal tmp16_MUX_uxn_opcodes_h_l1886_c7_e3c1_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1886_c7_e3c1_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1886_c7_e3c1_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1886_c7_e3c1_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1886_c7_e3c1]
signal result_u8_value_MUX_uxn_opcodes_h_l1886_c7_e3c1_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1886_c7_e3c1_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1886_c7_e3c1_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1886_c7_e3c1_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1886_c7_e3c1]
signal result_u16_value_MUX_uxn_opcodes_h_l1886_c7_e3c1_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1886_c7_e3c1_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1886_c7_e3c1_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1886_c7_e3c1_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1886_c7_e3c1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1886_c7_e3c1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1886_c7_e3c1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1886_c7_e3c1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1886_c7_e3c1_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1886_c7_e3c1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1886_c7_e3c1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1886_c7_e3c1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1886_c7_e3c1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1886_c7_e3c1_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1886_c7_e3c1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1886_c7_e3c1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1886_c7_e3c1_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1886_c7_e3c1_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1886_c7_e3c1_return_output : unsigned(3 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1888_c3_5e93]
signal CONST_SL_8_uxn_opcodes_h_l1888_c3_5e93_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1888_c3_5e93_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1889_c22_7de7]
signal BIN_OP_PLUS_uxn_opcodes_h_l1889_c22_7de7_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1889_c22_7de7_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1889_c22_7de7_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1891_c11_2fb7]
signal BIN_OP_EQ_uxn_opcodes_h_l1891_c11_2fb7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1891_c11_2fb7_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1891_c11_2fb7_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1891_c7_3839]
signal tmp16_MUX_uxn_opcodes_h_l1891_c7_3839_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1891_c7_3839_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1891_c7_3839_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1891_c7_3839_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1891_c7_3839]
signal result_u8_value_MUX_uxn_opcodes_h_l1891_c7_3839_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1891_c7_3839_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1891_c7_3839_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1891_c7_3839_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1891_c7_3839]
signal result_u16_value_MUX_uxn_opcodes_h_l1891_c7_3839_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1891_c7_3839_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1891_c7_3839_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1891_c7_3839_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1891_c7_3839]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1891_c7_3839_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1891_c7_3839_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1891_c7_3839_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1891_c7_3839_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1891_c7_3839]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1891_c7_3839_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1891_c7_3839_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1891_c7_3839_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1891_c7_3839_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1891_c7_3839]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1891_c7_3839_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1891_c7_3839_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1891_c7_3839_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1891_c7_3839_return_output : unsigned(3 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1892_c22_5eac]
signal BIN_OP_PLUS_uxn_opcodes_h_l1892_c22_5eac_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1892_c22_5eac_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1892_c22_5eac_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1894_c11_501e]
signal BIN_OP_EQ_uxn_opcodes_h_l1894_c11_501e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1894_c11_501e_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1894_c11_501e_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1894_c7_bbf0]
signal tmp16_MUX_uxn_opcodes_h_l1894_c7_bbf0_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1894_c7_bbf0_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1894_c7_bbf0_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1894_c7_bbf0_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1894_c7_bbf0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1894_c7_bbf0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1894_c7_bbf0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1894_c7_bbf0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1894_c7_bbf0_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1894_c7_bbf0]
signal result_u8_value_MUX_uxn_opcodes_h_l1894_c7_bbf0_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1894_c7_bbf0_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1894_c7_bbf0_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1894_c7_bbf0_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1894_c7_bbf0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1894_c7_bbf0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1894_c7_bbf0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1894_c7_bbf0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1894_c7_bbf0_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1894_c7_bbf0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1894_c7_bbf0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1894_c7_bbf0_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1894_c7_bbf0_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1894_c7_bbf0_return_output : unsigned(3 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1895_c3_2904]
signal BIN_OP_OR_uxn_opcodes_h_l1895_c3_2904_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1895_c3_2904_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1895_c3_2904_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1900_c11_ce6f]
signal BIN_OP_EQ_uxn_opcodes_h_l1900_c11_ce6f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1900_c11_ce6f_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1900_c11_ce6f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1900_c7_38b1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1900_c7_38b1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1900_c7_38b1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1900_c7_38b1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1900_c7_38b1_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1900_c7_38b1]
signal result_u8_value_MUX_uxn_opcodes_h_l1900_c7_38b1_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1900_c7_38b1_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1900_c7_38b1_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1900_c7_38b1_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1900_c7_38b1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1900_c7_38b1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1900_c7_38b1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1900_c7_38b1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1900_c7_38b1_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1900_c7_38b1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1900_c7_38b1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1900_c7_38b1_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1900_c7_38b1_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1900_c7_38b1_return_output : unsigned(3 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1902_c31_29d0]
signal CONST_SR_8_uxn_opcodes_h_l1902_c31_29d0_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1902_c31_29d0_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1904_c11_8543]
signal BIN_OP_EQ_uxn_opcodes_h_l1904_c11_8543_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1904_c11_8543_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1904_c11_8543_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1904_c7_d36a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1904_c7_d36a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1904_c7_d36a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1904_c7_d36a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1904_c7_d36a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1904_c7_d36a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1904_c7_d36a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1904_c7_d36a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1904_c7_d36a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1904_c7_d36a_return_output : unsigned(0 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_9969( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : signed;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.u8_value := ref_toks_1;
      base.u16_value := ref_toks_2;
      base.is_opc_done := ref_toks_3;
      base.sp_relative_shift := ref_toks_4;
      base.is_stack_write := ref_toks_5;
      base.is_sp_shift := ref_toks_6;
      base.stack_address_sp_offset := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1860_c6_8071
BIN_OP_EQ_uxn_opcodes_h_l1860_c6_8071 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1860_c6_8071_left,
BIN_OP_EQ_uxn_opcodes_h_l1860_c6_8071_right,
BIN_OP_EQ_uxn_opcodes_h_l1860_c6_8071_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1860_c1_d658
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1860_c1_d658 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1860_c1_d658_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1860_c1_d658_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1860_c1_d658_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1860_c1_d658_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1860_c2_b437
tmp16_MUX_uxn_opcodes_h_l1860_c2_b437 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1860_c2_b437_cond,
tmp16_MUX_uxn_opcodes_h_l1860_c2_b437_iftrue,
tmp16_MUX_uxn_opcodes_h_l1860_c2_b437_iffalse,
tmp16_MUX_uxn_opcodes_h_l1860_c2_b437_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1860_c2_b437
result_u8_value_MUX_uxn_opcodes_h_l1860_c2_b437 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1860_c2_b437_cond,
result_u8_value_MUX_uxn_opcodes_h_l1860_c2_b437_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1860_c2_b437_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1860_c2_b437_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1860_c2_b437
result_u16_value_MUX_uxn_opcodes_h_l1860_c2_b437 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1860_c2_b437_cond,
result_u16_value_MUX_uxn_opcodes_h_l1860_c2_b437_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1860_c2_b437_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1860_c2_b437_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1860_c2_b437
result_is_opc_done_MUX_uxn_opcodes_h_l1860_c2_b437 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1860_c2_b437_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1860_c2_b437_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1860_c2_b437_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1860_c2_b437_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c2_b437
result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c2_b437 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c2_b437_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c2_b437_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c2_b437_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c2_b437_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1860_c2_b437
result_is_stack_write_MUX_uxn_opcodes_h_l1860_c2_b437 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1860_c2_b437_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1860_c2_b437_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1860_c2_b437_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1860_c2_b437_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1860_c2_b437
result_is_sp_shift_MUX_uxn_opcodes_h_l1860_c2_b437 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1860_c2_b437_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1860_c2_b437_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1860_c2_b437_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1860_c2_b437_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c2_b437
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c2_b437 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c2_b437_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c2_b437_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c2_b437_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c2_b437_return_output);

-- t16_MUX_uxn_opcodes_h_l1860_c2_b437
t16_MUX_uxn_opcodes_h_l1860_c2_b437 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1860_c2_b437_cond,
t16_MUX_uxn_opcodes_h_l1860_c2_b437_iftrue,
t16_MUX_uxn_opcodes_h_l1860_c2_b437_iffalse,
t16_MUX_uxn_opcodes_h_l1860_c2_b437_return_output);

-- printf_uxn_opcodes_h_l1861_c3_0c85_uxn_opcodes_h_l1861_c3_0c85
printf_uxn_opcodes_h_l1861_c3_0c85_uxn_opcodes_h_l1861_c3_0c85 : entity work.printf_uxn_opcodes_h_l1861_c3_0c85_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1861_c3_0c85_uxn_opcodes_h_l1861_c3_0c85_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1865_c11_2538
BIN_OP_EQ_uxn_opcodes_h_l1865_c11_2538 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1865_c11_2538_left,
BIN_OP_EQ_uxn_opcodes_h_l1865_c11_2538_right,
BIN_OP_EQ_uxn_opcodes_h_l1865_c11_2538_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1865_c7_21b9
tmp16_MUX_uxn_opcodes_h_l1865_c7_21b9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1865_c7_21b9_cond,
tmp16_MUX_uxn_opcodes_h_l1865_c7_21b9_iftrue,
tmp16_MUX_uxn_opcodes_h_l1865_c7_21b9_iffalse,
tmp16_MUX_uxn_opcodes_h_l1865_c7_21b9_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1865_c7_21b9
result_u8_value_MUX_uxn_opcodes_h_l1865_c7_21b9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1865_c7_21b9_cond,
result_u8_value_MUX_uxn_opcodes_h_l1865_c7_21b9_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1865_c7_21b9_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1865_c7_21b9_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1865_c7_21b9
result_u16_value_MUX_uxn_opcodes_h_l1865_c7_21b9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1865_c7_21b9_cond,
result_u16_value_MUX_uxn_opcodes_h_l1865_c7_21b9_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1865_c7_21b9_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1865_c7_21b9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_21b9
result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_21b9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_21b9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_21b9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_21b9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_21b9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_21b9
result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_21b9 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_21b9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_21b9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_21b9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_21b9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_21b9
result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_21b9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_21b9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_21b9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_21b9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_21b9_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1865_c7_21b9
result_is_sp_shift_MUX_uxn_opcodes_h_l1865_c7_21b9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1865_c7_21b9_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1865_c7_21b9_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1865_c7_21b9_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1865_c7_21b9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_21b9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_21b9 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_21b9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_21b9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_21b9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_21b9_return_output);

-- t16_MUX_uxn_opcodes_h_l1865_c7_21b9
t16_MUX_uxn_opcodes_h_l1865_c7_21b9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1865_c7_21b9_cond,
t16_MUX_uxn_opcodes_h_l1865_c7_21b9_iftrue,
t16_MUX_uxn_opcodes_h_l1865_c7_21b9_iffalse,
t16_MUX_uxn_opcodes_h_l1865_c7_21b9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1868_c11_2d11
BIN_OP_EQ_uxn_opcodes_h_l1868_c11_2d11 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1868_c11_2d11_left,
BIN_OP_EQ_uxn_opcodes_h_l1868_c11_2d11_right,
BIN_OP_EQ_uxn_opcodes_h_l1868_c11_2d11_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1868_c7_e198
tmp16_MUX_uxn_opcodes_h_l1868_c7_e198 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1868_c7_e198_cond,
tmp16_MUX_uxn_opcodes_h_l1868_c7_e198_iftrue,
tmp16_MUX_uxn_opcodes_h_l1868_c7_e198_iffalse,
tmp16_MUX_uxn_opcodes_h_l1868_c7_e198_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1868_c7_e198
result_u8_value_MUX_uxn_opcodes_h_l1868_c7_e198 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1868_c7_e198_cond,
result_u8_value_MUX_uxn_opcodes_h_l1868_c7_e198_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1868_c7_e198_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1868_c7_e198_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1868_c7_e198
result_u16_value_MUX_uxn_opcodes_h_l1868_c7_e198 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1868_c7_e198_cond,
result_u16_value_MUX_uxn_opcodes_h_l1868_c7_e198_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1868_c7_e198_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1868_c7_e198_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1868_c7_e198
result_is_opc_done_MUX_uxn_opcodes_h_l1868_c7_e198 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1868_c7_e198_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1868_c7_e198_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1868_c7_e198_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1868_c7_e198_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1868_c7_e198
result_sp_relative_shift_MUX_uxn_opcodes_h_l1868_c7_e198 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1868_c7_e198_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1868_c7_e198_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1868_c7_e198_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1868_c7_e198_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1868_c7_e198
result_is_stack_write_MUX_uxn_opcodes_h_l1868_c7_e198 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1868_c7_e198_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1868_c7_e198_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1868_c7_e198_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1868_c7_e198_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1868_c7_e198
result_is_sp_shift_MUX_uxn_opcodes_h_l1868_c7_e198 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1868_c7_e198_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1868_c7_e198_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1868_c7_e198_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1868_c7_e198_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1868_c7_e198
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1868_c7_e198 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1868_c7_e198_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1868_c7_e198_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1868_c7_e198_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1868_c7_e198_return_output);

-- t16_MUX_uxn_opcodes_h_l1868_c7_e198
t16_MUX_uxn_opcodes_h_l1868_c7_e198 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1868_c7_e198_cond,
t16_MUX_uxn_opcodes_h_l1868_c7_e198_iftrue,
t16_MUX_uxn_opcodes_h_l1868_c7_e198_iffalse,
t16_MUX_uxn_opcodes_h_l1868_c7_e198_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1870_c3_6de9
CONST_SL_8_uxn_opcodes_h_l1870_c3_6de9 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1870_c3_6de9_x,
CONST_SL_8_uxn_opcodes_h_l1870_c3_6de9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1873_c11_6762
BIN_OP_EQ_uxn_opcodes_h_l1873_c11_6762 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1873_c11_6762_left,
BIN_OP_EQ_uxn_opcodes_h_l1873_c11_6762_right,
BIN_OP_EQ_uxn_opcodes_h_l1873_c11_6762_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1873_c7_0f34
tmp16_MUX_uxn_opcodes_h_l1873_c7_0f34 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1873_c7_0f34_cond,
tmp16_MUX_uxn_opcodes_h_l1873_c7_0f34_iftrue,
tmp16_MUX_uxn_opcodes_h_l1873_c7_0f34_iffalse,
tmp16_MUX_uxn_opcodes_h_l1873_c7_0f34_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1873_c7_0f34
result_u8_value_MUX_uxn_opcodes_h_l1873_c7_0f34 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1873_c7_0f34_cond,
result_u8_value_MUX_uxn_opcodes_h_l1873_c7_0f34_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1873_c7_0f34_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1873_c7_0f34_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1873_c7_0f34
result_u16_value_MUX_uxn_opcodes_h_l1873_c7_0f34 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1873_c7_0f34_cond,
result_u16_value_MUX_uxn_opcodes_h_l1873_c7_0f34_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1873_c7_0f34_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1873_c7_0f34_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_0f34
result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_0f34 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_0f34_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_0f34_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_0f34_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_0f34_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_0f34
result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_0f34 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_0f34_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_0f34_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_0f34_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_0f34_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_0f34
result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_0f34 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_0f34_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_0f34_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_0f34_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_0f34_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1873_c7_0f34
result_is_sp_shift_MUX_uxn_opcodes_h_l1873_c7_0f34 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1873_c7_0f34_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1873_c7_0f34_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1873_c7_0f34_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1873_c7_0f34_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_0f34
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_0f34 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_0f34_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_0f34_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_0f34_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_0f34_return_output);

-- t16_MUX_uxn_opcodes_h_l1873_c7_0f34
t16_MUX_uxn_opcodes_h_l1873_c7_0f34 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1873_c7_0f34_cond,
t16_MUX_uxn_opcodes_h_l1873_c7_0f34_iftrue,
t16_MUX_uxn_opcodes_h_l1873_c7_0f34_iffalse,
t16_MUX_uxn_opcodes_h_l1873_c7_0f34_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1876_c11_ebc7
BIN_OP_EQ_uxn_opcodes_h_l1876_c11_ebc7 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1876_c11_ebc7_left,
BIN_OP_EQ_uxn_opcodes_h_l1876_c11_ebc7_right,
BIN_OP_EQ_uxn_opcodes_h_l1876_c11_ebc7_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1876_c7_48b4
tmp16_MUX_uxn_opcodes_h_l1876_c7_48b4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1876_c7_48b4_cond,
tmp16_MUX_uxn_opcodes_h_l1876_c7_48b4_iftrue,
tmp16_MUX_uxn_opcodes_h_l1876_c7_48b4_iffalse,
tmp16_MUX_uxn_opcodes_h_l1876_c7_48b4_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1876_c7_48b4
result_u8_value_MUX_uxn_opcodes_h_l1876_c7_48b4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1876_c7_48b4_cond,
result_u8_value_MUX_uxn_opcodes_h_l1876_c7_48b4_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1876_c7_48b4_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1876_c7_48b4_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1876_c7_48b4
result_u16_value_MUX_uxn_opcodes_h_l1876_c7_48b4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1876_c7_48b4_cond,
result_u16_value_MUX_uxn_opcodes_h_l1876_c7_48b4_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1876_c7_48b4_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1876_c7_48b4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1876_c7_48b4
result_is_opc_done_MUX_uxn_opcodes_h_l1876_c7_48b4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1876_c7_48b4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1876_c7_48b4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1876_c7_48b4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1876_c7_48b4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1876_c7_48b4
result_sp_relative_shift_MUX_uxn_opcodes_h_l1876_c7_48b4 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1876_c7_48b4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1876_c7_48b4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1876_c7_48b4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1876_c7_48b4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1876_c7_48b4
result_is_stack_write_MUX_uxn_opcodes_h_l1876_c7_48b4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1876_c7_48b4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1876_c7_48b4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1876_c7_48b4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1876_c7_48b4_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1876_c7_48b4
result_is_sp_shift_MUX_uxn_opcodes_h_l1876_c7_48b4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1876_c7_48b4_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1876_c7_48b4_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1876_c7_48b4_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1876_c7_48b4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1876_c7_48b4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1876_c7_48b4 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1876_c7_48b4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1876_c7_48b4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1876_c7_48b4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1876_c7_48b4_return_output);

-- t16_MUX_uxn_opcodes_h_l1876_c7_48b4
t16_MUX_uxn_opcodes_h_l1876_c7_48b4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1876_c7_48b4_cond,
t16_MUX_uxn_opcodes_h_l1876_c7_48b4_iftrue,
t16_MUX_uxn_opcodes_h_l1876_c7_48b4_iffalse,
t16_MUX_uxn_opcodes_h_l1876_c7_48b4_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1877_c3_9b94
BIN_OP_OR_uxn_opcodes_h_l1877_c3_9b94 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1877_c3_9b94_left,
BIN_OP_OR_uxn_opcodes_h_l1877_c3_9b94_right,
BIN_OP_OR_uxn_opcodes_h_l1877_c3_9b94_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1879_c30_74d8
sp_relative_shift_uxn_opcodes_h_l1879_c30_74d8 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1879_c30_74d8_ins,
sp_relative_shift_uxn_opcodes_h_l1879_c30_74d8_x,
sp_relative_shift_uxn_opcodes_h_l1879_c30_74d8_y,
sp_relative_shift_uxn_opcodes_h_l1879_c30_74d8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1882_c11_0437
BIN_OP_EQ_uxn_opcodes_h_l1882_c11_0437 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1882_c11_0437_left,
BIN_OP_EQ_uxn_opcodes_h_l1882_c11_0437_right,
BIN_OP_EQ_uxn_opcodes_h_l1882_c11_0437_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1882_c7_2a91
tmp16_MUX_uxn_opcodes_h_l1882_c7_2a91 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1882_c7_2a91_cond,
tmp16_MUX_uxn_opcodes_h_l1882_c7_2a91_iftrue,
tmp16_MUX_uxn_opcodes_h_l1882_c7_2a91_iffalse,
tmp16_MUX_uxn_opcodes_h_l1882_c7_2a91_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1882_c7_2a91
result_u8_value_MUX_uxn_opcodes_h_l1882_c7_2a91 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1882_c7_2a91_cond,
result_u8_value_MUX_uxn_opcodes_h_l1882_c7_2a91_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1882_c7_2a91_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1882_c7_2a91_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1882_c7_2a91
result_u16_value_MUX_uxn_opcodes_h_l1882_c7_2a91 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1882_c7_2a91_cond,
result_u16_value_MUX_uxn_opcodes_h_l1882_c7_2a91_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1882_c7_2a91_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1882_c7_2a91_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_2a91
result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_2a91 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_2a91_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_2a91_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_2a91_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_2a91_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1882_c7_2a91
result_is_stack_write_MUX_uxn_opcodes_h_l1882_c7_2a91 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1882_c7_2a91_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1882_c7_2a91_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1882_c7_2a91_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1882_c7_2a91_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1882_c7_2a91
result_is_sp_shift_MUX_uxn_opcodes_h_l1882_c7_2a91 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1882_c7_2a91_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1882_c7_2a91_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1882_c7_2a91_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1882_c7_2a91_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1882_c7_2a91
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1882_c7_2a91 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1882_c7_2a91_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1882_c7_2a91_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1882_c7_2a91_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1882_c7_2a91_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1886_c11_c25e
BIN_OP_EQ_uxn_opcodes_h_l1886_c11_c25e : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1886_c11_c25e_left,
BIN_OP_EQ_uxn_opcodes_h_l1886_c11_c25e_right,
BIN_OP_EQ_uxn_opcodes_h_l1886_c11_c25e_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1886_c7_e3c1
tmp16_MUX_uxn_opcodes_h_l1886_c7_e3c1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1886_c7_e3c1_cond,
tmp16_MUX_uxn_opcodes_h_l1886_c7_e3c1_iftrue,
tmp16_MUX_uxn_opcodes_h_l1886_c7_e3c1_iffalse,
tmp16_MUX_uxn_opcodes_h_l1886_c7_e3c1_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1886_c7_e3c1
result_u8_value_MUX_uxn_opcodes_h_l1886_c7_e3c1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1886_c7_e3c1_cond,
result_u8_value_MUX_uxn_opcodes_h_l1886_c7_e3c1_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1886_c7_e3c1_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1886_c7_e3c1_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1886_c7_e3c1
result_u16_value_MUX_uxn_opcodes_h_l1886_c7_e3c1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1886_c7_e3c1_cond,
result_u16_value_MUX_uxn_opcodes_h_l1886_c7_e3c1_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1886_c7_e3c1_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1886_c7_e3c1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1886_c7_e3c1
result_is_opc_done_MUX_uxn_opcodes_h_l1886_c7_e3c1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1886_c7_e3c1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1886_c7_e3c1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1886_c7_e3c1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1886_c7_e3c1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1886_c7_e3c1
result_is_stack_write_MUX_uxn_opcodes_h_l1886_c7_e3c1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1886_c7_e3c1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1886_c7_e3c1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1886_c7_e3c1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1886_c7_e3c1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1886_c7_e3c1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1886_c7_e3c1 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1886_c7_e3c1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1886_c7_e3c1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1886_c7_e3c1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1886_c7_e3c1_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1888_c3_5e93
CONST_SL_8_uxn_opcodes_h_l1888_c3_5e93 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1888_c3_5e93_x,
CONST_SL_8_uxn_opcodes_h_l1888_c3_5e93_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1889_c22_7de7
BIN_OP_PLUS_uxn_opcodes_h_l1889_c22_7de7 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1889_c22_7de7_left,
BIN_OP_PLUS_uxn_opcodes_h_l1889_c22_7de7_right,
BIN_OP_PLUS_uxn_opcodes_h_l1889_c22_7de7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1891_c11_2fb7
BIN_OP_EQ_uxn_opcodes_h_l1891_c11_2fb7 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1891_c11_2fb7_left,
BIN_OP_EQ_uxn_opcodes_h_l1891_c11_2fb7_right,
BIN_OP_EQ_uxn_opcodes_h_l1891_c11_2fb7_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1891_c7_3839
tmp16_MUX_uxn_opcodes_h_l1891_c7_3839 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1891_c7_3839_cond,
tmp16_MUX_uxn_opcodes_h_l1891_c7_3839_iftrue,
tmp16_MUX_uxn_opcodes_h_l1891_c7_3839_iffalse,
tmp16_MUX_uxn_opcodes_h_l1891_c7_3839_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1891_c7_3839
result_u8_value_MUX_uxn_opcodes_h_l1891_c7_3839 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1891_c7_3839_cond,
result_u8_value_MUX_uxn_opcodes_h_l1891_c7_3839_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1891_c7_3839_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1891_c7_3839_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1891_c7_3839
result_u16_value_MUX_uxn_opcodes_h_l1891_c7_3839 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1891_c7_3839_cond,
result_u16_value_MUX_uxn_opcodes_h_l1891_c7_3839_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1891_c7_3839_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1891_c7_3839_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1891_c7_3839
result_is_opc_done_MUX_uxn_opcodes_h_l1891_c7_3839 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1891_c7_3839_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1891_c7_3839_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1891_c7_3839_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1891_c7_3839_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1891_c7_3839
result_is_stack_write_MUX_uxn_opcodes_h_l1891_c7_3839 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1891_c7_3839_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1891_c7_3839_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1891_c7_3839_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1891_c7_3839_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1891_c7_3839
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1891_c7_3839 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1891_c7_3839_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1891_c7_3839_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1891_c7_3839_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1891_c7_3839_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1892_c22_5eac
BIN_OP_PLUS_uxn_opcodes_h_l1892_c22_5eac : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1892_c22_5eac_left,
BIN_OP_PLUS_uxn_opcodes_h_l1892_c22_5eac_right,
BIN_OP_PLUS_uxn_opcodes_h_l1892_c22_5eac_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1894_c11_501e
BIN_OP_EQ_uxn_opcodes_h_l1894_c11_501e : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1894_c11_501e_left,
BIN_OP_EQ_uxn_opcodes_h_l1894_c11_501e_right,
BIN_OP_EQ_uxn_opcodes_h_l1894_c11_501e_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1894_c7_bbf0
tmp16_MUX_uxn_opcodes_h_l1894_c7_bbf0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1894_c7_bbf0_cond,
tmp16_MUX_uxn_opcodes_h_l1894_c7_bbf0_iftrue,
tmp16_MUX_uxn_opcodes_h_l1894_c7_bbf0_iffalse,
tmp16_MUX_uxn_opcodes_h_l1894_c7_bbf0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1894_c7_bbf0
result_is_stack_write_MUX_uxn_opcodes_h_l1894_c7_bbf0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1894_c7_bbf0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1894_c7_bbf0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1894_c7_bbf0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1894_c7_bbf0_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1894_c7_bbf0
result_u8_value_MUX_uxn_opcodes_h_l1894_c7_bbf0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1894_c7_bbf0_cond,
result_u8_value_MUX_uxn_opcodes_h_l1894_c7_bbf0_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1894_c7_bbf0_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1894_c7_bbf0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1894_c7_bbf0
result_is_opc_done_MUX_uxn_opcodes_h_l1894_c7_bbf0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1894_c7_bbf0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1894_c7_bbf0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1894_c7_bbf0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1894_c7_bbf0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1894_c7_bbf0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1894_c7_bbf0 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1894_c7_bbf0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1894_c7_bbf0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1894_c7_bbf0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1894_c7_bbf0_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1895_c3_2904
BIN_OP_OR_uxn_opcodes_h_l1895_c3_2904 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1895_c3_2904_left,
BIN_OP_OR_uxn_opcodes_h_l1895_c3_2904_right,
BIN_OP_OR_uxn_opcodes_h_l1895_c3_2904_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1900_c11_ce6f
BIN_OP_EQ_uxn_opcodes_h_l1900_c11_ce6f : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1900_c11_ce6f_left,
BIN_OP_EQ_uxn_opcodes_h_l1900_c11_ce6f_right,
BIN_OP_EQ_uxn_opcodes_h_l1900_c11_ce6f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1900_c7_38b1
result_is_stack_write_MUX_uxn_opcodes_h_l1900_c7_38b1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1900_c7_38b1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1900_c7_38b1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1900_c7_38b1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1900_c7_38b1_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1900_c7_38b1
result_u8_value_MUX_uxn_opcodes_h_l1900_c7_38b1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1900_c7_38b1_cond,
result_u8_value_MUX_uxn_opcodes_h_l1900_c7_38b1_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1900_c7_38b1_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1900_c7_38b1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1900_c7_38b1
result_is_opc_done_MUX_uxn_opcodes_h_l1900_c7_38b1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1900_c7_38b1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1900_c7_38b1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1900_c7_38b1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1900_c7_38b1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1900_c7_38b1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1900_c7_38b1 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1900_c7_38b1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1900_c7_38b1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1900_c7_38b1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1900_c7_38b1_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1902_c31_29d0
CONST_SR_8_uxn_opcodes_h_l1902_c31_29d0 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1902_c31_29d0_x,
CONST_SR_8_uxn_opcodes_h_l1902_c31_29d0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1904_c11_8543
BIN_OP_EQ_uxn_opcodes_h_l1904_c11_8543 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1904_c11_8543_left,
BIN_OP_EQ_uxn_opcodes_h_l1904_c11_8543_right,
BIN_OP_EQ_uxn_opcodes_h_l1904_c11_8543_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1904_c7_d36a
result_is_stack_write_MUX_uxn_opcodes_h_l1904_c7_d36a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1904_c7_d36a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1904_c7_d36a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1904_c7_d36a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1904_c7_d36a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1904_c7_d36a
result_is_opc_done_MUX_uxn_opcodes_h_l1904_c7_d36a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1904_c7_d36a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1904_c7_d36a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1904_c7_d36a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1904_c7_d36a_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1860_c6_8071_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1860_c1_d658_return_output,
 tmp16_MUX_uxn_opcodes_h_l1860_c2_b437_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1860_c2_b437_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1860_c2_b437_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1860_c2_b437_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c2_b437_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1860_c2_b437_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1860_c2_b437_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c2_b437_return_output,
 t16_MUX_uxn_opcodes_h_l1860_c2_b437_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1865_c11_2538_return_output,
 tmp16_MUX_uxn_opcodes_h_l1865_c7_21b9_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1865_c7_21b9_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1865_c7_21b9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_21b9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_21b9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_21b9_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1865_c7_21b9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_21b9_return_output,
 t16_MUX_uxn_opcodes_h_l1865_c7_21b9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1868_c11_2d11_return_output,
 tmp16_MUX_uxn_opcodes_h_l1868_c7_e198_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1868_c7_e198_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1868_c7_e198_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1868_c7_e198_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1868_c7_e198_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1868_c7_e198_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1868_c7_e198_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1868_c7_e198_return_output,
 t16_MUX_uxn_opcodes_h_l1868_c7_e198_return_output,
 CONST_SL_8_uxn_opcodes_h_l1870_c3_6de9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1873_c11_6762_return_output,
 tmp16_MUX_uxn_opcodes_h_l1873_c7_0f34_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1873_c7_0f34_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1873_c7_0f34_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_0f34_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_0f34_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_0f34_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1873_c7_0f34_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_0f34_return_output,
 t16_MUX_uxn_opcodes_h_l1873_c7_0f34_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1876_c11_ebc7_return_output,
 tmp16_MUX_uxn_opcodes_h_l1876_c7_48b4_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1876_c7_48b4_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1876_c7_48b4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1876_c7_48b4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1876_c7_48b4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1876_c7_48b4_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1876_c7_48b4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1876_c7_48b4_return_output,
 t16_MUX_uxn_opcodes_h_l1876_c7_48b4_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1877_c3_9b94_return_output,
 sp_relative_shift_uxn_opcodes_h_l1879_c30_74d8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1882_c11_0437_return_output,
 tmp16_MUX_uxn_opcodes_h_l1882_c7_2a91_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1882_c7_2a91_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1882_c7_2a91_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_2a91_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1882_c7_2a91_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1882_c7_2a91_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1882_c7_2a91_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1886_c11_c25e_return_output,
 tmp16_MUX_uxn_opcodes_h_l1886_c7_e3c1_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1886_c7_e3c1_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1886_c7_e3c1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1886_c7_e3c1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1886_c7_e3c1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1886_c7_e3c1_return_output,
 CONST_SL_8_uxn_opcodes_h_l1888_c3_5e93_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1889_c22_7de7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1891_c11_2fb7_return_output,
 tmp16_MUX_uxn_opcodes_h_l1891_c7_3839_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1891_c7_3839_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1891_c7_3839_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1891_c7_3839_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1891_c7_3839_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1891_c7_3839_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1892_c22_5eac_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1894_c11_501e_return_output,
 tmp16_MUX_uxn_opcodes_h_l1894_c7_bbf0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1894_c7_bbf0_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1894_c7_bbf0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1894_c7_bbf0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1894_c7_bbf0_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1895_c3_2904_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1900_c11_ce6f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1900_c7_38b1_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1900_c7_38b1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1900_c7_38b1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1900_c7_38b1_return_output,
 CONST_SR_8_uxn_opcodes_h_l1902_c31_29d0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1904_c11_8543_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1904_c7_d36a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1904_c7_d36a_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1860_c6_8071_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1860_c6_8071_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1860_c6_8071_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1860_c1_d658_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1860_c1_d658_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1860_c1_d658_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1860_c1_d658_iffalse : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1860_c2_b437_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1860_c2_b437_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1865_c7_21b9_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1860_c2_b437_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1860_c2_b437_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1860_c2_b437_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1860_c2_b437_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1865_c7_21b9_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1860_c2_b437_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1860_c2_b437_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1860_c2_b437_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1860_c2_b437_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1865_c7_21b9_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1860_c2_b437_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1860_c2_b437_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1860_c2_b437_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1860_c2_b437_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_21b9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1860_c2_b437_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1860_c2_b437_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c2_b437_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c2_b437_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_21b9_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c2_b437_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c2_b437_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1860_c2_b437_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1860_c2_b437_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_21b9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1860_c2_b437_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1860_c2_b437_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1860_c2_b437_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1860_c2_b437_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1865_c7_21b9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1860_c2_b437_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1860_c2_b437_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c2_b437_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1862_c3_98ec : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c2_b437_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_21b9_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c2_b437_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c2_b437_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1860_c2_b437_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1860_c2_b437_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1865_c7_21b9_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1860_c2_b437_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1860_c2_b437_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1861_c3_0c85_uxn_opcodes_h_l1861_c3_0c85_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c11_2538_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c11_2538_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c11_2538_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1865_c7_21b9_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1865_c7_21b9_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1868_c7_e198_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1865_c7_21b9_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1865_c7_21b9_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1865_c7_21b9_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1868_c7_e198_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1865_c7_21b9_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1865_c7_21b9_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1865_c7_21b9_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1868_c7_e198_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1865_c7_21b9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_21b9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_21b9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1868_c7_e198_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_21b9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_21b9_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_21b9_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1868_c7_e198_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_21b9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_21b9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_21b9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1868_c7_e198_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_21b9_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1865_c7_21b9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1865_c7_21b9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1868_c7_e198_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1865_c7_21b9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_21b9_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1866_c3_6755 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_21b9_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1868_c7_e198_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_21b9_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1865_c7_21b9_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1865_c7_21b9_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1868_c7_e198_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1865_c7_21b9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1868_c11_2d11_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1868_c11_2d11_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1868_c11_2d11_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1868_c7_e198_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1868_c7_e198_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1873_c7_0f34_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1868_c7_e198_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1868_c7_e198_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1868_c7_e198_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1873_c7_0f34_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1868_c7_e198_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1868_c7_e198_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1868_c7_e198_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1873_c7_0f34_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1868_c7_e198_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1868_c7_e198_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1868_c7_e198_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_0f34_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1868_c7_e198_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1868_c7_e198_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1868_c7_e198_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_0f34_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1868_c7_e198_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1868_c7_e198_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1868_c7_e198_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_0f34_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1868_c7_e198_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1868_c7_e198_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1868_c7_e198_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1873_c7_0f34_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1868_c7_e198_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1868_c7_e198_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1871_c3_1bb3 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1868_c7_e198_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_0f34_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1868_c7_e198_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1868_c7_e198_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1868_c7_e198_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1873_c7_0f34_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1868_c7_e198_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1870_c3_6de9_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1870_c3_6de9_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_6762_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_6762_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_6762_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1873_c7_0f34_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1873_c7_0f34_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1876_c7_48b4_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1873_c7_0f34_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1873_c7_0f34_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1873_c7_0f34_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1876_c7_48b4_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1873_c7_0f34_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1873_c7_0f34_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1873_c7_0f34_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1876_c7_48b4_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1873_c7_0f34_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_0f34_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_0f34_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1876_c7_48b4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_0f34_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_0f34_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_0f34_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1876_c7_48b4_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_0f34_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_0f34_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_0f34_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1876_c7_48b4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_0f34_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1873_c7_0f34_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1873_c7_0f34_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1876_c7_48b4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1873_c7_0f34_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_0f34_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1874_c3_205b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_0f34_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1876_c7_48b4_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_0f34_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1873_c7_0f34_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1873_c7_0f34_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1876_c7_48b4_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1873_c7_0f34_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1876_c11_ebc7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1876_c11_ebc7_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1876_c11_ebc7_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1876_c7_48b4_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1876_c7_48b4_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1882_c7_2a91_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1876_c7_48b4_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1876_c7_48b4_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1876_c7_48b4_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1882_c7_2a91_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1876_c7_48b4_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1876_c7_48b4_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1876_c7_48b4_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1882_c7_2a91_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1876_c7_48b4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1876_c7_48b4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1876_c7_48b4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_2a91_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1876_c7_48b4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1876_c7_48b4_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1876_c7_48b4_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1876_c7_48b4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1876_c7_48b4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1876_c7_48b4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1882_c7_2a91_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1876_c7_48b4_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1876_c7_48b4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1876_c7_48b4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1882_c7_2a91_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1876_c7_48b4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1876_c7_48b4_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1876_c7_48b4_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1882_c7_2a91_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1876_c7_48b4_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1876_c7_48b4_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1876_c7_48b4_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1876_c7_48b4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1877_c3_9b94_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1877_c3_9b94_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1877_c3_9b94_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1879_c30_74d8_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1879_c30_74d8_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1879_c30_74d8_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1879_c30_74d8_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1882_c11_0437_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1882_c11_0437_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1882_c11_0437_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1882_c7_2a91_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1882_c7_2a91_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1886_c7_e3c1_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1882_c7_2a91_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1882_c7_2a91_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1882_c7_2a91_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1886_c7_e3c1_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1882_c7_2a91_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1882_c7_2a91_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1882_c7_2a91_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1886_c7_e3c1_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1882_c7_2a91_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_2a91_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_2a91_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1886_c7_e3c1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_2a91_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1882_c7_2a91_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1882_c7_2a91_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1886_c7_e3c1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1882_c7_2a91_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1882_c7_2a91_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1882_c7_2a91_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1882_c7_2a91_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1882_c7_2a91_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1882_c7_2a91_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1886_c7_e3c1_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1882_c7_2a91_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1886_c11_c25e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1886_c11_c25e_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1886_c11_c25e_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1886_c7_e3c1_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1886_c7_e3c1_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1891_c7_3839_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1886_c7_e3c1_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1886_c7_e3c1_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1886_c7_e3c1_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1891_c7_3839_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1886_c7_e3c1_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1886_c7_e3c1_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l1889_c3_18d0 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1886_c7_e3c1_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1891_c7_3839_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1886_c7_e3c1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1886_c7_e3c1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1886_c7_e3c1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1891_c7_3839_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1886_c7_e3c1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1886_c7_e3c1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1886_c7_e3c1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1891_c7_3839_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1886_c7_e3c1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1886_c7_e3c1_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1886_c7_e3c1_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1891_c7_3839_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1886_c7_e3c1_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1888_c3_5e93_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1888_c3_5e93_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1889_c22_7de7_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1889_c22_7de7_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1889_c22_7de7_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1891_c11_2fb7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1891_c11_2fb7_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1891_c11_2fb7_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1891_c7_3839_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1891_c7_3839_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1894_c7_bbf0_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1891_c7_3839_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1891_c7_3839_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1891_c7_3839_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1894_c7_bbf0_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1891_c7_3839_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1891_c7_3839_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l1892_c3_4640 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1891_c7_3839_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1891_c7_3839_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1891_c7_3839_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1891_c7_3839_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1894_c7_bbf0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1891_c7_3839_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1891_c7_3839_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1891_c7_3839_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1894_c7_bbf0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1891_c7_3839_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1891_c7_3839_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1891_c7_3839_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1894_c7_bbf0_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1891_c7_3839_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1892_c22_5eac_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1892_c22_5eac_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1892_c22_5eac_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1894_c11_501e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1894_c11_501e_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1894_c11_501e_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1894_c7_bbf0_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1894_c7_bbf0_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1894_c7_bbf0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1894_c7_bbf0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1894_c7_bbf0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1900_c7_38b1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1894_c7_bbf0_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1894_c7_bbf0_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1894_c7_bbf0_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1900_c7_38b1_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1894_c7_bbf0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1894_c7_bbf0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1894_c7_bbf0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1900_c7_38b1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1894_c7_bbf0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1894_c7_bbf0_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1897_c3_d8da : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1894_c7_bbf0_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1900_c7_38b1_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1894_c7_bbf0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1895_c3_2904_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1895_c3_2904_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1895_c3_2904_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1898_c21_521a_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1900_c11_ce6f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1900_c11_ce6f_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1900_c11_ce6f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1900_c7_38b1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1900_c7_38b1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1904_c7_d36a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1900_c7_38b1_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1900_c7_38b1_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1900_c7_38b1_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1900_c7_38b1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1900_c7_38b1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1900_c7_38b1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1904_c7_d36a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1900_c7_38b1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1900_c7_38b1_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1901_c3_fe6a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1900_c7_38b1_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1900_c7_38b1_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1902_c31_29d0_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1902_c31_29d0_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1902_c21_d34f_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1904_c11_8543_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1904_c11_8543_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1904_c11_8543_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1904_c7_d36a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1904_c7_d36a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1904_c7_d36a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1904_c7_d36a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1904_c7_d36a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1904_c7_d36a_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1891_l1860_l1886_l1882_l1876_l1873_l1900_l1868_l1865_DUPLICATE_921c_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1891_l1860_l1873_l1868_l1865_DUPLICATE_521e_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1860_l1876_l1873_l1868_l1865_DUPLICATE_e830_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1891_l1860_l1886_l1882_l1876_l1904_l1873_l1900_l1868_l1865_DUPLICATE_99e6_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1860_l1882_l1873_l1868_l1865_DUPLICATE_ef8a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1891_l1886_l1882_l1876_l1904_l1873_l1900_l1868_l1894_l1865_DUPLICATE_10a4_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1877_l1869_DUPLICATE_8b25_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1891_l1886_l1882_l1876_l1900_DUPLICATE_781d_return_output : unsigned(3 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1895_l1887_DUPLICATE_b4b1_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_9969_uxn_opcodes_h_l1909_l1856_DUPLICATE_3a92_return_output : opcode_result_t;
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
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1894_c7_bbf0_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1897_c3_d8da := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1894_c7_bbf0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1897_c3_d8da;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1866_c3_6755 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_21b9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1866_c3_6755;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1904_c11_8543_right := to_unsigned(10, 4);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1889_c22_7de7_right := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1904_c7_d36a_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1876_c7_48b4_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1868_c11_2d11_right := to_unsigned(2, 2);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1860_c1_d658_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1886_c11_c25e_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1894_c11_501e_right := to_unsigned(8, 4);
     VAR_sp_relative_shift_uxn_opcodes_h_l1879_c30_74d8_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1862_c3_98ec := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c2_b437_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1862_c3_98ec;
     VAR_sp_relative_shift_uxn_opcodes_h_l1879_c30_74d8_y := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_6762_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1901_c3_fe6a := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1900_c7_38b1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1901_c3_fe6a;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1892_c22_5eac_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1891_c11_2fb7_right := to_unsigned(7, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1860_c2_b437_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1882_c7_2a91_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1876_c11_ebc7_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1900_c11_ce6f_right := to_unsigned(9, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1874_c3_205b := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_0f34_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1874_c3_205b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1860_c6_8071_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1882_c11_0437_right := to_unsigned(5, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1904_c7_d36a_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1871_c3_1bb3 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1868_c7_e198_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1871_c3_1bb3;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c11_2538_right := to_unsigned(1, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1860_c1_d658_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l1879_c30_74d8_ins := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1860_c6_8071_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c11_2538_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1868_c11_2d11_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_6762_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1876_c11_ebc7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1882_c11_0437_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1886_c11_c25e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1891_c11_2fb7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1894_c11_501e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1900_c11_ce6f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1904_c11_8543_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1877_c3_9b94_left := t16;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1889_c22_7de7_left := t16;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1892_c22_5eac_left := t16;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1882_c7_2a91_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1860_c2_b437_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1865_c7_21b9_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1873_c7_0f34_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1876_c7_48b4_iffalse := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1895_c3_2904_left := tmp16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1902_c31_29d0_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1860_c2_b437_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1865_c7_21b9_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1868_c7_e198_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1873_c7_0f34_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1876_c7_48b4_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1882_c7_2a91_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1891_c7_3839_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1894_c7_bbf0_iffalse := tmp16;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1860_l1882_l1873_l1868_l1865_DUPLICATE_ef8a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1860_l1882_l1873_l1868_l1865_DUPLICATE_ef8a_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1891_l1886_l1882_l1876_l1900_DUPLICATE_781d LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1891_l1886_l1882_l1876_l1900_DUPLICATE_781d_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1891_l1860_l1886_l1882_l1876_l1873_l1900_l1868_l1865_DUPLICATE_921c LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1891_l1860_l1886_l1882_l1876_l1873_l1900_l1868_l1865_DUPLICATE_921c_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1904_c11_8543] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1904_c11_8543_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1904_c11_8543_left;
     BIN_OP_EQ_uxn_opcodes_h_l1904_c11_8543_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1904_c11_8543_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1904_c11_8543_return_output := BIN_OP_EQ_uxn_opcodes_h_l1904_c11_8543_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1891_c11_2fb7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1891_c11_2fb7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1891_c11_2fb7_left;
     BIN_OP_EQ_uxn_opcodes_h_l1891_c11_2fb7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1891_c11_2fb7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1891_c11_2fb7_return_output := BIN_OP_EQ_uxn_opcodes_h_l1891_c11_2fb7_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1860_l1876_l1873_l1868_l1865_DUPLICATE_e830 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1860_l1876_l1873_l1868_l1865_DUPLICATE_e830_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1868_c11_2d11] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1868_c11_2d11_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1868_c11_2d11_left;
     BIN_OP_EQ_uxn_opcodes_h_l1868_c11_2d11_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1868_c11_2d11_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1868_c11_2d11_return_output := BIN_OP_EQ_uxn_opcodes_h_l1868_c11_2d11_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1882_c11_0437] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1882_c11_0437_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1882_c11_0437_left;
     BIN_OP_EQ_uxn_opcodes_h_l1882_c11_0437_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1882_c11_0437_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1882_c11_0437_return_output := BIN_OP_EQ_uxn_opcodes_h_l1882_c11_0437_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l1879_c30_74d8] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1879_c30_74d8_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1879_c30_74d8_ins;
     sp_relative_shift_uxn_opcodes_h_l1879_c30_74d8_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1879_c30_74d8_x;
     sp_relative_shift_uxn_opcodes_h_l1879_c30_74d8_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1879_c30_74d8_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1879_c30_74d8_return_output := sp_relative_shift_uxn_opcodes_h_l1879_c30_74d8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1865_c11_2538] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1865_c11_2538_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c11_2538_left;
     BIN_OP_EQ_uxn_opcodes_h_l1865_c11_2538_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c11_2538_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c11_2538_return_output := BIN_OP_EQ_uxn_opcodes_h_l1865_c11_2538_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1900_c11_ce6f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1900_c11_ce6f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1900_c11_ce6f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1900_c11_ce6f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1900_c11_ce6f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1900_c11_ce6f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1900_c11_ce6f_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1891_l1860_l1886_l1882_l1876_l1904_l1873_l1900_l1868_l1865_DUPLICATE_99e6 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1891_l1860_l1886_l1882_l1876_l1904_l1873_l1900_l1868_l1865_DUPLICATE_99e6_return_output := result.is_stack_write;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1895_l1887_DUPLICATE_b4b1 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1895_l1887_DUPLICATE_b4b1_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- BIN_OP_PLUS[uxn_opcodes_h_l1892_c22_5eac] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1892_c22_5eac_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1892_c22_5eac_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1892_c22_5eac_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1892_c22_5eac_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1892_c22_5eac_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1892_c22_5eac_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l1902_c31_29d0] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1902_c31_29d0_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1902_c31_29d0_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1902_c31_29d0_return_output := CONST_SR_8_uxn_opcodes_h_l1902_c31_29d0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1894_c11_501e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1894_c11_501e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1894_c11_501e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1894_c11_501e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1894_c11_501e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1894_c11_501e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1894_c11_501e_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1891_l1886_l1882_l1876_l1904_l1873_l1900_l1868_l1894_l1865_DUPLICATE_10a4 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1891_l1886_l1882_l1876_l1904_l1873_l1900_l1868_l1894_l1865_DUPLICATE_10a4_return_output := result.is_opc_done;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1877_l1869_DUPLICATE_8b25 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1877_l1869_DUPLICATE_8b25_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1891_l1860_l1873_l1868_l1865_DUPLICATE_521e LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1891_l1860_l1873_l1868_l1865_DUPLICATE_521e_return_output := result.u16_value;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1889_c22_7de7] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1889_c22_7de7_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1889_c22_7de7_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1889_c22_7de7_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1889_c22_7de7_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1889_c22_7de7_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1889_c22_7de7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1876_c11_ebc7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1876_c11_ebc7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1876_c11_ebc7_left;
     BIN_OP_EQ_uxn_opcodes_h_l1876_c11_ebc7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1876_c11_ebc7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1876_c11_ebc7_return_output := BIN_OP_EQ_uxn_opcodes_h_l1876_c11_ebc7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1873_c11_6762] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1873_c11_6762_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_6762_left;
     BIN_OP_EQ_uxn_opcodes_h_l1873_c11_6762_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_6762_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_6762_return_output := BIN_OP_EQ_uxn_opcodes_h_l1873_c11_6762_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1860_c6_8071] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1860_c6_8071_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1860_c6_8071_left;
     BIN_OP_EQ_uxn_opcodes_h_l1860_c6_8071_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1860_c6_8071_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1860_c6_8071_return_output := BIN_OP_EQ_uxn_opcodes_h_l1860_c6_8071_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1886_c11_c25e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1886_c11_c25e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1886_c11_c25e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1886_c11_c25e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1886_c11_c25e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1886_c11_c25e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1886_c11_c25e_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1860_c1_d658_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1860_c6_8071_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1860_c2_b437_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1860_c6_8071_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1860_c2_b437_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1860_c6_8071_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1860_c2_b437_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1860_c6_8071_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c2_b437_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1860_c6_8071_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c2_b437_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1860_c6_8071_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1860_c2_b437_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1860_c6_8071_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1860_c2_b437_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1860_c6_8071_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1860_c2_b437_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1860_c6_8071_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1860_c2_b437_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1860_c6_8071_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_21b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c11_2538_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1865_c7_21b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c11_2538_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_21b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c11_2538_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_21b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c11_2538_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_21b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c11_2538_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1865_c7_21b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c11_2538_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1865_c7_21b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c11_2538_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1865_c7_21b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c11_2538_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1865_c7_21b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c11_2538_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1868_c7_e198_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1868_c11_2d11_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1868_c7_e198_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1868_c11_2d11_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1868_c7_e198_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1868_c11_2d11_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1868_c7_e198_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1868_c11_2d11_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1868_c7_e198_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1868_c11_2d11_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1868_c7_e198_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1868_c11_2d11_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1868_c7_e198_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1868_c11_2d11_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1868_c7_e198_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1868_c11_2d11_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1868_c7_e198_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1868_c11_2d11_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_0f34_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_6762_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1873_c7_0f34_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_6762_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_0f34_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_6762_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_0f34_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_6762_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_0f34_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_6762_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1873_c7_0f34_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_6762_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1873_c7_0f34_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_6762_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1873_c7_0f34_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_6762_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1873_c7_0f34_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_6762_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1876_c7_48b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1876_c11_ebc7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1876_c7_48b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1876_c11_ebc7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1876_c7_48b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1876_c11_ebc7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1876_c7_48b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1876_c11_ebc7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1876_c7_48b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1876_c11_ebc7_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1876_c7_48b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1876_c11_ebc7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1876_c7_48b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1876_c11_ebc7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1876_c7_48b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1876_c11_ebc7_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1876_c7_48b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1876_c11_ebc7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_2a91_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1882_c11_0437_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1882_c7_2a91_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1882_c11_0437_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1882_c7_2a91_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1882_c11_0437_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1882_c7_2a91_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1882_c11_0437_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1882_c7_2a91_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1882_c11_0437_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1882_c7_2a91_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1882_c11_0437_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1882_c7_2a91_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1882_c11_0437_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1886_c7_e3c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1886_c11_c25e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1886_c7_e3c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1886_c11_c25e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1886_c7_e3c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1886_c11_c25e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1886_c7_e3c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1886_c11_c25e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1886_c7_e3c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1886_c11_c25e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1886_c7_e3c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1886_c11_c25e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1891_c7_3839_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1891_c11_2fb7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1891_c7_3839_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1891_c11_2fb7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1891_c7_3839_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1891_c11_2fb7_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1891_c7_3839_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1891_c11_2fb7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1891_c7_3839_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1891_c11_2fb7_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1891_c7_3839_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1891_c11_2fb7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1894_c7_bbf0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1894_c11_501e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1894_c7_bbf0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1894_c11_501e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1894_c7_bbf0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1894_c11_501e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1894_c7_bbf0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1894_c11_501e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1894_c7_bbf0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1894_c11_501e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1900_c7_38b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1900_c11_ce6f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1900_c7_38b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1900_c11_ce6f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1900_c7_38b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1900_c11_ce6f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1900_c7_38b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1900_c11_ce6f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1904_c7_d36a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1904_c11_8543_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1904_c7_d36a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1904_c11_8543_return_output;
     VAR_result_u16_value_uxn_opcodes_h_l1889_c3_18d0 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1889_c22_7de7_return_output, 16);
     VAR_result_u16_value_uxn_opcodes_h_l1892_c3_4640 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1892_c22_5eac_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l1877_c3_9b94_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1877_l1869_DUPLICATE_8b25_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1870_c3_6de9_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1877_l1869_DUPLICATE_8b25_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1895_c3_2904_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1895_l1887_DUPLICATE_b4b1_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1888_c3_5e93_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1895_l1887_DUPLICATE_b4b1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c2_b437_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1860_l1876_l1873_l1868_l1865_DUPLICATE_e830_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_21b9_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1860_l1876_l1873_l1868_l1865_DUPLICATE_e830_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1868_c7_e198_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1860_l1876_l1873_l1868_l1865_DUPLICATE_e830_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_0f34_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1860_l1876_l1873_l1868_l1865_DUPLICATE_e830_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1876_c7_48b4_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1860_l1876_l1873_l1868_l1865_DUPLICATE_e830_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1860_c2_b437_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1891_l1860_l1873_l1868_l1865_DUPLICATE_521e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1865_c7_21b9_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1891_l1860_l1873_l1868_l1865_DUPLICATE_521e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1868_c7_e198_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1891_l1860_l1873_l1868_l1865_DUPLICATE_521e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1873_c7_0f34_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1891_l1860_l1873_l1868_l1865_DUPLICATE_521e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1891_c7_3839_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1891_l1860_l1873_l1868_l1865_DUPLICATE_521e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_21b9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1891_l1886_l1882_l1876_l1904_l1873_l1900_l1868_l1894_l1865_DUPLICATE_10a4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1868_c7_e198_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1891_l1886_l1882_l1876_l1904_l1873_l1900_l1868_l1894_l1865_DUPLICATE_10a4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_0f34_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1891_l1886_l1882_l1876_l1904_l1873_l1900_l1868_l1894_l1865_DUPLICATE_10a4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1876_c7_48b4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1891_l1886_l1882_l1876_l1904_l1873_l1900_l1868_l1894_l1865_DUPLICATE_10a4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_2a91_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1891_l1886_l1882_l1876_l1904_l1873_l1900_l1868_l1894_l1865_DUPLICATE_10a4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1886_c7_e3c1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1891_l1886_l1882_l1876_l1904_l1873_l1900_l1868_l1894_l1865_DUPLICATE_10a4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1891_c7_3839_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1891_l1886_l1882_l1876_l1904_l1873_l1900_l1868_l1894_l1865_DUPLICATE_10a4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1894_c7_bbf0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1891_l1886_l1882_l1876_l1904_l1873_l1900_l1868_l1894_l1865_DUPLICATE_10a4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1900_c7_38b1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1891_l1886_l1882_l1876_l1904_l1873_l1900_l1868_l1894_l1865_DUPLICATE_10a4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1904_c7_d36a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1891_l1886_l1882_l1876_l1904_l1873_l1900_l1868_l1894_l1865_DUPLICATE_10a4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1860_c2_b437_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1860_l1882_l1873_l1868_l1865_DUPLICATE_ef8a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1865_c7_21b9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1860_l1882_l1873_l1868_l1865_DUPLICATE_ef8a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1868_c7_e198_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1860_l1882_l1873_l1868_l1865_DUPLICATE_ef8a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1873_c7_0f34_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1860_l1882_l1873_l1868_l1865_DUPLICATE_ef8a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1882_c7_2a91_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1860_l1882_l1873_l1868_l1865_DUPLICATE_ef8a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1860_c2_b437_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1891_l1860_l1886_l1882_l1876_l1904_l1873_l1900_l1868_l1865_DUPLICATE_99e6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_21b9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1891_l1860_l1886_l1882_l1876_l1904_l1873_l1900_l1868_l1865_DUPLICATE_99e6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1868_c7_e198_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1891_l1860_l1886_l1882_l1876_l1904_l1873_l1900_l1868_l1865_DUPLICATE_99e6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_0f34_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1891_l1860_l1886_l1882_l1876_l1904_l1873_l1900_l1868_l1865_DUPLICATE_99e6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1876_c7_48b4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1891_l1860_l1886_l1882_l1876_l1904_l1873_l1900_l1868_l1865_DUPLICATE_99e6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1882_c7_2a91_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1891_l1860_l1886_l1882_l1876_l1904_l1873_l1900_l1868_l1865_DUPLICATE_99e6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1886_c7_e3c1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1891_l1860_l1886_l1882_l1876_l1904_l1873_l1900_l1868_l1865_DUPLICATE_99e6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1891_c7_3839_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1891_l1860_l1886_l1882_l1876_l1904_l1873_l1900_l1868_l1865_DUPLICATE_99e6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1900_c7_38b1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1891_l1860_l1886_l1882_l1876_l1904_l1873_l1900_l1868_l1865_DUPLICATE_99e6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1904_c7_d36a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1891_l1860_l1886_l1882_l1876_l1904_l1873_l1900_l1868_l1865_DUPLICATE_99e6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1876_c7_48b4_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1891_l1886_l1882_l1876_l1900_DUPLICATE_781d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1882_c7_2a91_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1891_l1886_l1882_l1876_l1900_DUPLICATE_781d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1886_c7_e3c1_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1891_l1886_l1882_l1876_l1900_DUPLICATE_781d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1891_c7_3839_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1891_l1886_l1882_l1876_l1900_DUPLICATE_781d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1900_c7_38b1_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1891_l1886_l1882_l1876_l1900_DUPLICATE_781d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1860_c2_b437_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1891_l1860_l1886_l1882_l1876_l1873_l1900_l1868_l1865_DUPLICATE_921c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1865_c7_21b9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1891_l1860_l1886_l1882_l1876_l1873_l1900_l1868_l1865_DUPLICATE_921c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1868_c7_e198_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1891_l1860_l1886_l1882_l1876_l1873_l1900_l1868_l1865_DUPLICATE_921c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1873_c7_0f34_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1891_l1860_l1886_l1882_l1876_l1873_l1900_l1868_l1865_DUPLICATE_921c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1876_c7_48b4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1891_l1860_l1886_l1882_l1876_l1873_l1900_l1868_l1865_DUPLICATE_921c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1882_c7_2a91_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1891_l1860_l1886_l1882_l1876_l1873_l1900_l1868_l1865_DUPLICATE_921c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1886_c7_e3c1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1891_l1860_l1886_l1882_l1876_l1873_l1900_l1868_l1865_DUPLICATE_921c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1891_c7_3839_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1891_l1860_l1886_l1882_l1876_l1873_l1900_l1868_l1865_DUPLICATE_921c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1900_c7_38b1_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1891_l1860_l1886_l1882_l1876_l1873_l1900_l1868_l1865_DUPLICATE_921c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1876_c7_48b4_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1879_c30_74d8_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1886_c7_e3c1_iftrue := VAR_result_u16_value_uxn_opcodes_h_l1889_c3_18d0;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1891_c7_3839_iftrue := VAR_result_u16_value_uxn_opcodes_h_l1892_c3_4640;
     -- BIN_OP_OR[uxn_opcodes_h_l1895_c3_2904] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1895_c3_2904_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1895_c3_2904_left;
     BIN_OP_OR_uxn_opcodes_h_l1895_c3_2904_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1895_c3_2904_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1895_c3_2904_return_output := BIN_OP_OR_uxn_opcodes_h_l1895_c3_2904_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1876_c7_48b4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1876_c7_48b4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1876_c7_48b4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1876_c7_48b4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1876_c7_48b4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1876_c7_48b4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1876_c7_48b4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1876_c7_48b4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1876_c7_48b4_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1877_c3_9b94] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1877_c3_9b94_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1877_c3_9b94_left;
     BIN_OP_OR_uxn_opcodes_h_l1877_c3_9b94_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1877_c3_9b94_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1877_c3_9b94_return_output := BIN_OP_OR_uxn_opcodes_h_l1877_c3_9b94_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1882_c7_2a91] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1882_c7_2a91_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1882_c7_2a91_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1882_c7_2a91_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1882_c7_2a91_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1882_c7_2a91_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1882_c7_2a91_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1882_c7_2a91_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1882_c7_2a91_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l1870_c3_6de9] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1870_c3_6de9_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1870_c3_6de9_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1870_c3_6de9_return_output := CONST_SL_8_uxn_opcodes_h_l1870_c3_6de9_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1891_c7_3839] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1891_c7_3839_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1891_c7_3839_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1891_c7_3839_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1891_c7_3839_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1891_c7_3839_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1891_c7_3839_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1891_c7_3839_return_output := result_u16_value_MUX_uxn_opcodes_h_l1891_c7_3839_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1860_c1_d658] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1860_c1_d658_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1860_c1_d658_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1860_c1_d658_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1860_c1_d658_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1860_c1_d658_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1860_c1_d658_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1860_c1_d658_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1860_c1_d658_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l1888_c3_5e93] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1888_c3_5e93_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1888_c3_5e93_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1888_c3_5e93_return_output := CONST_SL_8_uxn_opcodes_h_l1888_c3_5e93_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1904_c7_d36a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1904_c7_d36a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1904_c7_d36a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1904_c7_d36a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1904_c7_d36a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1904_c7_d36a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1904_c7_d36a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1904_c7_d36a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1904_c7_d36a_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1902_c21_d34f] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1902_c21_d34f_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1902_c31_29d0_return_output);

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1904_c7_d36a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1904_c7_d36a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1904_c7_d36a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1904_c7_d36a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1904_c7_d36a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1904_c7_d36a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1904_c7_d36a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1904_c7_d36a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1904_c7_d36a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1900_c7_38b1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1900_c7_38b1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1900_c7_38b1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1900_c7_38b1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1900_c7_38b1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1900_c7_38b1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1900_c7_38b1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1900_c7_38b1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1900_c7_38b1_return_output;

     -- Submodule level 2
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1876_c7_48b4_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1877_c3_9b94_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1876_c7_48b4_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1877_c3_9b94_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1894_c7_bbf0_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1895_c3_2904_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1900_c7_38b1_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1902_c21_d34f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1868_c7_e198_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1870_c3_6de9_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1886_c7_e3c1_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1888_c3_5e93_return_output;
     VAR_printf_uxn_opcodes_h_l1861_c3_0c85_uxn_opcodes_h_l1861_c3_0c85_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1860_c1_d658_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1900_c7_38b1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1904_c7_d36a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1876_c7_48b4_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1882_c7_2a91_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1900_c7_38b1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1904_c7_d36a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_0f34_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1876_c7_48b4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1894_c7_bbf0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1900_c7_38b1_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1886_c7_e3c1_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1891_c7_3839_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1894_c7_bbf0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1894_c7_bbf0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1894_c7_bbf0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1894_c7_bbf0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1894_c7_bbf0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1894_c7_bbf0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1894_c7_bbf0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1894_c7_bbf0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1894_c7_bbf0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1900_c7_38b1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1900_c7_38b1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1900_c7_38b1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1900_c7_38b1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1900_c7_38b1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1900_c7_38b1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1900_c7_38b1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1900_c7_38b1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1900_c7_38b1_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1900_c7_38b1] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1900_c7_38b1_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1900_c7_38b1_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1900_c7_38b1_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1900_c7_38b1_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1900_c7_38b1_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1900_c7_38b1_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1900_c7_38b1_return_output := result_u8_value_MUX_uxn_opcodes_h_l1900_c7_38b1_return_output;

     -- t16_MUX[uxn_opcodes_h_l1876_c7_48b4] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1876_c7_48b4_cond <= VAR_t16_MUX_uxn_opcodes_h_l1876_c7_48b4_cond;
     t16_MUX_uxn_opcodes_h_l1876_c7_48b4_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1876_c7_48b4_iftrue;
     t16_MUX_uxn_opcodes_h_l1876_c7_48b4_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1876_c7_48b4_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1876_c7_48b4_return_output := t16_MUX_uxn_opcodes_h_l1876_c7_48b4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1873_c7_0f34] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_0f34_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_0f34_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_0f34_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_0f34_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_0f34_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_0f34_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_0f34_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_0f34_return_output;

     -- printf_uxn_opcodes_h_l1861_c3_0c85[uxn_opcodes_h_l1861_c3_0c85] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1861_c3_0c85_uxn_opcodes_h_l1861_c3_0c85_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1861_c3_0c85_uxn_opcodes_h_l1861_c3_0c85_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1876_c7_48b4] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1876_c7_48b4_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1876_c7_48b4_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1876_c7_48b4_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1876_c7_48b4_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1876_c7_48b4_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1876_c7_48b4_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1876_c7_48b4_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1876_c7_48b4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1900_c7_38b1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1900_c7_38b1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1900_c7_38b1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1900_c7_38b1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1900_c7_38b1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1900_c7_38b1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1900_c7_38b1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1900_c7_38b1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1900_c7_38b1_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1894_c7_bbf0] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1894_c7_bbf0_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1894_c7_bbf0_cond;
     tmp16_MUX_uxn_opcodes_h_l1894_c7_bbf0_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1894_c7_bbf0_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1894_c7_bbf0_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1894_c7_bbf0_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1894_c7_bbf0_return_output := tmp16_MUX_uxn_opcodes_h_l1894_c7_bbf0_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1898_c21_521a] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1898_c21_521a_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_OR_uxn_opcodes_h_l1895_c3_2904_return_output);

     -- result_u16_value_MUX[uxn_opcodes_h_l1886_c7_e3c1] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1886_c7_e3c1_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1886_c7_e3c1_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1886_c7_e3c1_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1886_c7_e3c1_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1886_c7_e3c1_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1886_c7_e3c1_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1886_c7_e3c1_return_output := result_u16_value_MUX_uxn_opcodes_h_l1886_c7_e3c1_return_output;

     -- Submodule level 3
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1894_c7_bbf0_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1898_c21_521a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1894_c7_bbf0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1900_c7_38b1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1873_c7_0f34_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1876_c7_48b4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1894_c7_bbf0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1900_c7_38b1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1868_c7_e198_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_0f34_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1891_c7_3839_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1894_c7_bbf0_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1882_c7_2a91_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1886_c7_e3c1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1894_c7_bbf0_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1900_c7_38b1_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1873_c7_0f34_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1876_c7_48b4_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1891_c7_3839_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1894_c7_bbf0_return_output;
     -- t16_MUX[uxn_opcodes_h_l1873_c7_0f34] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1873_c7_0f34_cond <= VAR_t16_MUX_uxn_opcodes_h_l1873_c7_0f34_cond;
     t16_MUX_uxn_opcodes_h_l1873_c7_0f34_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1873_c7_0f34_iftrue;
     t16_MUX_uxn_opcodes_h_l1873_c7_0f34_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1873_c7_0f34_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1873_c7_0f34_return_output := t16_MUX_uxn_opcodes_h_l1873_c7_0f34_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1894_c7_bbf0] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1894_c7_bbf0_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1894_c7_bbf0_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1894_c7_bbf0_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1894_c7_bbf0_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1894_c7_bbf0_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1894_c7_bbf0_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1894_c7_bbf0_return_output := result_u8_value_MUX_uxn_opcodes_h_l1894_c7_bbf0_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1882_c7_2a91] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1882_c7_2a91_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1882_c7_2a91_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1882_c7_2a91_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1882_c7_2a91_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1882_c7_2a91_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1882_c7_2a91_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1882_c7_2a91_return_output := result_u16_value_MUX_uxn_opcodes_h_l1882_c7_2a91_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1891_c7_3839] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1891_c7_3839_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1891_c7_3839_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1891_c7_3839_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1891_c7_3839_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1891_c7_3839_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1891_c7_3839_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1891_c7_3839_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1891_c7_3839_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1891_c7_3839] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1891_c7_3839_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1891_c7_3839_cond;
     tmp16_MUX_uxn_opcodes_h_l1891_c7_3839_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1891_c7_3839_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1891_c7_3839_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1891_c7_3839_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1891_c7_3839_return_output := tmp16_MUX_uxn_opcodes_h_l1891_c7_3839_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1894_c7_bbf0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1894_c7_bbf0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1894_c7_bbf0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1894_c7_bbf0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1894_c7_bbf0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1894_c7_bbf0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1894_c7_bbf0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1894_c7_bbf0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1894_c7_bbf0_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1873_c7_0f34] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1873_c7_0f34_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1873_c7_0f34_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1873_c7_0f34_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1873_c7_0f34_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1873_c7_0f34_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1873_c7_0f34_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1873_c7_0f34_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1873_c7_0f34_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1868_c7_e198] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1868_c7_e198_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1868_c7_e198_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1868_c7_e198_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1868_c7_e198_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1868_c7_e198_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1868_c7_e198_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1868_c7_e198_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1868_c7_e198_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1894_c7_bbf0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1894_c7_bbf0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1894_c7_bbf0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1894_c7_bbf0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1894_c7_bbf0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1894_c7_bbf0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1894_c7_bbf0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1894_c7_bbf0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1894_c7_bbf0_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1891_c7_3839_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1894_c7_bbf0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1868_c7_e198_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1873_c7_0f34_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1891_c7_3839_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1894_c7_bbf0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_21b9_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1868_c7_e198_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1886_c7_e3c1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1891_c7_3839_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1876_c7_48b4_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1882_c7_2a91_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1891_c7_3839_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1894_c7_bbf0_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1868_c7_e198_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1873_c7_0f34_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1886_c7_e3c1_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1891_c7_3839_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1891_c7_3839] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1891_c7_3839_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1891_c7_3839_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1891_c7_3839_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1891_c7_3839_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1891_c7_3839_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1891_c7_3839_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1891_c7_3839_return_output := result_u8_value_MUX_uxn_opcodes_h_l1891_c7_3839_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1886_c7_e3c1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1886_c7_e3c1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1886_c7_e3c1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1886_c7_e3c1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1886_c7_e3c1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1886_c7_e3c1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1886_c7_e3c1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1886_c7_e3c1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1886_c7_e3c1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1891_c7_3839] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1891_c7_3839_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1891_c7_3839_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1891_c7_3839_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1891_c7_3839_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1891_c7_3839_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1891_c7_3839_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1891_c7_3839_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1891_c7_3839_return_output;

     -- t16_MUX[uxn_opcodes_h_l1868_c7_e198] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1868_c7_e198_cond <= VAR_t16_MUX_uxn_opcodes_h_l1868_c7_e198_cond;
     t16_MUX_uxn_opcodes_h_l1868_c7_e198_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1868_c7_e198_iftrue;
     t16_MUX_uxn_opcodes_h_l1868_c7_e198_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1868_c7_e198_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1868_c7_e198_return_output := t16_MUX_uxn_opcodes_h_l1868_c7_e198_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1891_c7_3839] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1891_c7_3839_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1891_c7_3839_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1891_c7_3839_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1891_c7_3839_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1891_c7_3839_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1891_c7_3839_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1891_c7_3839_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1891_c7_3839_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1865_c7_21b9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_21b9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_21b9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_21b9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_21b9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_21b9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_21b9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_21b9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_21b9_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1868_c7_e198] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1868_c7_e198_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1868_c7_e198_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1868_c7_e198_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1868_c7_e198_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1868_c7_e198_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1868_c7_e198_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1868_c7_e198_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1868_c7_e198_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1886_c7_e3c1] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1886_c7_e3c1_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1886_c7_e3c1_cond;
     tmp16_MUX_uxn_opcodes_h_l1886_c7_e3c1_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1886_c7_e3c1_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1886_c7_e3c1_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1886_c7_e3c1_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1886_c7_e3c1_return_output := tmp16_MUX_uxn_opcodes_h_l1886_c7_e3c1_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1876_c7_48b4] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1876_c7_48b4_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1876_c7_48b4_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1876_c7_48b4_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1876_c7_48b4_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1876_c7_48b4_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1876_c7_48b4_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1876_c7_48b4_return_output := result_u16_value_MUX_uxn_opcodes_h_l1876_c7_48b4_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1886_c7_e3c1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1891_c7_3839_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1865_c7_21b9_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1868_c7_e198_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1886_c7_e3c1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1891_c7_3839_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c2_b437_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_21b9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1882_c7_2a91_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1886_c7_e3c1_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1873_c7_0f34_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1876_c7_48b4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1886_c7_e3c1_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1891_c7_3839_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1865_c7_21b9_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1868_c7_e198_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1882_c7_2a91_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1886_c7_e3c1_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1882_c7_2a91] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1882_c7_2a91_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1882_c7_2a91_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1882_c7_2a91_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1882_c7_2a91_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1882_c7_2a91_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1882_c7_2a91_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1882_c7_2a91_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1882_c7_2a91_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1860_c2_b437] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c2_b437_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c2_b437_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c2_b437_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c2_b437_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c2_b437_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c2_b437_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c2_b437_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c2_b437_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1886_c7_e3c1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1886_c7_e3c1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1886_c7_e3c1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1886_c7_e3c1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1886_c7_e3c1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1886_c7_e3c1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1886_c7_e3c1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1886_c7_e3c1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1886_c7_e3c1_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1886_c7_e3c1] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1886_c7_e3c1_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1886_c7_e3c1_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1886_c7_e3c1_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1886_c7_e3c1_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1886_c7_e3c1_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1886_c7_e3c1_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1886_c7_e3c1_return_output := result_u8_value_MUX_uxn_opcodes_h_l1886_c7_e3c1_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1882_c7_2a91] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1882_c7_2a91_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1882_c7_2a91_cond;
     tmp16_MUX_uxn_opcodes_h_l1882_c7_2a91_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1882_c7_2a91_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1882_c7_2a91_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1882_c7_2a91_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1882_c7_2a91_return_output := tmp16_MUX_uxn_opcodes_h_l1882_c7_2a91_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1865_c7_21b9] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1865_c7_21b9_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1865_c7_21b9_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1865_c7_21b9_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1865_c7_21b9_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1865_c7_21b9_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1865_c7_21b9_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1865_c7_21b9_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1865_c7_21b9_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1873_c7_0f34] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1873_c7_0f34_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1873_c7_0f34_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1873_c7_0f34_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1873_c7_0f34_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1873_c7_0f34_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1873_c7_0f34_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1873_c7_0f34_return_output := result_u16_value_MUX_uxn_opcodes_h_l1873_c7_0f34_return_output;

     -- t16_MUX[uxn_opcodes_h_l1865_c7_21b9] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1865_c7_21b9_cond <= VAR_t16_MUX_uxn_opcodes_h_l1865_c7_21b9_cond;
     t16_MUX_uxn_opcodes_h_l1865_c7_21b9_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1865_c7_21b9_iftrue;
     t16_MUX_uxn_opcodes_h_l1865_c7_21b9_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1865_c7_21b9_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1865_c7_21b9_return_output := t16_MUX_uxn_opcodes_h_l1865_c7_21b9_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1886_c7_e3c1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1886_c7_e3c1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1886_c7_e3c1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1886_c7_e3c1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1886_c7_e3c1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1886_c7_e3c1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1886_c7_e3c1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1886_c7_e3c1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1886_c7_e3c1_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_2a91_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1886_c7_e3c1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1860_c2_b437_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1865_c7_21b9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1882_c7_2a91_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1886_c7_e3c1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1876_c7_48b4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1882_c7_2a91_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1868_c7_e198_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1873_c7_0f34_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1882_c7_2a91_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1886_c7_e3c1_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1860_c2_b437_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1865_c7_21b9_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1876_c7_48b4_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1882_c7_2a91_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1882_c7_2a91] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1882_c7_2a91_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1882_c7_2a91_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1882_c7_2a91_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1882_c7_2a91_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1882_c7_2a91_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1882_c7_2a91_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1882_c7_2a91_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1882_c7_2a91_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1882_c7_2a91] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1882_c7_2a91_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1882_c7_2a91_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1882_c7_2a91_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1882_c7_2a91_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1882_c7_2a91_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1882_c7_2a91_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1882_c7_2a91_return_output := result_u8_value_MUX_uxn_opcodes_h_l1882_c7_2a91_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1882_c7_2a91] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_2a91_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_2a91_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_2a91_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_2a91_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_2a91_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_2a91_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_2a91_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_2a91_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1868_c7_e198] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1868_c7_e198_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1868_c7_e198_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1868_c7_e198_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1868_c7_e198_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1868_c7_e198_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1868_c7_e198_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1868_c7_e198_return_output := result_u16_value_MUX_uxn_opcodes_h_l1868_c7_e198_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1876_c7_48b4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1876_c7_48b4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1876_c7_48b4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1876_c7_48b4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1876_c7_48b4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1876_c7_48b4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1876_c7_48b4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1876_c7_48b4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1876_c7_48b4_return_output;

     -- t16_MUX[uxn_opcodes_h_l1860_c2_b437] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1860_c2_b437_cond <= VAR_t16_MUX_uxn_opcodes_h_l1860_c2_b437_cond;
     t16_MUX_uxn_opcodes_h_l1860_c2_b437_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1860_c2_b437_iftrue;
     t16_MUX_uxn_opcodes_h_l1860_c2_b437_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1860_c2_b437_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1860_c2_b437_return_output := t16_MUX_uxn_opcodes_h_l1860_c2_b437_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1860_c2_b437] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1860_c2_b437_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1860_c2_b437_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1860_c2_b437_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1860_c2_b437_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1860_c2_b437_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1860_c2_b437_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1860_c2_b437_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1860_c2_b437_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1876_c7_48b4] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1876_c7_48b4_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1876_c7_48b4_cond;
     tmp16_MUX_uxn_opcodes_h_l1876_c7_48b4_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1876_c7_48b4_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1876_c7_48b4_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1876_c7_48b4_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1876_c7_48b4_return_output := tmp16_MUX_uxn_opcodes_h_l1876_c7_48b4_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1876_c7_48b4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_2a91_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1876_c7_48b4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1882_c7_2a91_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_0f34_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1876_c7_48b4_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1865_c7_21b9_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1868_c7_e198_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1876_c7_48b4_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1882_c7_2a91_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1860_c2_b437_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1873_c7_0f34_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1876_c7_48b4_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1873_c7_0f34] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_0f34_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_0f34_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_0f34_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_0f34_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_0f34_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_0f34_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_0f34_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_0f34_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1865_c7_21b9] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1865_c7_21b9_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1865_c7_21b9_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1865_c7_21b9_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1865_c7_21b9_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1865_c7_21b9_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1865_c7_21b9_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1865_c7_21b9_return_output := result_u16_value_MUX_uxn_opcodes_h_l1865_c7_21b9_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1876_c7_48b4] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1876_c7_48b4_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1876_c7_48b4_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1876_c7_48b4_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1876_c7_48b4_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1876_c7_48b4_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1876_c7_48b4_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1876_c7_48b4_return_output := result_u8_value_MUX_uxn_opcodes_h_l1876_c7_48b4_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1873_c7_0f34] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1873_c7_0f34_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1873_c7_0f34_cond;
     tmp16_MUX_uxn_opcodes_h_l1873_c7_0f34_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1873_c7_0f34_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1873_c7_0f34_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1873_c7_0f34_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1873_c7_0f34_return_output := tmp16_MUX_uxn_opcodes_h_l1873_c7_0f34_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1876_c7_48b4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1876_c7_48b4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1876_c7_48b4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1876_c7_48b4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1876_c7_48b4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1876_c7_48b4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1876_c7_48b4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1876_c7_48b4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1876_c7_48b4_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1876_c7_48b4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1876_c7_48b4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1876_c7_48b4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1876_c7_48b4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1876_c7_48b4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1876_c7_48b4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1876_c7_48b4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1876_c7_48b4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1876_c7_48b4_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_0f34_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1876_c7_48b4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_0f34_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1876_c7_48b4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1868_c7_e198_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_0f34_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1860_c2_b437_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1865_c7_21b9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1873_c7_0f34_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1876_c7_48b4_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1868_c7_e198_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1873_c7_0f34_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1868_c7_e198] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1868_c7_e198_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1868_c7_e198_cond;
     tmp16_MUX_uxn_opcodes_h_l1868_c7_e198_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1868_c7_e198_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1868_c7_e198_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1868_c7_e198_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1868_c7_e198_return_output := tmp16_MUX_uxn_opcodes_h_l1868_c7_e198_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1873_c7_0f34] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_0f34_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_0f34_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_0f34_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_0f34_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_0f34_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_0f34_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_0f34_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_0f34_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1868_c7_e198] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1868_c7_e198_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1868_c7_e198_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1868_c7_e198_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1868_c7_e198_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1868_c7_e198_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1868_c7_e198_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1868_c7_e198_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1868_c7_e198_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1873_c7_0f34] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_0f34_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_0f34_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_0f34_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_0f34_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_0f34_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_0f34_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_0f34_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_0f34_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1860_c2_b437] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1860_c2_b437_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1860_c2_b437_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1860_c2_b437_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1860_c2_b437_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1860_c2_b437_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1860_c2_b437_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1860_c2_b437_return_output := result_u16_value_MUX_uxn_opcodes_h_l1860_c2_b437_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1873_c7_0f34] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1873_c7_0f34_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1873_c7_0f34_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1873_c7_0f34_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1873_c7_0f34_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1873_c7_0f34_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1873_c7_0f34_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1873_c7_0f34_return_output := result_u8_value_MUX_uxn_opcodes_h_l1873_c7_0f34_return_output;

     -- Submodule level 9
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1868_c7_e198_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_0f34_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1868_c7_e198_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_0f34_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_21b9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1868_c7_e198_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1868_c7_e198_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1873_c7_0f34_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1865_c7_21b9_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1868_c7_e198_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1865_c7_21b9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_21b9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_21b9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_21b9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_21b9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_21b9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_21b9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_21b9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_21b9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1868_c7_e198] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1868_c7_e198_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1868_c7_e198_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1868_c7_e198_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1868_c7_e198_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1868_c7_e198_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1868_c7_e198_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1868_c7_e198_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1868_c7_e198_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1868_c7_e198] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1868_c7_e198_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1868_c7_e198_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1868_c7_e198_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1868_c7_e198_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1868_c7_e198_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1868_c7_e198_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1868_c7_e198_return_output := result_u8_value_MUX_uxn_opcodes_h_l1868_c7_e198_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1868_c7_e198] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1868_c7_e198_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1868_c7_e198_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1868_c7_e198_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1868_c7_e198_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1868_c7_e198_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1868_c7_e198_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1868_c7_e198_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1868_c7_e198_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1865_c7_21b9] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1865_c7_21b9_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1865_c7_21b9_cond;
     tmp16_MUX_uxn_opcodes_h_l1865_c7_21b9_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1865_c7_21b9_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1865_c7_21b9_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1865_c7_21b9_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1865_c7_21b9_return_output := tmp16_MUX_uxn_opcodes_h_l1865_c7_21b9_return_output;

     -- Submodule level 10
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_21b9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1868_c7_e198_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_21b9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1868_c7_e198_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c2_b437_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_21b9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1865_c7_21b9_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1868_c7_e198_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1860_c2_b437_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1865_c7_21b9_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1865_c7_21b9] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1865_c7_21b9_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1865_c7_21b9_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1865_c7_21b9_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1865_c7_21b9_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1865_c7_21b9_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1865_c7_21b9_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1865_c7_21b9_return_output := result_u8_value_MUX_uxn_opcodes_h_l1865_c7_21b9_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1865_c7_21b9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_21b9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_21b9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_21b9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_21b9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_21b9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_21b9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_21b9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_21b9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1860_c2_b437] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c2_b437_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c2_b437_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c2_b437_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c2_b437_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c2_b437_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c2_b437_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c2_b437_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c2_b437_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1860_c2_b437] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1860_c2_b437_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1860_c2_b437_cond;
     tmp16_MUX_uxn_opcodes_h_l1860_c2_b437_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1860_c2_b437_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1860_c2_b437_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1860_c2_b437_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1860_c2_b437_return_output := tmp16_MUX_uxn_opcodes_h_l1860_c2_b437_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1865_c7_21b9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_21b9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_21b9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_21b9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_21b9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_21b9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_21b9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_21b9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_21b9_return_output;

     -- Submodule level 11
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1860_c2_b437_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_21b9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1860_c2_b437_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_21b9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1860_c2_b437_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1865_c7_21b9_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l1860_c2_b437_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1860_c2_b437] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1860_c2_b437_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1860_c2_b437_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1860_c2_b437_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1860_c2_b437_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1860_c2_b437_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1860_c2_b437_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1860_c2_b437_return_output := result_u8_value_MUX_uxn_opcodes_h_l1860_c2_b437_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1860_c2_b437] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1860_c2_b437_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1860_c2_b437_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1860_c2_b437_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1860_c2_b437_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1860_c2_b437_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1860_c2_b437_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1860_c2_b437_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1860_c2_b437_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1860_c2_b437] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1860_c2_b437_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1860_c2_b437_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1860_c2_b437_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1860_c2_b437_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1860_c2_b437_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1860_c2_b437_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1860_c2_b437_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1860_c2_b437_return_output;

     -- Submodule level 12
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_9969_uxn_opcodes_h_l1909_l1856_DUPLICATE_3a92 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_9969_uxn_opcodes_h_l1909_l1856_DUPLICATE_3a92_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_9969(
     result,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1860_c2_b437_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1860_c2_b437_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1860_c2_b437_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c2_b437_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1860_c2_b437_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1860_c2_b437_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c2_b437_return_output);

     -- Submodule level 13
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_9969_uxn_opcodes_h_l1909_l1856_DUPLICATE_3a92_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_9969_uxn_opcodes_h_l1909_l1856_DUPLICATE_3a92_return_output;
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
