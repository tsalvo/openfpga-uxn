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
-- Submodules: 73
entity ldr2_0CLK_6193b0ef is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end ldr2_0CLK_6193b0ef;
architecture arch of ldr2_0CLK_6193b0ef is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1560_c6_a654]
signal BIN_OP_EQ_uxn_opcodes_h_l1560_c6_a654_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1560_c6_a654_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1560_c6_a654_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1560_c1_b0d0]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1560_c1_b0d0_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1560_c1_b0d0_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1560_c1_b0d0_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1560_c1_b0d0_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1560_c2_303d]
signal t8_MUX_uxn_opcodes_h_l1560_c2_303d_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1560_c2_303d_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1560_c2_303d_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1560_c2_303d_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1560_c2_303d]
signal result_u16_value_MUX_uxn_opcodes_h_l1560_c2_303d_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1560_c2_303d_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1560_c2_303d_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1560_c2_303d_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1560_c2_303d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1560_c2_303d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1560_c2_303d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1560_c2_303d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1560_c2_303d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1560_c2_303d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c2_303d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c2_303d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c2_303d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c2_303d_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1560_c2_303d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c2_303d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c2_303d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c2_303d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c2_303d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1560_c2_303d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1560_c2_303d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1560_c2_303d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1560_c2_303d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1560_c2_303d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1560_c2_303d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c2_303d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c2_303d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c2_303d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c2_303d_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1560_c2_303d]
signal result_u8_value_MUX_uxn_opcodes_h_l1560_c2_303d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1560_c2_303d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1560_c2_303d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1560_c2_303d_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1560_c2_303d]
signal tmp16_MUX_uxn_opcodes_h_l1560_c2_303d_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1560_c2_303d_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1560_c2_303d_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1560_c2_303d_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l1561_c3_56e1[uxn_opcodes_h_l1561_c3_56e1]
signal printf_uxn_opcodes_h_l1561_c3_56e1_uxn_opcodes_h_l1561_c3_56e1_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1565_c11_922d]
signal BIN_OP_EQ_uxn_opcodes_h_l1565_c11_922d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1565_c11_922d_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1565_c11_922d_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1565_c7_2161]
signal t8_MUX_uxn_opcodes_h_l1565_c7_2161_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1565_c7_2161_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1565_c7_2161_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1565_c7_2161_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1565_c7_2161]
signal result_u16_value_MUX_uxn_opcodes_h_l1565_c7_2161_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1565_c7_2161_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1565_c7_2161_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1565_c7_2161_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1565_c7_2161]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1565_c7_2161_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1565_c7_2161_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1565_c7_2161_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1565_c7_2161_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1565_c7_2161]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1565_c7_2161_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1565_c7_2161_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1565_c7_2161_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1565_c7_2161_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1565_c7_2161]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1565_c7_2161_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1565_c7_2161_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1565_c7_2161_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1565_c7_2161_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1565_c7_2161]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1565_c7_2161_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1565_c7_2161_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1565_c7_2161_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1565_c7_2161_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1565_c7_2161]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1565_c7_2161_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1565_c7_2161_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1565_c7_2161_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1565_c7_2161_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1565_c7_2161]
signal result_u8_value_MUX_uxn_opcodes_h_l1565_c7_2161_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1565_c7_2161_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1565_c7_2161_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1565_c7_2161_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1565_c7_2161]
signal tmp16_MUX_uxn_opcodes_h_l1565_c7_2161_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1565_c7_2161_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1565_c7_2161_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1565_c7_2161_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1568_c11_6c77]
signal BIN_OP_EQ_uxn_opcodes_h_l1568_c11_6c77_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1568_c11_6c77_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1568_c11_6c77_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1568_c7_8d15]
signal t8_MUX_uxn_opcodes_h_l1568_c7_8d15_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1568_c7_8d15_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1568_c7_8d15_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1568_c7_8d15_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1568_c7_8d15]
signal result_u16_value_MUX_uxn_opcodes_h_l1568_c7_8d15_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1568_c7_8d15_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1568_c7_8d15_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1568_c7_8d15_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1568_c7_8d15]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_8d15_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_8d15_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_8d15_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_8d15_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1568_c7_8d15]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_8d15_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_8d15_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_8d15_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_8d15_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1568_c7_8d15]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_8d15_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_8d15_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_8d15_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_8d15_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1568_c7_8d15]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_8d15_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_8d15_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_8d15_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_8d15_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1568_c7_8d15]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_8d15_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_8d15_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_8d15_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_8d15_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1568_c7_8d15]
signal result_u8_value_MUX_uxn_opcodes_h_l1568_c7_8d15_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1568_c7_8d15_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1568_c7_8d15_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1568_c7_8d15_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1568_c7_8d15]
signal tmp16_MUX_uxn_opcodes_h_l1568_c7_8d15_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1568_c7_8d15_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1568_c7_8d15_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1568_c7_8d15_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1571_c30_d275]
signal sp_relative_shift_uxn_opcodes_h_l1571_c30_d275_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1571_c30_d275_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1571_c30_d275_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1571_c30_d275_return_output : signed(3 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1572_c22_37d6]
signal BIN_OP_PLUS_uxn_opcodes_h_l1572_c22_37d6_left : signed(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1572_c22_37d6_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1572_c22_37d6_return_output : signed(17 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1574_c11_4c64]
signal BIN_OP_EQ_uxn_opcodes_h_l1574_c11_4c64_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1574_c11_4c64_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1574_c11_4c64_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1574_c7_1007]
signal result_u16_value_MUX_uxn_opcodes_h_l1574_c7_1007_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1574_c7_1007_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1574_c7_1007_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1574_c7_1007_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1574_c7_1007]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_1007_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_1007_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_1007_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_1007_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1574_c7_1007]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_1007_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_1007_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_1007_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_1007_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1574_c7_1007]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_1007_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_1007_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_1007_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_1007_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1574_c7_1007]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_1007_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_1007_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_1007_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_1007_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1574_c7_1007]
signal result_u8_value_MUX_uxn_opcodes_h_l1574_c7_1007_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1574_c7_1007_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1574_c7_1007_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1574_c7_1007_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1574_c7_1007]
signal tmp16_MUX_uxn_opcodes_h_l1574_c7_1007_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1574_c7_1007_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1574_c7_1007_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1574_c7_1007_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1576_c22_40f4]
signal BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_40f4_left : signed(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_40f4_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_40f4_return_output : signed(17 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1576_c22_1934]
signal BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_1934_left : signed(17 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_1934_right : signed(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_1934_return_output : signed(18 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1578_c11_7cd8]
signal BIN_OP_EQ_uxn_opcodes_h_l1578_c11_7cd8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1578_c11_7cd8_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1578_c11_7cd8_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1578_c7_54e5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_54e5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_54e5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_54e5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_54e5_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1578_c7_54e5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_54e5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_54e5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_54e5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_54e5_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1578_c7_54e5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_54e5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_54e5_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_54e5_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_54e5_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1578_c7_54e5]
signal result_u8_value_MUX_uxn_opcodes_h_l1578_c7_54e5_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1578_c7_54e5_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1578_c7_54e5_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1578_c7_54e5_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1578_c7_54e5]
signal tmp16_MUX_uxn_opcodes_h_l1578_c7_54e5_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1578_c7_54e5_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1578_c7_54e5_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1578_c7_54e5_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1580_c3_5cab]
signal CONST_SL_8_uxn_opcodes_h_l1580_c3_5cab_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1580_c3_5cab_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1582_c11_5ead]
signal BIN_OP_EQ_uxn_opcodes_h_l1582_c11_5ead_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1582_c11_5ead_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1582_c11_5ead_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1582_c7_4900]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_4900_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_4900_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_4900_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_4900_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1582_c7_4900]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_4900_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_4900_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_4900_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_4900_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1582_c7_4900]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_4900_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_4900_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_4900_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_4900_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1582_c7_4900]
signal result_u8_value_MUX_uxn_opcodes_h_l1582_c7_4900_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1582_c7_4900_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1582_c7_4900_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1582_c7_4900_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1582_c7_4900]
signal tmp16_MUX_uxn_opcodes_h_l1582_c7_4900_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1582_c7_4900_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1582_c7_4900_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1582_c7_4900_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1583_c3_e6be]
signal BIN_OP_OR_uxn_opcodes_h_l1583_c3_e6be_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1583_c3_e6be_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1583_c3_e6be_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1588_c11_be98]
signal BIN_OP_EQ_uxn_opcodes_h_l1588_c11_be98_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1588_c11_be98_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1588_c11_be98_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1588_c7_14a8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1588_c7_14a8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1588_c7_14a8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1588_c7_14a8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1588_c7_14a8_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1588_c7_14a8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1588_c7_14a8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1588_c7_14a8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1588_c7_14a8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1588_c7_14a8_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1588_c7_14a8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1588_c7_14a8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1588_c7_14a8_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1588_c7_14a8_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1588_c7_14a8_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1588_c7_14a8]
signal result_u8_value_MUX_uxn_opcodes_h_l1588_c7_14a8_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1588_c7_14a8_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1588_c7_14a8_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1588_c7_14a8_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1590_c31_efa2]
signal CONST_SR_8_uxn_opcodes_h_l1590_c31_efa2_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1590_c31_efa2_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1592_c11_2125]
signal BIN_OP_EQ_uxn_opcodes_h_l1592_c11_2125_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1592_c11_2125_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1592_c11_2125_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1592_c7_aa68]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1592_c7_aa68_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1592_c7_aa68_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1592_c7_aa68_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1592_c7_aa68_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1592_c7_aa68]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1592_c7_aa68_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1592_c7_aa68_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1592_c7_aa68_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1592_c7_aa68_return_output : unsigned(0 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_c7d3( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : signed;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.u16_value := ref_toks_1;
      base.is_stack_write := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.is_sp_shift := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.u8_value := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1560_c6_a654
BIN_OP_EQ_uxn_opcodes_h_l1560_c6_a654 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1560_c6_a654_left,
BIN_OP_EQ_uxn_opcodes_h_l1560_c6_a654_right,
BIN_OP_EQ_uxn_opcodes_h_l1560_c6_a654_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1560_c1_b0d0
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1560_c1_b0d0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1560_c1_b0d0_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1560_c1_b0d0_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1560_c1_b0d0_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1560_c1_b0d0_return_output);

-- t8_MUX_uxn_opcodes_h_l1560_c2_303d
t8_MUX_uxn_opcodes_h_l1560_c2_303d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1560_c2_303d_cond,
t8_MUX_uxn_opcodes_h_l1560_c2_303d_iftrue,
t8_MUX_uxn_opcodes_h_l1560_c2_303d_iffalse,
t8_MUX_uxn_opcodes_h_l1560_c2_303d_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1560_c2_303d
result_u16_value_MUX_uxn_opcodes_h_l1560_c2_303d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1560_c2_303d_cond,
result_u16_value_MUX_uxn_opcodes_h_l1560_c2_303d_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1560_c2_303d_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1560_c2_303d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1560_c2_303d
result_is_stack_write_MUX_uxn_opcodes_h_l1560_c2_303d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1560_c2_303d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1560_c2_303d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1560_c2_303d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1560_c2_303d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c2_303d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c2_303d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c2_303d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c2_303d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c2_303d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c2_303d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c2_303d
result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c2_303d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c2_303d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c2_303d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c2_303d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c2_303d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1560_c2_303d
result_is_opc_done_MUX_uxn_opcodes_h_l1560_c2_303d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1560_c2_303d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1560_c2_303d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1560_c2_303d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1560_c2_303d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c2_303d
result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c2_303d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c2_303d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c2_303d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c2_303d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c2_303d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1560_c2_303d
result_u8_value_MUX_uxn_opcodes_h_l1560_c2_303d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1560_c2_303d_cond,
result_u8_value_MUX_uxn_opcodes_h_l1560_c2_303d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1560_c2_303d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1560_c2_303d_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1560_c2_303d
tmp16_MUX_uxn_opcodes_h_l1560_c2_303d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1560_c2_303d_cond,
tmp16_MUX_uxn_opcodes_h_l1560_c2_303d_iftrue,
tmp16_MUX_uxn_opcodes_h_l1560_c2_303d_iffalse,
tmp16_MUX_uxn_opcodes_h_l1560_c2_303d_return_output);

