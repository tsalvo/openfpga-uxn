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
-- BIN_OP_EQ[uxn_opcodes_h_l1560_c6_fd9c]
signal BIN_OP_EQ_uxn_opcodes_h_l1560_c6_fd9c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1560_c6_fd9c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1560_c6_fd9c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1560_c1_5193]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1560_c1_5193_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1560_c1_5193_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1560_c1_5193_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1560_c1_5193_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1560_c2_e9f3]
signal tmp16_MUX_uxn_opcodes_h_l1560_c2_e9f3_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1560_c2_e9f3_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1560_c2_e9f3_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1560_c2_e9f3_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l1560_c2_e9f3]
signal t8_MUX_uxn_opcodes_h_l1560_c2_e9f3_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1560_c2_e9f3_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1560_c2_e9f3_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1560_c2_e9f3_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1560_c2_e9f3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1560_c2_e9f3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1560_c2_e9f3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1560_c2_e9f3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1560_c2_e9f3_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1560_c2_e9f3]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c2_e9f3_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c2_e9f3_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c2_e9f3_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c2_e9f3_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1560_c2_e9f3]
signal result_u16_value_MUX_uxn_opcodes_h_l1560_c2_e9f3_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1560_c2_e9f3_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1560_c2_e9f3_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1560_c2_e9f3_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1560_c2_e9f3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c2_e9f3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c2_e9f3_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c2_e9f3_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c2_e9f3_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1560_c2_e9f3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1560_c2_e9f3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1560_c2_e9f3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1560_c2_e9f3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1560_c2_e9f3_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1560_c2_e9f3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c2_e9f3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c2_e9f3_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c2_e9f3_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c2_e9f3_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1560_c2_e9f3]
signal result_u8_value_MUX_uxn_opcodes_h_l1560_c2_e9f3_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1560_c2_e9f3_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1560_c2_e9f3_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1560_c2_e9f3_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l1561_c3_f0dc[uxn_opcodes_h_l1561_c3_f0dc]
signal printf_uxn_opcodes_h_l1561_c3_f0dc_uxn_opcodes_h_l1561_c3_f0dc_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1565_c11_1b73]
signal BIN_OP_EQ_uxn_opcodes_h_l1565_c11_1b73_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1565_c11_1b73_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1565_c11_1b73_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1565_c7_c171]
signal tmp16_MUX_uxn_opcodes_h_l1565_c7_c171_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1565_c7_c171_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1565_c7_c171_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1565_c7_c171_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l1565_c7_c171]
signal t8_MUX_uxn_opcodes_h_l1565_c7_c171_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1565_c7_c171_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1565_c7_c171_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1565_c7_c171_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1565_c7_c171]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1565_c7_c171_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1565_c7_c171_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1565_c7_c171_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1565_c7_c171_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1565_c7_c171]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1565_c7_c171_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1565_c7_c171_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1565_c7_c171_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1565_c7_c171_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1565_c7_c171]
signal result_u16_value_MUX_uxn_opcodes_h_l1565_c7_c171_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1565_c7_c171_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1565_c7_c171_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1565_c7_c171_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1565_c7_c171]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1565_c7_c171_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1565_c7_c171_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1565_c7_c171_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1565_c7_c171_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1565_c7_c171]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1565_c7_c171_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1565_c7_c171_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1565_c7_c171_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1565_c7_c171_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1565_c7_c171]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1565_c7_c171_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1565_c7_c171_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1565_c7_c171_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1565_c7_c171_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1565_c7_c171]
signal result_u8_value_MUX_uxn_opcodes_h_l1565_c7_c171_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1565_c7_c171_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1565_c7_c171_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1565_c7_c171_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1568_c11_2701]
signal BIN_OP_EQ_uxn_opcodes_h_l1568_c11_2701_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1568_c11_2701_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1568_c11_2701_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1568_c7_61b4]
signal tmp16_MUX_uxn_opcodes_h_l1568_c7_61b4_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1568_c7_61b4_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1568_c7_61b4_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1568_c7_61b4_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l1568_c7_61b4]
signal t8_MUX_uxn_opcodes_h_l1568_c7_61b4_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1568_c7_61b4_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1568_c7_61b4_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1568_c7_61b4_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1568_c7_61b4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_61b4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_61b4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_61b4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_61b4_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1568_c7_61b4]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_61b4_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_61b4_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_61b4_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_61b4_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1568_c7_61b4]
signal result_u16_value_MUX_uxn_opcodes_h_l1568_c7_61b4_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1568_c7_61b4_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1568_c7_61b4_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1568_c7_61b4_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1568_c7_61b4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_61b4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_61b4_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_61b4_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_61b4_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1568_c7_61b4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_61b4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_61b4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_61b4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_61b4_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1568_c7_61b4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_61b4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_61b4_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_61b4_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_61b4_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1568_c7_61b4]
signal result_u8_value_MUX_uxn_opcodes_h_l1568_c7_61b4_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1568_c7_61b4_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1568_c7_61b4_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1568_c7_61b4_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1571_c30_534c]
signal sp_relative_shift_uxn_opcodes_h_l1571_c30_534c_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1571_c30_534c_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1571_c30_534c_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1571_c30_534c_return_output : signed(3 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1572_c22_702c]
signal BIN_OP_PLUS_uxn_opcodes_h_l1572_c22_702c_left : signed(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1572_c22_702c_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1572_c22_702c_return_output : signed(17 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1574_c11_66ad]
signal BIN_OP_EQ_uxn_opcodes_h_l1574_c11_66ad_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1574_c11_66ad_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1574_c11_66ad_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1574_c7_d9c4]
signal tmp16_MUX_uxn_opcodes_h_l1574_c7_d9c4_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1574_c7_d9c4_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1574_c7_d9c4_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1574_c7_d9c4_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1574_c7_d9c4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_d9c4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_d9c4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_d9c4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_d9c4_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1574_c7_d9c4]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_d9c4_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_d9c4_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_d9c4_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_d9c4_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1574_c7_d9c4]
signal result_u16_value_MUX_uxn_opcodes_h_l1574_c7_d9c4_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1574_c7_d9c4_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1574_c7_d9c4_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1574_c7_d9c4_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1574_c7_d9c4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_d9c4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_d9c4_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_d9c4_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_d9c4_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1574_c7_d9c4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_d9c4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_d9c4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_d9c4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_d9c4_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1574_c7_d9c4]
signal result_u8_value_MUX_uxn_opcodes_h_l1574_c7_d9c4_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1574_c7_d9c4_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1574_c7_d9c4_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1574_c7_d9c4_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1576_c22_fa71]
signal BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_fa71_left : signed(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_fa71_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_fa71_return_output : signed(17 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1576_c22_64dd]
signal BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_64dd_left : signed(17 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_64dd_right : signed(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_64dd_return_output : signed(18 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1578_c11_fd6b]
signal BIN_OP_EQ_uxn_opcodes_h_l1578_c11_fd6b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1578_c11_fd6b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1578_c11_fd6b_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1578_c7_eaf5]
signal tmp16_MUX_uxn_opcodes_h_l1578_c7_eaf5_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1578_c7_eaf5_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1578_c7_eaf5_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1578_c7_eaf5_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1578_c7_eaf5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_eaf5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_eaf5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_eaf5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_eaf5_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1578_c7_eaf5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_eaf5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_eaf5_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_eaf5_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_eaf5_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1578_c7_eaf5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_eaf5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_eaf5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_eaf5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_eaf5_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1578_c7_eaf5]
signal result_u8_value_MUX_uxn_opcodes_h_l1578_c7_eaf5_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1578_c7_eaf5_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1578_c7_eaf5_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1578_c7_eaf5_return_output : unsigned(7 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1580_c3_389c]
signal CONST_SL_8_uxn_opcodes_h_l1580_c3_389c_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1580_c3_389c_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1582_c11_4624]
signal BIN_OP_EQ_uxn_opcodes_h_l1582_c11_4624_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1582_c11_4624_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1582_c11_4624_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1582_c7_2432]
signal tmp16_MUX_uxn_opcodes_h_l1582_c7_2432_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1582_c7_2432_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1582_c7_2432_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1582_c7_2432_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1582_c7_2432]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_2432_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_2432_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_2432_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_2432_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1582_c7_2432]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_2432_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_2432_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_2432_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_2432_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1582_c7_2432]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_2432_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_2432_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_2432_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_2432_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1582_c7_2432]
signal result_u8_value_MUX_uxn_opcodes_h_l1582_c7_2432_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1582_c7_2432_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1582_c7_2432_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1582_c7_2432_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1583_c3_f227]
signal BIN_OP_OR_uxn_opcodes_h_l1583_c3_f227_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1583_c3_f227_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1583_c3_f227_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1588_c11_5d98]
signal BIN_OP_EQ_uxn_opcodes_h_l1588_c11_5d98_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1588_c11_5d98_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1588_c11_5d98_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1588_c7_428a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1588_c7_428a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1588_c7_428a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1588_c7_428a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1588_c7_428a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1588_c7_428a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1588_c7_428a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1588_c7_428a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1588_c7_428a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1588_c7_428a_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1588_c7_428a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1588_c7_428a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1588_c7_428a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1588_c7_428a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1588_c7_428a_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1588_c7_428a]
signal result_u8_value_MUX_uxn_opcodes_h_l1588_c7_428a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1588_c7_428a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1588_c7_428a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1588_c7_428a_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1590_c31_f993]
signal CONST_SR_8_uxn_opcodes_h_l1590_c31_f993_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1590_c31_f993_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1592_c11_fb64]
signal BIN_OP_EQ_uxn_opcodes_h_l1592_c11_fb64_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1592_c11_fb64_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1592_c11_fb64_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1592_c7_f5c0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1592_c7_f5c0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1592_c7_f5c0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1592_c7_f5c0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1592_c7_f5c0_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1592_c7_f5c0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1592_c7_f5c0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1592_c7_f5c0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1592_c7_f5c0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1592_c7_f5c0_return_output : unsigned(0 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_856e( ref_toks_0 : opcode_result_t;
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
      base.is_opc_done := ref_toks_1;
      base.is_sp_shift := ref_toks_2;
      base.u16_value := ref_toks_3;
      base.stack_address_sp_offset := ref_toks_4;
      base.is_stack_write := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.u8_value := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1560_c6_fd9c
BIN_OP_EQ_uxn_opcodes_h_l1560_c6_fd9c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1560_c6_fd9c_left,
BIN_OP_EQ_uxn_opcodes_h_l1560_c6_fd9c_right,
BIN_OP_EQ_uxn_opcodes_h_l1560_c6_fd9c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1560_c1_5193
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1560_c1_5193 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1560_c1_5193_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1560_c1_5193_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1560_c1_5193_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1560_c1_5193_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1560_c2_e9f3
tmp16_MUX_uxn_opcodes_h_l1560_c2_e9f3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1560_c2_e9f3_cond,
tmp16_MUX_uxn_opcodes_h_l1560_c2_e9f3_iftrue,
tmp16_MUX_uxn_opcodes_h_l1560_c2_e9f3_iffalse,
tmp16_MUX_uxn_opcodes_h_l1560_c2_e9f3_return_output);

-- t8_MUX_uxn_opcodes_h_l1560_c2_e9f3
t8_MUX_uxn_opcodes_h_l1560_c2_e9f3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1560_c2_e9f3_cond,
t8_MUX_uxn_opcodes_h_l1560_c2_e9f3_iftrue,
t8_MUX_uxn_opcodes_h_l1560_c2_e9f3_iffalse,
t8_MUX_uxn_opcodes_h_l1560_c2_e9f3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1560_c2_e9f3
result_is_opc_done_MUX_uxn_opcodes_h_l1560_c2_e9f3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1560_c2_e9f3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1560_c2_e9f3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1560_c2_e9f3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1560_c2_e9f3_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c2_e9f3
result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c2_e9f3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c2_e9f3_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c2_e9f3_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c2_e9f3_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c2_e9f3_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1560_c2_e9f3
result_u16_value_MUX_uxn_opcodes_h_l1560_c2_e9f3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1560_c2_e9f3_cond,
result_u16_value_MUX_uxn_opcodes_h_l1560_c2_e9f3_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1560_c2_e9f3_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1560_c2_e9f3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c2_e9f3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c2_e9f3 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c2_e9f3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c2_e9f3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c2_e9f3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c2_e9f3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1560_c2_e9f3
result_is_stack_write_MUX_uxn_opcodes_h_l1560_c2_e9f3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1560_c2_e9f3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1560_c2_e9f3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1560_c2_e9f3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1560_c2_e9f3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c2_e9f3
result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c2_e9f3 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c2_e9f3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c2_e9f3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c2_e9f3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c2_e9f3_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1560_c2_e9f3
result_u8_value_MUX_uxn_opcodes_h_l1560_c2_e9f3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1560_c2_e9f3_cond,
result_u8_value_MUX_uxn_opcodes_h_l1560_c2_e9f3_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1560_c2_e9f3_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1560_c2_e9f3_return_output);

