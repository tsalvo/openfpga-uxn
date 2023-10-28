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
-- Submodules: 91
entity lth2_0CLK_c96e1a89 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end lth2_0CLK_c96e1a89;
architecture arch of lth2_0CLK_c96e1a89 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal n16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_n16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l2045_c6_3caa]
signal BIN_OP_EQ_uxn_opcodes_h_l2045_c6_3caa_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2045_c6_3caa_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2045_c6_3caa_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2045_c1_0a03]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c1_0a03_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c1_0a03_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c1_0a03_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c1_0a03_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2045_c2_50d9]
signal t16_MUX_uxn_opcodes_h_l2045_c2_50d9_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2045_c2_50d9_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2045_c2_50d9_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2045_c2_50d9_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2045_c2_50d9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2045_c2_50d9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2045_c2_50d9_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2045_c2_50d9_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2045_c2_50d9_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2045_c2_50d9]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2045_c2_50d9_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2045_c2_50d9_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2045_c2_50d9_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2045_c2_50d9_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2045_c2_50d9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2045_c2_50d9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2045_c2_50d9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2045_c2_50d9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2045_c2_50d9_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2045_c2_50d9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2045_c2_50d9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2045_c2_50d9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2045_c2_50d9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2045_c2_50d9_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2045_c2_50d9]
signal result_u8_value_MUX_uxn_opcodes_h_l2045_c2_50d9_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2045_c2_50d9_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2045_c2_50d9_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2045_c2_50d9_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2045_c2_50d9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2045_c2_50d9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2045_c2_50d9_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2045_c2_50d9_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2045_c2_50d9_return_output : signed(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l2045_c2_50d9]
signal n16_MUX_uxn_opcodes_h_l2045_c2_50d9_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2045_c2_50d9_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2045_c2_50d9_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2045_c2_50d9_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l2046_c3_3ad7[uxn_opcodes_h_l2046_c3_3ad7]
signal printf_uxn_opcodes_h_l2046_c3_3ad7_uxn_opcodes_h_l2046_c3_3ad7_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2050_c11_4469]
signal BIN_OP_EQ_uxn_opcodes_h_l2050_c11_4469_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2050_c11_4469_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2050_c11_4469_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2050_c7_d21f]
signal t16_MUX_uxn_opcodes_h_l2050_c7_d21f_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2050_c7_d21f_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2050_c7_d21f_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2050_c7_d21f_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2050_c7_d21f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2050_c7_d21f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2050_c7_d21f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2050_c7_d21f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2050_c7_d21f_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2050_c7_d21f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2050_c7_d21f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2050_c7_d21f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2050_c7_d21f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2050_c7_d21f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2050_c7_d21f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2050_c7_d21f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2050_c7_d21f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2050_c7_d21f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2050_c7_d21f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2050_c7_d21f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2050_c7_d21f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2050_c7_d21f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2050_c7_d21f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2050_c7_d21f_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2050_c7_d21f]
signal result_u8_value_MUX_uxn_opcodes_h_l2050_c7_d21f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2050_c7_d21f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2050_c7_d21f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2050_c7_d21f_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2050_c7_d21f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2050_c7_d21f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2050_c7_d21f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2050_c7_d21f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2050_c7_d21f_return_output : signed(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l2050_c7_d21f]
signal n16_MUX_uxn_opcodes_h_l2050_c7_d21f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2050_c7_d21f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2050_c7_d21f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2050_c7_d21f_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2053_c11_4caa]
signal BIN_OP_EQ_uxn_opcodes_h_l2053_c11_4caa_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2053_c11_4caa_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2053_c11_4caa_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2053_c7_812f]
signal t16_MUX_uxn_opcodes_h_l2053_c7_812f_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2053_c7_812f_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2053_c7_812f_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2053_c7_812f_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2053_c7_812f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2053_c7_812f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2053_c7_812f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2053_c7_812f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2053_c7_812f_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2053_c7_812f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2053_c7_812f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2053_c7_812f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2053_c7_812f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2053_c7_812f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2053_c7_812f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2053_c7_812f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2053_c7_812f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2053_c7_812f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2053_c7_812f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2053_c7_812f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2053_c7_812f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2053_c7_812f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2053_c7_812f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2053_c7_812f_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2053_c7_812f]
signal result_u8_value_MUX_uxn_opcodes_h_l2053_c7_812f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2053_c7_812f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2053_c7_812f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2053_c7_812f_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2053_c7_812f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2053_c7_812f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2053_c7_812f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2053_c7_812f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2053_c7_812f_return_output : signed(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l2053_c7_812f]
signal n16_MUX_uxn_opcodes_h_l2053_c7_812f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2053_c7_812f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2053_c7_812f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2053_c7_812f_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2058_c11_f608]
signal BIN_OP_EQ_uxn_opcodes_h_l2058_c11_f608_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2058_c11_f608_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2058_c11_f608_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2058_c7_71bf]
signal t16_MUX_uxn_opcodes_h_l2058_c7_71bf_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2058_c7_71bf_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2058_c7_71bf_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2058_c7_71bf_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2058_c7_71bf]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2058_c7_71bf_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2058_c7_71bf_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2058_c7_71bf_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2058_c7_71bf_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2058_c7_71bf]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2058_c7_71bf_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2058_c7_71bf_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2058_c7_71bf_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2058_c7_71bf_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2058_c7_71bf]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2058_c7_71bf_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2058_c7_71bf_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2058_c7_71bf_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2058_c7_71bf_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2058_c7_71bf]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2058_c7_71bf_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2058_c7_71bf_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2058_c7_71bf_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2058_c7_71bf_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2058_c7_71bf]
signal result_u8_value_MUX_uxn_opcodes_h_l2058_c7_71bf_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2058_c7_71bf_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2058_c7_71bf_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2058_c7_71bf_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2058_c7_71bf]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2058_c7_71bf_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2058_c7_71bf_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2058_c7_71bf_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2058_c7_71bf_return_output : signed(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l2058_c7_71bf]
signal n16_MUX_uxn_opcodes_h_l2058_c7_71bf_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2058_c7_71bf_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2058_c7_71bf_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2058_c7_71bf_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2061_c11_41b9]
signal BIN_OP_EQ_uxn_opcodes_h_l2061_c11_41b9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2061_c11_41b9_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2061_c11_41b9_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2061_c7_8115]
signal t16_MUX_uxn_opcodes_h_l2061_c7_8115_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2061_c7_8115_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2061_c7_8115_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2061_c7_8115_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2061_c7_8115]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2061_c7_8115_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2061_c7_8115_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2061_c7_8115_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2061_c7_8115_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2061_c7_8115]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2061_c7_8115_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2061_c7_8115_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2061_c7_8115_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2061_c7_8115_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2061_c7_8115]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2061_c7_8115_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2061_c7_8115_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2061_c7_8115_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2061_c7_8115_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2061_c7_8115]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2061_c7_8115_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2061_c7_8115_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2061_c7_8115_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2061_c7_8115_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2061_c7_8115]
signal result_u8_value_MUX_uxn_opcodes_h_l2061_c7_8115_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2061_c7_8115_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2061_c7_8115_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2061_c7_8115_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2061_c7_8115]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2061_c7_8115_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2061_c7_8115_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2061_c7_8115_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2061_c7_8115_return_output : signed(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l2061_c7_8115]
signal n16_MUX_uxn_opcodes_h_l2061_c7_8115_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2061_c7_8115_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2061_c7_8115_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2061_c7_8115_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2062_c3_776d]
signal BIN_OP_OR_uxn_opcodes_h_l2062_c3_776d_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2062_c3_776d_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2062_c3_776d_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2065_c11_4ac4]
signal BIN_OP_EQ_uxn_opcodes_h_l2065_c11_4ac4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2065_c11_4ac4_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2065_c11_4ac4_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2065_c7_5371]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2065_c7_5371_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2065_c7_5371_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2065_c7_5371_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2065_c7_5371_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2065_c7_5371]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2065_c7_5371_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2065_c7_5371_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2065_c7_5371_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2065_c7_5371_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2065_c7_5371]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2065_c7_5371_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2065_c7_5371_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2065_c7_5371_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2065_c7_5371_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2065_c7_5371]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2065_c7_5371_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2065_c7_5371_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2065_c7_5371_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2065_c7_5371_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2065_c7_5371]
signal result_u8_value_MUX_uxn_opcodes_h_l2065_c7_5371_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2065_c7_5371_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2065_c7_5371_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2065_c7_5371_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2065_c7_5371]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2065_c7_5371_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2065_c7_5371_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2065_c7_5371_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2065_c7_5371_return_output : signed(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l2065_c7_5371]
signal n16_MUX_uxn_opcodes_h_l2065_c7_5371_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2065_c7_5371_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2065_c7_5371_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2065_c7_5371_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2068_c11_3448]
signal BIN_OP_EQ_uxn_opcodes_h_l2068_c11_3448_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2068_c11_3448_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2068_c11_3448_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2068_c7_9364]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2068_c7_9364_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2068_c7_9364_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2068_c7_9364_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2068_c7_9364_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2068_c7_9364]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2068_c7_9364_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2068_c7_9364_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2068_c7_9364_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2068_c7_9364_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2068_c7_9364]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2068_c7_9364_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2068_c7_9364_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2068_c7_9364_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2068_c7_9364_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2068_c7_9364]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2068_c7_9364_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2068_c7_9364_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2068_c7_9364_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2068_c7_9364_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2068_c7_9364]
signal result_u8_value_MUX_uxn_opcodes_h_l2068_c7_9364_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2068_c7_9364_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2068_c7_9364_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2068_c7_9364_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2068_c7_9364]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2068_c7_9364_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2068_c7_9364_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2068_c7_9364_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2068_c7_9364_return_output : signed(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l2068_c7_9364]
signal n16_MUX_uxn_opcodes_h_l2068_c7_9364_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2068_c7_9364_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2068_c7_9364_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2068_c7_9364_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2073_c11_5950]
signal BIN_OP_EQ_uxn_opcodes_h_l2073_c11_5950_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2073_c11_5950_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2073_c11_5950_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2073_c7_3f3d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2073_c7_3f3d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2073_c7_3f3d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2073_c7_3f3d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2073_c7_3f3d_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2073_c7_3f3d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2073_c7_3f3d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2073_c7_3f3d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2073_c7_3f3d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2073_c7_3f3d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2073_c7_3f3d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2073_c7_3f3d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2073_c7_3f3d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2073_c7_3f3d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2073_c7_3f3d_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2073_c7_3f3d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2073_c7_3f3d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2073_c7_3f3d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2073_c7_3f3d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2073_c7_3f3d_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2073_c7_3f3d]
signal result_u8_value_MUX_uxn_opcodes_h_l2073_c7_3f3d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2073_c7_3f3d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2073_c7_3f3d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2073_c7_3f3d_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2073_c7_3f3d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2073_c7_3f3d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2073_c7_3f3d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2073_c7_3f3d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2073_c7_3f3d_return_output : signed(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l2073_c7_3f3d]
signal n16_MUX_uxn_opcodes_h_l2073_c7_3f3d_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2073_c7_3f3d_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2073_c7_3f3d_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2073_c7_3f3d_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2076_c11_ede8]
signal BIN_OP_EQ_uxn_opcodes_h_l2076_c11_ede8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2076_c11_ede8_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2076_c11_ede8_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2076_c7_bbe1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2076_c7_bbe1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2076_c7_bbe1_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2076_c7_bbe1_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2076_c7_bbe1_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2076_c7_bbe1]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2076_c7_bbe1_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2076_c7_bbe1_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2076_c7_bbe1_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2076_c7_bbe1_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2076_c7_bbe1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2076_c7_bbe1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2076_c7_bbe1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2076_c7_bbe1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2076_c7_bbe1_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2076_c7_bbe1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2076_c7_bbe1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2076_c7_bbe1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2076_c7_bbe1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2076_c7_bbe1_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2076_c7_bbe1]
signal result_u8_value_MUX_uxn_opcodes_h_l2076_c7_bbe1_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2076_c7_bbe1_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2076_c7_bbe1_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2076_c7_bbe1_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2076_c7_bbe1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2076_c7_bbe1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2076_c7_bbe1_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2076_c7_bbe1_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2076_c7_bbe1_return_output : signed(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l2076_c7_bbe1]
signal n16_MUX_uxn_opcodes_h_l2076_c7_bbe1_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2076_c7_bbe1_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2076_c7_bbe1_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2076_c7_bbe1_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2077_c3_5eeb]
signal BIN_OP_OR_uxn_opcodes_h_l2077_c3_5eeb_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2077_c3_5eeb_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2077_c3_5eeb_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2079_c30_65dd]
signal sp_relative_shift_uxn_opcodes_h_l2079_c30_65dd_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2079_c30_65dd_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2079_c30_65dd_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2079_c30_65dd_return_output : signed(3 downto 0);