-- printf_uxn_opcodes_h_l1561_c3_56e1_uxn_opcodes_h_l1561_c3_56e1
printf_uxn_opcodes_h_l1561_c3_56e1_uxn_opcodes_h_l1561_c3_56e1 : entity work.printf_uxn_opcodes_h_l1561_c3_56e1_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1561_c3_56e1_uxn_opcodes_h_l1561_c3_56e1_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1565_c11_922d
BIN_OP_EQ_uxn_opcodes_h_l1565_c11_922d : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1565_c11_922d_left,
BIN_OP_EQ_uxn_opcodes_h_l1565_c11_922d_right,
BIN_OP_EQ_uxn_opcodes_h_l1565_c11_922d_return_output);

-- t8_MUX_uxn_opcodes_h_l1565_c7_2161
t8_MUX_uxn_opcodes_h_l1565_c7_2161 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1565_c7_2161_cond,
t8_MUX_uxn_opcodes_h_l1565_c7_2161_iftrue,
t8_MUX_uxn_opcodes_h_l1565_c7_2161_iffalse,
t8_MUX_uxn_opcodes_h_l1565_c7_2161_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1565_c7_2161
result_u16_value_MUX_uxn_opcodes_h_l1565_c7_2161 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1565_c7_2161_cond,
result_u16_value_MUX_uxn_opcodes_h_l1565_c7_2161_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1565_c7_2161_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1565_c7_2161_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1565_c7_2161
result_is_stack_write_MUX_uxn_opcodes_h_l1565_c7_2161 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1565_c7_2161_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1565_c7_2161_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1565_c7_2161_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1565_c7_2161_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1565_c7_2161
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1565_c7_2161 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1565_c7_2161_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1565_c7_2161_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1565_c7_2161_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1565_c7_2161_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1565_c7_2161
result_is_sp_shift_MUX_uxn_opcodes_h_l1565_c7_2161 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1565_c7_2161_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1565_c7_2161_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1565_c7_2161_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1565_c7_2161_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1565_c7_2161
result_is_opc_done_MUX_uxn_opcodes_h_l1565_c7_2161 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1565_c7_2161_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1565_c7_2161_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1565_c7_2161_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1565_c7_2161_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1565_c7_2161
result_sp_relative_shift_MUX_uxn_opcodes_h_l1565_c7_2161 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1565_c7_2161_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1565_c7_2161_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1565_c7_2161_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1565_c7_2161_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1565_c7_2161
result_u8_value_MUX_uxn_opcodes_h_l1565_c7_2161 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1565_c7_2161_cond,
result_u8_value_MUX_uxn_opcodes_h_l1565_c7_2161_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1565_c7_2161_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1565_c7_2161_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1565_c7_2161
tmp16_MUX_uxn_opcodes_h_l1565_c7_2161 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1565_c7_2161_cond,
tmp16_MUX_uxn_opcodes_h_l1565_c7_2161_iftrue,
tmp16_MUX_uxn_opcodes_h_l1565_c7_2161_iffalse,
tmp16_MUX_uxn_opcodes_h_l1565_c7_2161_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1568_c11_6c77
BIN_OP_EQ_uxn_opcodes_h_l1568_c11_6c77 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1568_c11_6c77_left,
BIN_OP_EQ_uxn_opcodes_h_l1568_c11_6c77_right,
BIN_OP_EQ_uxn_opcodes_h_l1568_c11_6c77_return_output);