-- printf_uxn_opcodes_h_l1561_c3_f0dc_uxn_opcodes_h_l1561_c3_f0dc
printf_uxn_opcodes_h_l1561_c3_f0dc_uxn_opcodes_h_l1561_c3_f0dc : entity work.printf_uxn_opcodes_h_l1561_c3_f0dc_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1561_c3_f0dc_uxn_opcodes_h_l1561_c3_f0dc_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1565_c11_1b73
BIN_OP_EQ_uxn_opcodes_h_l1565_c11_1b73 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1565_c11_1b73_left,
BIN_OP_EQ_uxn_opcodes_h_l1565_c11_1b73_right,
BIN_OP_EQ_uxn_opcodes_h_l1565_c11_1b73_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1565_c7_c171
tmp16_MUX_uxn_opcodes_h_l1565_c7_c171 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1565_c7_c171_cond,
tmp16_MUX_uxn_opcodes_h_l1565_c7_c171_iftrue,
tmp16_MUX_uxn_opcodes_h_l1565_c7_c171_iffalse,
tmp16_MUX_uxn_opcodes_h_l1565_c7_c171_return_output);

-- t8_MUX_uxn_opcodes_h_l1565_c7_c171
t8_MUX_uxn_opcodes_h_l1565_c7_c171 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1565_c7_c171_cond,
t8_MUX_uxn_opcodes_h_l1565_c7_c171_iftrue,
t8_MUX_uxn_opcodes_h_l1565_c7_c171_iffalse,
t8_MUX_uxn_opcodes_h_l1565_c7_c171_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1565_c7_c171
result_is_opc_done_MUX_uxn_opcodes_h_l1565_c7_c171 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1565_c7_c171_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1565_c7_c171_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1565_c7_c171_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1565_c7_c171_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1565_c7_c171
result_is_sp_shift_MUX_uxn_opcodes_h_l1565_c7_c171 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1565_c7_c171_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1565_c7_c171_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1565_c7_c171_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1565_c7_c171_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1565_c7_c171
result_u16_value_MUX_uxn_opcodes_h_l1565_c7_c171 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1565_c7_c171_cond,
result_u16_value_MUX_uxn_opcodes_h_l1565_c7_c171_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1565_c7_c171_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1565_c7_c171_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1565_c7_c171
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1565_c7_c171 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1565_c7_c171_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1565_c7_c171_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1565_c7_c171_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1565_c7_c171_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1565_c7_c171
result_is_stack_write_MUX_uxn_opcodes_h_l1565_c7_c171 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1565_c7_c171_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1565_c7_c171_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1565_c7_c171_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1565_c7_c171_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1565_c7_c171
result_sp_relative_shift_MUX_uxn_opcodes_h_l1565_c7_c171 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1565_c7_c171_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1565_c7_c171_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1565_c7_c171_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1565_c7_c171_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1565_c7_c171
result_u8_value_MUX_uxn_opcodes_h_l1565_c7_c171 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1565_c7_c171_cond,
result_u8_value_MUX_uxn_opcodes_h_l1565_c7_c171_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1565_c7_c171_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1565_c7_c171_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1568_c11_2701
BIN_OP_EQ_uxn_opcodes_h_l1568_c11_2701 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1568_c11_2701_left,
BIN_OP_EQ_uxn_opcodes_h_l1568_c11_2701_right,
BIN_OP_EQ_uxn_opcodes_h_l1568_c11_2701_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1568_c7_61b4
tmp16_MUX_uxn_opcodes_h_l1568_c7_61b4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1568_c7_61b4_cond,
tmp16_MUX_uxn_opcodes_h_l1568_c7_61b4_iftrue,
tmp16_MUX_uxn_opcodes_h_l1568_c7_61b4_iffalse,
tmp16_MUX_uxn_opcodes_h_l1568_c7_61b4_return_output);