-- BIN_OP_LT[uxn_opcodes_h_l2082_c21_57d6]
signal BIN_OP_LT_uxn_opcodes_h_l2082_c21_57d6_left : unsigned(15 downto 0);
signal BIN_OP_LT_uxn_opcodes_h_l2082_c21_57d6_right : unsigned(15 downto 0);
signal BIN_OP_LT_uxn_opcodes_h_l2082_c21_57d6_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2082_c21_c1da]
signal MUX_uxn_opcodes_h_l2082_c21_c1da_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2082_c21_c1da_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l2082_c21_c1da_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l2082_c21_c1da_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2084_c11_e137]
signal BIN_OP_EQ_uxn_opcodes_h_l2084_c11_e137_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2084_c11_e137_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2084_c11_e137_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2084_c7_7dd7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2084_c7_7dd7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2084_c7_7dd7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2084_c7_7dd7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2084_c7_7dd7_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2084_c7_7dd7]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2084_c7_7dd7_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2084_c7_7dd7_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2084_c7_7dd7_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2084_c7_7dd7_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2084_c7_7dd7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2084_c7_7dd7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2084_c7_7dd7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2084_c7_7dd7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2084_c7_7dd7_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2055_l2070_DUPLICATE_54df
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2055_l2070_DUPLICATE_54df_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2055_l2070_DUPLICATE_54df_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_641b( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : signed) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.stack_address_sp_offset := ref_toks_1;
      base.is_sp_shift := ref_toks_2;
      base.is_opc_done := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.u8_value := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2045_c6_3caa
BIN_OP_EQ_uxn_opcodes_h_l2045_c6_3caa : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2045_c6_3caa_left,
BIN_OP_EQ_uxn_opcodes_h_l2045_c6_3caa_right,
BIN_OP_EQ_uxn_opcodes_h_l2045_c6_3caa_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c1_0a03
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c1_0a03 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c1_0a03_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c1_0a03_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c1_0a03_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c1_0a03_return_output);

-- t16_MUX_uxn_opcodes_h_l2045_c2_50d9
t16_MUX_uxn_opcodes_h_l2045_c2_50d9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2045_c2_50d9_cond,
t16_MUX_uxn_opcodes_h_l2045_c2_50d9_iftrue,
t16_MUX_uxn_opcodes_h_l2045_c2_50d9_iffalse,
t16_MUX_uxn_opcodes_h_l2045_c2_50d9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2045_c2_50d9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2045_c2_50d9 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2045_c2_50d9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2045_c2_50d9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2045_c2_50d9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2045_c2_50d9_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2045_c2_50d9
result_is_sp_shift_MUX_uxn_opcodes_h_l2045_c2_50d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2045_c2_50d9_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2045_c2_50d9_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2045_c2_50d9_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2045_c2_50d9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2045_c2_50d9
result_is_opc_done_MUX_uxn_opcodes_h_l2045_c2_50d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2045_c2_50d9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2045_c2_50d9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2045_c2_50d9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2045_c2_50d9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2045_c2_50d9
result_is_stack_write_MUX_uxn_opcodes_h_l2045_c2_50d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2045_c2_50d9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2045_c2_50d9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2045_c2_50d9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2045_c2_50d9_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2045_c2_50d9
result_u8_value_MUX_uxn_opcodes_h_l2045_c2_50d9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2045_c2_50d9_cond,
result_u8_value_MUX_uxn_opcodes_h_l2045_c2_50d9_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2045_c2_50d9_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2045_c2_50d9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2045_c2_50d9
result_sp_relative_shift_MUX_uxn_opcodes_h_l2045_c2_50d9 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2045_c2_50d9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2045_c2_50d9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2045_c2_50d9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2045_c2_50d9_return_output);

-- n16_MUX_uxn_opcodes_h_l2045_c2_50d9
n16_MUX_uxn_opcodes_h_l2045_c2_50d9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2045_c2_50d9_cond,
n16_MUX_uxn_opcodes_h_l2045_c2_50d9_iftrue,
n16_MUX_uxn_opcodes_h_l2045_c2_50d9_iffalse,
n16_MUX_uxn_opcodes_h_l2045_c2_50d9_return_output);

-- printf_uxn_opcodes_h_l2046_c3_3ad7_uxn_opcodes_h_l2046_c3_3ad7
printf_uxn_opcodes_h_l2046_c3_3ad7_uxn_opcodes_h_l2046_c3_3ad7 : entity work.printf_uxn_opcodes_h_l2046_c3_3ad7_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2046_c3_3ad7_uxn_opcodes_h_l2046_c3_3ad7_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2050_c11_4469
BIN_OP_EQ_uxn_opcodes_h_l2050_c11_4469 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2050_c11_4469_left,
BIN_OP_EQ_uxn_opcodes_h_l2050_c11_4469_right,
BIN_OP_EQ_uxn_opcodes_h_l2050_c11_4469_return_output);

-- t16_MUX_uxn_opcodes_h_l2050_c7_d21f
t16_MUX_uxn_opcodes_h_l2050_c7_d21f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2050_c7_d21f_cond,
t16_MUX_uxn_opcodes_h_l2050_c7_d21f_iftrue,
t16_MUX_uxn_opcodes_h_l2050_c7_d21f_iffalse,
t16_MUX_uxn_opcodes_h_l2050_c7_d21f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2050_c7_d21f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2050_c7_d21f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2050_c7_d21f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2050_c7_d21f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2050_c7_d21f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2050_c7_d21f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2050_c7_d21f
result_is_sp_shift_MUX_uxn_opcodes_h_l2050_c7_d21f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2050_c7_d21f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2050_c7_d21f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2050_c7_d21f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2050_c7_d21f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2050_c7_d21f
result_is_opc_done_MUX_uxn_opcodes_h_l2050_c7_d21f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2050_c7_d21f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2050_c7_d21f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2050_c7_d21f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2050_c7_d21f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2050_c7_d21f
result_is_stack_write_MUX_uxn_opcodes_h_l2050_c7_d21f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2050_c7_d21f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2050_c7_d21f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2050_c7_d21f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2050_c7_d21f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2050_c7_d21f
result_u8_value_MUX_uxn_opcodes_h_l2050_c7_d21f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2050_c7_d21f_cond,
result_u8_value_MUX_uxn_opcodes_h_l2050_c7_d21f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2050_c7_d21f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2050_c7_d21f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2050_c7_d21f
result_sp_relative_shift_MUX_uxn_opcodes_h_l2050_c7_d21f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2050_c7_d21f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2050_c7_d21f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2050_c7_d21f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2050_c7_d21f_return_output);

-- n16_MUX_uxn_opcodes_h_l2050_c7_d21f
n16_MUX_uxn_opcodes_h_l2050_c7_d21f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2050_c7_d21f_cond,
n16_MUX_uxn_opcodes_h_l2050_c7_d21f_iftrue,
n16_MUX_uxn_opcodes_h_l2050_c7_d21f_iffalse,
n16_MUX_uxn_opcodes_h_l2050_c7_d21f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2053_c11_4caa
BIN_OP_EQ_uxn_opcodes_h_l2053_c11_4caa : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2053_c11_4caa_left,
BIN_OP_EQ_uxn_opcodes_h_l2053_c11_4caa_right,
BIN_OP_EQ_uxn_opcodes_h_l2053_c11_4caa_return_output);

-- t16_MUX_uxn_opcodes_h_l2053_c7_812f
t16_MUX_uxn_opcodes_h_l2053_c7_812f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2053_c7_812f_cond,
t16_MUX_uxn_opcodes_h_l2053_c7_812f_iftrue,
t16_MUX_uxn_opcodes_h_l2053_c7_812f_iffalse,
t16_MUX_uxn_opcodes_h_l2053_c7_812f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2053_c7_812f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2053_c7_812f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2053_c7_812f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2053_c7_812f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2053_c7_812f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2053_c7_812f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2053_c7_812f
result_is_sp_shift_MUX_uxn_opcodes_h_l2053_c7_812f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2053_c7_812f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2053_c7_812f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2053_c7_812f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2053_c7_812f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2053_c7_812f
result_is_opc_done_MUX_uxn_opcodes_h_l2053_c7_812f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2053_c7_812f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2053_c7_812f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2053_c7_812f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2053_c7_812f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2053_c7_812f
result_is_stack_write_MUX_uxn_opcodes_h_l2053_c7_812f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2053_c7_812f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2053_c7_812f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2053_c7_812f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2053_c7_812f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2053_c7_812f
result_u8_value_MUX_uxn_opcodes_h_l2053_c7_812f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2053_c7_812f_cond,
result_u8_value_MUX_uxn_opcodes_h_l2053_c7_812f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2053_c7_812f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2053_c7_812f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2053_c7_812f
result_sp_relative_shift_MUX_uxn_opcodes_h_l2053_c7_812f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2053_c7_812f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2053_c7_812f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2053_c7_812f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2053_c7_812f_return_output);

-- n16_MUX_uxn_opcodes_h_l2053_c7_812f
n16_MUX_uxn_opcodes_h_l2053_c7_812f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2053_c7_812f_cond,
n16_MUX_uxn_opcodes_h_l2053_c7_812f_iftrue,
n16_MUX_uxn_opcodes_h_l2053_c7_812f_iffalse,
n16_MUX_uxn_opcodes_h_l2053_c7_812f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2058_c11_f608
BIN_OP_EQ_uxn_opcodes_h_l2058_c11_f608 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2058_c11_f608_left,
BIN_OP_EQ_uxn_opcodes_h_l2058_c11_f608_right,
BIN_OP_EQ_uxn_opcodes_h_l2058_c11_f608_return_output);

-- t16_MUX_uxn_opcodes_h_l2058_c7_71bf
t16_MUX_uxn_opcodes_h_l2058_c7_71bf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2058_c7_71bf_cond,
t16_MUX_uxn_opcodes_h_l2058_c7_71bf_iftrue,
t16_MUX_uxn_opcodes_h_l2058_c7_71bf_iffalse,
t16_MUX_uxn_opcodes_h_l2058_c7_71bf_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2058_c7_71bf
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2058_c7_71bf : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2058_c7_71bf_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2058_c7_71bf_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2058_c7_71bf_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2058_c7_71bf_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2058_c7_71bf
result_is_sp_shift_MUX_uxn_opcodes_h_l2058_c7_71bf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2058_c7_71bf_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2058_c7_71bf_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2058_c7_71bf_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2058_c7_71bf_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2058_c7_71bf
result_is_opc_done_MUX_uxn_opcodes_h_l2058_c7_71bf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2058_c7_71bf_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2058_c7_71bf_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2058_c7_71bf_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2058_c7_71bf_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2058_c7_71bf
result_is_stack_write_MUX_uxn_opcodes_h_l2058_c7_71bf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2058_c7_71bf_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2058_c7_71bf_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2058_c7_71bf_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2058_c7_71bf_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2058_c7_71bf
result_u8_value_MUX_uxn_opcodes_h_l2058_c7_71bf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2058_c7_71bf_cond,
result_u8_value_MUX_uxn_opcodes_h_l2058_c7_71bf_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2058_c7_71bf_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2058_c7_71bf_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2058_c7_71bf
result_sp_relative_shift_MUX_uxn_opcodes_h_l2058_c7_71bf : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2058_c7_71bf_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2058_c7_71bf_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2058_c7_71bf_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2058_c7_71bf_return_output);