-- t8_MUX_uxn_opcodes_h_l1568_c7_8d15
t8_MUX_uxn_opcodes_h_l1568_c7_8d15 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1568_c7_8d15_cond,
t8_MUX_uxn_opcodes_h_l1568_c7_8d15_iftrue,
t8_MUX_uxn_opcodes_h_l1568_c7_8d15_iffalse,
t8_MUX_uxn_opcodes_h_l1568_c7_8d15_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1568_c7_8d15
result_u16_value_MUX_uxn_opcodes_h_l1568_c7_8d15 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1568_c7_8d15_cond,
result_u16_value_MUX_uxn_opcodes_h_l1568_c7_8d15_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1568_c7_8d15_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1568_c7_8d15_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_8d15
result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_8d15 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_8d15_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_8d15_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_8d15_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_8d15_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_8d15
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_8d15 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_8d15_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_8d15_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_8d15_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_8d15_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_8d15
result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_8d15 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_8d15_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_8d15_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_8d15_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_8d15_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_8d15
result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_8d15 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_8d15_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_8d15_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_8d15_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_8d15_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_8d15
result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_8d15 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_8d15_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_8d15_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_8d15_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_8d15_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1568_c7_8d15
result_u8_value_MUX_uxn_opcodes_h_l1568_c7_8d15 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1568_c7_8d15_cond,
result_u8_value_MUX_uxn_opcodes_h_l1568_c7_8d15_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1568_c7_8d15_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1568_c7_8d15_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1568_c7_8d15
tmp16_MUX_uxn_opcodes_h_l1568_c7_8d15 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1568_c7_8d15_cond,
tmp16_MUX_uxn_opcodes_h_l1568_c7_8d15_iftrue,
tmp16_MUX_uxn_opcodes_h_l1568_c7_8d15_iffalse,
tmp16_MUX_uxn_opcodes_h_l1568_c7_8d15_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1571_c30_d275
sp_relative_shift_uxn_opcodes_h_l1571_c30_d275 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1571_c30_d275_ins,
sp_relative_shift_uxn_opcodes_h_l1571_c30_d275_x,
sp_relative_shift_uxn_opcodes_h_l1571_c30_d275_y,
sp_relative_shift_uxn_opcodes_h_l1571_c30_d275_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1572_c22_37d6
BIN_OP_PLUS_uxn_opcodes_h_l1572_c22_37d6 : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1572_c22_37d6_left,
BIN_OP_PLUS_uxn_opcodes_h_l1572_c22_37d6_right,
BIN_OP_PLUS_uxn_opcodes_h_l1572_c22_37d6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1574_c11_4c64
BIN_OP_EQ_uxn_opcodes_h_l1574_c11_4c64 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1574_c11_4c64_left,
BIN_OP_EQ_uxn_opcodes_h_l1574_c11_4c64_right,
BIN_OP_EQ_uxn_opcodes_h_l1574_c11_4c64_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1574_c7_1007
result_u16_value_MUX_uxn_opcodes_h_l1574_c7_1007 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1574_c7_1007_cond,
result_u16_value_MUX_uxn_opcodes_h_l1574_c7_1007_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1574_c7_1007_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1574_c7_1007_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_1007
result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_1007 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_1007_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_1007_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_1007_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_1007_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_1007
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_1007 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_1007_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_1007_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_1007_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_1007_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_1007
result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_1007 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_1007_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_1007_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_1007_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_1007_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_1007
result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_1007 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_1007_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_1007_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_1007_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_1007_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1574_c7_1007
result_u8_value_MUX_uxn_opcodes_h_l1574_c7_1007 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1574_c7_1007_cond,
result_u8_value_MUX_uxn_opcodes_h_l1574_c7_1007_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1574_c7_1007_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1574_c7_1007_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1574_c7_1007
tmp16_MUX_uxn_opcodes_h_l1574_c7_1007 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1574_c7_1007_cond,
tmp16_MUX_uxn_opcodes_h_l1574_c7_1007_iftrue,
tmp16_MUX_uxn_opcodes_h_l1574_c7_1007_iffalse,
tmp16_MUX_uxn_opcodes_h_l1574_c7_1007_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_40f4
BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_40f4 : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_40f4_left,
BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_40f4_right,
BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_40f4_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_1934
BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_1934 : entity work.BIN_OP_PLUS_int18_t_int2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_1934_left,
BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_1934_right,
BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_1934_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1578_c11_7cd8
BIN_OP_EQ_uxn_opcodes_h_l1578_c11_7cd8 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1578_c11_7cd8_left,
BIN_OP_EQ_uxn_opcodes_h_l1578_c11_7cd8_right,
BIN_OP_EQ_uxn_opcodes_h_l1578_c11_7cd8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_54e5
result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_54e5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_54e5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_54e5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_54e5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_54e5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_54e5
result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_54e5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_54e5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_54e5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_54e5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_54e5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_54e5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_54e5 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_54e5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_54e5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_54e5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_54e5_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1578_c7_54e5
result_u8_value_MUX_uxn_opcodes_h_l1578_c7_54e5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1578_c7_54e5_cond,
result_u8_value_MUX_uxn_opcodes_h_l1578_c7_54e5_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1578_c7_54e5_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1578_c7_54e5_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1578_c7_54e5
tmp16_MUX_uxn_opcodes_h_l1578_c7_54e5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1578_c7_54e5_cond,
tmp16_MUX_uxn_opcodes_h_l1578_c7_54e5_iftrue,
tmp16_MUX_uxn_opcodes_h_l1578_c7_54e5_iffalse,
tmp16_MUX_uxn_opcodes_h_l1578_c7_54e5_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1580_c3_5cab
CONST_SL_8_uxn_opcodes_h_l1580_c3_5cab : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1580_c3_5cab_x,
CONST_SL_8_uxn_opcodes_h_l1580_c3_5cab_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1582_c11_5ead
BIN_OP_EQ_uxn_opcodes_h_l1582_c11_5ead : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1582_c11_5ead_left,
BIN_OP_EQ_uxn_opcodes_h_l1582_c11_5ead_right,
BIN_OP_EQ_uxn_opcodes_h_l1582_c11_5ead_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_4900
result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_4900 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_4900_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_4900_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_4900_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_4900_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_4900
result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_4900 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_4900_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_4900_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_4900_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_4900_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_4900
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_4900 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_4900_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_4900_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_4900_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_4900_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1582_c7_4900
result_u8_value_MUX_uxn_opcodes_h_l1582_c7_4900 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1582_c7_4900_cond,
result_u8_value_MUX_uxn_opcodes_h_l1582_c7_4900_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1582_c7_4900_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1582_c7_4900_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1582_c7_4900
tmp16_MUX_uxn_opcodes_h_l1582_c7_4900 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1582_c7_4900_cond,
tmp16_MUX_uxn_opcodes_h_l1582_c7_4900_iftrue,
tmp16_MUX_uxn_opcodes_h_l1582_c7_4900_iffalse,
tmp16_MUX_uxn_opcodes_h_l1582_c7_4900_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1583_c3_e6be
BIN_OP_OR_uxn_opcodes_h_l1583_c3_e6be : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1583_c3_e6be_left,
BIN_OP_OR_uxn_opcodes_h_l1583_c3_e6be_right,
BIN_OP_OR_uxn_opcodes_h_l1583_c3_e6be_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1588_c11_be98
BIN_OP_EQ_uxn_opcodes_h_l1588_c11_be98 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1588_c11_be98_left,
BIN_OP_EQ_uxn_opcodes_h_l1588_c11_be98_right,
BIN_OP_EQ_uxn_opcodes_h_l1588_c11_be98_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1588_c7_14a8
result_is_stack_write_MUX_uxn_opcodes_h_l1588_c7_14a8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1588_c7_14a8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1588_c7_14a8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1588_c7_14a8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1588_c7_14a8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1588_c7_14a8
result_is_opc_done_MUX_uxn_opcodes_h_l1588_c7_14a8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1588_c7_14a8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1588_c7_14a8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1588_c7_14a8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1588_c7_14a8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1588_c7_14a8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1588_c7_14a8 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1588_c7_14a8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1588_c7_14a8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1588_c7_14a8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1588_c7_14a8_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1588_c7_14a8
result_u8_value_MUX_uxn_opcodes_h_l1588_c7_14a8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1588_c7_14a8_cond,
result_u8_value_MUX_uxn_opcodes_h_l1588_c7_14a8_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1588_c7_14a8_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1588_c7_14a8_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1590_c31_efa2
CONST_SR_8_uxn_opcodes_h_l1590_c31_efa2 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1590_c31_efa2_x,
CONST_SR_8_uxn_opcodes_h_l1590_c31_efa2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1592_c11_2125
BIN_OP_EQ_uxn_opcodes_h_l1592_c11_2125 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1592_c11_2125_left,
BIN_OP_EQ_uxn_opcodes_h_l1592_c11_2125_right,
BIN_OP_EQ_uxn_opcodes_h_l1592_c11_2125_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1592_c7_aa68
result_is_stack_write_MUX_uxn_opcodes_h_l1592_c7_aa68 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1592_c7_aa68_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1592_c7_aa68_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1592_c7_aa68_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1592_c7_aa68_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1592_c7_aa68
result_is_opc_done_MUX_uxn_opcodes_h_l1592_c7_aa68 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1592_c7_aa68_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1592_c7_aa68_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1592_c7_aa68_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1592_c7_aa68_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1560_c6_a654_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1560_c1_b0d0_return_output,
 t8_MUX_uxn_opcodes_h_l1560_c2_303d_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1560_c2_303d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1560_c2_303d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c2_303d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c2_303d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1560_c2_303d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c2_303d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1560_c2_303d_return_output,
 tmp16_MUX_uxn_opcodes_h_l1560_c2_303d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1565_c11_922d_return_output,
 t8_MUX_uxn_opcodes_h_l1565_c7_2161_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1565_c7_2161_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1565_c7_2161_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1565_c7_2161_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1565_c7_2161_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1565_c7_2161_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1565_c7_2161_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1565_c7_2161_return_output,
 tmp16_MUX_uxn_opcodes_h_l1565_c7_2161_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1568_c11_6c77_return_output,
 t8_MUX_uxn_opcodes_h_l1568_c7_8d15_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1568_c7_8d15_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_8d15_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_8d15_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_8d15_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_8d15_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_8d15_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1568_c7_8d15_return_output,
 tmp16_MUX_uxn_opcodes_h_l1568_c7_8d15_return_output,
 sp_relative_shift_uxn_opcodes_h_l1571_c30_d275_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1572_c22_37d6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1574_c11_4c64_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1574_c7_1007_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_1007_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_1007_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_1007_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_1007_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1574_c7_1007_return_output,
 tmp16_MUX_uxn_opcodes_h_l1574_c7_1007_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_40f4_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_1934_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1578_c11_7cd8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_54e5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_54e5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_54e5_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1578_c7_54e5_return_output,
 tmp16_MUX_uxn_opcodes_h_l1578_c7_54e5_return_output,
 CONST_SL_8_uxn_opcodes_h_l1580_c3_5cab_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1582_c11_5ead_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_4900_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_4900_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_4900_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1582_c7_4900_return_output,
 tmp16_MUX_uxn_opcodes_h_l1582_c7_4900_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1583_c3_e6be_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1588_c11_be98_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1588_c7_14a8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1588_c7_14a8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1588_c7_14a8_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1588_c7_14a8_return_output,
 CONST_SR_8_uxn_opcodes_h_l1590_c31_efa2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1592_c11_2125_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1592_c7_aa68_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1592_c7_aa68_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c6_a654_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c6_a654_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c6_a654_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1560_c1_b0d0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1560_c1_b0d0_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1560_c1_b0d0_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1560_c1_b0d0_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1560_c2_303d_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1560_c2_303d_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1565_c7_2161_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1560_c2_303d_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1560_c2_303d_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1560_c2_303d_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1560_c2_303d_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1565_c7_2161_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1560_c2_303d_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1560_c2_303d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1560_c2_303d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1560_c2_303d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1565_c7_2161_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1560_c2_303d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1560_c2_303d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c2_303d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1562_c3_a979 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c2_303d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1565_c7_2161_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c2_303d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c2_303d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c2_303d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c2_303d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1565_c7_2161_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c2_303d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c2_303d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1560_c2_303d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1560_c2_303d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1565_c7_2161_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1560_c2_303d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1560_c2_303d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c2_303d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c2_303d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1565_c7_2161_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c2_303d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c2_303d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1560_c2_303d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1560_c2_303d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1565_c7_2161_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1560_c2_303d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1560_c2_303d_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1560_c2_303d_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1560_c2_303d_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1565_c7_2161_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1560_c2_303d_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1560_c2_303d_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1561_c3_56e1_uxn_opcodes_h_l1561_c3_56e1_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1565_c11_922d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1565_c11_922d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1565_c11_922d_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1565_c7_2161_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1565_c7_2161_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1568_c7_8d15_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1565_c7_2161_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1565_c7_2161_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1565_c7_2161_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1568_c7_8d15_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1565_c7_2161_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1565_c7_2161_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1565_c7_2161_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_8d15_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1565_c7_2161_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1565_c7_2161_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1566_c3_05d2 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1565_c7_2161_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_8d15_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1565_c7_2161_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1565_c7_2161_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1565_c7_2161_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_8d15_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1565_c7_2161_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1565_c7_2161_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1565_c7_2161_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_8d15_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1565_c7_2161_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1565_c7_2161_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1565_c7_2161_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_8d15_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1565_c7_2161_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1565_c7_2161_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1565_c7_2161_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1568_c7_8d15_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1565_c7_2161_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1565_c7_2161_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1565_c7_2161_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1568_c7_8d15_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1565_c7_2161_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1568_c11_6c77_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1568_c11_6c77_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1568_c11_6c77_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1568_c7_8d15_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1568_c7_8d15_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1568_c7_8d15_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1568_c7_8d15_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l1572_c3_b320 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1568_c7_8d15_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1574_c7_1007_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1568_c7_8d15_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_8d15_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_8d15_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_1007_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_8d15_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_8d15_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_8d15_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_1007_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_8d15_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_8d15_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_8d15_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_1007_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_8d15_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_8d15_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_8d15_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_1007_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_8d15_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_8d15_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_8d15_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_8d15_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1568_c7_8d15_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1568_c7_8d15_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1574_c7_1007_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1568_c7_8d15_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1568_c7_8d15_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1568_c7_8d15_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1574_c7_1007_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1568_c7_8d15_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1571_c30_d275_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1571_c30_d275_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1571_c30_d275_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1571_c30_d275_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1572_c22_37d6_left : signed(16 downto 0);
 variable VAR_CAST_TO_int8_t_uxn_opcodes_h_l1572_c27_3a29_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1572_c22_37d6_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1572_c22_37d6_return_output : signed(17 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_4c64_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_4c64_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_4c64_return_output : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1574_c7_1007_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l1576_c3_a11f : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1574_c7_1007_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1574_c7_1007_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_1007_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_1007_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_54e5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_1007_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_1007_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_1007_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_54e5_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_1007_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_1007_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_1007_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_1007_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_1007_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_1007_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_54e5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_1007_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1574_c7_1007_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1574_c7_1007_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1578_c7_54e5_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1574_c7_1007_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1574_c7_1007_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1574_c7_1007_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1578_c7_54e5_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1574_c7_1007_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_40f4_left : signed(16 downto 0);
 variable VAR_CAST_TO_int8_t_uxn_opcodes_h_l1576_c27_b086_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_40f4_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_40f4_return_output : signed(17 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_1934_left : signed(17 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_1934_right : signed(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_1934_return_output : signed(18 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_7cd8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_7cd8_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_7cd8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_54e5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_54e5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_4900_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_54e5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_54e5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_54e5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_4900_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_54e5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_54e5_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_54e5_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_4900_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_54e5_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1578_c7_54e5_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1578_c7_54e5_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1582_c7_4900_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1578_c7_54e5_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1578_c7_54e5_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1578_c7_54e5_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1582_c7_4900_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1578_c7_54e5_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1580_c3_5cab_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1580_c3_5cab_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1582_c11_5ead_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1582_c11_5ead_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1582_c11_5ead_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_4900_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_4900_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1588_c7_14a8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_4900_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_4900_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_4900_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1588_c7_14a8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_4900_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_4900_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1585_c3_f56b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_4900_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1588_c7_14a8_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_4900_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1582_c7_4900_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1582_c7_4900_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1588_c7_14a8_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1582_c7_4900_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1582_c7_4900_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1582_c7_4900_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1582_c7_4900_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1583_c3_e6be_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1583_c3_e6be_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1583_c3_e6be_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1586_c21_5806_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1588_c11_be98_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1588_c11_be98_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1588_c11_be98_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1588_c7_14a8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1588_c7_14a8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1592_c7_aa68_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1588_c7_14a8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1588_c7_14a8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1588_c7_14a8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1592_c7_aa68_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1588_c7_14a8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1588_c7_14a8_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1589_c3_4209 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1588_c7_14a8_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1588_c7_14a8_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1588_c7_14a8_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1588_c7_14a8_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1588_c7_14a8_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1590_c31_efa2_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1590_c31_efa2_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1590_c21_24c2_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1592_c11_2125_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1592_c11_2125_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1592_c11_2125_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1592_c7_aa68_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1592_c7_aa68_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1592_c7_aa68_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1592_c7_aa68_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1592_c7_aa68_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1592_c7_aa68_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1565_l1560_l1574_DUPLICATE_f519_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1565_l1592_l1560_l1588_l1578_l1574_l1568_DUPLICATE_ca65_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1565_l1560_l1574_DUPLICATE_249b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1565_l1568_l1560_DUPLICATE_3611_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1565_l1560_l1588_l1578_l1574_l1568_DUPLICATE_64d2_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1565_l1592_l1588_l1582_l1578_l1574_l1568_DUPLICATE_1faa_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1588_l1578_l1568_l1574_DUPLICATE_1876_return_output : unsigned(3 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1583_l1579_DUPLICATE_9e87_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c7d3_uxn_opcodes_h_l1555_l1597_DUPLICATE_1f2b_return_output : opcode_result_t;
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
     VAR_sp_relative_shift_uxn_opcodes_h_l1571_c30_d275_x := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1562_c3_a979 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c2_303d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1562_c3_a979;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1560_c2_303d_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_1934_right := signed(std_logic_vector(resize(to_unsigned(1, 1), 2)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1582_c11_5ead_right := to_unsigned(5, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_1007_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1592_c7_aa68_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1566_c3_05d2 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1565_c7_2161_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1566_c3_05d2;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_4900_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1568_c11_6c77_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c6_a654_right := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1560_c1_b0d0_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1565_c11_922d_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1588_c11_be98_right := to_unsigned(6, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l1571_c30_d275_y := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_7cd8_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1589_c3_4209 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1588_c7_14a8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1589_c3_4209;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_8d15_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_4c64_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1585_c3_f56b := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_4900_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1585_c3_f56b;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1592_c7_aa68_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1592_c11_2125_right := to_unsigned(7, 3);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1560_c1_b0d0_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l1571_c30_d275_ins := VAR_ins;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1572_c22_37d6_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_40f4_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c6_a654_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1565_c11_922d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1568_c11_6c77_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_4c64_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_7cd8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1582_c11_5ead_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1588_c11_be98_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1592_c11_2125_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l1568_c7_8d15_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1560_c2_303d_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1565_c7_2161_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1568_c7_8d15_iffalse := t8;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1583_c3_e6be_left := tmp16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1590_c31_efa2_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1560_c2_303d_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1565_c7_2161_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1568_c7_8d15_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1574_c7_1007_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1582_c7_4900_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l1578_c11_7cd8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1578_c11_7cd8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_7cd8_left;
     BIN_OP_EQ_uxn_opcodes_h_l1578_c11_7cd8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_7cd8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_7cd8_return_output := BIN_OP_EQ_uxn_opcodes_h_l1578_c11_7cd8_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l1590_c31_efa2] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1590_c31_efa2_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1590_c31_efa2_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1590_c31_efa2_return_output := CONST_SR_8_uxn_opcodes_h_l1590_c31_efa2_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1565_l1592_l1560_l1588_l1578_l1574_l1568_DUPLICATE_ca65 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1565_l1592_l1560_l1588_l1578_l1574_l1568_DUPLICATE_ca65_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1565_l1560_l1574_DUPLICATE_249b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1565_l1560_l1574_DUPLICATE_249b_return_output := result.is_sp_shift;

     -- CAST_TO_int8_t[uxn_opcodes_h_l1576_c27_b086] LATENCY=0
     VAR_CAST_TO_int8_t_uxn_opcodes_h_l1576_c27_b086_return_output := CAST_TO_int8_t_uint8_t(
     t8);

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1565_l1568_l1560_DUPLICATE_3611 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1565_l1568_l1560_DUPLICATE_3611_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1565_l1560_l1574_DUPLICATE_f519 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1565_l1560_l1574_DUPLICATE_f519_return_output := result.u16_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1592_c11_2125] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1592_c11_2125_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1592_c11_2125_left;
     BIN_OP_EQ_uxn_opcodes_h_l1592_c11_2125_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1592_c11_2125_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1592_c11_2125_return_output := BIN_OP_EQ_uxn_opcodes_h_l1592_c11_2125_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1568_c11_6c77] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1568_c11_6c77_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1568_c11_6c77_left;
     BIN_OP_EQ_uxn_opcodes_h_l1568_c11_6c77_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1568_c11_6c77_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1568_c11_6c77_return_output := BIN_OP_EQ_uxn_opcodes_h_l1568_c11_6c77_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1583_l1579_DUPLICATE_9e87 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1583_l1579_DUPLICATE_9e87_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1565_c11_922d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1565_c11_922d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1565_c11_922d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1565_c11_922d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1565_c11_922d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1565_c11_922d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1565_c11_922d_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l1571_c30_d275] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1571_c30_d275_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1571_c30_d275_ins;
     sp_relative_shift_uxn_opcodes_h_l1571_c30_d275_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1571_c30_d275_x;
     sp_relative_shift_uxn_opcodes_h_l1571_c30_d275_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1571_c30_d275_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1571_c30_d275_return_output := sp_relative_shift_uxn_opcodes_h_l1571_c30_d275_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1565_l1592_l1588_l1582_l1578_l1574_l1568_DUPLICATE_1faa LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1565_l1592_l1588_l1582_l1578_l1574_l1568_DUPLICATE_1faa_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1565_l1560_l1588_l1578_l1574_l1568_DUPLICATE_64d2 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1565_l1560_l1588_l1578_l1574_l1568_DUPLICATE_64d2_return_output := result.u8_value;

     -- CAST_TO_int8_t[uxn_opcodes_h_l1572_c27_3a29] LATENCY=0
     VAR_CAST_TO_int8_t_uxn_opcodes_h_l1572_c27_3a29_return_output := CAST_TO_int8_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1560_c6_a654] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1560_c6_a654_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c6_a654_left;
     BIN_OP_EQ_uxn_opcodes_h_l1560_c6_a654_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c6_a654_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c6_a654_return_output := BIN_OP_EQ_uxn_opcodes_h_l1560_c6_a654_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1588_l1578_l1568_l1574_DUPLICATE_1876 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1588_l1578_l1568_l1574_DUPLICATE_1876_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1582_c11_5ead] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1582_c11_5ead_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1582_c11_5ead_left;
     BIN_OP_EQ_uxn_opcodes_h_l1582_c11_5ead_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1582_c11_5ead_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1582_c11_5ead_return_output := BIN_OP_EQ_uxn_opcodes_h_l1582_c11_5ead_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1588_c11_be98] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1588_c11_be98_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1588_c11_be98_left;
     BIN_OP_EQ_uxn_opcodes_h_l1588_c11_be98_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1588_c11_be98_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1588_c11_be98_return_output := BIN_OP_EQ_uxn_opcodes_h_l1588_c11_be98_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1574_c11_4c64] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1574_c11_4c64_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_4c64_left;
     BIN_OP_EQ_uxn_opcodes_h_l1574_c11_4c64_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_4c64_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_4c64_return_output := BIN_OP_EQ_uxn_opcodes_h_l1574_c11_4c64_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1560_c1_b0d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c6_a654_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1560_c2_303d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c6_a654_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c2_303d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c6_a654_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1560_c2_303d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c6_a654_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c2_303d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c6_a654_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c2_303d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c6_a654_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1560_c2_303d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c6_a654_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1560_c2_303d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c6_a654_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1560_c2_303d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c6_a654_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1560_c2_303d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c6_a654_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1565_c7_2161_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1565_c11_922d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1565_c7_2161_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1565_c11_922d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1565_c7_2161_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1565_c11_922d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1565_c7_2161_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1565_c11_922d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1565_c7_2161_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1565_c11_922d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1565_c7_2161_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1565_c11_922d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1565_c7_2161_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1565_c11_922d_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1565_c7_2161_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1565_c11_922d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1565_c7_2161_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1565_c11_922d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_8d15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1568_c11_6c77_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_8d15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1568_c11_6c77_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_8d15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1568_c11_6c77_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_8d15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1568_c11_6c77_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_8d15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1568_c11_6c77_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1568_c7_8d15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1568_c11_6c77_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1568_c7_8d15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1568_c11_6c77_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1568_c7_8d15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1568_c11_6c77_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1568_c7_8d15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1568_c11_6c77_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_1007_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_4c64_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_1007_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_4c64_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_1007_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_4c64_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_1007_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_4c64_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1574_c7_1007_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_4c64_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1574_c7_1007_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_4c64_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1574_c7_1007_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_4c64_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_54e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_7cd8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_54e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_7cd8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_54e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_7cd8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1578_c7_54e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_7cd8_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1578_c7_54e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_7cd8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_4900_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1582_c11_5ead_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_4900_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1582_c11_5ead_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_4900_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1582_c11_5ead_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1582_c7_4900_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1582_c11_5ead_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1582_c7_4900_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1582_c11_5ead_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1588_c7_14a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1588_c11_be98_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1588_c7_14a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1588_c11_be98_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1588_c7_14a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1588_c11_be98_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1588_c7_14a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1588_c11_be98_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1592_c7_aa68_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1592_c11_2125_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1592_c7_aa68_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1592_c11_2125_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1572_c22_37d6_right := VAR_CAST_TO_int8_t_uxn_opcodes_h_l1572_c27_3a29_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_40f4_right := VAR_CAST_TO_int8_t_uxn_opcodes_h_l1576_c27_b086_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1583_c3_e6be_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1583_l1579_DUPLICATE_9e87_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1580_c3_5cab_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1583_l1579_DUPLICATE_9e87_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c2_303d_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1565_l1568_l1560_DUPLICATE_3611_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1565_c7_2161_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1565_l1568_l1560_DUPLICATE_3611_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_8d15_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1565_l1568_l1560_DUPLICATE_3611_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1560_c2_303d_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1565_l1560_l1574_DUPLICATE_f519_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1565_c7_2161_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1565_l1560_l1574_DUPLICATE_f519_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1574_c7_1007_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1565_l1560_l1574_DUPLICATE_f519_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1565_c7_2161_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1565_l1592_l1588_l1582_l1578_l1574_l1568_DUPLICATE_1faa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_8d15_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1565_l1592_l1588_l1582_l1578_l1574_l1568_DUPLICATE_1faa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_1007_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1565_l1592_l1588_l1582_l1578_l1574_l1568_DUPLICATE_1faa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_54e5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1565_l1592_l1588_l1582_l1578_l1574_l1568_DUPLICATE_1faa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_4900_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1565_l1592_l1588_l1582_l1578_l1574_l1568_DUPLICATE_1faa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1588_c7_14a8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1565_l1592_l1588_l1582_l1578_l1574_l1568_DUPLICATE_1faa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1592_c7_aa68_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1565_l1592_l1588_l1582_l1578_l1574_l1568_DUPLICATE_1faa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c2_303d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1565_l1560_l1574_DUPLICATE_249b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1565_c7_2161_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1565_l1560_l1574_DUPLICATE_249b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_1007_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1565_l1560_l1574_DUPLICATE_249b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1560_c2_303d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1565_l1592_l1560_l1588_l1578_l1574_l1568_DUPLICATE_ca65_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1565_c7_2161_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1565_l1592_l1560_l1588_l1578_l1574_l1568_DUPLICATE_ca65_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_8d15_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1565_l1592_l1560_l1588_l1578_l1574_l1568_DUPLICATE_ca65_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_1007_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1565_l1592_l1560_l1588_l1578_l1574_l1568_DUPLICATE_ca65_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_54e5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1565_l1592_l1560_l1588_l1578_l1574_l1568_DUPLICATE_ca65_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1588_c7_14a8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1565_l1592_l1560_l1588_l1578_l1574_l1568_DUPLICATE_ca65_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1592_c7_aa68_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1565_l1592_l1560_l1588_l1578_l1574_l1568_DUPLICATE_ca65_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_8d15_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1588_l1578_l1568_l1574_DUPLICATE_1876_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_1007_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1588_l1578_l1568_l1574_DUPLICATE_1876_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_54e5_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1588_l1578_l1568_l1574_DUPLICATE_1876_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1588_c7_14a8_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1588_l1578_l1568_l1574_DUPLICATE_1876_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1560_c2_303d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1565_l1560_l1588_l1578_l1574_l1568_DUPLICATE_64d2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1565_c7_2161_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1565_l1560_l1588_l1578_l1574_l1568_DUPLICATE_64d2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1568_c7_8d15_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1565_l1560_l1588_l1578_l1574_l1568_DUPLICATE_64d2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1574_c7_1007_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1565_l1560_l1588_l1578_l1574_l1568_DUPLICATE_64d2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1578_c7_54e5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1565_l1560_l1588_l1578_l1574_l1568_DUPLICATE_64d2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1588_c7_14a8_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1565_l1560_l1588_l1578_l1574_l1568_DUPLICATE_64d2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_8d15_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1571_c30_d275_return_output;
     -- BIN_OP_OR[uxn_opcodes_h_l1583_c3_e6be] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1583_c3_e6be_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1583_c3_e6be_left;
     BIN_OP_OR_uxn_opcodes_h_l1583_c3_e6be_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1583_c3_e6be_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1583_c3_e6be_return_output := BIN_OP_OR_uxn_opcodes_h_l1583_c3_e6be_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1590_c21_24c2] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1590_c21_24c2_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1590_c31_efa2_return_output);

     -- BIN_OP_PLUS[uxn_opcodes_h_l1572_c22_37d6] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1572_c22_37d6_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1572_c22_37d6_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1572_c22_37d6_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1572_c22_37d6_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1572_c22_37d6_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1572_c22_37d6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1592_c7_aa68] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1592_c7_aa68_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1592_c7_aa68_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1592_c7_aa68_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1592_c7_aa68_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1592_c7_aa68_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1592_c7_aa68_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1592_c7_aa68_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1592_c7_aa68_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1592_c7_aa68] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1592_c7_aa68_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1592_c7_aa68_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1592_c7_aa68_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1592_c7_aa68_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1592_c7_aa68_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1592_c7_aa68_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1592_c7_aa68_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1592_c7_aa68_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l1580_c3_5cab] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1580_c3_5cab_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1580_c3_5cab_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1580_c3_5cab_return_output := CONST_SL_8_uxn_opcodes_h_l1580_c3_5cab_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1568_c7_8d15] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_8d15_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_8d15_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_8d15_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_8d15_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_8d15_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_8d15_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_8d15_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_8d15_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1576_c22_40f4] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_40f4_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_40f4_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_40f4_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_40f4_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_40f4_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_40f4_return_output;

     -- t8_MUX[uxn_opcodes_h_l1568_c7_8d15] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1568_c7_8d15_cond <= VAR_t8_MUX_uxn_opcodes_h_l1568_c7_8d15_cond;
     t8_MUX_uxn_opcodes_h_l1568_c7_8d15_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1568_c7_8d15_iftrue;
     t8_MUX_uxn_opcodes_h_l1568_c7_8d15_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1568_c7_8d15_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1568_c7_8d15_return_output := t8_MUX_uxn_opcodes_h_l1568_c7_8d15_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1560_c1_b0d0] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1560_c1_b0d0_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1560_c1_b0d0_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1560_c1_b0d0_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1560_c1_b0d0_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1560_c1_b0d0_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1560_c1_b0d0_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1560_c1_b0d0_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1560_c1_b0d0_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1574_c7_1007] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_1007_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_1007_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_1007_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_1007_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_1007_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_1007_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_1007_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_1007_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1588_c7_14a8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1588_c7_14a8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1588_c7_14a8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1588_c7_14a8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1588_c7_14a8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1588_c7_14a8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1588_c7_14a8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1588_c7_14a8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1588_c7_14a8_return_output;

     -- Submodule level 2
     VAR_tmp16_MUX_uxn_opcodes_h_l1582_c7_4900_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1583_c3_e6be_return_output;
     VAR_result_u16_value_uxn_opcodes_h_l1572_c3_b320 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1572_c22_37d6_return_output)),16);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_1934_left := VAR_BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_40f4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1588_c7_14a8_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1590_c21_24c2_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1578_c7_54e5_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1580_c3_5cab_return_output;
     VAR_printf_uxn_opcodes_h_l1561_c3_56e1_uxn_opcodes_h_l1561_c3_56e1_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1560_c1_b0d0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1588_c7_14a8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1592_c7_aa68_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_8d15_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_1007_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1588_c7_14a8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1592_c7_aa68_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1565_c7_2161_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_8d15_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_4900_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1588_c7_14a8_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1565_c7_2161_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1568_c7_8d15_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1568_c7_8d15_iftrue := VAR_result_u16_value_uxn_opcodes_h_l1572_c3_b320;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1588_c7_14a8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1588_c7_14a8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1588_c7_14a8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1588_c7_14a8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1588_c7_14a8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1588_c7_14a8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1588_c7_14a8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1588_c7_14a8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1588_c7_14a8_return_output;

     -- printf_uxn_opcodes_h_l1561_c3_56e1[uxn_opcodes_h_l1561_c3_56e1] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1561_c3_56e1_uxn_opcodes_h_l1561_c3_56e1_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1561_c3_56e1_uxn_opcodes_h_l1561_c3_56e1_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_u8_value_MUX[uxn_opcodes_h_l1588_c7_14a8] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1588_c7_14a8_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1588_c7_14a8_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1588_c7_14a8_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1588_c7_14a8_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1588_c7_14a8_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1588_c7_14a8_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1588_c7_14a8_return_output := result_u8_value_MUX_uxn_opcodes_h_l1588_c7_14a8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1582_c7_4900] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_4900_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_4900_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_4900_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_4900_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_4900_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_4900_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_4900_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_4900_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1586_c21_5806] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1586_c21_5806_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_OR_uxn_opcodes_h_l1583_c3_e6be_return_output);

     -- tmp16_MUX[uxn_opcodes_h_l1582_c7_4900] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1582_c7_4900_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1582_c7_4900_cond;
     tmp16_MUX_uxn_opcodes_h_l1582_c7_4900_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1582_c7_4900_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1582_c7_4900_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1582_c7_4900_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1582_c7_4900_return_output := tmp16_MUX_uxn_opcodes_h_l1582_c7_4900_return_output;

     -- t8_MUX[uxn_opcodes_h_l1565_c7_2161] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1565_c7_2161_cond <= VAR_t8_MUX_uxn_opcodes_h_l1565_c7_2161_cond;
     t8_MUX_uxn_opcodes_h_l1565_c7_2161_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1565_c7_2161_iftrue;
     t8_MUX_uxn_opcodes_h_l1565_c7_2161_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1565_c7_2161_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1565_c7_2161_return_output := t8_MUX_uxn_opcodes_h_l1565_c7_2161_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1565_c7_2161] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1565_c7_2161_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1565_c7_2161_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1565_c7_2161_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1565_c7_2161_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1565_c7_2161_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1565_c7_2161_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1565_c7_2161_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1565_c7_2161_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1568_c7_8d15] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_8d15_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_8d15_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_8d15_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_8d15_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_8d15_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_8d15_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_8d15_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_8d15_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1576_c22_1934] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_1934_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_1934_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_1934_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_1934_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_1934_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_1934_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1588_c7_14a8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1588_c7_14a8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1588_c7_14a8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1588_c7_14a8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1588_c7_14a8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1588_c7_14a8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1588_c7_14a8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1588_c7_14a8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1588_c7_14a8_return_output;

     -- Submodule level 3
     VAR_result_u16_value_uxn_opcodes_h_l1576_c3_a11f := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_1934_return_output)),16);
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1582_c7_4900_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1586_c21_5806_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_4900_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1588_c7_14a8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1565_c7_2161_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_8d15_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_4900_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1588_c7_14a8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c2_303d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1565_c7_2161_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_54e5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_4900_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1582_c7_4900_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1588_c7_14a8_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1560_c2_303d_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1565_c7_2161_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1578_c7_54e5_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1582_c7_4900_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1574_c7_1007_iftrue := VAR_result_u16_value_uxn_opcodes_h_l1576_c3_a11f;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1565_c7_2161] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1565_c7_2161_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1565_c7_2161_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1565_c7_2161_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1565_c7_2161_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1565_c7_2161_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1565_c7_2161_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1565_c7_2161_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1565_c7_2161_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1578_c7_54e5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_54e5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_54e5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_54e5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_54e5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_54e5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_54e5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_54e5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_54e5_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1578_c7_54e5] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1578_c7_54e5_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1578_c7_54e5_cond;
     tmp16_MUX_uxn_opcodes_h_l1578_c7_54e5_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1578_c7_54e5_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1578_c7_54e5_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1578_c7_54e5_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1578_c7_54e5_return_output := tmp16_MUX_uxn_opcodes_h_l1578_c7_54e5_return_output;

     -- t8_MUX[uxn_opcodes_h_l1560_c2_303d] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1560_c2_303d_cond <= VAR_t8_MUX_uxn_opcodes_h_l1560_c2_303d_cond;
     t8_MUX_uxn_opcodes_h_l1560_c2_303d_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1560_c2_303d_iftrue;
     t8_MUX_uxn_opcodes_h_l1560_c2_303d_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1560_c2_303d_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1560_c2_303d_return_output := t8_MUX_uxn_opcodes_h_l1560_c2_303d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1560_c2_303d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c2_303d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c2_303d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c2_303d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c2_303d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c2_303d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c2_303d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c2_303d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c2_303d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1582_c7_4900] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_4900_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_4900_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_4900_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_4900_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_4900_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_4900_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_4900_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_4900_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1574_c7_1007] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1574_c7_1007_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1574_c7_1007_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1574_c7_1007_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1574_c7_1007_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1574_c7_1007_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1574_c7_1007_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1574_c7_1007_return_output := result_u16_value_MUX_uxn_opcodes_h_l1574_c7_1007_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1582_c7_4900] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1582_c7_4900_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1582_c7_4900_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1582_c7_4900_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1582_c7_4900_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1582_c7_4900_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1582_c7_4900_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1582_c7_4900_return_output := result_u8_value_MUX_uxn_opcodes_h_l1582_c7_4900_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1582_c7_4900] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_4900_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_4900_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_4900_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_4900_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_4900_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_4900_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_4900_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_4900_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_54e5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_4900_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c2_303d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1565_c7_2161_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_54e5_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_4900_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_1007_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_54e5_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1568_c7_8d15_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1574_c7_1007_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1578_c7_54e5_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1582_c7_4900_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1560_c2_303d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1574_c7_1007_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1578_c7_54e5_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1574_c7_1007] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_1007_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_1007_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_1007_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_1007_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_1007_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_1007_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_1007_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_1007_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1578_c7_54e5] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1578_c7_54e5_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1578_c7_54e5_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1578_c7_54e5_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1578_c7_54e5_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1578_c7_54e5_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1578_c7_54e5_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1578_c7_54e5_return_output := result_u8_value_MUX_uxn_opcodes_h_l1578_c7_54e5_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1574_c7_1007] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1574_c7_1007_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1574_c7_1007_cond;
     tmp16_MUX_uxn_opcodes_h_l1574_c7_1007_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1574_c7_1007_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1574_c7_1007_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1574_c7_1007_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1574_c7_1007_return_output := tmp16_MUX_uxn_opcodes_h_l1574_c7_1007_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1578_c7_54e5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_54e5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_54e5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_54e5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_54e5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_54e5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_54e5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_54e5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_54e5_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1560_c2_303d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c2_303d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c2_303d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c2_303d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c2_303d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c2_303d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c2_303d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c2_303d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c2_303d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1578_c7_54e5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_54e5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_54e5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_54e5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_54e5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_54e5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_54e5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_54e5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_54e5_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1568_c7_8d15] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1568_c7_8d15_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1568_c7_8d15_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1568_c7_8d15_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1568_c7_8d15_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1568_c7_8d15_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1568_c7_8d15_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1568_c7_8d15_return_output := result_u16_value_MUX_uxn_opcodes_h_l1568_c7_8d15_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_1007_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_54e5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_1007_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_54e5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_8d15_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_1007_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1565_c7_2161_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1568_c7_8d15_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1574_c7_1007_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1578_c7_54e5_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1568_c7_8d15_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1574_c7_1007_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1568_c7_8d15] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1568_c7_8d15_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1568_c7_8d15_cond;
     tmp16_MUX_uxn_opcodes_h_l1568_c7_8d15_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1568_c7_8d15_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1568_c7_8d15_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1568_c7_8d15_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1568_c7_8d15_return_output := tmp16_MUX_uxn_opcodes_h_l1568_c7_8d15_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1574_c7_1007] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1574_c7_1007_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1574_c7_1007_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1574_c7_1007_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1574_c7_1007_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1574_c7_1007_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1574_c7_1007_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1574_c7_1007_return_output := result_u8_value_MUX_uxn_opcodes_h_l1574_c7_1007_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1574_c7_1007] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_1007_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_1007_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_1007_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_1007_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_1007_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_1007_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_1007_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_1007_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1565_c7_2161] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1565_c7_2161_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1565_c7_2161_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1565_c7_2161_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1565_c7_2161_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1565_c7_2161_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1565_c7_2161_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1565_c7_2161_return_output := result_u16_value_MUX_uxn_opcodes_h_l1565_c7_2161_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1568_c7_8d15] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_8d15_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_8d15_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_8d15_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_8d15_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_8d15_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_8d15_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_8d15_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_8d15_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1574_c7_1007] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_1007_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_1007_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_1007_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_1007_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_1007_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_1007_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_1007_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_1007_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_8d15_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_1007_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_8d15_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_1007_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1565_c7_2161_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_8d15_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1560_c2_303d_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1565_c7_2161_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1568_c7_8d15_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1574_c7_1007_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1565_c7_2161_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1568_c7_8d15_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l1560_c2_303d] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1560_c2_303d_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1560_c2_303d_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1560_c2_303d_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1560_c2_303d_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1560_c2_303d_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1560_c2_303d_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1560_c2_303d_return_output := result_u16_value_MUX_uxn_opcodes_h_l1560_c2_303d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1565_c7_2161] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1565_c7_2161_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1565_c7_2161_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1565_c7_2161_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1565_c7_2161_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1565_c7_2161_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1565_c7_2161_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1565_c7_2161_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1565_c7_2161_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1568_c7_8d15] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1568_c7_8d15_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1568_c7_8d15_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1568_c7_8d15_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1568_c7_8d15_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1568_c7_8d15_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1568_c7_8d15_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1568_c7_8d15_return_output := result_u8_value_MUX_uxn_opcodes_h_l1568_c7_8d15_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1568_c7_8d15] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_8d15_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_8d15_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_8d15_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_8d15_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_8d15_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_8d15_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_8d15_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_8d15_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1568_c7_8d15] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_8d15_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_8d15_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_8d15_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_8d15_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_8d15_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_8d15_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_8d15_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_8d15_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1565_c7_2161] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1565_c7_2161_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1565_c7_2161_cond;
     tmp16_MUX_uxn_opcodes_h_l1565_c7_2161_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1565_c7_2161_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1565_c7_2161_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1565_c7_2161_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1565_c7_2161_return_output := tmp16_MUX_uxn_opcodes_h_l1565_c7_2161_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1565_c7_2161_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_8d15_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1565_c7_2161_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_8d15_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c2_303d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1565_c7_2161_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1565_c7_2161_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1568_c7_8d15_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1560_c2_303d_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1565_c7_2161_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1565_c7_2161] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1565_c7_2161_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1565_c7_2161_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1565_c7_2161_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1565_c7_2161_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1565_c7_2161_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1565_c7_2161_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1565_c7_2161_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1565_c7_2161_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1560_c2_303d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c2_303d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c2_303d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c2_303d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c2_303d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c2_303d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c2_303d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c2_303d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c2_303d_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1560_c2_303d] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1560_c2_303d_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1560_c2_303d_cond;
     tmp16_MUX_uxn_opcodes_h_l1560_c2_303d_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1560_c2_303d_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1560_c2_303d_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1560_c2_303d_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1560_c2_303d_return_output := tmp16_MUX_uxn_opcodes_h_l1560_c2_303d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1565_c7_2161] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1565_c7_2161_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1565_c7_2161_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1565_c7_2161_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1565_c7_2161_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1565_c7_2161_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1565_c7_2161_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1565_c7_2161_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1565_c7_2161_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1565_c7_2161] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1565_c7_2161_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1565_c7_2161_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1565_c7_2161_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1565_c7_2161_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1565_c7_2161_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1565_c7_2161_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1565_c7_2161_return_output := result_u8_value_MUX_uxn_opcodes_h_l1565_c7_2161_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1560_c2_303d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1565_c7_2161_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1560_c2_303d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1565_c7_2161_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1560_c2_303d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1565_c7_2161_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l1560_c2_303d_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1560_c2_303d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1560_c2_303d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1560_c2_303d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1560_c2_303d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1560_c2_303d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1560_c2_303d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1560_c2_303d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1560_c2_303d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1560_c2_303d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1560_c2_303d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1560_c2_303d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1560_c2_303d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1560_c2_303d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1560_c2_303d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1560_c2_303d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1560_c2_303d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1560_c2_303d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1560_c2_303d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1560_c2_303d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1560_c2_303d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1560_c2_303d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1560_c2_303d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1560_c2_303d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1560_c2_303d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1560_c2_303d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1560_c2_303d_return_output := result_u8_value_MUX_uxn_opcodes_h_l1560_c2_303d_return_output;

     -- Submodule level 9
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_c7d3_uxn_opcodes_h_l1555_l1597_DUPLICATE_1f2b LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c7d3_uxn_opcodes_h_l1555_l1597_DUPLICATE_1f2b_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_c7d3(
     result,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1560_c2_303d_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1560_c2_303d_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c2_303d_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c2_303d_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1560_c2_303d_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c2_303d_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1560_c2_303d_return_output);

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c7d3_uxn_opcodes_h_l1555_l1597_DUPLICATE_1f2b_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c7d3_uxn_opcodes_h_l1555_l1597_DUPLICATE_1f2b_return_output;
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