-- t8_MUX_uxn_opcodes_h_l1568_c7_61b4
t8_MUX_uxn_opcodes_h_l1568_c7_61b4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1568_c7_61b4_cond,
t8_MUX_uxn_opcodes_h_l1568_c7_61b4_iftrue,
t8_MUX_uxn_opcodes_h_l1568_c7_61b4_iffalse,
t8_MUX_uxn_opcodes_h_l1568_c7_61b4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_61b4
result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_61b4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_61b4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_61b4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_61b4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_61b4_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_61b4
result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_61b4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_61b4_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_61b4_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_61b4_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_61b4_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1568_c7_61b4
result_u16_value_MUX_uxn_opcodes_h_l1568_c7_61b4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1568_c7_61b4_cond,
result_u16_value_MUX_uxn_opcodes_h_l1568_c7_61b4_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1568_c7_61b4_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1568_c7_61b4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_61b4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_61b4 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_61b4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_61b4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_61b4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_61b4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_61b4
result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_61b4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_61b4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_61b4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_61b4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_61b4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_61b4
result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_61b4 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_61b4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_61b4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_61b4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_61b4_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1568_c7_61b4
result_u8_value_MUX_uxn_opcodes_h_l1568_c7_61b4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1568_c7_61b4_cond,
result_u8_value_MUX_uxn_opcodes_h_l1568_c7_61b4_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1568_c7_61b4_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1568_c7_61b4_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1571_c30_534c
sp_relative_shift_uxn_opcodes_h_l1571_c30_534c : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1571_c30_534c_ins,
sp_relative_shift_uxn_opcodes_h_l1571_c30_534c_x,
sp_relative_shift_uxn_opcodes_h_l1571_c30_534c_y,
sp_relative_shift_uxn_opcodes_h_l1571_c30_534c_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1572_c22_702c
BIN_OP_PLUS_uxn_opcodes_h_l1572_c22_702c : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1572_c22_702c_left,
BIN_OP_PLUS_uxn_opcodes_h_l1572_c22_702c_right,
BIN_OP_PLUS_uxn_opcodes_h_l1572_c22_702c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1574_c11_66ad
BIN_OP_EQ_uxn_opcodes_h_l1574_c11_66ad : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1574_c11_66ad_left,
BIN_OP_EQ_uxn_opcodes_h_l1574_c11_66ad_right,
BIN_OP_EQ_uxn_opcodes_h_l1574_c11_66ad_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1574_c7_d9c4
tmp16_MUX_uxn_opcodes_h_l1574_c7_d9c4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1574_c7_d9c4_cond,
tmp16_MUX_uxn_opcodes_h_l1574_c7_d9c4_iftrue,
tmp16_MUX_uxn_opcodes_h_l1574_c7_d9c4_iffalse,
tmp16_MUX_uxn_opcodes_h_l1574_c7_d9c4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_d9c4
result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_d9c4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_d9c4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_d9c4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_d9c4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_d9c4_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_d9c4
result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_d9c4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_d9c4_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_d9c4_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_d9c4_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_d9c4_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1574_c7_d9c4
result_u16_value_MUX_uxn_opcodes_h_l1574_c7_d9c4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1574_c7_d9c4_cond,
result_u16_value_MUX_uxn_opcodes_h_l1574_c7_d9c4_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1574_c7_d9c4_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1574_c7_d9c4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_d9c4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_d9c4 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_d9c4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_d9c4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_d9c4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_d9c4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_d9c4
result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_d9c4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_d9c4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_d9c4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_d9c4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_d9c4_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1574_c7_d9c4
result_u8_value_MUX_uxn_opcodes_h_l1574_c7_d9c4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1574_c7_d9c4_cond,
result_u8_value_MUX_uxn_opcodes_h_l1574_c7_d9c4_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1574_c7_d9c4_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1574_c7_d9c4_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_fa71
BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_fa71 : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_fa71_left,
BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_fa71_right,
BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_fa71_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_64dd
BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_64dd : entity work.BIN_OP_PLUS_int18_t_int2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_64dd_left,
BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_64dd_right,
BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_64dd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1578_c11_fd6b
BIN_OP_EQ_uxn_opcodes_h_l1578_c11_fd6b : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1578_c11_fd6b_left,
BIN_OP_EQ_uxn_opcodes_h_l1578_c11_fd6b_right,
BIN_OP_EQ_uxn_opcodes_h_l1578_c11_fd6b_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1578_c7_eaf5
tmp16_MUX_uxn_opcodes_h_l1578_c7_eaf5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1578_c7_eaf5_cond,
tmp16_MUX_uxn_opcodes_h_l1578_c7_eaf5_iftrue,
tmp16_MUX_uxn_opcodes_h_l1578_c7_eaf5_iffalse,
tmp16_MUX_uxn_opcodes_h_l1578_c7_eaf5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_eaf5
result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_eaf5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_eaf5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_eaf5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_eaf5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_eaf5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_eaf5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_eaf5 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_eaf5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_eaf5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_eaf5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_eaf5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_eaf5
result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_eaf5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_eaf5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_eaf5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_eaf5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_eaf5_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1578_c7_eaf5
result_u8_value_MUX_uxn_opcodes_h_l1578_c7_eaf5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1578_c7_eaf5_cond,
result_u8_value_MUX_uxn_opcodes_h_l1578_c7_eaf5_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1578_c7_eaf5_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1578_c7_eaf5_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1580_c3_389c
CONST_SL_8_uxn_opcodes_h_l1580_c3_389c : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1580_c3_389c_x,
CONST_SL_8_uxn_opcodes_h_l1580_c3_389c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1582_c11_4624
BIN_OP_EQ_uxn_opcodes_h_l1582_c11_4624 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1582_c11_4624_left,
BIN_OP_EQ_uxn_opcodes_h_l1582_c11_4624_right,
BIN_OP_EQ_uxn_opcodes_h_l1582_c11_4624_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1582_c7_2432
tmp16_MUX_uxn_opcodes_h_l1582_c7_2432 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1582_c7_2432_cond,
tmp16_MUX_uxn_opcodes_h_l1582_c7_2432_iftrue,
tmp16_MUX_uxn_opcodes_h_l1582_c7_2432_iffalse,
tmp16_MUX_uxn_opcodes_h_l1582_c7_2432_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_2432
result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_2432 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_2432_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_2432_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_2432_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_2432_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_2432
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_2432 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_2432_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_2432_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_2432_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_2432_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_2432
result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_2432 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_2432_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_2432_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_2432_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_2432_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1582_c7_2432
result_u8_value_MUX_uxn_opcodes_h_l1582_c7_2432 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1582_c7_2432_cond,
result_u8_value_MUX_uxn_opcodes_h_l1582_c7_2432_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1582_c7_2432_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1582_c7_2432_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1583_c3_f227
BIN_OP_OR_uxn_opcodes_h_l1583_c3_f227 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1583_c3_f227_left,
BIN_OP_OR_uxn_opcodes_h_l1583_c3_f227_right,
BIN_OP_OR_uxn_opcodes_h_l1583_c3_f227_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1588_c11_5d98
BIN_OP_EQ_uxn_opcodes_h_l1588_c11_5d98 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1588_c11_5d98_left,
BIN_OP_EQ_uxn_opcodes_h_l1588_c11_5d98_right,
BIN_OP_EQ_uxn_opcodes_h_l1588_c11_5d98_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1588_c7_428a
result_is_opc_done_MUX_uxn_opcodes_h_l1588_c7_428a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1588_c7_428a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1588_c7_428a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1588_c7_428a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1588_c7_428a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1588_c7_428a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1588_c7_428a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1588_c7_428a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1588_c7_428a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1588_c7_428a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1588_c7_428a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1588_c7_428a
result_is_stack_write_MUX_uxn_opcodes_h_l1588_c7_428a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1588_c7_428a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1588_c7_428a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1588_c7_428a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1588_c7_428a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1588_c7_428a
result_u8_value_MUX_uxn_opcodes_h_l1588_c7_428a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1588_c7_428a_cond,
result_u8_value_MUX_uxn_opcodes_h_l1588_c7_428a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1588_c7_428a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1588_c7_428a_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1590_c31_f993
CONST_SR_8_uxn_opcodes_h_l1590_c31_f993 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1590_c31_f993_x,
CONST_SR_8_uxn_opcodes_h_l1590_c31_f993_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1592_c11_fb64
BIN_OP_EQ_uxn_opcodes_h_l1592_c11_fb64 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1592_c11_fb64_left,
BIN_OP_EQ_uxn_opcodes_h_l1592_c11_fb64_right,
BIN_OP_EQ_uxn_opcodes_h_l1592_c11_fb64_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1592_c7_f5c0
result_is_opc_done_MUX_uxn_opcodes_h_l1592_c7_f5c0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1592_c7_f5c0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1592_c7_f5c0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1592_c7_f5c0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1592_c7_f5c0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1592_c7_f5c0
result_is_stack_write_MUX_uxn_opcodes_h_l1592_c7_f5c0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1592_c7_f5c0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1592_c7_f5c0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1592_c7_f5c0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1592_c7_f5c0_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1560_c6_fd9c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1560_c1_5193_return_output,
 tmp16_MUX_uxn_opcodes_h_l1560_c2_e9f3_return_output,
 t8_MUX_uxn_opcodes_h_l1560_c2_e9f3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1560_c2_e9f3_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c2_e9f3_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1560_c2_e9f3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c2_e9f3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1560_c2_e9f3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c2_e9f3_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1560_c2_e9f3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1565_c11_1b73_return_output,
 tmp16_MUX_uxn_opcodes_h_l1565_c7_c171_return_output,
 t8_MUX_uxn_opcodes_h_l1565_c7_c171_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1565_c7_c171_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1565_c7_c171_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1565_c7_c171_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1565_c7_c171_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1565_c7_c171_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1565_c7_c171_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1565_c7_c171_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1568_c11_2701_return_output,
 tmp16_MUX_uxn_opcodes_h_l1568_c7_61b4_return_output,
 t8_MUX_uxn_opcodes_h_l1568_c7_61b4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_61b4_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_61b4_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1568_c7_61b4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_61b4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_61b4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_61b4_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1568_c7_61b4_return_output,
 sp_relative_shift_uxn_opcodes_h_l1571_c30_534c_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1572_c22_702c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1574_c11_66ad_return_output,
 tmp16_MUX_uxn_opcodes_h_l1574_c7_d9c4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_d9c4_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_d9c4_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1574_c7_d9c4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_d9c4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_d9c4_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1574_c7_d9c4_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_fa71_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_64dd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1578_c11_fd6b_return_output,
 tmp16_MUX_uxn_opcodes_h_l1578_c7_eaf5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_eaf5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_eaf5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_eaf5_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1578_c7_eaf5_return_output,
 CONST_SL_8_uxn_opcodes_h_l1580_c3_389c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1582_c11_4624_return_output,
 tmp16_MUX_uxn_opcodes_h_l1582_c7_2432_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_2432_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_2432_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_2432_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1582_c7_2432_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1583_c3_f227_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1588_c11_5d98_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1588_c7_428a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1588_c7_428a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1588_c7_428a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1588_c7_428a_return_output,
 CONST_SR_8_uxn_opcodes_h_l1590_c31_f993_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1592_c11_fb64_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1592_c7_f5c0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1592_c7_f5c0_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c6_fd9c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c6_fd9c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c6_fd9c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1560_c1_5193_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1560_c1_5193_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1560_c1_5193_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1560_c1_5193_iffalse : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1560_c2_e9f3_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1560_c2_e9f3_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1565_c7_c171_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1560_c2_e9f3_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1560_c2_e9f3_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1560_c2_e9f3_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1560_c2_e9f3_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1565_c7_c171_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1560_c2_e9f3_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1560_c2_e9f3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1560_c2_e9f3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1560_c2_e9f3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1565_c7_c171_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1560_c2_e9f3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1560_c2_e9f3_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c2_e9f3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c2_e9f3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1565_c7_c171_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c2_e9f3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c2_e9f3_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1560_c2_e9f3_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1560_c2_e9f3_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1565_c7_c171_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1560_c2_e9f3_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1560_c2_e9f3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c2_e9f3_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1562_c3_a80e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c2_e9f3_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1565_c7_c171_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c2_e9f3_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c2_e9f3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1560_c2_e9f3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1560_c2_e9f3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1565_c7_c171_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1560_c2_e9f3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1560_c2_e9f3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c2_e9f3_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c2_e9f3_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1565_c7_c171_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c2_e9f3_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c2_e9f3_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1560_c2_e9f3_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1560_c2_e9f3_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1565_c7_c171_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1560_c2_e9f3_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1560_c2_e9f3_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1561_c3_f0dc_uxn_opcodes_h_l1561_c3_f0dc_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1565_c11_1b73_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1565_c11_1b73_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1565_c11_1b73_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1565_c7_c171_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1565_c7_c171_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1568_c7_61b4_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1565_c7_c171_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1565_c7_c171_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1565_c7_c171_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1568_c7_61b4_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1565_c7_c171_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1565_c7_c171_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1565_c7_c171_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_61b4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1565_c7_c171_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1565_c7_c171_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1565_c7_c171_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_61b4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1565_c7_c171_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1565_c7_c171_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1565_c7_c171_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1568_c7_61b4_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1565_c7_c171_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1565_c7_c171_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1566_c3_4505 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1565_c7_c171_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_61b4_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1565_c7_c171_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1565_c7_c171_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1565_c7_c171_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_61b4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1565_c7_c171_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1565_c7_c171_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1565_c7_c171_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_61b4_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1565_c7_c171_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1565_c7_c171_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1565_c7_c171_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1568_c7_61b4_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1565_c7_c171_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1568_c11_2701_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1568_c11_2701_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1568_c11_2701_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1568_c7_61b4_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1568_c7_61b4_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1574_c7_d9c4_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1568_c7_61b4_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1568_c7_61b4_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1568_c7_61b4_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1568_c7_61b4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_61b4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_61b4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_d9c4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_61b4_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_61b4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_61b4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_d9c4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_61b4_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1568_c7_61b4_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l1572_c3_0f94 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1568_c7_61b4_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1574_c7_d9c4_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1568_c7_61b4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_61b4_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_61b4_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_d9c4_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_61b4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_61b4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_61b4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_d9c4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_61b4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_61b4_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_61b4_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_61b4_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1568_c7_61b4_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1568_c7_61b4_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1574_c7_d9c4_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1568_c7_61b4_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1571_c30_534c_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1571_c30_534c_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1571_c30_534c_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1571_c30_534c_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1572_c22_702c_left : signed(16 downto 0);
 variable VAR_CAST_TO_int8_t_uxn_opcodes_h_l1572_c27_b2cc_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1572_c22_702c_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1572_c22_702c_return_output : signed(17 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_66ad_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_66ad_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_66ad_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1574_c7_d9c4_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1574_c7_d9c4_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1578_c7_eaf5_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1574_c7_d9c4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_d9c4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_d9c4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_eaf5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_d9c4_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_d9c4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_d9c4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_d9c4_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1574_c7_d9c4_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l1576_c3_e7df : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1574_c7_d9c4_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1574_c7_d9c4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_d9c4_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_d9c4_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_eaf5_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_d9c4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_d9c4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_d9c4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_eaf5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_d9c4_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1574_c7_d9c4_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1574_c7_d9c4_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1578_c7_eaf5_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1574_c7_d9c4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_fa71_left : signed(16 downto 0);
 variable VAR_CAST_TO_int8_t_uxn_opcodes_h_l1576_c27_d736_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_fa71_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_fa71_return_output : signed(17 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_64dd_left : signed(17 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_64dd_right : signed(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_64dd_return_output : signed(18 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_fd6b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_fd6b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_fd6b_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1578_c7_eaf5_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1578_c7_eaf5_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1582_c7_2432_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1578_c7_eaf5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_eaf5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_eaf5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_2432_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_eaf5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_eaf5_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_eaf5_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_2432_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_eaf5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_eaf5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_eaf5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_2432_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_eaf5_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1578_c7_eaf5_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1578_c7_eaf5_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1582_c7_2432_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1578_c7_eaf5_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1580_c3_389c_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1580_c3_389c_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1582_c11_4624_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1582_c11_4624_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1582_c11_4624_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1582_c7_2432_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1582_c7_2432_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1582_c7_2432_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_2432_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_2432_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1588_c7_428a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_2432_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_2432_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1585_c3_9779 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_2432_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1588_c7_428a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_2432_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_2432_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_2432_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1588_c7_428a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_2432_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1582_c7_2432_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1582_c7_2432_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1588_c7_428a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1582_c7_2432_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1583_c3_f227_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1583_c3_f227_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1583_c3_f227_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1586_c21_03f8_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1588_c11_5d98_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1588_c11_5d98_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1588_c11_5d98_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1588_c7_428a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1588_c7_428a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1592_c7_f5c0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1588_c7_428a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1588_c7_428a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1589_c3_05b3 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1588_c7_428a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1588_c7_428a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1588_c7_428a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1588_c7_428a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1592_c7_f5c0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1588_c7_428a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1588_c7_428a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1588_c7_428a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1588_c7_428a_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1590_c31_f993_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1590_c31_f993_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1590_c21_6cff_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1592_c11_fb64_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1592_c11_fb64_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1592_c11_fb64_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1592_c7_f5c0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1592_c7_f5c0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1592_c7_f5c0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1592_c7_f5c0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1592_c7_f5c0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1592_c7_f5c0_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1565_l1560_l1574_DUPLICATE_2b38_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1565_l1560_l1574_DUPLICATE_f018_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1565_l1592_l1560_l1588_l1578_l1574_l1568_DUPLICATE_fd7f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1565_l1568_l1560_DUPLICATE_9e35_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1565_l1560_l1588_l1578_l1574_l1568_DUPLICATE_0628_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1565_l1592_l1588_l1582_l1578_l1574_l1568_DUPLICATE_b2a3_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1588_l1578_l1568_l1574_DUPLICATE_0780_return_output : unsigned(3 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1579_l1583_DUPLICATE_5375_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_856e_uxn_opcodes_h_l1597_l1555_DUPLICATE_022b_return_output : opcode_result_t;
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
     VAR_sp_relative_shift_uxn_opcodes_h_l1571_c30_534c_y := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_d9c4_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1582_c11_4624_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1592_c11_fb64_right := to_unsigned(7, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1560_c2_e9f3_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1589_c3_05b3 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1588_c7_428a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1589_c3_05b3;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_fd6b_right := to_unsigned(4, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1592_c7_f5c0_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c6_fd9c_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1565_c11_1b73_right := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_61b4_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_64dd_right := signed(std_logic_vector(resize(to_unsigned(1, 1), 2)));
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1560_c1_5193_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1588_c11_5d98_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1562_c3_a80e := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c2_e9f3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1562_c3_a80e;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1585_c3_9779 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_2432_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1585_c3_9779;
     VAR_sp_relative_shift_uxn_opcodes_h_l1571_c30_534c_x := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1568_c11_2701_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_66ad_right := to_unsigned(3, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_2432_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1592_c7_f5c0_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1566_c3_4505 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1565_c7_c171_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1566_c3_4505;

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1560_c1_5193_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l1571_c30_534c_ins := VAR_ins;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1572_c22_702c_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_fa71_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c6_fd9c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1565_c11_1b73_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1568_c11_2701_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_66ad_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_fd6b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1582_c11_4624_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1588_c11_5d98_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1592_c11_fb64_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l1568_c7_61b4_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1560_c2_e9f3_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1565_c7_c171_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1568_c7_61b4_iffalse := t8;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1583_c3_f227_left := tmp16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1590_c31_f993_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1560_c2_e9f3_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1565_c7_c171_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1568_c7_61b4_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1574_c7_d9c4_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1582_c7_2432_iffalse := tmp16;
     -- sp_relative_shift[uxn_opcodes_h_l1571_c30_534c] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1571_c30_534c_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1571_c30_534c_ins;
     sp_relative_shift_uxn_opcodes_h_l1571_c30_534c_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1571_c30_534c_x;
     sp_relative_shift_uxn_opcodes_h_l1571_c30_534c_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1571_c30_534c_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1571_c30_534c_return_output := sp_relative_shift_uxn_opcodes_h_l1571_c30_534c_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1588_l1578_l1568_l1574_DUPLICATE_0780 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1588_l1578_l1568_l1574_DUPLICATE_0780_return_output := result.stack_address_sp_offset;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1579_l1583_DUPLICATE_5375 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1579_l1583_DUPLICATE_5375_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1565_l1592_l1560_l1588_l1578_l1574_l1568_DUPLICATE_fd7f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1565_l1592_l1560_l1588_l1578_l1574_l1568_DUPLICATE_fd7f_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1578_c11_fd6b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1578_c11_fd6b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_fd6b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1578_c11_fd6b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_fd6b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_fd6b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1578_c11_fd6b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1592_c11_fb64] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1592_c11_fb64_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1592_c11_fb64_left;
     BIN_OP_EQ_uxn_opcodes_h_l1592_c11_fb64_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1592_c11_fb64_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1592_c11_fb64_return_output := BIN_OP_EQ_uxn_opcodes_h_l1592_c11_fb64_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1560_c6_fd9c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1560_c6_fd9c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c6_fd9c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1560_c6_fd9c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c6_fd9c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c6_fd9c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1560_c6_fd9c_return_output;

     -- CAST_TO_int8_t[uxn_opcodes_h_l1572_c27_b2cc] LATENCY=0
     VAR_CAST_TO_int8_t_uxn_opcodes_h_l1572_c27_b2cc_return_output := CAST_TO_int8_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1565_l1560_l1574_DUPLICATE_2b38 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1565_l1560_l1574_DUPLICATE_2b38_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1565_c11_1b73] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1565_c11_1b73_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1565_c11_1b73_left;
     BIN_OP_EQ_uxn_opcodes_h_l1565_c11_1b73_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1565_c11_1b73_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1565_c11_1b73_return_output := BIN_OP_EQ_uxn_opcodes_h_l1565_c11_1b73_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1574_c11_66ad] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1574_c11_66ad_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_66ad_left;
     BIN_OP_EQ_uxn_opcodes_h_l1574_c11_66ad_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_66ad_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_66ad_return_output := BIN_OP_EQ_uxn_opcodes_h_l1574_c11_66ad_return_output;

     -- CAST_TO_int8_t[uxn_opcodes_h_l1576_c27_d736] LATENCY=0
     VAR_CAST_TO_int8_t_uxn_opcodes_h_l1576_c27_d736_return_output := CAST_TO_int8_t_uint8_t(
     t8);

     -- CONST_SR_8[uxn_opcodes_h_l1590_c31_f993] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1590_c31_f993_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1590_c31_f993_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1590_c31_f993_return_output := CONST_SR_8_uxn_opcodes_h_l1590_c31_f993_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1568_c11_2701] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1568_c11_2701_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1568_c11_2701_left;
     BIN_OP_EQ_uxn_opcodes_h_l1568_c11_2701_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1568_c11_2701_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1568_c11_2701_return_output := BIN_OP_EQ_uxn_opcodes_h_l1568_c11_2701_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1565_l1568_l1560_DUPLICATE_9e35 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1565_l1568_l1560_DUPLICATE_9e35_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1565_l1560_l1574_DUPLICATE_f018 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1565_l1560_l1574_DUPLICATE_f018_return_output := result.u16_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1588_c11_5d98] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1588_c11_5d98_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1588_c11_5d98_left;
     BIN_OP_EQ_uxn_opcodes_h_l1588_c11_5d98_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1588_c11_5d98_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1588_c11_5d98_return_output := BIN_OP_EQ_uxn_opcodes_h_l1588_c11_5d98_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1582_c11_4624] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1582_c11_4624_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1582_c11_4624_left;
     BIN_OP_EQ_uxn_opcodes_h_l1582_c11_4624_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1582_c11_4624_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1582_c11_4624_return_output := BIN_OP_EQ_uxn_opcodes_h_l1582_c11_4624_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1565_l1560_l1588_l1578_l1574_l1568_DUPLICATE_0628 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1565_l1560_l1588_l1578_l1574_l1568_DUPLICATE_0628_return_output := result.u8_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1565_l1592_l1588_l1582_l1578_l1574_l1568_DUPLICATE_b2a3 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1565_l1592_l1588_l1582_l1578_l1574_l1568_DUPLICATE_b2a3_return_output := result.is_opc_done;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1560_c1_5193_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c6_fd9c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1560_c2_e9f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c6_fd9c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c2_e9f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c6_fd9c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1560_c2_e9f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c6_fd9c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c2_e9f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c6_fd9c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c2_e9f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c6_fd9c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1560_c2_e9f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c6_fd9c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1560_c2_e9f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c6_fd9c_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1560_c2_e9f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c6_fd9c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1560_c2_e9f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c6_fd9c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1565_c7_c171_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1565_c11_1b73_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1565_c7_c171_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1565_c11_1b73_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1565_c7_c171_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1565_c11_1b73_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1565_c7_c171_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1565_c11_1b73_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1565_c7_c171_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1565_c11_1b73_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1565_c7_c171_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1565_c11_1b73_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1565_c7_c171_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1565_c11_1b73_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1565_c7_c171_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1565_c11_1b73_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1565_c7_c171_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1565_c11_1b73_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_61b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1568_c11_2701_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_61b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1568_c11_2701_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_61b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1568_c11_2701_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_61b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1568_c11_2701_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_61b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1568_c11_2701_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1568_c7_61b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1568_c11_2701_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1568_c7_61b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1568_c11_2701_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1568_c7_61b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1568_c11_2701_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1568_c7_61b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1568_c11_2701_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_d9c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_66ad_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_d9c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_66ad_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_d9c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_66ad_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_d9c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_66ad_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1574_c7_d9c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_66ad_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1574_c7_d9c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_66ad_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1574_c7_d9c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_66ad_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_eaf5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_fd6b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_eaf5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_fd6b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_eaf5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_fd6b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1578_c7_eaf5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_fd6b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1578_c7_eaf5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_fd6b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_2432_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1582_c11_4624_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_2432_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1582_c11_4624_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_2432_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1582_c11_4624_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1582_c7_2432_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1582_c11_4624_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1582_c7_2432_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1582_c11_4624_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1588_c7_428a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1588_c11_5d98_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1588_c7_428a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1588_c11_5d98_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1588_c7_428a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1588_c11_5d98_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1588_c7_428a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1588_c11_5d98_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1592_c7_f5c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1592_c11_fb64_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1592_c7_f5c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1592_c11_fb64_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1572_c22_702c_right := VAR_CAST_TO_int8_t_uxn_opcodes_h_l1572_c27_b2cc_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_fa71_right := VAR_CAST_TO_int8_t_uxn_opcodes_h_l1576_c27_d736_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1583_c3_f227_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1579_l1583_DUPLICATE_5375_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1580_c3_389c_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1579_l1583_DUPLICATE_5375_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c2_e9f3_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1565_l1568_l1560_DUPLICATE_9e35_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1565_c7_c171_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1565_l1568_l1560_DUPLICATE_9e35_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_61b4_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1565_l1568_l1560_DUPLICATE_9e35_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1560_c2_e9f3_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1565_l1560_l1574_DUPLICATE_f018_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1565_c7_c171_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1565_l1560_l1574_DUPLICATE_f018_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1574_c7_d9c4_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1565_l1560_l1574_DUPLICATE_f018_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1565_c7_c171_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1565_l1592_l1588_l1582_l1578_l1574_l1568_DUPLICATE_b2a3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_61b4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1565_l1592_l1588_l1582_l1578_l1574_l1568_DUPLICATE_b2a3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_d9c4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1565_l1592_l1588_l1582_l1578_l1574_l1568_DUPLICATE_b2a3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_eaf5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1565_l1592_l1588_l1582_l1578_l1574_l1568_DUPLICATE_b2a3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_2432_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1565_l1592_l1588_l1582_l1578_l1574_l1568_DUPLICATE_b2a3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1588_c7_428a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1565_l1592_l1588_l1582_l1578_l1574_l1568_DUPLICATE_b2a3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1592_c7_f5c0_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1565_l1592_l1588_l1582_l1578_l1574_l1568_DUPLICATE_b2a3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c2_e9f3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1565_l1560_l1574_DUPLICATE_2b38_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1565_c7_c171_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1565_l1560_l1574_DUPLICATE_2b38_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_d9c4_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1565_l1560_l1574_DUPLICATE_2b38_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1560_c2_e9f3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1565_l1592_l1560_l1588_l1578_l1574_l1568_DUPLICATE_fd7f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1565_c7_c171_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1565_l1592_l1560_l1588_l1578_l1574_l1568_DUPLICATE_fd7f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_61b4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1565_l1592_l1560_l1588_l1578_l1574_l1568_DUPLICATE_fd7f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_d9c4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1565_l1592_l1560_l1588_l1578_l1574_l1568_DUPLICATE_fd7f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_eaf5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1565_l1592_l1560_l1588_l1578_l1574_l1568_DUPLICATE_fd7f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1588_c7_428a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1565_l1592_l1560_l1588_l1578_l1574_l1568_DUPLICATE_fd7f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1592_c7_f5c0_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1565_l1592_l1560_l1588_l1578_l1574_l1568_DUPLICATE_fd7f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_61b4_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1588_l1578_l1568_l1574_DUPLICATE_0780_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_d9c4_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1588_l1578_l1568_l1574_DUPLICATE_0780_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_eaf5_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1588_l1578_l1568_l1574_DUPLICATE_0780_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1588_c7_428a_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1588_l1578_l1568_l1574_DUPLICATE_0780_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1560_c2_e9f3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1565_l1560_l1588_l1578_l1574_l1568_DUPLICATE_0628_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1565_c7_c171_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1565_l1560_l1588_l1578_l1574_l1568_DUPLICATE_0628_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1568_c7_61b4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1565_l1560_l1588_l1578_l1574_l1568_DUPLICATE_0628_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1574_c7_d9c4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1565_l1560_l1588_l1578_l1574_l1568_DUPLICATE_0628_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1578_c7_eaf5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1565_l1560_l1588_l1578_l1574_l1568_DUPLICATE_0628_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1588_c7_428a_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1565_l1560_l1588_l1578_l1574_l1568_DUPLICATE_0628_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_61b4_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1571_c30_534c_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1592_c7_f5c0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1592_c7_f5c0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1592_c7_f5c0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1592_c7_f5c0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1592_c7_f5c0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1592_c7_f5c0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1592_c7_f5c0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1592_c7_f5c0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1592_c7_f5c0_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l1580_c3_389c] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1580_c3_389c_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1580_c3_389c_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1580_c3_389c_return_output := CONST_SL_8_uxn_opcodes_h_l1580_c3_389c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1568_c7_61b4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_61b4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_61b4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_61b4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_61b4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_61b4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_61b4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_61b4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_61b4_return_output;

     -- t8_MUX[uxn_opcodes_h_l1568_c7_61b4] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1568_c7_61b4_cond <= VAR_t8_MUX_uxn_opcodes_h_l1568_c7_61b4_cond;
     t8_MUX_uxn_opcodes_h_l1568_c7_61b4_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1568_c7_61b4_iftrue;
     t8_MUX_uxn_opcodes_h_l1568_c7_61b4_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1568_c7_61b4_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1568_c7_61b4_return_output := t8_MUX_uxn_opcodes_h_l1568_c7_61b4_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1590_c21_6cff] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1590_c21_6cff_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1590_c31_f993_return_output);

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1592_c7_f5c0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1592_c7_f5c0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1592_c7_f5c0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1592_c7_f5c0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1592_c7_f5c0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1592_c7_f5c0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1592_c7_f5c0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1592_c7_f5c0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1592_c7_f5c0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1588_c7_428a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1588_c7_428a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1588_c7_428a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1588_c7_428a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1588_c7_428a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1588_c7_428a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1588_c7_428a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1588_c7_428a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1588_c7_428a_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1576_c22_fa71] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_fa71_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_fa71_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_fa71_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_fa71_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_fa71_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_fa71_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1572_c22_702c] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1572_c22_702c_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1572_c22_702c_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1572_c22_702c_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1572_c22_702c_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1572_c22_702c_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1572_c22_702c_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1560_c1_5193] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1560_c1_5193_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1560_c1_5193_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1560_c1_5193_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1560_c1_5193_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1560_c1_5193_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1560_c1_5193_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1560_c1_5193_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1560_c1_5193_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1583_c3_f227] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1583_c3_f227_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1583_c3_f227_left;
     BIN_OP_OR_uxn_opcodes_h_l1583_c3_f227_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1583_c3_f227_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1583_c3_f227_return_output := BIN_OP_OR_uxn_opcodes_h_l1583_c3_f227_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1574_c7_d9c4] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_d9c4_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_d9c4_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_d9c4_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_d9c4_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_d9c4_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_d9c4_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_d9c4_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_d9c4_return_output;

     -- Submodule level 2
     VAR_tmp16_MUX_uxn_opcodes_h_l1582_c7_2432_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1583_c3_f227_return_output;
     VAR_result_u16_value_uxn_opcodes_h_l1572_c3_0f94 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1572_c22_702c_return_output)),16);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_64dd_left := VAR_BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_fa71_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1588_c7_428a_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1590_c21_6cff_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1578_c7_eaf5_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1580_c3_389c_return_output;
     VAR_printf_uxn_opcodes_h_l1561_c3_f0dc_uxn_opcodes_h_l1561_c3_f0dc_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1560_c1_5193_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1588_c7_428a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1592_c7_f5c0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_61b4_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_d9c4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1588_c7_428a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1592_c7_f5c0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1565_c7_c171_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_61b4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_2432_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1588_c7_428a_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1565_c7_c171_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1568_c7_61b4_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1568_c7_61b4_iftrue := VAR_result_u16_value_uxn_opcodes_h_l1572_c3_0f94;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1565_c7_c171] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1565_c7_c171_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1565_c7_c171_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1565_c7_c171_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1565_c7_c171_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1565_c7_c171_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1565_c7_c171_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1565_c7_c171_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1565_c7_c171_return_output;

     -- t8_MUX[uxn_opcodes_h_l1565_c7_c171] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1565_c7_c171_cond <= VAR_t8_MUX_uxn_opcodes_h_l1565_c7_c171_cond;
     t8_MUX_uxn_opcodes_h_l1565_c7_c171_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1565_c7_c171_iftrue;
     t8_MUX_uxn_opcodes_h_l1565_c7_c171_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1565_c7_c171_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1565_c7_c171_return_output := t8_MUX_uxn_opcodes_h_l1565_c7_c171_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1582_c7_2432] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1582_c7_2432_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1582_c7_2432_cond;
     tmp16_MUX_uxn_opcodes_h_l1582_c7_2432_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1582_c7_2432_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1582_c7_2432_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1582_c7_2432_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1582_c7_2432_return_output := tmp16_MUX_uxn_opcodes_h_l1582_c7_2432_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1586_c21_03f8] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1586_c21_03f8_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_OR_uxn_opcodes_h_l1583_c3_f227_return_output);

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1588_c7_428a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1588_c7_428a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1588_c7_428a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1588_c7_428a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1588_c7_428a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1588_c7_428a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1588_c7_428a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1588_c7_428a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1588_c7_428a_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1588_c7_428a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1588_c7_428a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1588_c7_428a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1588_c7_428a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1588_c7_428a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1588_c7_428a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1588_c7_428a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1588_c7_428a_return_output := result_u8_value_MUX_uxn_opcodes_h_l1588_c7_428a_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1576_c22_64dd] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_64dd_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_64dd_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_64dd_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_64dd_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_64dd_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_64dd_return_output;

     -- printf_uxn_opcodes_h_l1561_c3_f0dc[uxn_opcodes_h_l1561_c3_f0dc] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1561_c3_f0dc_uxn_opcodes_h_l1561_c3_f0dc_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1561_c3_f0dc_uxn_opcodes_h_l1561_c3_f0dc_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1568_c7_61b4] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_61b4_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_61b4_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_61b4_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_61b4_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_61b4_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_61b4_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_61b4_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_61b4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1582_c7_2432] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_2432_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_2432_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_2432_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_2432_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_2432_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_2432_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_2432_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_2432_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1588_c7_428a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1588_c7_428a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1588_c7_428a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1588_c7_428a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1588_c7_428a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1588_c7_428a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1588_c7_428a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1588_c7_428a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1588_c7_428a_return_output;

     -- Submodule level 3
     VAR_result_u16_value_uxn_opcodes_h_l1576_c3_e7df := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_64dd_return_output)),16);
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1582_c7_2432_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1586_c21_03f8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_2432_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1588_c7_428a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1565_c7_c171_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_61b4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_2432_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1588_c7_428a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c2_e9f3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1565_c7_c171_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_eaf5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_2432_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1582_c7_2432_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1588_c7_428a_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1560_c2_e9f3_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1565_c7_c171_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1578_c7_eaf5_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1582_c7_2432_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1574_c7_d9c4_iftrue := VAR_result_u16_value_uxn_opcodes_h_l1576_c3_e7df;
     -- result_u8_value_MUX[uxn_opcodes_h_l1582_c7_2432] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1582_c7_2432_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1582_c7_2432_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1582_c7_2432_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1582_c7_2432_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1582_c7_2432_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1582_c7_2432_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1582_c7_2432_return_output := result_u8_value_MUX_uxn_opcodes_h_l1582_c7_2432_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1582_c7_2432] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_2432_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_2432_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_2432_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_2432_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_2432_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_2432_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_2432_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_2432_return_output;

     -- t8_MUX[uxn_opcodes_h_l1560_c2_e9f3] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1560_c2_e9f3_cond <= VAR_t8_MUX_uxn_opcodes_h_l1560_c2_e9f3_cond;
     t8_MUX_uxn_opcodes_h_l1560_c2_e9f3_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1560_c2_e9f3_iftrue;
     t8_MUX_uxn_opcodes_h_l1560_c2_e9f3_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1560_c2_e9f3_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1560_c2_e9f3_return_output := t8_MUX_uxn_opcodes_h_l1560_c2_e9f3_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1578_c7_eaf5] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1578_c7_eaf5_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1578_c7_eaf5_cond;
     tmp16_MUX_uxn_opcodes_h_l1578_c7_eaf5_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1578_c7_eaf5_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1578_c7_eaf5_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1578_c7_eaf5_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1578_c7_eaf5_return_output := tmp16_MUX_uxn_opcodes_h_l1578_c7_eaf5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1578_c7_eaf5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_eaf5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_eaf5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_eaf5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_eaf5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_eaf5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_eaf5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_eaf5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_eaf5_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1565_c7_c171] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1565_c7_c171_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1565_c7_c171_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1565_c7_c171_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1565_c7_c171_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1565_c7_c171_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1565_c7_c171_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1565_c7_c171_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1565_c7_c171_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1574_c7_d9c4] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1574_c7_d9c4_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1574_c7_d9c4_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1574_c7_d9c4_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1574_c7_d9c4_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1574_c7_d9c4_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1574_c7_d9c4_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1574_c7_d9c4_return_output := result_u16_value_MUX_uxn_opcodes_h_l1574_c7_d9c4_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1582_c7_2432] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_2432_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_2432_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_2432_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_2432_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_2432_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_2432_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_2432_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_2432_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1560_c2_e9f3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c2_e9f3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c2_e9f3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c2_e9f3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c2_e9f3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c2_e9f3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c2_e9f3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c2_e9f3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c2_e9f3_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_eaf5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_2432_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c2_e9f3_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1565_c7_c171_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_eaf5_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_2432_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_d9c4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_eaf5_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1568_c7_61b4_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1574_c7_d9c4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1578_c7_eaf5_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1582_c7_2432_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1560_c2_e9f3_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1574_c7_d9c4_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1578_c7_eaf5_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1578_c7_eaf5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_eaf5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_eaf5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_eaf5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_eaf5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_eaf5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_eaf5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_eaf5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_eaf5_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1560_c2_e9f3] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c2_e9f3_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c2_e9f3_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c2_e9f3_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c2_e9f3_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c2_e9f3_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c2_e9f3_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c2_e9f3_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c2_e9f3_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1574_c7_d9c4] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1574_c7_d9c4_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1574_c7_d9c4_cond;
     tmp16_MUX_uxn_opcodes_h_l1574_c7_d9c4_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1574_c7_d9c4_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1574_c7_d9c4_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1574_c7_d9c4_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1574_c7_d9c4_return_output := tmp16_MUX_uxn_opcodes_h_l1574_c7_d9c4_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1568_c7_61b4] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1568_c7_61b4_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1568_c7_61b4_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1568_c7_61b4_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1568_c7_61b4_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1568_c7_61b4_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1568_c7_61b4_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1568_c7_61b4_return_output := result_u16_value_MUX_uxn_opcodes_h_l1568_c7_61b4_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1578_c7_eaf5] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1578_c7_eaf5_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1578_c7_eaf5_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1578_c7_eaf5_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1578_c7_eaf5_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1578_c7_eaf5_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1578_c7_eaf5_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1578_c7_eaf5_return_output := result_u8_value_MUX_uxn_opcodes_h_l1578_c7_eaf5_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1578_c7_eaf5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_eaf5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_eaf5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_eaf5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_eaf5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_eaf5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_eaf5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_eaf5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_eaf5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1574_c7_d9c4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_d9c4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_d9c4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_d9c4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_d9c4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_d9c4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_d9c4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_d9c4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_d9c4_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_d9c4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_eaf5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_d9c4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_eaf5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_61b4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_d9c4_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1565_c7_c171_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1568_c7_61b4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1574_c7_d9c4_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1578_c7_eaf5_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1568_c7_61b4_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1574_c7_d9c4_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1568_c7_61b4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_61b4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_61b4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_61b4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_61b4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_61b4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_61b4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_61b4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_61b4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1574_c7_d9c4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_d9c4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_d9c4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_d9c4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_d9c4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_d9c4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_d9c4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_d9c4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_d9c4_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1568_c7_61b4] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1568_c7_61b4_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1568_c7_61b4_cond;
     tmp16_MUX_uxn_opcodes_h_l1568_c7_61b4_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1568_c7_61b4_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1568_c7_61b4_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1568_c7_61b4_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1568_c7_61b4_return_output := tmp16_MUX_uxn_opcodes_h_l1568_c7_61b4_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1574_c7_d9c4] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1574_c7_d9c4_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1574_c7_d9c4_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1574_c7_d9c4_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1574_c7_d9c4_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1574_c7_d9c4_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1574_c7_d9c4_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1574_c7_d9c4_return_output := result_u8_value_MUX_uxn_opcodes_h_l1574_c7_d9c4_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1574_c7_d9c4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_d9c4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_d9c4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_d9c4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_d9c4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_d9c4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_d9c4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_d9c4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_d9c4_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1565_c7_c171] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1565_c7_c171_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1565_c7_c171_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1565_c7_c171_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1565_c7_c171_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1565_c7_c171_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1565_c7_c171_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1565_c7_c171_return_output := result_u16_value_MUX_uxn_opcodes_h_l1565_c7_c171_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_61b4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_d9c4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_61b4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_d9c4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1565_c7_c171_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_61b4_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1560_c2_e9f3_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1565_c7_c171_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1568_c7_61b4_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1574_c7_d9c4_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1565_c7_c171_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1568_c7_61b4_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1565_c7_c171] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1565_c7_c171_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1565_c7_c171_cond;
     tmp16_MUX_uxn_opcodes_h_l1565_c7_c171_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1565_c7_c171_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1565_c7_c171_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1565_c7_c171_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1565_c7_c171_return_output := tmp16_MUX_uxn_opcodes_h_l1565_c7_c171_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1568_c7_61b4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_61b4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_61b4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_61b4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_61b4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_61b4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_61b4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_61b4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_61b4_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1560_c2_e9f3] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1560_c2_e9f3_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1560_c2_e9f3_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1560_c2_e9f3_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1560_c2_e9f3_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1560_c2_e9f3_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1560_c2_e9f3_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1560_c2_e9f3_return_output := result_u16_value_MUX_uxn_opcodes_h_l1560_c2_e9f3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1565_c7_c171] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1565_c7_c171_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1565_c7_c171_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1565_c7_c171_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1565_c7_c171_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1565_c7_c171_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1565_c7_c171_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1565_c7_c171_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1565_c7_c171_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1568_c7_61b4] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1568_c7_61b4_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1568_c7_61b4_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1568_c7_61b4_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1568_c7_61b4_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1568_c7_61b4_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1568_c7_61b4_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1568_c7_61b4_return_output := result_u8_value_MUX_uxn_opcodes_h_l1568_c7_61b4_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1568_c7_61b4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_61b4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_61b4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_61b4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_61b4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_61b4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_61b4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_61b4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_61b4_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1565_c7_c171_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_61b4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1565_c7_c171_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_61b4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c2_e9f3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1565_c7_c171_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1565_c7_c171_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1568_c7_61b4_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1560_c2_e9f3_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1565_c7_c171_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1560_c2_e9f3] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1560_c2_e9f3_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1560_c2_e9f3_cond;
     tmp16_MUX_uxn_opcodes_h_l1560_c2_e9f3_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1560_c2_e9f3_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1560_c2_e9f3_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1560_c2_e9f3_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1560_c2_e9f3_return_output := tmp16_MUX_uxn_opcodes_h_l1560_c2_e9f3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1565_c7_c171] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1565_c7_c171_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1565_c7_c171_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1565_c7_c171_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1565_c7_c171_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1565_c7_c171_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1565_c7_c171_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1565_c7_c171_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1565_c7_c171_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1560_c2_e9f3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c2_e9f3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c2_e9f3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c2_e9f3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c2_e9f3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c2_e9f3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c2_e9f3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c2_e9f3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c2_e9f3_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1565_c7_c171] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1565_c7_c171_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1565_c7_c171_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1565_c7_c171_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1565_c7_c171_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1565_c7_c171_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1565_c7_c171_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1565_c7_c171_return_output := result_u8_value_MUX_uxn_opcodes_h_l1565_c7_c171_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1565_c7_c171] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1565_c7_c171_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1565_c7_c171_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1565_c7_c171_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1565_c7_c171_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1565_c7_c171_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1565_c7_c171_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1565_c7_c171_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1565_c7_c171_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1560_c2_e9f3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1565_c7_c171_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1560_c2_e9f3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1565_c7_c171_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1560_c2_e9f3_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1565_c7_c171_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l1560_c2_e9f3_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1560_c2_e9f3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1560_c2_e9f3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1560_c2_e9f3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1560_c2_e9f3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1560_c2_e9f3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1560_c2_e9f3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1560_c2_e9f3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1560_c2_e9f3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1560_c2_e9f3_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1560_c2_e9f3] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1560_c2_e9f3_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1560_c2_e9f3_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1560_c2_e9f3_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1560_c2_e9f3_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1560_c2_e9f3_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1560_c2_e9f3_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1560_c2_e9f3_return_output := result_u8_value_MUX_uxn_opcodes_h_l1560_c2_e9f3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1560_c2_e9f3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1560_c2_e9f3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1560_c2_e9f3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1560_c2_e9f3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1560_c2_e9f3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1560_c2_e9f3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1560_c2_e9f3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1560_c2_e9f3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1560_c2_e9f3_return_output;

     -- Submodule level 9
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_856e_uxn_opcodes_h_l1597_l1555_DUPLICATE_022b LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_856e_uxn_opcodes_h_l1597_l1555_DUPLICATE_022b_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_856e(
     result,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1560_c2_e9f3_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c2_e9f3_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1560_c2_e9f3_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c2_e9f3_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1560_c2_e9f3_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c2_e9f3_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1560_c2_e9f3_return_output);

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_856e_uxn_opcodes_h_l1597_l1555_DUPLICATE_022b_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_856e_uxn_opcodes_h_l1597_l1555_DUPLICATE_022b_return_output;
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