-- n16_MUX_uxn_opcodes_h_l2058_c7_71bf
n16_MUX_uxn_opcodes_h_l2058_c7_71bf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2058_c7_71bf_cond,
n16_MUX_uxn_opcodes_h_l2058_c7_71bf_iftrue,
n16_MUX_uxn_opcodes_h_l2058_c7_71bf_iffalse,
n16_MUX_uxn_opcodes_h_l2058_c7_71bf_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2061_c11_41b9
BIN_OP_EQ_uxn_opcodes_h_l2061_c11_41b9 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2061_c11_41b9_left,
BIN_OP_EQ_uxn_opcodes_h_l2061_c11_41b9_right,
BIN_OP_EQ_uxn_opcodes_h_l2061_c11_41b9_return_output);

-- t16_MUX_uxn_opcodes_h_l2061_c7_8115
t16_MUX_uxn_opcodes_h_l2061_c7_8115 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2061_c7_8115_cond,
t16_MUX_uxn_opcodes_h_l2061_c7_8115_iftrue,
t16_MUX_uxn_opcodes_h_l2061_c7_8115_iffalse,
t16_MUX_uxn_opcodes_h_l2061_c7_8115_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2061_c7_8115
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2061_c7_8115 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2061_c7_8115_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2061_c7_8115_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2061_c7_8115_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2061_c7_8115_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2061_c7_8115
result_is_sp_shift_MUX_uxn_opcodes_h_l2061_c7_8115 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2061_c7_8115_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2061_c7_8115_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2061_c7_8115_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2061_c7_8115_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2061_c7_8115
result_is_opc_done_MUX_uxn_opcodes_h_l2061_c7_8115 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2061_c7_8115_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2061_c7_8115_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2061_c7_8115_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2061_c7_8115_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2061_c7_8115
result_is_stack_write_MUX_uxn_opcodes_h_l2061_c7_8115 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2061_c7_8115_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2061_c7_8115_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2061_c7_8115_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2061_c7_8115_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2061_c7_8115
result_u8_value_MUX_uxn_opcodes_h_l2061_c7_8115 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2061_c7_8115_cond,
result_u8_value_MUX_uxn_opcodes_h_l2061_c7_8115_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2061_c7_8115_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2061_c7_8115_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2061_c7_8115
result_sp_relative_shift_MUX_uxn_opcodes_h_l2061_c7_8115 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2061_c7_8115_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2061_c7_8115_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2061_c7_8115_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2061_c7_8115_return_output);

-- n16_MUX_uxn_opcodes_h_l2061_c7_8115
n16_MUX_uxn_opcodes_h_l2061_c7_8115 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2061_c7_8115_cond,
n16_MUX_uxn_opcodes_h_l2061_c7_8115_iftrue,
n16_MUX_uxn_opcodes_h_l2061_c7_8115_iffalse,
n16_MUX_uxn_opcodes_h_l2061_c7_8115_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2062_c3_776d
BIN_OP_OR_uxn_opcodes_h_l2062_c3_776d : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2062_c3_776d_left,
BIN_OP_OR_uxn_opcodes_h_l2062_c3_776d_right,
BIN_OP_OR_uxn_opcodes_h_l2062_c3_776d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2065_c11_4ac4
BIN_OP_EQ_uxn_opcodes_h_l2065_c11_4ac4 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2065_c11_4ac4_left,
BIN_OP_EQ_uxn_opcodes_h_l2065_c11_4ac4_right,
BIN_OP_EQ_uxn_opcodes_h_l2065_c11_4ac4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2065_c7_5371
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2065_c7_5371 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2065_c7_5371_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2065_c7_5371_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2065_c7_5371_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2065_c7_5371_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2065_c7_5371
result_is_sp_shift_MUX_uxn_opcodes_h_l2065_c7_5371 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2065_c7_5371_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2065_c7_5371_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2065_c7_5371_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2065_c7_5371_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2065_c7_5371
result_is_opc_done_MUX_uxn_opcodes_h_l2065_c7_5371 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2065_c7_5371_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2065_c7_5371_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2065_c7_5371_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2065_c7_5371_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2065_c7_5371
result_is_stack_write_MUX_uxn_opcodes_h_l2065_c7_5371 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2065_c7_5371_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2065_c7_5371_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2065_c7_5371_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2065_c7_5371_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2065_c7_5371
result_u8_value_MUX_uxn_opcodes_h_l2065_c7_5371 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2065_c7_5371_cond,
result_u8_value_MUX_uxn_opcodes_h_l2065_c7_5371_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2065_c7_5371_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2065_c7_5371_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2065_c7_5371
result_sp_relative_shift_MUX_uxn_opcodes_h_l2065_c7_5371 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2065_c7_5371_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2065_c7_5371_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2065_c7_5371_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2065_c7_5371_return_output);

-- n16_MUX_uxn_opcodes_h_l2065_c7_5371
n16_MUX_uxn_opcodes_h_l2065_c7_5371 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2065_c7_5371_cond,
n16_MUX_uxn_opcodes_h_l2065_c7_5371_iftrue,
n16_MUX_uxn_opcodes_h_l2065_c7_5371_iffalse,
n16_MUX_uxn_opcodes_h_l2065_c7_5371_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2068_c11_3448
BIN_OP_EQ_uxn_opcodes_h_l2068_c11_3448 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2068_c11_3448_left,
BIN_OP_EQ_uxn_opcodes_h_l2068_c11_3448_right,
BIN_OP_EQ_uxn_opcodes_h_l2068_c11_3448_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2068_c7_9364
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2068_c7_9364 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2068_c7_9364_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2068_c7_9364_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2068_c7_9364_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2068_c7_9364_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2068_c7_9364
result_is_sp_shift_MUX_uxn_opcodes_h_l2068_c7_9364 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2068_c7_9364_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2068_c7_9364_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2068_c7_9364_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2068_c7_9364_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2068_c7_9364
result_is_opc_done_MUX_uxn_opcodes_h_l2068_c7_9364 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2068_c7_9364_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2068_c7_9364_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2068_c7_9364_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2068_c7_9364_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2068_c7_9364
result_is_stack_write_MUX_uxn_opcodes_h_l2068_c7_9364 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2068_c7_9364_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2068_c7_9364_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2068_c7_9364_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2068_c7_9364_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2068_c7_9364
result_u8_value_MUX_uxn_opcodes_h_l2068_c7_9364 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2068_c7_9364_cond,
result_u8_value_MUX_uxn_opcodes_h_l2068_c7_9364_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2068_c7_9364_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2068_c7_9364_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2068_c7_9364
result_sp_relative_shift_MUX_uxn_opcodes_h_l2068_c7_9364 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2068_c7_9364_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2068_c7_9364_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2068_c7_9364_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2068_c7_9364_return_output);

-- n16_MUX_uxn_opcodes_h_l2068_c7_9364
n16_MUX_uxn_opcodes_h_l2068_c7_9364 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2068_c7_9364_cond,
n16_MUX_uxn_opcodes_h_l2068_c7_9364_iftrue,
n16_MUX_uxn_opcodes_h_l2068_c7_9364_iffalse,
n16_MUX_uxn_opcodes_h_l2068_c7_9364_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2073_c11_5950
BIN_OP_EQ_uxn_opcodes_h_l2073_c11_5950 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2073_c11_5950_left,
BIN_OP_EQ_uxn_opcodes_h_l2073_c11_5950_right,
BIN_OP_EQ_uxn_opcodes_h_l2073_c11_5950_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2073_c7_3f3d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2073_c7_3f3d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2073_c7_3f3d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2073_c7_3f3d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2073_c7_3f3d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2073_c7_3f3d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2073_c7_3f3d
result_is_sp_shift_MUX_uxn_opcodes_h_l2073_c7_3f3d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2073_c7_3f3d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2073_c7_3f3d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2073_c7_3f3d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2073_c7_3f3d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2073_c7_3f3d
result_is_opc_done_MUX_uxn_opcodes_h_l2073_c7_3f3d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2073_c7_3f3d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2073_c7_3f3d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2073_c7_3f3d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2073_c7_3f3d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2073_c7_3f3d
result_is_stack_write_MUX_uxn_opcodes_h_l2073_c7_3f3d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2073_c7_3f3d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2073_c7_3f3d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2073_c7_3f3d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2073_c7_3f3d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2073_c7_3f3d
result_u8_value_MUX_uxn_opcodes_h_l2073_c7_3f3d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2073_c7_3f3d_cond,
result_u8_value_MUX_uxn_opcodes_h_l2073_c7_3f3d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2073_c7_3f3d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2073_c7_3f3d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2073_c7_3f3d
result_sp_relative_shift_MUX_uxn_opcodes_h_l2073_c7_3f3d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2073_c7_3f3d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2073_c7_3f3d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2073_c7_3f3d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2073_c7_3f3d_return_output);

-- n16_MUX_uxn_opcodes_h_l2073_c7_3f3d
n16_MUX_uxn_opcodes_h_l2073_c7_3f3d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2073_c7_3f3d_cond,
n16_MUX_uxn_opcodes_h_l2073_c7_3f3d_iftrue,
n16_MUX_uxn_opcodes_h_l2073_c7_3f3d_iffalse,
n16_MUX_uxn_opcodes_h_l2073_c7_3f3d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2076_c11_ede8
BIN_OP_EQ_uxn_opcodes_h_l2076_c11_ede8 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2076_c11_ede8_left,
BIN_OP_EQ_uxn_opcodes_h_l2076_c11_ede8_right,
BIN_OP_EQ_uxn_opcodes_h_l2076_c11_ede8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2076_c7_bbe1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2076_c7_bbe1 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2076_c7_bbe1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2076_c7_bbe1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2076_c7_bbe1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2076_c7_bbe1_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2076_c7_bbe1
result_is_sp_shift_MUX_uxn_opcodes_h_l2076_c7_bbe1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2076_c7_bbe1_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2076_c7_bbe1_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2076_c7_bbe1_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2076_c7_bbe1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2076_c7_bbe1
result_is_opc_done_MUX_uxn_opcodes_h_l2076_c7_bbe1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2076_c7_bbe1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2076_c7_bbe1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2076_c7_bbe1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2076_c7_bbe1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2076_c7_bbe1
result_is_stack_write_MUX_uxn_opcodes_h_l2076_c7_bbe1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2076_c7_bbe1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2076_c7_bbe1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2076_c7_bbe1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2076_c7_bbe1_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2076_c7_bbe1
result_u8_value_MUX_uxn_opcodes_h_l2076_c7_bbe1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2076_c7_bbe1_cond,
result_u8_value_MUX_uxn_opcodes_h_l2076_c7_bbe1_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2076_c7_bbe1_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2076_c7_bbe1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2076_c7_bbe1
result_sp_relative_shift_MUX_uxn_opcodes_h_l2076_c7_bbe1 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2076_c7_bbe1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2076_c7_bbe1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2076_c7_bbe1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2076_c7_bbe1_return_output);

-- n16_MUX_uxn_opcodes_h_l2076_c7_bbe1
n16_MUX_uxn_opcodes_h_l2076_c7_bbe1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2076_c7_bbe1_cond,
n16_MUX_uxn_opcodes_h_l2076_c7_bbe1_iftrue,
n16_MUX_uxn_opcodes_h_l2076_c7_bbe1_iffalse,
n16_MUX_uxn_opcodes_h_l2076_c7_bbe1_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2077_c3_5eeb
BIN_OP_OR_uxn_opcodes_h_l2077_c3_5eeb : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2077_c3_5eeb_left,
BIN_OP_OR_uxn_opcodes_h_l2077_c3_5eeb_right,
BIN_OP_OR_uxn_opcodes_h_l2077_c3_5eeb_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2079_c30_65dd
sp_relative_shift_uxn_opcodes_h_l2079_c30_65dd : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2079_c30_65dd_ins,
sp_relative_shift_uxn_opcodes_h_l2079_c30_65dd_x,
sp_relative_shift_uxn_opcodes_h_l2079_c30_65dd_y,
sp_relative_shift_uxn_opcodes_h_l2079_c30_65dd_return_output);

-- BIN_OP_LT_uxn_opcodes_h_l2082_c21_57d6
BIN_OP_LT_uxn_opcodes_h_l2082_c21_57d6 : entity work.BIN_OP_LT_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_LT_uxn_opcodes_h_l2082_c21_57d6_left,
BIN_OP_LT_uxn_opcodes_h_l2082_c21_57d6_right,
BIN_OP_LT_uxn_opcodes_h_l2082_c21_57d6_return_output);

-- MUX_uxn_opcodes_h_l2082_c21_c1da
MUX_uxn_opcodes_h_l2082_c21_c1da : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2082_c21_c1da_cond,
MUX_uxn_opcodes_h_l2082_c21_c1da_iftrue,
MUX_uxn_opcodes_h_l2082_c21_c1da_iffalse,
MUX_uxn_opcodes_h_l2082_c21_c1da_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2084_c11_e137
BIN_OP_EQ_uxn_opcodes_h_l2084_c11_e137 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2084_c11_e137_left,
BIN_OP_EQ_uxn_opcodes_h_l2084_c11_e137_right,
BIN_OP_EQ_uxn_opcodes_h_l2084_c11_e137_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2084_c7_7dd7
result_is_stack_write_MUX_uxn_opcodes_h_l2084_c7_7dd7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2084_c7_7dd7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2084_c7_7dd7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2084_c7_7dd7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2084_c7_7dd7_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2084_c7_7dd7
result_is_sp_shift_MUX_uxn_opcodes_h_l2084_c7_7dd7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2084_c7_7dd7_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2084_c7_7dd7_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2084_c7_7dd7_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2084_c7_7dd7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2084_c7_7dd7
result_is_opc_done_MUX_uxn_opcodes_h_l2084_c7_7dd7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2084_c7_7dd7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2084_c7_7dd7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2084_c7_7dd7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2084_c7_7dd7_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2055_l2070_DUPLICATE_54df
CONST_SL_8_uint16_t_uxn_opcodes_h_l2055_l2070_DUPLICATE_54df : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l2055_l2070_DUPLICATE_54df_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l2055_l2070_DUPLICATE_54df_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t16,
 n16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l2045_c6_3caa_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c1_0a03_return_output,
 t16_MUX_uxn_opcodes_h_l2045_c2_50d9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2045_c2_50d9_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2045_c2_50d9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2045_c2_50d9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2045_c2_50d9_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2045_c2_50d9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2045_c2_50d9_return_output,
 n16_MUX_uxn_opcodes_h_l2045_c2_50d9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2050_c11_4469_return_output,
 t16_MUX_uxn_opcodes_h_l2050_c7_d21f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2050_c7_d21f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2050_c7_d21f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2050_c7_d21f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2050_c7_d21f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2050_c7_d21f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2050_c7_d21f_return_output,
 n16_MUX_uxn_opcodes_h_l2050_c7_d21f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2053_c11_4caa_return_output,
 t16_MUX_uxn_opcodes_h_l2053_c7_812f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2053_c7_812f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2053_c7_812f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2053_c7_812f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2053_c7_812f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2053_c7_812f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2053_c7_812f_return_output,
 n16_MUX_uxn_opcodes_h_l2053_c7_812f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2058_c11_f608_return_output,
 t16_MUX_uxn_opcodes_h_l2058_c7_71bf_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2058_c7_71bf_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2058_c7_71bf_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2058_c7_71bf_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2058_c7_71bf_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2058_c7_71bf_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2058_c7_71bf_return_output,
 n16_MUX_uxn_opcodes_h_l2058_c7_71bf_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2061_c11_41b9_return_output,
 t16_MUX_uxn_opcodes_h_l2061_c7_8115_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2061_c7_8115_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2061_c7_8115_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2061_c7_8115_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2061_c7_8115_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2061_c7_8115_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2061_c7_8115_return_output,
 n16_MUX_uxn_opcodes_h_l2061_c7_8115_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2062_c3_776d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2065_c11_4ac4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2065_c7_5371_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2065_c7_5371_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2065_c7_5371_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2065_c7_5371_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2065_c7_5371_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2065_c7_5371_return_output,
 n16_MUX_uxn_opcodes_h_l2065_c7_5371_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2068_c11_3448_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2068_c7_9364_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2068_c7_9364_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2068_c7_9364_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2068_c7_9364_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2068_c7_9364_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2068_c7_9364_return_output,
 n16_MUX_uxn_opcodes_h_l2068_c7_9364_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2073_c11_5950_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2073_c7_3f3d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2073_c7_3f3d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2073_c7_3f3d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2073_c7_3f3d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2073_c7_3f3d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2073_c7_3f3d_return_output,
 n16_MUX_uxn_opcodes_h_l2073_c7_3f3d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2076_c11_ede8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2076_c7_bbe1_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2076_c7_bbe1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2076_c7_bbe1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2076_c7_bbe1_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2076_c7_bbe1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2076_c7_bbe1_return_output,
 n16_MUX_uxn_opcodes_h_l2076_c7_bbe1_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2077_c3_5eeb_return_output,
 sp_relative_shift_uxn_opcodes_h_l2079_c30_65dd_return_output,
 BIN_OP_LT_uxn_opcodes_h_l2082_c21_57d6_return_output,
 MUX_uxn_opcodes_h_l2082_c21_c1da_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2084_c11_e137_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2084_c7_7dd7_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2084_c7_7dd7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2084_c7_7dd7_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l2055_l2070_DUPLICATE_54df_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2045_c6_3caa_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2045_c6_3caa_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2045_c6_3caa_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c1_0a03_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c1_0a03_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c1_0a03_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c1_0a03_iffalse : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2045_c2_50d9_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2045_c2_50d9_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2050_c7_d21f_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2045_c2_50d9_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2045_c2_50d9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2045_c2_50d9_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2047_c3_07d5 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2045_c2_50d9_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2050_c7_d21f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2045_c2_50d9_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2045_c2_50d9_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2045_c2_50d9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2045_c2_50d9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2050_c7_d21f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2045_c2_50d9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2045_c2_50d9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2045_c2_50d9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2045_c2_50d9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2050_c7_d21f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2045_c2_50d9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2045_c2_50d9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2045_c2_50d9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2045_c2_50d9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2050_c7_d21f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2045_c2_50d9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2045_c2_50d9_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2045_c2_50d9_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2045_c2_50d9_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2050_c7_d21f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2045_c2_50d9_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2045_c2_50d9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2045_c2_50d9_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2045_c2_50d9_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2050_c7_d21f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2045_c2_50d9_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2045_c2_50d9_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2045_c2_50d9_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2045_c2_50d9_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2050_c7_d21f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2045_c2_50d9_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2045_c2_50d9_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2046_c3_3ad7_uxn_opcodes_h_l2046_c3_3ad7_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2050_c11_4469_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2050_c11_4469_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2050_c11_4469_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2050_c7_d21f_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2050_c7_d21f_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2053_c7_812f_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2050_c7_d21f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2050_c7_d21f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2051_c3_d2d7 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2050_c7_d21f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2053_c7_812f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2050_c7_d21f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2050_c7_d21f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2050_c7_d21f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2053_c7_812f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2050_c7_d21f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2050_c7_d21f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2050_c7_d21f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2053_c7_812f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2050_c7_d21f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2050_c7_d21f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2050_c7_d21f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2053_c7_812f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2050_c7_d21f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2050_c7_d21f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2050_c7_d21f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2053_c7_812f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2050_c7_d21f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2050_c7_d21f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2050_c7_d21f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2053_c7_812f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2050_c7_d21f_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2050_c7_d21f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2050_c7_d21f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2053_c7_812f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2050_c7_d21f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2053_c11_4caa_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2053_c11_4caa_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2053_c11_4caa_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2053_c7_812f_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2053_c7_812f_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2058_c7_71bf_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2053_c7_812f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2053_c7_812f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2056_c3_cda5 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2053_c7_812f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2058_c7_71bf_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2053_c7_812f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2053_c7_812f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2053_c7_812f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2058_c7_71bf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2053_c7_812f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2053_c7_812f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2053_c7_812f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2058_c7_71bf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2053_c7_812f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2053_c7_812f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2053_c7_812f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2058_c7_71bf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2053_c7_812f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2053_c7_812f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2053_c7_812f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2058_c7_71bf_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2053_c7_812f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2053_c7_812f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2053_c7_812f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2058_c7_71bf_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2053_c7_812f_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2053_c7_812f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2053_c7_812f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2058_c7_71bf_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2053_c7_812f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2058_c11_f608_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2058_c11_f608_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2058_c11_f608_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2058_c7_71bf_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2058_c7_71bf_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2061_c7_8115_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2058_c7_71bf_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2058_c7_71bf_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2059_c3_799a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2058_c7_71bf_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2061_c7_8115_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2058_c7_71bf_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2058_c7_71bf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2058_c7_71bf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2061_c7_8115_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2058_c7_71bf_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2058_c7_71bf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2058_c7_71bf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2061_c7_8115_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2058_c7_71bf_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2058_c7_71bf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2058_c7_71bf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2061_c7_8115_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2058_c7_71bf_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2058_c7_71bf_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2058_c7_71bf_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2061_c7_8115_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2058_c7_71bf_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2058_c7_71bf_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2058_c7_71bf_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2061_c7_8115_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2058_c7_71bf_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2058_c7_71bf_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2058_c7_71bf_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2061_c7_8115_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2058_c7_71bf_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2061_c11_41b9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2061_c11_41b9_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2061_c11_41b9_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2061_c7_8115_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2061_c7_8115_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2061_c7_8115_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2061_c7_8115_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2063_c3_9a6a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2061_c7_8115_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2065_c7_5371_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2061_c7_8115_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2061_c7_8115_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2061_c7_8115_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2065_c7_5371_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2061_c7_8115_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2061_c7_8115_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2061_c7_8115_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2065_c7_5371_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2061_c7_8115_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2061_c7_8115_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2061_c7_8115_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2065_c7_5371_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2061_c7_8115_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2061_c7_8115_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2061_c7_8115_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2065_c7_5371_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2061_c7_8115_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2061_c7_8115_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2061_c7_8115_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2065_c7_5371_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2061_c7_8115_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2061_c7_8115_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2061_c7_8115_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2065_c7_5371_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2061_c7_8115_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2062_c3_776d_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2062_c3_776d_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2062_c3_776d_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2065_c11_4ac4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2065_c11_4ac4_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2065_c11_4ac4_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2065_c7_5371_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2066_c3_3367 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2065_c7_5371_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2068_c7_9364_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2065_c7_5371_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2065_c7_5371_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2065_c7_5371_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2068_c7_9364_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2065_c7_5371_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2065_c7_5371_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2065_c7_5371_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2068_c7_9364_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2065_c7_5371_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2065_c7_5371_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2065_c7_5371_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2068_c7_9364_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2065_c7_5371_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2065_c7_5371_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2065_c7_5371_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2068_c7_9364_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2065_c7_5371_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2065_c7_5371_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2065_c7_5371_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2068_c7_9364_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2065_c7_5371_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2065_c7_5371_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2065_c7_5371_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2068_c7_9364_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2065_c7_5371_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2068_c11_3448_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2068_c11_3448_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2068_c11_3448_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2068_c7_9364_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2071_c3_1f1a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2068_c7_9364_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2073_c7_3f3d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2068_c7_9364_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2068_c7_9364_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2068_c7_9364_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2073_c7_3f3d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2068_c7_9364_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2068_c7_9364_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2068_c7_9364_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2073_c7_3f3d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2068_c7_9364_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2068_c7_9364_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2068_c7_9364_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2073_c7_3f3d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2068_c7_9364_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2068_c7_9364_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2068_c7_9364_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2073_c7_3f3d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2068_c7_9364_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2068_c7_9364_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2068_c7_9364_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2073_c7_3f3d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2068_c7_9364_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2068_c7_9364_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2068_c7_9364_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2073_c7_3f3d_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2068_c7_9364_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2073_c11_5950_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2073_c11_5950_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2073_c11_5950_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2073_c7_3f3d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2074_c3_8f9b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2073_c7_3f3d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2076_c7_bbe1_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2073_c7_3f3d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2073_c7_3f3d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2073_c7_3f3d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2076_c7_bbe1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2073_c7_3f3d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2073_c7_3f3d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2073_c7_3f3d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2076_c7_bbe1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2073_c7_3f3d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2073_c7_3f3d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2073_c7_3f3d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2076_c7_bbe1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2073_c7_3f3d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2073_c7_3f3d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2073_c7_3f3d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2076_c7_bbe1_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2073_c7_3f3d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2073_c7_3f3d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2073_c7_3f3d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2076_c7_bbe1_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2073_c7_3f3d_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2073_c7_3f3d_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2073_c7_3f3d_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2076_c7_bbe1_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2073_c7_3f3d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2076_c11_ede8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2076_c11_ede8_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2076_c11_ede8_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2076_c7_bbe1_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2081_c3_13cf : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2076_c7_bbe1_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2076_c7_bbe1_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2076_c7_bbe1_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2076_c7_bbe1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2076_c7_bbe1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2084_c7_7dd7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2076_c7_bbe1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2076_c7_bbe1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2076_c7_bbe1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2084_c7_7dd7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2076_c7_bbe1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2076_c7_bbe1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2076_c7_bbe1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2084_c7_7dd7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2076_c7_bbe1_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2076_c7_bbe1_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2076_c7_bbe1_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2076_c7_bbe1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2076_c7_bbe1_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2076_c7_bbe1_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2076_c7_bbe1_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2076_c7_bbe1_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2076_c7_bbe1_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2076_c7_bbe1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2077_c3_5eeb_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2077_c3_5eeb_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2077_c3_5eeb_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2079_c30_65dd_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2079_c30_65dd_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2079_c30_65dd_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2079_c30_65dd_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2082_c21_c1da_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2082_c21_c1da_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2082_c21_c1da_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_LT_uxn_opcodes_h_l2082_c21_57d6_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_LT_uxn_opcodes_h_l2082_c21_57d6_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_LT_uxn_opcodes_h_l2082_c21_57d6_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2082_c21_c1da_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2084_c11_e137_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2084_c11_e137_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2084_c11_e137_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2084_c7_7dd7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2084_c7_7dd7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2084_c7_7dd7_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2084_c7_7dd7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2084_c7_7dd7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2084_c7_7dd7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2084_c7_7dd7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2084_c7_7dd7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2084_c7_7dd7_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2045_l2068_l2065_l2061_l2058_l2084_l2053_l2050_l2073_DUPLICATE_e5ba_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2045_l2068_l2065_l2061_l2058_l2084_l2053_l2050_l2073_DUPLICATE_5a84_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2045_l2068_l2065_l2061_l2058_l2053_l2076_l2050_l2073_DUPLICATE_295a_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2045_l2068_l2065_l2061_l2058_l2053_l2076_l2050_l2073_DUPLICATE_e5d4_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2068_l2065_l2061_l2058_l2084_l2053_l2076_l2050_l2073_DUPLICATE_b117_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2054_l2069_l2062_l2077_DUPLICATE_e991_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2055_l2070_DUPLICATE_54df_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2055_l2070_DUPLICATE_54df_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_641b_uxn_opcodes_h_l2090_l2041_DUPLICATE_100d_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_n16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_n16 := n16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2056_c3_cda5 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2053_c7_812f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2056_c3_cda5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2068_c11_3448_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2045_c6_3caa_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2047_c3_07d5 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2045_c2_50d9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2047_c3_07d5;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2084_c7_7dd7_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2053_c11_4caa_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2073_c11_5950_right := to_unsigned(7, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2084_c7_7dd7_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c1_0a03_iffalse := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2076_c7_bbe1_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2081_c3_13cf := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2076_c7_bbe1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2081_c3_13cf;
     VAR_sp_relative_shift_uxn_opcodes_h_l2079_c30_65dd_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2050_c11_4469_right := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2079_c30_65dd_y := resize(to_signed(-3, 3), 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2074_c3_8f9b := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2073_c7_3f3d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2074_c3_8f9b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2084_c11_e137_right := to_unsigned(9, 4);
     VAR_MUX_uxn_opcodes_h_l2082_c21_c1da_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2076_c7_bbe1_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2051_c3_d2d7 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2050_c7_d21f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2051_c3_d2d7;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2059_c3_799a := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2058_c7_71bf_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2059_c3_799a;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2045_c2_50d9_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2058_c11_f608_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2065_c11_4ac4_right := to_unsigned(5, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2084_c7_7dd7_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2071_c3_1f1a := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2068_c7_9364_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2071_c3_1f1a;
     VAR_MUX_uxn_opcodes_h_l2082_c21_c1da_iftrue := resize(to_unsigned(1, 1), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2076_c11_ede8_right := to_unsigned(8, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2066_c3_3367 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2065_c7_5371_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2066_c3_3367;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2061_c11_41b9_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2063_c3_9a6a := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2061_c7_8115_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2063_c3_9a6a;

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c1_0a03_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l2079_c30_65dd_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2077_c3_5eeb_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2045_c2_50d9_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2050_c7_d21f_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2053_c7_812f_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2058_c7_71bf_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2061_c7_8115_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2065_c7_5371_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2073_c7_3f3d_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2076_c7_bbe1_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2045_c6_3caa_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2050_c11_4469_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2053_c11_4caa_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2058_c11_f608_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2061_c11_41b9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2065_c11_4ac4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2068_c11_3448_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2073_c11_5950_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2076_c11_ede8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2084_c11_e137_left := VAR_phase;
     VAR_BIN_OP_LT_uxn_opcodes_h_l2082_c21_57d6_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2062_c3_776d_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2045_c2_50d9_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2050_c7_d21f_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2058_c7_71bf_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2061_c7_8115_iffalse := t16;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2045_l2068_l2065_l2061_l2058_l2084_l2053_l2050_l2073_DUPLICATE_e5ba LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2045_l2068_l2065_l2061_l2058_l2084_l2053_l2050_l2073_DUPLICATE_e5ba_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2076_c11_ede8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2076_c11_ede8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2076_c11_ede8_left;
     BIN_OP_EQ_uxn_opcodes_h_l2076_c11_ede8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2076_c11_ede8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2076_c11_ede8_return_output := BIN_OP_EQ_uxn_opcodes_h_l2076_c11_ede8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2053_c11_4caa] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2053_c11_4caa_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2053_c11_4caa_left;
     BIN_OP_EQ_uxn_opcodes_h_l2053_c11_4caa_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2053_c11_4caa_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2053_c11_4caa_return_output := BIN_OP_EQ_uxn_opcodes_h_l2053_c11_4caa_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2065_c11_4ac4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2065_c11_4ac4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2065_c11_4ac4_left;
     BIN_OP_EQ_uxn_opcodes_h_l2065_c11_4ac4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2065_c11_4ac4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2065_c11_4ac4_return_output := BIN_OP_EQ_uxn_opcodes_h_l2065_c11_4ac4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2045_c6_3caa] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2045_c6_3caa_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2045_c6_3caa_left;
     BIN_OP_EQ_uxn_opcodes_h_l2045_c6_3caa_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2045_c6_3caa_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2045_c6_3caa_return_output := BIN_OP_EQ_uxn_opcodes_h_l2045_c6_3caa_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2045_l2068_l2065_l2061_l2058_l2053_l2076_l2050_l2073_DUPLICATE_e5d4 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2045_l2068_l2065_l2061_l2058_l2053_l2076_l2050_l2073_DUPLICATE_e5d4_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2084_c11_e137] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2084_c11_e137_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2084_c11_e137_left;
     BIN_OP_EQ_uxn_opcodes_h_l2084_c11_e137_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2084_c11_e137_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2084_c11_e137_return_output := BIN_OP_EQ_uxn_opcodes_h_l2084_c11_e137_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2050_c11_4469] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2050_c11_4469_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2050_c11_4469_left;
     BIN_OP_EQ_uxn_opcodes_h_l2050_c11_4469_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2050_c11_4469_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2050_c11_4469_return_output := BIN_OP_EQ_uxn_opcodes_h_l2050_c11_4469_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2045_l2068_l2065_l2061_l2058_l2084_l2053_l2050_l2073_DUPLICATE_5a84 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2045_l2068_l2065_l2061_l2058_l2084_l2053_l2050_l2073_DUPLICATE_5a84_return_output := result.is_stack_write;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2076_c7_bbe1] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2076_c7_bbe1_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2073_c11_5950] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2073_c11_5950_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2073_c11_5950_left;
     BIN_OP_EQ_uxn_opcodes_h_l2073_c11_5950_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2073_c11_5950_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2073_c11_5950_return_output := BIN_OP_EQ_uxn_opcodes_h_l2073_c11_5950_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2045_l2068_l2065_l2061_l2058_l2053_l2076_l2050_l2073_DUPLICATE_295a LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2045_l2068_l2065_l2061_l2058_l2053_l2076_l2050_l2073_DUPLICATE_295a_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2068_c11_3448] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2068_c11_3448_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2068_c11_3448_left;
     BIN_OP_EQ_uxn_opcodes_h_l2068_c11_3448_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2068_c11_3448_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2068_c11_3448_return_output := BIN_OP_EQ_uxn_opcodes_h_l2068_c11_3448_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2061_c11_41b9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2061_c11_41b9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2061_c11_41b9_left;
     BIN_OP_EQ_uxn_opcodes_h_l2061_c11_41b9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2061_c11_41b9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2061_c11_41b9_return_output := BIN_OP_EQ_uxn_opcodes_h_l2061_c11_41b9_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l2079_c30_65dd] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2079_c30_65dd_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2079_c30_65dd_ins;
     sp_relative_shift_uxn_opcodes_h_l2079_c30_65dd_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2079_c30_65dd_x;
     sp_relative_shift_uxn_opcodes_h_l2079_c30_65dd_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2079_c30_65dd_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2079_c30_65dd_return_output := sp_relative_shift_uxn_opcodes_h_l2079_c30_65dd_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2058_c11_f608] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2058_c11_f608_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2058_c11_f608_left;
     BIN_OP_EQ_uxn_opcodes_h_l2058_c11_f608_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2058_c11_f608_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2058_c11_f608_return_output := BIN_OP_EQ_uxn_opcodes_h_l2058_c11_f608_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2068_l2065_l2061_l2058_l2084_l2053_l2076_l2050_l2073_DUPLICATE_b117 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2068_l2065_l2061_l2058_l2084_l2053_l2076_l2050_l2073_DUPLICATE_b117_return_output := result.is_opc_done;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2054_l2069_l2062_l2077_DUPLICATE_e991 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2054_l2069_l2062_l2077_DUPLICATE_e991_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c1_0a03_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2045_c6_3caa_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2045_c2_50d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2045_c6_3caa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2045_c2_50d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2045_c6_3caa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2045_c2_50d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2045_c6_3caa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2045_c2_50d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2045_c6_3caa_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2045_c2_50d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2045_c6_3caa_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2045_c2_50d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2045_c6_3caa_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2045_c2_50d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2045_c6_3caa_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2045_c2_50d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2045_c6_3caa_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2050_c7_d21f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2050_c11_4469_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2050_c7_d21f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2050_c11_4469_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2050_c7_d21f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2050_c11_4469_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2050_c7_d21f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2050_c11_4469_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2050_c7_d21f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2050_c11_4469_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2050_c7_d21f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2050_c11_4469_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2050_c7_d21f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2050_c11_4469_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2050_c7_d21f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2050_c11_4469_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2053_c7_812f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2053_c11_4caa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2053_c7_812f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2053_c11_4caa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2053_c7_812f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2053_c11_4caa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2053_c7_812f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2053_c11_4caa_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2053_c7_812f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2053_c11_4caa_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2053_c7_812f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2053_c11_4caa_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2053_c7_812f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2053_c11_4caa_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2053_c7_812f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2053_c11_4caa_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2058_c7_71bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2058_c11_f608_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2058_c7_71bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2058_c11_f608_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2058_c7_71bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2058_c11_f608_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2058_c7_71bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2058_c11_f608_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2058_c7_71bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2058_c11_f608_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2058_c7_71bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2058_c11_f608_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2058_c7_71bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2058_c11_f608_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2058_c7_71bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2058_c11_f608_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2061_c7_8115_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2061_c11_41b9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2061_c7_8115_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2061_c11_41b9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2061_c7_8115_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2061_c11_41b9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2061_c7_8115_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2061_c11_41b9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2061_c7_8115_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2061_c11_41b9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2061_c7_8115_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2061_c11_41b9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2061_c7_8115_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2061_c11_41b9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2061_c7_8115_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2061_c11_41b9_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2065_c7_5371_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2065_c11_4ac4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2065_c7_5371_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2065_c11_4ac4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2065_c7_5371_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2065_c11_4ac4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2065_c7_5371_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2065_c11_4ac4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2065_c7_5371_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2065_c11_4ac4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2065_c7_5371_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2065_c11_4ac4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2065_c7_5371_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2065_c11_4ac4_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2068_c7_9364_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2068_c11_3448_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2068_c7_9364_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2068_c11_3448_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2068_c7_9364_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2068_c11_3448_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2068_c7_9364_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2068_c11_3448_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2068_c7_9364_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2068_c11_3448_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2068_c7_9364_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2068_c11_3448_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2068_c7_9364_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2068_c11_3448_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2073_c7_3f3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2073_c11_5950_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2073_c7_3f3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2073_c11_5950_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2073_c7_3f3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2073_c11_5950_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2073_c7_3f3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2073_c11_5950_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2073_c7_3f3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2073_c11_5950_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2073_c7_3f3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2073_c11_5950_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2073_c7_3f3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2073_c11_5950_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2076_c7_bbe1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2076_c11_ede8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2076_c7_bbe1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2076_c11_ede8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2076_c7_bbe1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2076_c11_ede8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2076_c7_bbe1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2076_c11_ede8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2076_c7_bbe1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2076_c11_ede8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2076_c7_bbe1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2076_c11_ede8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2076_c7_bbe1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2076_c11_ede8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2084_c7_7dd7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2084_c11_e137_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2084_c7_7dd7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2084_c11_e137_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2084_c7_7dd7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2084_c11_e137_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2062_c3_776d_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2054_l2069_l2062_l2077_DUPLICATE_e991_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2077_c3_5eeb_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2054_l2069_l2062_l2077_DUPLICATE_e991_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2055_l2070_DUPLICATE_54df_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2054_l2069_l2062_l2077_DUPLICATE_e991_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2045_c2_50d9_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2045_l2068_l2065_l2061_l2058_l2053_l2076_l2050_l2073_DUPLICATE_e5d4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2050_c7_d21f_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2045_l2068_l2065_l2061_l2058_l2053_l2076_l2050_l2073_DUPLICATE_e5d4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2053_c7_812f_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2045_l2068_l2065_l2061_l2058_l2053_l2076_l2050_l2073_DUPLICATE_e5d4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2058_c7_71bf_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2045_l2068_l2065_l2061_l2058_l2053_l2076_l2050_l2073_DUPLICATE_e5d4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2061_c7_8115_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2045_l2068_l2065_l2061_l2058_l2053_l2076_l2050_l2073_DUPLICATE_e5d4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2065_c7_5371_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2045_l2068_l2065_l2061_l2058_l2053_l2076_l2050_l2073_DUPLICATE_e5d4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2068_c7_9364_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2045_l2068_l2065_l2061_l2058_l2053_l2076_l2050_l2073_DUPLICATE_e5d4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2073_c7_3f3d_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2045_l2068_l2065_l2061_l2058_l2053_l2076_l2050_l2073_DUPLICATE_e5d4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2076_c7_bbe1_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2045_l2068_l2065_l2061_l2058_l2053_l2076_l2050_l2073_DUPLICATE_e5d4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2050_c7_d21f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2068_l2065_l2061_l2058_l2084_l2053_l2076_l2050_l2073_DUPLICATE_b117_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2053_c7_812f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2068_l2065_l2061_l2058_l2084_l2053_l2076_l2050_l2073_DUPLICATE_b117_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2058_c7_71bf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2068_l2065_l2061_l2058_l2084_l2053_l2076_l2050_l2073_DUPLICATE_b117_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2061_c7_8115_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2068_l2065_l2061_l2058_l2084_l2053_l2076_l2050_l2073_DUPLICATE_b117_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2065_c7_5371_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2068_l2065_l2061_l2058_l2084_l2053_l2076_l2050_l2073_DUPLICATE_b117_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2068_c7_9364_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2068_l2065_l2061_l2058_l2084_l2053_l2076_l2050_l2073_DUPLICATE_b117_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2073_c7_3f3d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2068_l2065_l2061_l2058_l2084_l2053_l2076_l2050_l2073_DUPLICATE_b117_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2076_c7_bbe1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2068_l2065_l2061_l2058_l2084_l2053_l2076_l2050_l2073_DUPLICATE_b117_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2084_c7_7dd7_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2068_l2065_l2061_l2058_l2084_l2053_l2076_l2050_l2073_DUPLICATE_b117_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2045_c2_50d9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2045_l2068_l2065_l2061_l2058_l2084_l2053_l2050_l2073_DUPLICATE_e5ba_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2050_c7_d21f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2045_l2068_l2065_l2061_l2058_l2084_l2053_l2050_l2073_DUPLICATE_e5ba_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2053_c7_812f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2045_l2068_l2065_l2061_l2058_l2084_l2053_l2050_l2073_DUPLICATE_e5ba_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2058_c7_71bf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2045_l2068_l2065_l2061_l2058_l2084_l2053_l2050_l2073_DUPLICATE_e5ba_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2061_c7_8115_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2045_l2068_l2065_l2061_l2058_l2084_l2053_l2050_l2073_DUPLICATE_e5ba_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2065_c7_5371_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2045_l2068_l2065_l2061_l2058_l2084_l2053_l2050_l2073_DUPLICATE_e5ba_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2068_c7_9364_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2045_l2068_l2065_l2061_l2058_l2084_l2053_l2050_l2073_DUPLICATE_e5ba_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2073_c7_3f3d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2045_l2068_l2065_l2061_l2058_l2084_l2053_l2050_l2073_DUPLICATE_e5ba_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2084_c7_7dd7_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2045_l2068_l2065_l2061_l2058_l2084_l2053_l2050_l2073_DUPLICATE_e5ba_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2045_c2_50d9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2045_l2068_l2065_l2061_l2058_l2084_l2053_l2050_l2073_DUPLICATE_5a84_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2050_c7_d21f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2045_l2068_l2065_l2061_l2058_l2084_l2053_l2050_l2073_DUPLICATE_5a84_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2053_c7_812f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2045_l2068_l2065_l2061_l2058_l2084_l2053_l2050_l2073_DUPLICATE_5a84_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2058_c7_71bf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2045_l2068_l2065_l2061_l2058_l2084_l2053_l2050_l2073_DUPLICATE_5a84_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2061_c7_8115_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2045_l2068_l2065_l2061_l2058_l2084_l2053_l2050_l2073_DUPLICATE_5a84_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2065_c7_5371_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2045_l2068_l2065_l2061_l2058_l2084_l2053_l2050_l2073_DUPLICATE_5a84_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2068_c7_9364_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2045_l2068_l2065_l2061_l2058_l2084_l2053_l2050_l2073_DUPLICATE_5a84_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2073_c7_3f3d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2045_l2068_l2065_l2061_l2058_l2084_l2053_l2050_l2073_DUPLICATE_5a84_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2084_c7_7dd7_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2045_l2068_l2065_l2061_l2058_l2084_l2053_l2050_l2073_DUPLICATE_5a84_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2045_c2_50d9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2045_l2068_l2065_l2061_l2058_l2053_l2076_l2050_l2073_DUPLICATE_295a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2050_c7_d21f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2045_l2068_l2065_l2061_l2058_l2053_l2076_l2050_l2073_DUPLICATE_295a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2053_c7_812f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2045_l2068_l2065_l2061_l2058_l2053_l2076_l2050_l2073_DUPLICATE_295a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2058_c7_71bf_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2045_l2068_l2065_l2061_l2058_l2053_l2076_l2050_l2073_DUPLICATE_295a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2061_c7_8115_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2045_l2068_l2065_l2061_l2058_l2053_l2076_l2050_l2073_DUPLICATE_295a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2065_c7_5371_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2045_l2068_l2065_l2061_l2058_l2053_l2076_l2050_l2073_DUPLICATE_295a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2068_c7_9364_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2045_l2068_l2065_l2061_l2058_l2053_l2076_l2050_l2073_DUPLICATE_295a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2073_c7_3f3d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2045_l2068_l2065_l2061_l2058_l2053_l2076_l2050_l2073_DUPLICATE_295a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2076_c7_bbe1_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2045_l2068_l2065_l2061_l2058_l2053_l2076_l2050_l2073_DUPLICATE_295a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2076_c7_bbe1_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2076_c7_bbe1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2076_c7_bbe1_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2079_c30_65dd_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2045_c1_0a03] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c1_0a03_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c1_0a03_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c1_0a03_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c1_0a03_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c1_0a03_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c1_0a03_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c1_0a03_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c1_0a03_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2076_c7_bbe1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2076_c7_bbe1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2076_c7_bbe1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2076_c7_bbe1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2076_c7_bbe1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2076_c7_bbe1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2076_c7_bbe1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2076_c7_bbe1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2076_c7_bbe1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2084_c7_7dd7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2084_c7_7dd7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2084_c7_7dd7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2084_c7_7dd7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2084_c7_7dd7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2084_c7_7dd7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2084_c7_7dd7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2084_c7_7dd7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2084_c7_7dd7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2076_c7_bbe1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2076_c7_bbe1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2076_c7_bbe1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2076_c7_bbe1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2076_c7_bbe1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2076_c7_bbe1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2076_c7_bbe1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2076_c7_bbe1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2076_c7_bbe1_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2062_c3_776d] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2062_c3_776d_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2062_c3_776d_left;
     BIN_OP_OR_uxn_opcodes_h_l2062_c3_776d_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2062_c3_776d_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2062_c3_776d_return_output := BIN_OP_OR_uxn_opcodes_h_l2062_c3_776d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2084_c7_7dd7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2084_c7_7dd7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2084_c7_7dd7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2084_c7_7dd7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2084_c7_7dd7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2084_c7_7dd7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2084_c7_7dd7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2084_c7_7dd7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2084_c7_7dd7_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2084_c7_7dd7] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2084_c7_7dd7_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2084_c7_7dd7_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2084_c7_7dd7_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2084_c7_7dd7_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2084_c7_7dd7_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2084_c7_7dd7_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2084_c7_7dd7_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2084_c7_7dd7_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l2055_l2070_DUPLICATE_54df LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l2055_l2070_DUPLICATE_54df_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2055_l2070_DUPLICATE_54df_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2055_l2070_DUPLICATE_54df_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l2055_l2070_DUPLICATE_54df_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2077_c3_5eeb] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2077_c3_5eeb_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2077_c3_5eeb_left;
     BIN_OP_OR_uxn_opcodes_h_l2077_c3_5eeb_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2077_c3_5eeb_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2077_c3_5eeb_return_output := BIN_OP_OR_uxn_opcodes_h_l2077_c3_5eeb_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l2061_c7_8115_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2062_c3_776d_return_output;
     VAR_BIN_OP_LT_uxn_opcodes_h_l2082_c21_57d6_left := VAR_BIN_OP_OR_uxn_opcodes_h_l2077_c3_5eeb_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2076_c7_bbe1_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2077_c3_5eeb_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2068_c7_9364_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2055_l2070_DUPLICATE_54df_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2053_c7_812f_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2055_l2070_DUPLICATE_54df_return_output;
     VAR_printf_uxn_opcodes_h_l2046_c3_3ad7_uxn_opcodes_h_l2046_c3_3ad7_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2045_c1_0a03_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2076_c7_bbe1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2084_c7_7dd7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2076_c7_bbe1_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2084_c7_7dd7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2076_c7_bbe1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2084_c7_7dd7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2073_c7_3f3d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2076_c7_bbe1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2073_c7_3f3d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2076_c7_bbe1_return_output;
     -- n16_MUX[uxn_opcodes_h_l2076_c7_bbe1] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2076_c7_bbe1_cond <= VAR_n16_MUX_uxn_opcodes_h_l2076_c7_bbe1_cond;
     n16_MUX_uxn_opcodes_h_l2076_c7_bbe1_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2076_c7_bbe1_iftrue;
     n16_MUX_uxn_opcodes_h_l2076_c7_bbe1_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2076_c7_bbe1_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2076_c7_bbe1_return_output := n16_MUX_uxn_opcodes_h_l2076_c7_bbe1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2073_c7_3f3d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2073_c7_3f3d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2073_c7_3f3d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2073_c7_3f3d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2073_c7_3f3d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2073_c7_3f3d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2073_c7_3f3d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2073_c7_3f3d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2073_c7_3f3d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2076_c7_bbe1] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2076_c7_bbe1_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2076_c7_bbe1_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2076_c7_bbe1_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2076_c7_bbe1_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2076_c7_bbe1_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2076_c7_bbe1_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2076_c7_bbe1_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2076_c7_bbe1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2076_c7_bbe1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2076_c7_bbe1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2076_c7_bbe1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2076_c7_bbe1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2076_c7_bbe1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2076_c7_bbe1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2076_c7_bbe1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2076_c7_bbe1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2076_c7_bbe1_return_output;

     -- t16_MUX[uxn_opcodes_h_l2061_c7_8115] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2061_c7_8115_cond <= VAR_t16_MUX_uxn_opcodes_h_l2061_c7_8115_cond;
     t16_MUX_uxn_opcodes_h_l2061_c7_8115_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2061_c7_8115_iftrue;
     t16_MUX_uxn_opcodes_h_l2061_c7_8115_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2061_c7_8115_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2061_c7_8115_return_output := t16_MUX_uxn_opcodes_h_l2061_c7_8115_return_output;

     -- BIN_OP_LT[uxn_opcodes_h_l2082_c21_57d6] LATENCY=0
     -- Inputs
     BIN_OP_LT_uxn_opcodes_h_l2082_c21_57d6_left <= VAR_BIN_OP_LT_uxn_opcodes_h_l2082_c21_57d6_left;
     BIN_OP_LT_uxn_opcodes_h_l2082_c21_57d6_right <= VAR_BIN_OP_LT_uxn_opcodes_h_l2082_c21_57d6_right;
     -- Outputs
     VAR_BIN_OP_LT_uxn_opcodes_h_l2082_c21_57d6_return_output := BIN_OP_LT_uxn_opcodes_h_l2082_c21_57d6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2076_c7_bbe1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2076_c7_bbe1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2076_c7_bbe1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2076_c7_bbe1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2076_c7_bbe1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2076_c7_bbe1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2076_c7_bbe1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2076_c7_bbe1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2076_c7_bbe1_return_output;

     -- printf_uxn_opcodes_h_l2046_c3_3ad7[uxn_opcodes_h_l2046_c3_3ad7] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2046_c3_3ad7_uxn_opcodes_h_l2046_c3_3ad7_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2046_c3_3ad7_uxn_opcodes_h_l2046_c3_3ad7_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2073_c7_3f3d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2073_c7_3f3d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2073_c7_3f3d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2073_c7_3f3d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2073_c7_3f3d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2073_c7_3f3d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2073_c7_3f3d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2073_c7_3f3d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2073_c7_3f3d_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_opcodes_h_l2082_c21_c1da_cond := VAR_BIN_OP_LT_uxn_opcodes_h_l2082_c21_57d6_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2073_c7_3f3d_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2076_c7_bbe1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2073_c7_3f3d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2076_c7_bbe1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2073_c7_3f3d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2076_c7_bbe1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2073_c7_3f3d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2076_c7_bbe1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2068_c7_9364_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2073_c7_3f3d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2068_c7_9364_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2073_c7_3f3d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2058_c7_71bf_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2061_c7_8115_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2073_c7_3f3d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2073_c7_3f3d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2073_c7_3f3d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2073_c7_3f3d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2073_c7_3f3d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2073_c7_3f3d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2073_c7_3f3d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2073_c7_3f3d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2073_c7_3f3d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2073_c7_3f3d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2073_c7_3f3d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2073_c7_3f3d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2073_c7_3f3d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2073_c7_3f3d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2073_c7_3f3d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2073_c7_3f3d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2073_c7_3f3d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2073_c7_3f3d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2068_c7_9364] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2068_c7_9364_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2068_c7_9364_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2068_c7_9364_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2068_c7_9364_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2068_c7_9364_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2068_c7_9364_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2068_c7_9364_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2068_c7_9364_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2068_c7_9364] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2068_c7_9364_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2068_c7_9364_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2068_c7_9364_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2068_c7_9364_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2068_c7_9364_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2068_c7_9364_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2068_c7_9364_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2068_c7_9364_return_output;

     -- n16_MUX[uxn_opcodes_h_l2073_c7_3f3d] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2073_c7_3f3d_cond <= VAR_n16_MUX_uxn_opcodes_h_l2073_c7_3f3d_cond;
     n16_MUX_uxn_opcodes_h_l2073_c7_3f3d_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2073_c7_3f3d_iftrue;
     n16_MUX_uxn_opcodes_h_l2073_c7_3f3d_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2073_c7_3f3d_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2073_c7_3f3d_return_output := n16_MUX_uxn_opcodes_h_l2073_c7_3f3d_return_output;

     -- MUX[uxn_opcodes_h_l2082_c21_c1da] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2082_c21_c1da_cond <= VAR_MUX_uxn_opcodes_h_l2082_c21_c1da_cond;
     MUX_uxn_opcodes_h_l2082_c21_c1da_iftrue <= VAR_MUX_uxn_opcodes_h_l2082_c21_c1da_iftrue;
     MUX_uxn_opcodes_h_l2082_c21_c1da_iffalse <= VAR_MUX_uxn_opcodes_h_l2082_c21_c1da_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2082_c21_c1da_return_output := MUX_uxn_opcodes_h_l2082_c21_c1da_return_output;

     -- t16_MUX[uxn_opcodes_h_l2058_c7_71bf] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2058_c7_71bf_cond <= VAR_t16_MUX_uxn_opcodes_h_l2058_c7_71bf_cond;
     t16_MUX_uxn_opcodes_h_l2058_c7_71bf_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2058_c7_71bf_iftrue;
     t16_MUX_uxn_opcodes_h_l2058_c7_71bf_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2058_c7_71bf_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2058_c7_71bf_return_output := t16_MUX_uxn_opcodes_h_l2058_c7_71bf_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2073_c7_3f3d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2073_c7_3f3d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2073_c7_3f3d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2073_c7_3f3d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2073_c7_3f3d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2073_c7_3f3d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2073_c7_3f3d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2073_c7_3f3d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2073_c7_3f3d_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2076_c7_bbe1_iftrue := VAR_MUX_uxn_opcodes_h_l2082_c21_c1da_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2068_c7_9364_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2073_c7_3f3d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2068_c7_9364_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2073_c7_3f3d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2068_c7_9364_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2073_c7_3f3d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2068_c7_9364_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2073_c7_3f3d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2065_c7_5371_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2068_c7_9364_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2065_c7_5371_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2068_c7_9364_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2053_c7_812f_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2058_c7_71bf_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2076_c7_bbe1] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2076_c7_bbe1_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2076_c7_bbe1_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2076_c7_bbe1_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2076_c7_bbe1_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2076_c7_bbe1_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2076_c7_bbe1_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2076_c7_bbe1_return_output := result_u8_value_MUX_uxn_opcodes_h_l2076_c7_bbe1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2068_c7_9364] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2068_c7_9364_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2068_c7_9364_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2068_c7_9364_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2068_c7_9364_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2068_c7_9364_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2068_c7_9364_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2068_c7_9364_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2068_c7_9364_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2068_c7_9364] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2068_c7_9364_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2068_c7_9364_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2068_c7_9364_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2068_c7_9364_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2068_c7_9364_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2068_c7_9364_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2068_c7_9364_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2068_c7_9364_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2068_c7_9364] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2068_c7_9364_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2068_c7_9364_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2068_c7_9364_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2068_c7_9364_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2068_c7_9364_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2068_c7_9364_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2068_c7_9364_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2068_c7_9364_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2065_c7_5371] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2065_c7_5371_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2065_c7_5371_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2065_c7_5371_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2065_c7_5371_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2065_c7_5371_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2065_c7_5371_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2065_c7_5371_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2065_c7_5371_return_output;

     -- t16_MUX[uxn_opcodes_h_l2053_c7_812f] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2053_c7_812f_cond <= VAR_t16_MUX_uxn_opcodes_h_l2053_c7_812f_cond;
     t16_MUX_uxn_opcodes_h_l2053_c7_812f_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2053_c7_812f_iftrue;
     t16_MUX_uxn_opcodes_h_l2053_c7_812f_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2053_c7_812f_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2053_c7_812f_return_output := t16_MUX_uxn_opcodes_h_l2053_c7_812f_return_output;

     -- n16_MUX[uxn_opcodes_h_l2068_c7_9364] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2068_c7_9364_cond <= VAR_n16_MUX_uxn_opcodes_h_l2068_c7_9364_cond;
     n16_MUX_uxn_opcodes_h_l2068_c7_9364_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2068_c7_9364_iftrue;
     n16_MUX_uxn_opcodes_h_l2068_c7_9364_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2068_c7_9364_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2068_c7_9364_return_output := n16_MUX_uxn_opcodes_h_l2068_c7_9364_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2065_c7_5371] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2065_c7_5371_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2065_c7_5371_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2065_c7_5371_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2065_c7_5371_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2065_c7_5371_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2065_c7_5371_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2065_c7_5371_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2065_c7_5371_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l2065_c7_5371_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2068_c7_9364_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2065_c7_5371_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2068_c7_9364_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2065_c7_5371_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2068_c7_9364_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2065_c7_5371_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2068_c7_9364_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2061_c7_8115_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2065_c7_5371_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2061_c7_8115_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2065_c7_5371_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2073_c7_3f3d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2076_c7_bbe1_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2050_c7_d21f_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2053_c7_812f_return_output;
     -- t16_MUX[uxn_opcodes_h_l2050_c7_d21f] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2050_c7_d21f_cond <= VAR_t16_MUX_uxn_opcodes_h_l2050_c7_d21f_cond;
     t16_MUX_uxn_opcodes_h_l2050_c7_d21f_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2050_c7_d21f_iftrue;
     t16_MUX_uxn_opcodes_h_l2050_c7_d21f_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2050_c7_d21f_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2050_c7_d21f_return_output := t16_MUX_uxn_opcodes_h_l2050_c7_d21f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2065_c7_5371] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2065_c7_5371_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2065_c7_5371_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2065_c7_5371_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2065_c7_5371_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2065_c7_5371_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2065_c7_5371_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2065_c7_5371_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2065_c7_5371_return_output;

     -- n16_MUX[uxn_opcodes_h_l2065_c7_5371] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2065_c7_5371_cond <= VAR_n16_MUX_uxn_opcodes_h_l2065_c7_5371_cond;
     n16_MUX_uxn_opcodes_h_l2065_c7_5371_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2065_c7_5371_iftrue;
     n16_MUX_uxn_opcodes_h_l2065_c7_5371_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2065_c7_5371_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2065_c7_5371_return_output := n16_MUX_uxn_opcodes_h_l2065_c7_5371_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2073_c7_3f3d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2073_c7_3f3d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2073_c7_3f3d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2073_c7_3f3d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2073_c7_3f3d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2073_c7_3f3d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2073_c7_3f3d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2073_c7_3f3d_return_output := result_u8_value_MUX_uxn_opcodes_h_l2073_c7_3f3d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2061_c7_8115] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2061_c7_8115_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2061_c7_8115_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2061_c7_8115_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2061_c7_8115_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2061_c7_8115_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2061_c7_8115_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2061_c7_8115_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2061_c7_8115_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2065_c7_5371] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2065_c7_5371_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2065_c7_5371_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2065_c7_5371_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2065_c7_5371_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2065_c7_5371_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2065_c7_5371_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2065_c7_5371_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2065_c7_5371_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2065_c7_5371] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2065_c7_5371_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2065_c7_5371_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2065_c7_5371_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2065_c7_5371_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2065_c7_5371_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2065_c7_5371_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2065_c7_5371_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2065_c7_5371_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2061_c7_8115] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2061_c7_8115_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2061_c7_8115_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2061_c7_8115_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2061_c7_8115_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2061_c7_8115_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2061_c7_8115_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2061_c7_8115_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2061_c7_8115_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2061_c7_8115_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2065_c7_5371_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2061_c7_8115_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2065_c7_5371_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2061_c7_8115_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2065_c7_5371_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2061_c7_8115_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2065_c7_5371_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2058_c7_71bf_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2061_c7_8115_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2058_c7_71bf_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2061_c7_8115_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2068_c7_9364_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2073_c7_3f3d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2045_c2_50d9_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2050_c7_d21f_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2061_c7_8115] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2061_c7_8115_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2061_c7_8115_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2061_c7_8115_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2061_c7_8115_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2061_c7_8115_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2061_c7_8115_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2061_c7_8115_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2061_c7_8115_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2061_c7_8115] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2061_c7_8115_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2061_c7_8115_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2061_c7_8115_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2061_c7_8115_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2061_c7_8115_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2061_c7_8115_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2061_c7_8115_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2061_c7_8115_return_output;

     -- t16_MUX[uxn_opcodes_h_l2045_c2_50d9] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2045_c2_50d9_cond <= VAR_t16_MUX_uxn_opcodes_h_l2045_c2_50d9_cond;
     t16_MUX_uxn_opcodes_h_l2045_c2_50d9_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2045_c2_50d9_iftrue;
     t16_MUX_uxn_opcodes_h_l2045_c2_50d9_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2045_c2_50d9_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2045_c2_50d9_return_output := t16_MUX_uxn_opcodes_h_l2045_c2_50d9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2061_c7_8115] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2061_c7_8115_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2061_c7_8115_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2061_c7_8115_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2061_c7_8115_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2061_c7_8115_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2061_c7_8115_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2061_c7_8115_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2061_c7_8115_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2068_c7_9364] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2068_c7_9364_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2068_c7_9364_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2068_c7_9364_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2068_c7_9364_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2068_c7_9364_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2068_c7_9364_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2068_c7_9364_return_output := result_u8_value_MUX_uxn_opcodes_h_l2068_c7_9364_return_output;

     -- n16_MUX[uxn_opcodes_h_l2061_c7_8115] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2061_c7_8115_cond <= VAR_n16_MUX_uxn_opcodes_h_l2061_c7_8115_cond;
     n16_MUX_uxn_opcodes_h_l2061_c7_8115_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2061_c7_8115_iftrue;
     n16_MUX_uxn_opcodes_h_l2061_c7_8115_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2061_c7_8115_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2061_c7_8115_return_output := n16_MUX_uxn_opcodes_h_l2061_c7_8115_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2058_c7_71bf] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2058_c7_71bf_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2058_c7_71bf_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2058_c7_71bf_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2058_c7_71bf_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2058_c7_71bf_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2058_c7_71bf_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2058_c7_71bf_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2058_c7_71bf_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2058_c7_71bf] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2058_c7_71bf_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2058_c7_71bf_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2058_c7_71bf_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2058_c7_71bf_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2058_c7_71bf_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2058_c7_71bf_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2058_c7_71bf_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2058_c7_71bf_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l2058_c7_71bf_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2061_c7_8115_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2058_c7_71bf_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2061_c7_8115_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2058_c7_71bf_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2061_c7_8115_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2058_c7_71bf_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2061_c7_8115_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2053_c7_812f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2058_c7_71bf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2053_c7_812f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2058_c7_71bf_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2065_c7_5371_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2068_c7_9364_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2045_c2_50d9_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2065_c7_5371] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2065_c7_5371_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2065_c7_5371_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2065_c7_5371_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2065_c7_5371_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2065_c7_5371_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2065_c7_5371_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2065_c7_5371_return_output := result_u8_value_MUX_uxn_opcodes_h_l2065_c7_5371_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2053_c7_812f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2053_c7_812f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2053_c7_812f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2053_c7_812f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2053_c7_812f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2053_c7_812f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2053_c7_812f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2053_c7_812f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2053_c7_812f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2058_c7_71bf] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2058_c7_71bf_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2058_c7_71bf_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2058_c7_71bf_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2058_c7_71bf_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2058_c7_71bf_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2058_c7_71bf_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2058_c7_71bf_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2058_c7_71bf_return_output;

     -- n16_MUX[uxn_opcodes_h_l2058_c7_71bf] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2058_c7_71bf_cond <= VAR_n16_MUX_uxn_opcodes_h_l2058_c7_71bf_cond;
     n16_MUX_uxn_opcodes_h_l2058_c7_71bf_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2058_c7_71bf_iftrue;
     n16_MUX_uxn_opcodes_h_l2058_c7_71bf_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2058_c7_71bf_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2058_c7_71bf_return_output := n16_MUX_uxn_opcodes_h_l2058_c7_71bf_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2058_c7_71bf] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2058_c7_71bf_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2058_c7_71bf_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2058_c7_71bf_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2058_c7_71bf_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2058_c7_71bf_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2058_c7_71bf_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2058_c7_71bf_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2058_c7_71bf_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2053_c7_812f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2053_c7_812f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2053_c7_812f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2053_c7_812f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2053_c7_812f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2053_c7_812f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2053_c7_812f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2053_c7_812f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2053_c7_812f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2058_c7_71bf] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2058_c7_71bf_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2058_c7_71bf_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2058_c7_71bf_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2058_c7_71bf_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2058_c7_71bf_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2058_c7_71bf_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2058_c7_71bf_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2058_c7_71bf_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l2053_c7_812f_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2058_c7_71bf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2053_c7_812f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2058_c7_71bf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2053_c7_812f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2058_c7_71bf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2053_c7_812f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2058_c7_71bf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2050_c7_d21f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2053_c7_812f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2050_c7_d21f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2053_c7_812f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2061_c7_8115_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2065_c7_5371_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2061_c7_8115] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2061_c7_8115_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2061_c7_8115_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2061_c7_8115_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2061_c7_8115_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2061_c7_8115_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2061_c7_8115_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2061_c7_8115_return_output := result_u8_value_MUX_uxn_opcodes_h_l2061_c7_8115_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2053_c7_812f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2053_c7_812f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2053_c7_812f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2053_c7_812f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2053_c7_812f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2053_c7_812f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2053_c7_812f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2053_c7_812f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2053_c7_812f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2053_c7_812f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2053_c7_812f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2053_c7_812f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2053_c7_812f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2053_c7_812f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2053_c7_812f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2053_c7_812f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2053_c7_812f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2053_c7_812f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2050_c7_d21f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2050_c7_d21f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2050_c7_d21f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2050_c7_d21f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2050_c7_d21f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2050_c7_d21f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2050_c7_d21f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2050_c7_d21f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2050_c7_d21f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2053_c7_812f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2053_c7_812f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2053_c7_812f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2053_c7_812f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2053_c7_812f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2053_c7_812f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2053_c7_812f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2053_c7_812f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2053_c7_812f_return_output;

     -- n16_MUX[uxn_opcodes_h_l2053_c7_812f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2053_c7_812f_cond <= VAR_n16_MUX_uxn_opcodes_h_l2053_c7_812f_cond;
     n16_MUX_uxn_opcodes_h_l2053_c7_812f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2053_c7_812f_iftrue;
     n16_MUX_uxn_opcodes_h_l2053_c7_812f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2053_c7_812f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2053_c7_812f_return_output := n16_MUX_uxn_opcodes_h_l2053_c7_812f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2050_c7_d21f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2050_c7_d21f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2050_c7_d21f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2050_c7_d21f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2050_c7_d21f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2050_c7_d21f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2050_c7_d21f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2050_c7_d21f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2050_c7_d21f_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l2050_c7_d21f_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2053_c7_812f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2050_c7_d21f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2053_c7_812f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2050_c7_d21f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2053_c7_812f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2050_c7_d21f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2053_c7_812f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2045_c2_50d9_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2050_c7_d21f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2045_c2_50d9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2050_c7_d21f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2058_c7_71bf_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2061_c7_8115_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2050_c7_d21f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2050_c7_d21f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2050_c7_d21f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2050_c7_d21f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2050_c7_d21f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2050_c7_d21f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2050_c7_d21f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2050_c7_d21f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2050_c7_d21f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2045_c2_50d9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2045_c2_50d9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2045_c2_50d9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2045_c2_50d9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2045_c2_50d9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2045_c2_50d9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2045_c2_50d9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2045_c2_50d9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2045_c2_50d9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2045_c2_50d9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2045_c2_50d9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2045_c2_50d9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2045_c2_50d9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2045_c2_50d9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2045_c2_50d9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2045_c2_50d9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2045_c2_50d9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2045_c2_50d9_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2050_c7_d21f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2050_c7_d21f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2050_c7_d21f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2050_c7_d21f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2050_c7_d21f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2050_c7_d21f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2050_c7_d21f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2050_c7_d21f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2050_c7_d21f_return_output;

     -- n16_MUX[uxn_opcodes_h_l2050_c7_d21f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2050_c7_d21f_cond <= VAR_n16_MUX_uxn_opcodes_h_l2050_c7_d21f_cond;
     n16_MUX_uxn_opcodes_h_l2050_c7_d21f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2050_c7_d21f_iftrue;
     n16_MUX_uxn_opcodes_h_l2050_c7_d21f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2050_c7_d21f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2050_c7_d21f_return_output := n16_MUX_uxn_opcodes_h_l2050_c7_d21f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2050_c7_d21f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2050_c7_d21f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2050_c7_d21f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2050_c7_d21f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2050_c7_d21f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2050_c7_d21f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2050_c7_d21f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2050_c7_d21f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2050_c7_d21f_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2058_c7_71bf] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2058_c7_71bf_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2058_c7_71bf_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2058_c7_71bf_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2058_c7_71bf_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2058_c7_71bf_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2058_c7_71bf_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2058_c7_71bf_return_output := result_u8_value_MUX_uxn_opcodes_h_l2058_c7_71bf_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l2045_c2_50d9_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2050_c7_d21f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2045_c2_50d9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2050_c7_d21f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2045_c2_50d9_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2050_c7_d21f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2045_c2_50d9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2050_c7_d21f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2053_c7_812f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2058_c7_71bf_return_output;
     -- n16_MUX[uxn_opcodes_h_l2045_c2_50d9] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2045_c2_50d9_cond <= VAR_n16_MUX_uxn_opcodes_h_l2045_c2_50d9_cond;
     n16_MUX_uxn_opcodes_h_l2045_c2_50d9_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2045_c2_50d9_iftrue;
     n16_MUX_uxn_opcodes_h_l2045_c2_50d9_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2045_c2_50d9_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2045_c2_50d9_return_output := n16_MUX_uxn_opcodes_h_l2045_c2_50d9_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2053_c7_812f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2053_c7_812f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2053_c7_812f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2053_c7_812f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2053_c7_812f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2053_c7_812f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2053_c7_812f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2053_c7_812f_return_output := result_u8_value_MUX_uxn_opcodes_h_l2053_c7_812f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2045_c2_50d9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2045_c2_50d9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2045_c2_50d9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2045_c2_50d9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2045_c2_50d9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2045_c2_50d9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2045_c2_50d9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2045_c2_50d9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2045_c2_50d9_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2045_c2_50d9] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2045_c2_50d9_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2045_c2_50d9_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2045_c2_50d9_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2045_c2_50d9_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2045_c2_50d9_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2045_c2_50d9_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2045_c2_50d9_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2045_c2_50d9_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2045_c2_50d9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2045_c2_50d9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2045_c2_50d9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2045_c2_50d9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2045_c2_50d9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2045_c2_50d9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2045_c2_50d9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2045_c2_50d9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2045_c2_50d9_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2045_c2_50d9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2050_c7_d21f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2053_c7_812f_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2050_c7_d21f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2050_c7_d21f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2050_c7_d21f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2050_c7_d21f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2050_c7_d21f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2050_c7_d21f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2050_c7_d21f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2050_c7_d21f_return_output := result_u8_value_MUX_uxn_opcodes_h_l2050_c7_d21f_return_output;

     -- Submodule level 12
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2045_c2_50d9_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2050_c7_d21f_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2045_c2_50d9] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2045_c2_50d9_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2045_c2_50d9_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2045_c2_50d9_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2045_c2_50d9_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2045_c2_50d9_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2045_c2_50d9_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2045_c2_50d9_return_output := result_u8_value_MUX_uxn_opcodes_h_l2045_c2_50d9_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_641b_uxn_opcodes_h_l2090_l2041_DUPLICATE_100d LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_641b_uxn_opcodes_h_l2090_l2041_DUPLICATE_100d_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_641b(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2045_c2_50d9_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2045_c2_50d9_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2045_c2_50d9_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2045_c2_50d9_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2045_c2_50d9_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2045_c2_50d9_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_641b_uxn_opcodes_h_l2090_l2041_DUPLICATE_100d_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_641b_uxn_opcodes_h_l2090_l2041_DUPLICATE_100d_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_n16 <= REG_VAR_n16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     n16 <= REG_COMB_n16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
