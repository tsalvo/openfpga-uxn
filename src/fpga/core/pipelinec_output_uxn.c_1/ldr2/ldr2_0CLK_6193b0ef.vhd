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
-- BIN_OP_EQ[uxn_opcodes_h_l1560_c6_4b54]
signal BIN_OP_EQ_uxn_opcodes_h_l1560_c6_4b54_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1560_c6_4b54_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1560_c6_4b54_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1560_c1_a6bc]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1560_c1_a6bc_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1560_c1_a6bc_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1560_c1_a6bc_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1560_c1_a6bc_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1560_c2_e7d5]
signal tmp16_MUX_uxn_opcodes_h_l1560_c2_e7d5_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1560_c2_e7d5_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1560_c2_e7d5_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1560_c2_e7d5_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l1560_c2_e7d5]
signal t8_MUX_uxn_opcodes_h_l1560_c2_e7d5_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1560_c2_e7d5_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1560_c2_e7d5_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1560_c2_e7d5_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1560_c2_e7d5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c2_e7d5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c2_e7d5_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c2_e7d5_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c2_e7d5_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1560_c2_e7d5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1560_c2_e7d5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1560_c2_e7d5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1560_c2_e7d5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1560_c2_e7d5_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1560_c2_e7d5]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c2_e7d5_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c2_e7d5_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c2_e7d5_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c2_e7d5_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1560_c2_e7d5]
signal result_u16_value_MUX_uxn_opcodes_h_l1560_c2_e7d5_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1560_c2_e7d5_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1560_c2_e7d5_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1560_c2_e7d5_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1560_c2_e7d5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c2_e7d5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c2_e7d5_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c2_e7d5_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c2_e7d5_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1560_c2_e7d5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1560_c2_e7d5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1560_c2_e7d5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1560_c2_e7d5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1560_c2_e7d5_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1560_c2_e7d5]
signal result_u8_value_MUX_uxn_opcodes_h_l1560_c2_e7d5_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1560_c2_e7d5_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1560_c2_e7d5_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1560_c2_e7d5_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l1561_c3_382f[uxn_opcodes_h_l1561_c3_382f]
signal printf_uxn_opcodes_h_l1561_c3_382f_uxn_opcodes_h_l1561_c3_382f_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1565_c11_fdde]
signal BIN_OP_EQ_uxn_opcodes_h_l1565_c11_fdde_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1565_c11_fdde_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1565_c11_fdde_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1565_c7_1cd7]
signal tmp16_MUX_uxn_opcodes_h_l1565_c7_1cd7_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1565_c7_1cd7_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1565_c7_1cd7_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1565_c7_1cd7_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l1565_c7_1cd7]
signal t8_MUX_uxn_opcodes_h_l1565_c7_1cd7_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1565_c7_1cd7_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1565_c7_1cd7_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1565_c7_1cd7_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1565_c7_1cd7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1565_c7_1cd7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1565_c7_1cd7_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1565_c7_1cd7_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1565_c7_1cd7_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1565_c7_1cd7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1565_c7_1cd7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1565_c7_1cd7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1565_c7_1cd7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1565_c7_1cd7_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1565_c7_1cd7]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1565_c7_1cd7_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1565_c7_1cd7_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1565_c7_1cd7_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1565_c7_1cd7_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1565_c7_1cd7]
signal result_u16_value_MUX_uxn_opcodes_h_l1565_c7_1cd7_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1565_c7_1cd7_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1565_c7_1cd7_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1565_c7_1cd7_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1565_c7_1cd7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1565_c7_1cd7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1565_c7_1cd7_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1565_c7_1cd7_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1565_c7_1cd7_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1565_c7_1cd7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1565_c7_1cd7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1565_c7_1cd7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1565_c7_1cd7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1565_c7_1cd7_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1565_c7_1cd7]
signal result_u8_value_MUX_uxn_opcodes_h_l1565_c7_1cd7_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1565_c7_1cd7_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1565_c7_1cd7_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1565_c7_1cd7_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1568_c11_a577]
signal BIN_OP_EQ_uxn_opcodes_h_l1568_c11_a577_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1568_c11_a577_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1568_c11_a577_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1568_c7_e96b]
signal tmp16_MUX_uxn_opcodes_h_l1568_c7_e96b_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1568_c7_e96b_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1568_c7_e96b_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1568_c7_e96b_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l1568_c7_e96b]
signal t8_MUX_uxn_opcodes_h_l1568_c7_e96b_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1568_c7_e96b_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1568_c7_e96b_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1568_c7_e96b_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1568_c7_e96b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_e96b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_e96b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_e96b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_e96b_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1568_c7_e96b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_e96b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_e96b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_e96b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_e96b_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1568_c7_e96b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_e96b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_e96b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_e96b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_e96b_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1568_c7_e96b]
signal result_u16_value_MUX_uxn_opcodes_h_l1568_c7_e96b_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1568_c7_e96b_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1568_c7_e96b_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1568_c7_e96b_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1568_c7_e96b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_e96b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_e96b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_e96b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_e96b_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1568_c7_e96b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_e96b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_e96b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_e96b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_e96b_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1568_c7_e96b]
signal result_u8_value_MUX_uxn_opcodes_h_l1568_c7_e96b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1568_c7_e96b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1568_c7_e96b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1568_c7_e96b_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1571_c30_1951]
signal sp_relative_shift_uxn_opcodes_h_l1571_c30_1951_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1571_c30_1951_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1571_c30_1951_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1571_c30_1951_return_output : signed(3 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1572_c22_ad32]
signal BIN_OP_PLUS_uxn_opcodes_h_l1572_c22_ad32_left : signed(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1572_c22_ad32_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1572_c22_ad32_return_output : signed(17 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1574_c11_3663]
signal BIN_OP_EQ_uxn_opcodes_h_l1574_c11_3663_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1574_c11_3663_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1574_c11_3663_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1574_c7_621e]
signal tmp16_MUX_uxn_opcodes_h_l1574_c7_621e_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1574_c7_621e_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1574_c7_621e_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1574_c7_621e_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1574_c7_621e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_621e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_621e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_621e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_621e_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1574_c7_621e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_621e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_621e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_621e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_621e_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1574_c7_621e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_621e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_621e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_621e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_621e_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1574_c7_621e]
signal result_u16_value_MUX_uxn_opcodes_h_l1574_c7_621e_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1574_c7_621e_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1574_c7_621e_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1574_c7_621e_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1574_c7_621e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_621e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_621e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_621e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_621e_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1574_c7_621e]
signal result_u8_value_MUX_uxn_opcodes_h_l1574_c7_621e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1574_c7_621e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1574_c7_621e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1574_c7_621e_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1576_c22_330c]
signal BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_330c_left : signed(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_330c_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_330c_return_output : signed(17 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1576_c22_3770]
signal BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_3770_left : signed(17 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_3770_right : signed(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_3770_return_output : signed(18 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1578_c11_e71a]
signal BIN_OP_EQ_uxn_opcodes_h_l1578_c11_e71a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1578_c11_e71a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1578_c11_e71a_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1578_c7_394f]
signal tmp16_MUX_uxn_opcodes_h_l1578_c7_394f_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1578_c7_394f_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1578_c7_394f_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1578_c7_394f_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1578_c7_394f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_394f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_394f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_394f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_394f_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1578_c7_394f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_394f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_394f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_394f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_394f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1578_c7_394f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_394f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_394f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_394f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_394f_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1578_c7_394f]
signal result_u8_value_MUX_uxn_opcodes_h_l1578_c7_394f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1578_c7_394f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1578_c7_394f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1578_c7_394f_return_output : unsigned(7 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1580_c3_248d]
signal CONST_SL_8_uxn_opcodes_h_l1580_c3_248d_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1580_c3_248d_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1582_c11_827c]
signal BIN_OP_EQ_uxn_opcodes_h_l1582_c11_827c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1582_c11_827c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1582_c11_827c_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1582_c7_5377]
signal tmp16_MUX_uxn_opcodes_h_l1582_c7_5377_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1582_c7_5377_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1582_c7_5377_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1582_c7_5377_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1582_c7_5377]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_5377_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_5377_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_5377_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_5377_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1582_c7_5377]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_5377_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_5377_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_5377_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_5377_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1582_c7_5377]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_5377_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_5377_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_5377_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_5377_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1582_c7_5377]
signal result_u8_value_MUX_uxn_opcodes_h_l1582_c7_5377_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1582_c7_5377_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1582_c7_5377_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1582_c7_5377_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1583_c3_8cc0]
signal BIN_OP_OR_uxn_opcodes_h_l1583_c3_8cc0_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1583_c3_8cc0_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1583_c3_8cc0_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1588_c11_dff9]
signal BIN_OP_EQ_uxn_opcodes_h_l1588_c11_dff9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1588_c11_dff9_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1588_c11_dff9_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1588_c7_dc4c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1588_c7_dc4c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1588_c7_dc4c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1588_c7_dc4c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1588_c7_dc4c_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1588_c7_dc4c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1588_c7_dc4c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1588_c7_dc4c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1588_c7_dc4c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1588_c7_dc4c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1588_c7_dc4c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1588_c7_dc4c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1588_c7_dc4c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1588_c7_dc4c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1588_c7_dc4c_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1588_c7_dc4c]
signal result_u8_value_MUX_uxn_opcodes_h_l1588_c7_dc4c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1588_c7_dc4c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1588_c7_dc4c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1588_c7_dc4c_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1590_c31_a1cb]
signal CONST_SR_8_uxn_opcodes_h_l1590_c31_a1cb_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1590_c31_a1cb_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1592_c11_03f8]
signal BIN_OP_EQ_uxn_opcodes_h_l1592_c11_03f8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1592_c11_03f8_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1592_c11_03f8_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1592_c7_c1e1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1592_c7_c1e1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1592_c7_c1e1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1592_c7_c1e1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1592_c7_c1e1_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1592_c7_c1e1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1592_c7_c1e1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1592_c7_c1e1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1592_c7_c1e1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1592_c7_c1e1_return_output : unsigned(0 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l1560_c6_4b54
BIN_OP_EQ_uxn_opcodes_h_l1560_c6_4b54 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1560_c6_4b54_left,
BIN_OP_EQ_uxn_opcodes_h_l1560_c6_4b54_right,
BIN_OP_EQ_uxn_opcodes_h_l1560_c6_4b54_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1560_c1_a6bc
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1560_c1_a6bc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1560_c1_a6bc_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1560_c1_a6bc_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1560_c1_a6bc_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1560_c1_a6bc_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1560_c2_e7d5
tmp16_MUX_uxn_opcodes_h_l1560_c2_e7d5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1560_c2_e7d5_cond,
tmp16_MUX_uxn_opcodes_h_l1560_c2_e7d5_iftrue,
tmp16_MUX_uxn_opcodes_h_l1560_c2_e7d5_iffalse,
tmp16_MUX_uxn_opcodes_h_l1560_c2_e7d5_return_output);

-- t8_MUX_uxn_opcodes_h_l1560_c2_e7d5
t8_MUX_uxn_opcodes_h_l1560_c2_e7d5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1560_c2_e7d5_cond,
t8_MUX_uxn_opcodes_h_l1560_c2_e7d5_iftrue,
t8_MUX_uxn_opcodes_h_l1560_c2_e7d5_iffalse,
t8_MUX_uxn_opcodes_h_l1560_c2_e7d5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c2_e7d5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c2_e7d5 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c2_e7d5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c2_e7d5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c2_e7d5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c2_e7d5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1560_c2_e7d5
result_is_stack_write_MUX_uxn_opcodes_h_l1560_c2_e7d5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1560_c2_e7d5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1560_c2_e7d5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1560_c2_e7d5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1560_c2_e7d5_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c2_e7d5
result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c2_e7d5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c2_e7d5_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c2_e7d5_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c2_e7d5_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c2_e7d5_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1560_c2_e7d5
result_u16_value_MUX_uxn_opcodes_h_l1560_c2_e7d5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1560_c2_e7d5_cond,
result_u16_value_MUX_uxn_opcodes_h_l1560_c2_e7d5_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1560_c2_e7d5_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1560_c2_e7d5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c2_e7d5
result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c2_e7d5 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c2_e7d5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c2_e7d5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c2_e7d5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c2_e7d5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1560_c2_e7d5
result_is_opc_done_MUX_uxn_opcodes_h_l1560_c2_e7d5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1560_c2_e7d5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1560_c2_e7d5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1560_c2_e7d5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1560_c2_e7d5_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1560_c2_e7d5
result_u8_value_MUX_uxn_opcodes_h_l1560_c2_e7d5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1560_c2_e7d5_cond,
result_u8_value_MUX_uxn_opcodes_h_l1560_c2_e7d5_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1560_c2_e7d5_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1560_c2_e7d5_return_output);

-- printf_uxn_opcodes_h_l1561_c3_382f_uxn_opcodes_h_l1561_c3_382f
printf_uxn_opcodes_h_l1561_c3_382f_uxn_opcodes_h_l1561_c3_382f : entity work.printf_uxn_opcodes_h_l1561_c3_382f_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1561_c3_382f_uxn_opcodes_h_l1561_c3_382f_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1565_c11_fdde
BIN_OP_EQ_uxn_opcodes_h_l1565_c11_fdde : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1565_c11_fdde_left,
BIN_OP_EQ_uxn_opcodes_h_l1565_c11_fdde_right,
BIN_OP_EQ_uxn_opcodes_h_l1565_c11_fdde_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1565_c7_1cd7
tmp16_MUX_uxn_opcodes_h_l1565_c7_1cd7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1565_c7_1cd7_cond,
tmp16_MUX_uxn_opcodes_h_l1565_c7_1cd7_iftrue,
tmp16_MUX_uxn_opcodes_h_l1565_c7_1cd7_iffalse,
tmp16_MUX_uxn_opcodes_h_l1565_c7_1cd7_return_output);

-- t8_MUX_uxn_opcodes_h_l1565_c7_1cd7
t8_MUX_uxn_opcodes_h_l1565_c7_1cd7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1565_c7_1cd7_cond,
t8_MUX_uxn_opcodes_h_l1565_c7_1cd7_iftrue,
t8_MUX_uxn_opcodes_h_l1565_c7_1cd7_iffalse,
t8_MUX_uxn_opcodes_h_l1565_c7_1cd7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1565_c7_1cd7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1565_c7_1cd7 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1565_c7_1cd7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1565_c7_1cd7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1565_c7_1cd7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1565_c7_1cd7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1565_c7_1cd7
result_is_stack_write_MUX_uxn_opcodes_h_l1565_c7_1cd7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1565_c7_1cd7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1565_c7_1cd7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1565_c7_1cd7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1565_c7_1cd7_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1565_c7_1cd7
result_is_sp_shift_MUX_uxn_opcodes_h_l1565_c7_1cd7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1565_c7_1cd7_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1565_c7_1cd7_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1565_c7_1cd7_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1565_c7_1cd7_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1565_c7_1cd7
result_u16_value_MUX_uxn_opcodes_h_l1565_c7_1cd7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1565_c7_1cd7_cond,
result_u16_value_MUX_uxn_opcodes_h_l1565_c7_1cd7_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1565_c7_1cd7_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1565_c7_1cd7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1565_c7_1cd7
result_sp_relative_shift_MUX_uxn_opcodes_h_l1565_c7_1cd7 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1565_c7_1cd7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1565_c7_1cd7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1565_c7_1cd7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1565_c7_1cd7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1565_c7_1cd7
result_is_opc_done_MUX_uxn_opcodes_h_l1565_c7_1cd7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1565_c7_1cd7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1565_c7_1cd7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1565_c7_1cd7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1565_c7_1cd7_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1565_c7_1cd7
result_u8_value_MUX_uxn_opcodes_h_l1565_c7_1cd7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1565_c7_1cd7_cond,
result_u8_value_MUX_uxn_opcodes_h_l1565_c7_1cd7_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1565_c7_1cd7_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1565_c7_1cd7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1568_c11_a577
BIN_OP_EQ_uxn_opcodes_h_l1568_c11_a577 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1568_c11_a577_left,
BIN_OP_EQ_uxn_opcodes_h_l1568_c11_a577_right,
BIN_OP_EQ_uxn_opcodes_h_l1568_c11_a577_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1568_c7_e96b
tmp16_MUX_uxn_opcodes_h_l1568_c7_e96b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1568_c7_e96b_cond,
tmp16_MUX_uxn_opcodes_h_l1568_c7_e96b_iftrue,
tmp16_MUX_uxn_opcodes_h_l1568_c7_e96b_iffalse,
tmp16_MUX_uxn_opcodes_h_l1568_c7_e96b_return_output);

-- t8_MUX_uxn_opcodes_h_l1568_c7_e96b
t8_MUX_uxn_opcodes_h_l1568_c7_e96b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1568_c7_e96b_cond,
t8_MUX_uxn_opcodes_h_l1568_c7_e96b_iftrue,
t8_MUX_uxn_opcodes_h_l1568_c7_e96b_iffalse,
t8_MUX_uxn_opcodes_h_l1568_c7_e96b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_e96b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_e96b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_e96b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_e96b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_e96b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_e96b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_e96b
result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_e96b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_e96b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_e96b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_e96b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_e96b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_e96b
result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_e96b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_e96b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_e96b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_e96b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_e96b_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1568_c7_e96b
result_u16_value_MUX_uxn_opcodes_h_l1568_c7_e96b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1568_c7_e96b_cond,
result_u16_value_MUX_uxn_opcodes_h_l1568_c7_e96b_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1568_c7_e96b_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1568_c7_e96b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_e96b
result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_e96b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_e96b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_e96b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_e96b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_e96b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_e96b
result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_e96b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_e96b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_e96b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_e96b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_e96b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1568_c7_e96b
result_u8_value_MUX_uxn_opcodes_h_l1568_c7_e96b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1568_c7_e96b_cond,
result_u8_value_MUX_uxn_opcodes_h_l1568_c7_e96b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1568_c7_e96b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1568_c7_e96b_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1571_c30_1951
sp_relative_shift_uxn_opcodes_h_l1571_c30_1951 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1571_c30_1951_ins,
sp_relative_shift_uxn_opcodes_h_l1571_c30_1951_x,
sp_relative_shift_uxn_opcodes_h_l1571_c30_1951_y,
sp_relative_shift_uxn_opcodes_h_l1571_c30_1951_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1572_c22_ad32
BIN_OP_PLUS_uxn_opcodes_h_l1572_c22_ad32 : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1572_c22_ad32_left,
BIN_OP_PLUS_uxn_opcodes_h_l1572_c22_ad32_right,
BIN_OP_PLUS_uxn_opcodes_h_l1572_c22_ad32_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1574_c11_3663
BIN_OP_EQ_uxn_opcodes_h_l1574_c11_3663 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1574_c11_3663_left,
BIN_OP_EQ_uxn_opcodes_h_l1574_c11_3663_right,
BIN_OP_EQ_uxn_opcodes_h_l1574_c11_3663_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1574_c7_621e
tmp16_MUX_uxn_opcodes_h_l1574_c7_621e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1574_c7_621e_cond,
tmp16_MUX_uxn_opcodes_h_l1574_c7_621e_iftrue,
tmp16_MUX_uxn_opcodes_h_l1574_c7_621e_iffalse,
tmp16_MUX_uxn_opcodes_h_l1574_c7_621e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_621e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_621e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_621e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_621e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_621e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_621e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_621e
result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_621e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_621e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_621e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_621e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_621e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_621e
result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_621e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_621e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_621e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_621e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_621e_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1574_c7_621e
result_u16_value_MUX_uxn_opcodes_h_l1574_c7_621e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1574_c7_621e_cond,
result_u16_value_MUX_uxn_opcodes_h_l1574_c7_621e_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1574_c7_621e_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1574_c7_621e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_621e
result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_621e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_621e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_621e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_621e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_621e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1574_c7_621e
result_u8_value_MUX_uxn_opcodes_h_l1574_c7_621e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1574_c7_621e_cond,
result_u8_value_MUX_uxn_opcodes_h_l1574_c7_621e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1574_c7_621e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1574_c7_621e_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_330c
BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_330c : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_330c_left,
BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_330c_right,
BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_330c_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_3770
BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_3770 : entity work.BIN_OP_PLUS_int18_t_int2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_3770_left,
BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_3770_right,
BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_3770_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1578_c11_e71a
BIN_OP_EQ_uxn_opcodes_h_l1578_c11_e71a : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1578_c11_e71a_left,
BIN_OP_EQ_uxn_opcodes_h_l1578_c11_e71a_right,
BIN_OP_EQ_uxn_opcodes_h_l1578_c11_e71a_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1578_c7_394f
tmp16_MUX_uxn_opcodes_h_l1578_c7_394f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1578_c7_394f_cond,
tmp16_MUX_uxn_opcodes_h_l1578_c7_394f_iftrue,
tmp16_MUX_uxn_opcodes_h_l1578_c7_394f_iffalse,
tmp16_MUX_uxn_opcodes_h_l1578_c7_394f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_394f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_394f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_394f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_394f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_394f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_394f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_394f
result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_394f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_394f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_394f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_394f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_394f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_394f
result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_394f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_394f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_394f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_394f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_394f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1578_c7_394f
result_u8_value_MUX_uxn_opcodes_h_l1578_c7_394f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1578_c7_394f_cond,
result_u8_value_MUX_uxn_opcodes_h_l1578_c7_394f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1578_c7_394f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1578_c7_394f_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1580_c3_248d
CONST_SL_8_uxn_opcodes_h_l1580_c3_248d : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1580_c3_248d_x,
CONST_SL_8_uxn_opcodes_h_l1580_c3_248d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1582_c11_827c
BIN_OP_EQ_uxn_opcodes_h_l1582_c11_827c : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1582_c11_827c_left,
BIN_OP_EQ_uxn_opcodes_h_l1582_c11_827c_right,
BIN_OP_EQ_uxn_opcodes_h_l1582_c11_827c_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1582_c7_5377
tmp16_MUX_uxn_opcodes_h_l1582_c7_5377 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1582_c7_5377_cond,
tmp16_MUX_uxn_opcodes_h_l1582_c7_5377_iftrue,
tmp16_MUX_uxn_opcodes_h_l1582_c7_5377_iffalse,
tmp16_MUX_uxn_opcodes_h_l1582_c7_5377_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_5377
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_5377 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_5377_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_5377_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_5377_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_5377_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_5377
result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_5377 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_5377_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_5377_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_5377_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_5377_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_5377
result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_5377 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_5377_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_5377_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_5377_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_5377_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1582_c7_5377
result_u8_value_MUX_uxn_opcodes_h_l1582_c7_5377 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1582_c7_5377_cond,
result_u8_value_MUX_uxn_opcodes_h_l1582_c7_5377_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1582_c7_5377_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1582_c7_5377_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1583_c3_8cc0
BIN_OP_OR_uxn_opcodes_h_l1583_c3_8cc0 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1583_c3_8cc0_left,
BIN_OP_OR_uxn_opcodes_h_l1583_c3_8cc0_right,
BIN_OP_OR_uxn_opcodes_h_l1583_c3_8cc0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1588_c11_dff9
BIN_OP_EQ_uxn_opcodes_h_l1588_c11_dff9 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1588_c11_dff9_left,
BIN_OP_EQ_uxn_opcodes_h_l1588_c11_dff9_right,
BIN_OP_EQ_uxn_opcodes_h_l1588_c11_dff9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1588_c7_dc4c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1588_c7_dc4c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1588_c7_dc4c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1588_c7_dc4c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1588_c7_dc4c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1588_c7_dc4c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1588_c7_dc4c
result_is_stack_write_MUX_uxn_opcodes_h_l1588_c7_dc4c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1588_c7_dc4c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1588_c7_dc4c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1588_c7_dc4c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1588_c7_dc4c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1588_c7_dc4c
result_is_opc_done_MUX_uxn_opcodes_h_l1588_c7_dc4c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1588_c7_dc4c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1588_c7_dc4c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1588_c7_dc4c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1588_c7_dc4c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1588_c7_dc4c
result_u8_value_MUX_uxn_opcodes_h_l1588_c7_dc4c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1588_c7_dc4c_cond,
result_u8_value_MUX_uxn_opcodes_h_l1588_c7_dc4c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1588_c7_dc4c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1588_c7_dc4c_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1590_c31_a1cb
CONST_SR_8_uxn_opcodes_h_l1590_c31_a1cb : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1590_c31_a1cb_x,
CONST_SR_8_uxn_opcodes_h_l1590_c31_a1cb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1592_c11_03f8
BIN_OP_EQ_uxn_opcodes_h_l1592_c11_03f8 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1592_c11_03f8_left,
BIN_OP_EQ_uxn_opcodes_h_l1592_c11_03f8_right,
BIN_OP_EQ_uxn_opcodes_h_l1592_c11_03f8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1592_c7_c1e1
result_is_stack_write_MUX_uxn_opcodes_h_l1592_c7_c1e1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1592_c7_c1e1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1592_c7_c1e1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1592_c7_c1e1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1592_c7_c1e1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1592_c7_c1e1
result_is_opc_done_MUX_uxn_opcodes_h_l1592_c7_c1e1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1592_c7_c1e1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1592_c7_c1e1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1592_c7_c1e1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1592_c7_c1e1_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1560_c6_4b54_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1560_c1_a6bc_return_output,
 tmp16_MUX_uxn_opcodes_h_l1560_c2_e7d5_return_output,
 t8_MUX_uxn_opcodes_h_l1560_c2_e7d5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c2_e7d5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1560_c2_e7d5_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c2_e7d5_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1560_c2_e7d5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c2_e7d5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1560_c2_e7d5_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1560_c2_e7d5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1565_c11_fdde_return_output,
 tmp16_MUX_uxn_opcodes_h_l1565_c7_1cd7_return_output,
 t8_MUX_uxn_opcodes_h_l1565_c7_1cd7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1565_c7_1cd7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1565_c7_1cd7_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1565_c7_1cd7_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1565_c7_1cd7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1565_c7_1cd7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1565_c7_1cd7_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1565_c7_1cd7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1568_c11_a577_return_output,
 tmp16_MUX_uxn_opcodes_h_l1568_c7_e96b_return_output,
 t8_MUX_uxn_opcodes_h_l1568_c7_e96b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_e96b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_e96b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_e96b_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1568_c7_e96b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_e96b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_e96b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1568_c7_e96b_return_output,
 sp_relative_shift_uxn_opcodes_h_l1571_c30_1951_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1572_c22_ad32_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1574_c11_3663_return_output,
 tmp16_MUX_uxn_opcodes_h_l1574_c7_621e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_621e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_621e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_621e_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1574_c7_621e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_621e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1574_c7_621e_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_330c_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_3770_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1578_c11_e71a_return_output,
 tmp16_MUX_uxn_opcodes_h_l1578_c7_394f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_394f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_394f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_394f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1578_c7_394f_return_output,
 CONST_SL_8_uxn_opcodes_h_l1580_c3_248d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1582_c11_827c_return_output,
 tmp16_MUX_uxn_opcodes_h_l1582_c7_5377_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_5377_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_5377_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_5377_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1582_c7_5377_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1583_c3_8cc0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1588_c11_dff9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1588_c7_dc4c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1588_c7_dc4c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1588_c7_dc4c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1588_c7_dc4c_return_output,
 CONST_SR_8_uxn_opcodes_h_l1590_c31_a1cb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1592_c11_03f8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1592_c7_c1e1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1592_c7_c1e1_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c6_4b54_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c6_4b54_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c6_4b54_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1560_c1_a6bc_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1560_c1_a6bc_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1560_c1_a6bc_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1560_c1_a6bc_iffalse : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1560_c2_e7d5_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1560_c2_e7d5_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1565_c7_1cd7_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1560_c2_e7d5_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1560_c2_e7d5_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1560_c2_e7d5_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1560_c2_e7d5_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1565_c7_1cd7_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1560_c2_e7d5_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1560_c2_e7d5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c2_e7d5_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1562_c3_6953 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c2_e7d5_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1565_c7_1cd7_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c2_e7d5_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c2_e7d5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1560_c2_e7d5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1560_c2_e7d5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1565_c7_1cd7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1560_c2_e7d5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1560_c2_e7d5_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c2_e7d5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c2_e7d5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1565_c7_1cd7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c2_e7d5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c2_e7d5_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1560_c2_e7d5_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1560_c2_e7d5_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1565_c7_1cd7_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1560_c2_e7d5_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1560_c2_e7d5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c2_e7d5_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c2_e7d5_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1565_c7_1cd7_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c2_e7d5_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c2_e7d5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1560_c2_e7d5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1560_c2_e7d5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1565_c7_1cd7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1560_c2_e7d5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1560_c2_e7d5_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1560_c2_e7d5_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1560_c2_e7d5_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1565_c7_1cd7_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1560_c2_e7d5_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1560_c2_e7d5_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1561_c3_382f_uxn_opcodes_h_l1561_c3_382f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1565_c11_fdde_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1565_c11_fdde_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1565_c11_fdde_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1565_c7_1cd7_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1565_c7_1cd7_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1568_c7_e96b_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1565_c7_1cd7_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1565_c7_1cd7_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1565_c7_1cd7_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1568_c7_e96b_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1565_c7_1cd7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1565_c7_1cd7_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1566_c3_1d4f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1565_c7_1cd7_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_e96b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1565_c7_1cd7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1565_c7_1cd7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1565_c7_1cd7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_e96b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1565_c7_1cd7_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1565_c7_1cd7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1565_c7_1cd7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_e96b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1565_c7_1cd7_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1565_c7_1cd7_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1565_c7_1cd7_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1568_c7_e96b_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1565_c7_1cd7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1565_c7_1cd7_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1565_c7_1cd7_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_e96b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1565_c7_1cd7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1565_c7_1cd7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1565_c7_1cd7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_e96b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1565_c7_1cd7_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1565_c7_1cd7_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1565_c7_1cd7_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1568_c7_e96b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1565_c7_1cd7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1568_c11_a577_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1568_c11_a577_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1568_c11_a577_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1568_c7_e96b_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1568_c7_e96b_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1574_c7_621e_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1568_c7_e96b_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1568_c7_e96b_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1568_c7_e96b_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1568_c7_e96b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_e96b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_e96b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_621e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_e96b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_e96b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_e96b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_621e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_e96b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_e96b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_e96b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_621e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_e96b_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1568_c7_e96b_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l1572_c3_ebde : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1568_c7_e96b_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1574_c7_621e_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1568_c7_e96b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_e96b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_e96b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_e96b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_e96b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_e96b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_621e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_e96b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1568_c7_e96b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1568_c7_e96b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1574_c7_621e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1568_c7_e96b_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1571_c30_1951_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1571_c30_1951_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1571_c30_1951_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1571_c30_1951_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1572_c22_ad32_left : signed(16 downto 0);
 variable VAR_CAST_TO_int8_t_uxn_opcodes_h_l1572_c27_7848_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1572_c22_ad32_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1572_c22_ad32_return_output : signed(17 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_3663_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_3663_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_3663_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1574_c7_621e_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1574_c7_621e_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1578_c7_394f_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1574_c7_621e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_621e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_621e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_394f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_621e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_621e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_621e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_394f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_621e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_621e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_621e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_621e_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1574_c7_621e_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l1576_c3_f0ac : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1574_c7_621e_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1574_c7_621e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_621e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_621e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_394f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_621e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1574_c7_621e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1574_c7_621e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1578_c7_394f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1574_c7_621e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_330c_left : signed(16 downto 0);
 variable VAR_CAST_TO_int8_t_uxn_opcodes_h_l1576_c27_1c76_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_330c_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_330c_return_output : signed(17 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_3770_left : signed(17 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_3770_right : signed(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_3770_return_output : signed(18 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_e71a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_e71a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_e71a_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1578_c7_394f_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1578_c7_394f_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1582_c7_5377_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1578_c7_394f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_394f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_394f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_5377_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_394f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_394f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_394f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_5377_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_394f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_394f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_394f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_5377_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_394f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1578_c7_394f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1578_c7_394f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1582_c7_5377_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1578_c7_394f_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1580_c3_248d_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1580_c3_248d_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1582_c11_827c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1582_c11_827c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1582_c11_827c_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1582_c7_5377_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1582_c7_5377_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1582_c7_5377_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_5377_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1585_c3_c29f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_5377_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1588_c7_dc4c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_5377_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_5377_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_5377_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1588_c7_dc4c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_5377_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_5377_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_5377_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1588_c7_dc4c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_5377_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1582_c7_5377_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1582_c7_5377_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1588_c7_dc4c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1582_c7_5377_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1583_c3_8cc0_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1583_c3_8cc0_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1583_c3_8cc0_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1586_c21_7ddc_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1588_c11_dff9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1588_c11_dff9_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1588_c11_dff9_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1588_c7_dc4c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1589_c3_c984 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1588_c7_dc4c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1588_c7_dc4c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1588_c7_dc4c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1588_c7_dc4c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1592_c7_c1e1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1588_c7_dc4c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1588_c7_dc4c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1588_c7_dc4c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1592_c7_c1e1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1588_c7_dc4c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1588_c7_dc4c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1588_c7_dc4c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1588_c7_dc4c_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1590_c31_a1cb_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1590_c31_a1cb_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1590_c21_b0ea_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1592_c11_03f8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1592_c11_03f8_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1592_c11_03f8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1592_c7_c1e1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1592_c7_c1e1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1592_c7_c1e1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1592_c7_c1e1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1592_c7_c1e1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1592_c7_c1e1_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1574_l1568_l1565_l1592_l1560_l1588_l1578_DUPLICATE_f36d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1560_l1574_l1565_DUPLICATE_453d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1560_l1574_l1565_DUPLICATE_f3af_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1560_l1565_l1568_DUPLICATE_db6a_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1574_l1568_l1565_l1560_l1588_l1578_DUPLICATE_44b7_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1574_l1568_l1565_l1592_l1588_l1582_l1578_DUPLICATE_59d1_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1574_l1588_l1578_l1568_DUPLICATE_95ed_return_output : unsigned(3 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1579_l1583_DUPLICATE_8927_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5517_uxn_opcodes_h_l1597_l1555_DUPLICATE_5c42_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_3663_right := to_unsigned(3, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_e96b_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1562_c3_6953 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c2_e7d5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1562_c3_6953;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1560_c1_a6bc_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1585_c3_c29f := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_5377_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1585_c3_c29f;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c6_4b54_right := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1592_c7_c1e1_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1568_c11_a577_right := to_unsigned(2, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_5377_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1571_c30_1951_x := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1592_c11_03f8_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_e71a_right := to_unsigned(4, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l1571_c30_1951_y := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_3770_right := signed(std_logic_vector(resize(to_unsigned(1, 1), 2)));
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_621e_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1566_c3_1d4f := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1565_c7_1cd7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1566_c3_1d4f;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1565_c11_fdde_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1589_c3_c984 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1588_c7_dc4c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1589_c3_c984;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1582_c11_827c_right := to_unsigned(5, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1592_c7_c1e1_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1560_c2_e7d5_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1588_c11_dff9_right := to_unsigned(6, 3);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1560_c1_a6bc_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l1571_c30_1951_ins := VAR_ins;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1572_c22_ad32_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_330c_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c6_4b54_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1565_c11_fdde_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1568_c11_a577_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_3663_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_e71a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1582_c11_827c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1588_c11_dff9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1592_c11_03f8_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l1568_c7_e96b_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1560_c2_e7d5_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1565_c7_1cd7_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1568_c7_e96b_iffalse := t8;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1583_c3_8cc0_left := tmp16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1590_c31_a1cb_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1560_c2_e7d5_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1565_c7_1cd7_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1568_c7_e96b_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1574_c7_621e_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1582_c7_5377_iffalse := tmp16;
     -- CAST_TO_int8_t[uxn_opcodes_h_l1572_c27_7848] LATENCY=0
     VAR_CAST_TO_int8_t_uxn_opcodes_h_l1572_c27_7848_return_output := CAST_TO_int8_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1568_c11_a577] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1568_c11_a577_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1568_c11_a577_left;
     BIN_OP_EQ_uxn_opcodes_h_l1568_c11_a577_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1568_c11_a577_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1568_c11_a577_return_output := BIN_OP_EQ_uxn_opcodes_h_l1568_c11_a577_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1579_l1583_DUPLICATE_8927 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1579_l1583_DUPLICATE_8927_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1560_l1565_l1568_DUPLICATE_db6a LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1560_l1565_l1568_DUPLICATE_db6a_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1574_l1568_l1565_l1592_l1588_l1582_l1578_DUPLICATE_59d1 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1574_l1568_l1565_l1592_l1588_l1582_l1578_DUPLICATE_59d1_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1582_c11_827c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1582_c11_827c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1582_c11_827c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1582_c11_827c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1582_c11_827c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1582_c11_827c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1582_c11_827c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1588_c11_dff9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1588_c11_dff9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1588_c11_dff9_left;
     BIN_OP_EQ_uxn_opcodes_h_l1588_c11_dff9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1588_c11_dff9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1588_c11_dff9_return_output := BIN_OP_EQ_uxn_opcodes_h_l1588_c11_dff9_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l1571_c30_1951] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1571_c30_1951_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1571_c30_1951_ins;
     sp_relative_shift_uxn_opcodes_h_l1571_c30_1951_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1571_c30_1951_x;
     sp_relative_shift_uxn_opcodes_h_l1571_c30_1951_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1571_c30_1951_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1571_c30_1951_return_output := sp_relative_shift_uxn_opcodes_h_l1571_c30_1951_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1574_l1568_l1565_l1592_l1560_l1588_l1578_DUPLICATE_f36d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1574_l1568_l1565_l1592_l1560_l1588_l1578_DUPLICATE_f36d_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1560_c6_4b54] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1560_c6_4b54_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c6_4b54_left;
     BIN_OP_EQ_uxn_opcodes_h_l1560_c6_4b54_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c6_4b54_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c6_4b54_return_output := BIN_OP_EQ_uxn_opcodes_h_l1560_c6_4b54_return_output;

     -- CAST_TO_int8_t[uxn_opcodes_h_l1576_c27_1c76] LATENCY=0
     VAR_CAST_TO_int8_t_uxn_opcodes_h_l1576_c27_1c76_return_output := CAST_TO_int8_t_uint8_t(
     t8);

     -- BIN_OP_EQ[uxn_opcodes_h_l1592_c11_03f8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1592_c11_03f8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1592_c11_03f8_left;
     BIN_OP_EQ_uxn_opcodes_h_l1592_c11_03f8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1592_c11_03f8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1592_c11_03f8_return_output := BIN_OP_EQ_uxn_opcodes_h_l1592_c11_03f8_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1560_l1574_l1565_DUPLICATE_f3af LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1560_l1574_l1565_DUPLICATE_f3af_return_output := result.u16_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1578_c11_e71a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1578_c11_e71a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_e71a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1578_c11_e71a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_e71a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_e71a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1578_c11_e71a_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1574_l1568_l1565_l1560_l1588_l1578_DUPLICATE_44b7 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1574_l1568_l1565_l1560_l1588_l1578_DUPLICATE_44b7_return_output := result.u8_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1560_l1574_l1565_DUPLICATE_453d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1560_l1574_l1565_DUPLICATE_453d_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1574_l1588_l1578_l1568_DUPLICATE_95ed LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1574_l1588_l1578_l1568_DUPLICATE_95ed_return_output := result.stack_address_sp_offset;

     -- CONST_SR_8[uxn_opcodes_h_l1590_c31_a1cb] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1590_c31_a1cb_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1590_c31_a1cb_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1590_c31_a1cb_return_output := CONST_SR_8_uxn_opcodes_h_l1590_c31_a1cb_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1565_c11_fdde] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1565_c11_fdde_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1565_c11_fdde_left;
     BIN_OP_EQ_uxn_opcodes_h_l1565_c11_fdde_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1565_c11_fdde_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1565_c11_fdde_return_output := BIN_OP_EQ_uxn_opcodes_h_l1565_c11_fdde_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1574_c11_3663] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1574_c11_3663_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_3663_left;
     BIN_OP_EQ_uxn_opcodes_h_l1574_c11_3663_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_3663_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_3663_return_output := BIN_OP_EQ_uxn_opcodes_h_l1574_c11_3663_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1560_c1_a6bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c6_4b54_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1560_c2_e7d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c6_4b54_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c2_e7d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c6_4b54_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1560_c2_e7d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c6_4b54_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c2_e7d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c6_4b54_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c2_e7d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c6_4b54_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1560_c2_e7d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c6_4b54_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1560_c2_e7d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c6_4b54_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1560_c2_e7d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c6_4b54_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1560_c2_e7d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1560_c6_4b54_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1565_c7_1cd7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1565_c11_fdde_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1565_c7_1cd7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1565_c11_fdde_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1565_c7_1cd7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1565_c11_fdde_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1565_c7_1cd7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1565_c11_fdde_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1565_c7_1cd7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1565_c11_fdde_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1565_c7_1cd7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1565_c11_fdde_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1565_c7_1cd7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1565_c11_fdde_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1565_c7_1cd7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1565_c11_fdde_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1565_c7_1cd7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1565_c11_fdde_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_e96b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1568_c11_a577_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_e96b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1568_c11_a577_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_e96b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1568_c11_a577_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_e96b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1568_c11_a577_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_e96b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1568_c11_a577_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1568_c7_e96b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1568_c11_a577_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1568_c7_e96b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1568_c11_a577_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1568_c7_e96b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1568_c11_a577_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1568_c7_e96b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1568_c11_a577_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_621e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_3663_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_621e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_3663_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_621e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_3663_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_621e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_3663_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1574_c7_621e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_3663_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1574_c7_621e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_3663_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1574_c7_621e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1574_c11_3663_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_394f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_e71a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_394f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_e71a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_394f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_e71a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1578_c7_394f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_e71a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1578_c7_394f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1578_c11_e71a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_5377_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1582_c11_827c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_5377_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1582_c11_827c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_5377_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1582_c11_827c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1582_c7_5377_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1582_c11_827c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1582_c7_5377_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1582_c11_827c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1588_c7_dc4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1588_c11_dff9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1588_c7_dc4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1588_c11_dff9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1588_c7_dc4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1588_c11_dff9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1588_c7_dc4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1588_c11_dff9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1592_c7_c1e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1592_c11_03f8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1592_c7_c1e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1592_c11_03f8_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1572_c22_ad32_right := VAR_CAST_TO_int8_t_uxn_opcodes_h_l1572_c27_7848_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_330c_right := VAR_CAST_TO_int8_t_uxn_opcodes_h_l1576_c27_1c76_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1583_c3_8cc0_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1579_l1583_DUPLICATE_8927_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1580_c3_248d_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1579_l1583_DUPLICATE_8927_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c2_e7d5_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1560_l1565_l1568_DUPLICATE_db6a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1565_c7_1cd7_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1560_l1565_l1568_DUPLICATE_db6a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_e96b_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1560_l1565_l1568_DUPLICATE_db6a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1560_c2_e7d5_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1560_l1574_l1565_DUPLICATE_f3af_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1565_c7_1cd7_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1560_l1574_l1565_DUPLICATE_f3af_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1574_c7_621e_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1560_l1574_l1565_DUPLICATE_f3af_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1565_c7_1cd7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1574_l1568_l1565_l1592_l1588_l1582_l1578_DUPLICATE_59d1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_e96b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1574_l1568_l1565_l1592_l1588_l1582_l1578_DUPLICATE_59d1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_621e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1574_l1568_l1565_l1592_l1588_l1582_l1578_DUPLICATE_59d1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_394f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1574_l1568_l1565_l1592_l1588_l1582_l1578_DUPLICATE_59d1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_5377_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1574_l1568_l1565_l1592_l1588_l1582_l1578_DUPLICATE_59d1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1588_c7_dc4c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1574_l1568_l1565_l1592_l1588_l1582_l1578_DUPLICATE_59d1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1592_c7_c1e1_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1574_l1568_l1565_l1592_l1588_l1582_l1578_DUPLICATE_59d1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c2_e7d5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1560_l1574_l1565_DUPLICATE_453d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1565_c7_1cd7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1560_l1574_l1565_DUPLICATE_453d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_621e_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1560_l1574_l1565_DUPLICATE_453d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1560_c2_e7d5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1574_l1568_l1565_l1592_l1560_l1588_l1578_DUPLICATE_f36d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1565_c7_1cd7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1574_l1568_l1565_l1592_l1560_l1588_l1578_DUPLICATE_f36d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_e96b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1574_l1568_l1565_l1592_l1560_l1588_l1578_DUPLICATE_f36d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_621e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1574_l1568_l1565_l1592_l1560_l1588_l1578_DUPLICATE_f36d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_394f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1574_l1568_l1565_l1592_l1560_l1588_l1578_DUPLICATE_f36d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1588_c7_dc4c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1574_l1568_l1565_l1592_l1560_l1588_l1578_DUPLICATE_f36d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1592_c7_c1e1_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1574_l1568_l1565_l1592_l1560_l1588_l1578_DUPLICATE_f36d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_e96b_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1574_l1588_l1578_l1568_DUPLICATE_95ed_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_621e_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1574_l1588_l1578_l1568_DUPLICATE_95ed_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_394f_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1574_l1588_l1578_l1568_DUPLICATE_95ed_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1588_c7_dc4c_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1574_l1588_l1578_l1568_DUPLICATE_95ed_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1560_c2_e7d5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1574_l1568_l1565_l1560_l1588_l1578_DUPLICATE_44b7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1565_c7_1cd7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1574_l1568_l1565_l1560_l1588_l1578_DUPLICATE_44b7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1568_c7_e96b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1574_l1568_l1565_l1560_l1588_l1578_DUPLICATE_44b7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1574_c7_621e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1574_l1568_l1565_l1560_l1588_l1578_DUPLICATE_44b7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1578_c7_394f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1574_l1568_l1565_l1560_l1588_l1578_DUPLICATE_44b7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1588_c7_dc4c_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1574_l1568_l1565_l1560_l1588_l1578_DUPLICATE_44b7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_e96b_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1571_c30_1951_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1592_c7_c1e1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1592_c7_c1e1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1592_c7_c1e1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1592_c7_c1e1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1592_c7_c1e1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1592_c7_c1e1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1592_c7_c1e1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1592_c7_c1e1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1592_c7_c1e1_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1590_c21_b0ea] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1590_c21_b0ea_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1590_c31_a1cb_return_output);

     -- CONST_SL_8[uxn_opcodes_h_l1580_c3_248d] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1580_c3_248d_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1580_c3_248d_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1580_c3_248d_return_output := CONST_SL_8_uxn_opcodes_h_l1580_c3_248d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1574_c7_621e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_621e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_621e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_621e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_621e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_621e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_621e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_621e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_621e_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1576_c22_330c] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_330c_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_330c_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_330c_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_330c_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_330c_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_330c_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1583_c3_8cc0] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1583_c3_8cc0_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1583_c3_8cc0_left;
     BIN_OP_OR_uxn_opcodes_h_l1583_c3_8cc0_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1583_c3_8cc0_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1583_c3_8cc0_return_output := BIN_OP_OR_uxn_opcodes_h_l1583_c3_8cc0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1592_c7_c1e1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1592_c7_c1e1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1592_c7_c1e1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1592_c7_c1e1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1592_c7_c1e1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1592_c7_c1e1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1592_c7_c1e1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1592_c7_c1e1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1592_c7_c1e1_return_output;

     -- t8_MUX[uxn_opcodes_h_l1568_c7_e96b] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1568_c7_e96b_cond <= VAR_t8_MUX_uxn_opcodes_h_l1568_c7_e96b_cond;
     t8_MUX_uxn_opcodes_h_l1568_c7_e96b_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1568_c7_e96b_iftrue;
     t8_MUX_uxn_opcodes_h_l1568_c7_e96b_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1568_c7_e96b_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1568_c7_e96b_return_output := t8_MUX_uxn_opcodes_h_l1568_c7_e96b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1568_c7_e96b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_e96b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_e96b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_e96b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_e96b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_e96b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_e96b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_e96b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_e96b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1588_c7_dc4c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1588_c7_dc4c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1588_c7_dc4c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1588_c7_dc4c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1588_c7_dc4c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1588_c7_dc4c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1588_c7_dc4c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1588_c7_dc4c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1588_c7_dc4c_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1572_c22_ad32] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1572_c22_ad32_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1572_c22_ad32_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1572_c22_ad32_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1572_c22_ad32_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1572_c22_ad32_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1572_c22_ad32_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1560_c1_a6bc] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1560_c1_a6bc_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1560_c1_a6bc_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1560_c1_a6bc_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1560_c1_a6bc_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1560_c1_a6bc_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1560_c1_a6bc_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1560_c1_a6bc_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1560_c1_a6bc_return_output;

     -- Submodule level 2
     VAR_tmp16_MUX_uxn_opcodes_h_l1582_c7_5377_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1583_c3_8cc0_return_output;
     VAR_result_u16_value_uxn_opcodes_h_l1572_c3_ebde := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1572_c22_ad32_return_output)),16);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_3770_left := VAR_BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_330c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1588_c7_dc4c_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1590_c21_b0ea_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1578_c7_394f_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1580_c3_248d_return_output;
     VAR_printf_uxn_opcodes_h_l1561_c3_382f_uxn_opcodes_h_l1561_c3_382f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1560_c1_a6bc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1588_c7_dc4c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1592_c7_c1e1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_e96b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1574_c7_621e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1588_c7_dc4c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1592_c7_c1e1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1565_c7_1cd7_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1568_c7_e96b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_5377_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1588_c7_dc4c_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1565_c7_1cd7_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1568_c7_e96b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1568_c7_e96b_iftrue := VAR_result_u16_value_uxn_opcodes_h_l1572_c3_ebde;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1565_c7_1cd7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1565_c7_1cd7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1565_c7_1cd7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1565_c7_1cd7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1565_c7_1cd7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1565_c7_1cd7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1565_c7_1cd7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1565_c7_1cd7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1565_c7_1cd7_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1568_c7_e96b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_e96b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_e96b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_e96b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_e96b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_e96b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_e96b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_e96b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_e96b_return_output;

     -- printf_uxn_opcodes_h_l1561_c3_382f[uxn_opcodes_h_l1561_c3_382f] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1561_c3_382f_uxn_opcodes_h_l1561_c3_382f_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1561_c3_382f_uxn_opcodes_h_l1561_c3_382f_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- tmp16_MUX[uxn_opcodes_h_l1582_c7_5377] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1582_c7_5377_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1582_c7_5377_cond;
     tmp16_MUX_uxn_opcodes_h_l1582_c7_5377_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1582_c7_5377_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1582_c7_5377_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1582_c7_5377_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1582_c7_5377_return_output := tmp16_MUX_uxn_opcodes_h_l1582_c7_5377_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1588_c7_dc4c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1588_c7_dc4c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1588_c7_dc4c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1588_c7_dc4c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1588_c7_dc4c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1588_c7_dc4c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1588_c7_dc4c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1588_c7_dc4c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1588_c7_dc4c_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1586_c21_7ddc] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1586_c21_7ddc_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_OR_uxn_opcodes_h_l1583_c3_8cc0_return_output);

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1582_c7_5377] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_5377_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_5377_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_5377_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_5377_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_5377_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_5377_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_5377_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_5377_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1588_c7_dc4c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1588_c7_dc4c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1588_c7_dc4c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1588_c7_dc4c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1588_c7_dc4c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1588_c7_dc4c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1588_c7_dc4c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1588_c7_dc4c_return_output := result_u8_value_MUX_uxn_opcodes_h_l1588_c7_dc4c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1588_c7_dc4c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1588_c7_dc4c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1588_c7_dc4c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1588_c7_dc4c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1588_c7_dc4c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1588_c7_dc4c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1588_c7_dc4c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1588_c7_dc4c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1588_c7_dc4c_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1576_c22_3770] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_3770_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_3770_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_3770_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_3770_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_3770_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_3770_return_output;

     -- t8_MUX[uxn_opcodes_h_l1565_c7_1cd7] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1565_c7_1cd7_cond <= VAR_t8_MUX_uxn_opcodes_h_l1565_c7_1cd7_cond;
     t8_MUX_uxn_opcodes_h_l1565_c7_1cd7_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1565_c7_1cd7_iftrue;
     t8_MUX_uxn_opcodes_h_l1565_c7_1cd7_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1565_c7_1cd7_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1565_c7_1cd7_return_output := t8_MUX_uxn_opcodes_h_l1565_c7_1cd7_return_output;

     -- Submodule level 3
     VAR_result_u16_value_uxn_opcodes_h_l1576_c3_f0ac := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1576_c22_3770_return_output)),16);
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1582_c7_5377_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1586_c21_7ddc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_5377_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1588_c7_dc4c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1565_c7_1cd7_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1568_c7_e96b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_5377_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1588_c7_dc4c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c2_e7d5_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1565_c7_1cd7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_394f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1582_c7_5377_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1582_c7_5377_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1588_c7_dc4c_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1560_c2_e7d5_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1565_c7_1cd7_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1578_c7_394f_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1582_c7_5377_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1574_c7_621e_iftrue := VAR_result_u16_value_uxn_opcodes_h_l1576_c3_f0ac;
     -- t8_MUX[uxn_opcodes_h_l1560_c2_e7d5] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1560_c2_e7d5_cond <= VAR_t8_MUX_uxn_opcodes_h_l1560_c2_e7d5_cond;
     t8_MUX_uxn_opcodes_h_l1560_c2_e7d5_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1560_c2_e7d5_iftrue;
     t8_MUX_uxn_opcodes_h_l1560_c2_e7d5_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1560_c2_e7d5_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1560_c2_e7d5_return_output := t8_MUX_uxn_opcodes_h_l1560_c2_e7d5_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1565_c7_1cd7] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1565_c7_1cd7_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1565_c7_1cd7_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1565_c7_1cd7_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1565_c7_1cd7_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1565_c7_1cd7_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1565_c7_1cd7_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1565_c7_1cd7_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1565_c7_1cd7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1582_c7_5377] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_5377_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_5377_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_5377_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_5377_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_5377_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_5377_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_5377_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_5377_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1578_c7_394f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_394f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_394f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_394f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_394f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_394f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_394f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_394f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_394f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1582_c7_5377] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_5377_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_5377_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_5377_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_5377_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_5377_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_5377_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_5377_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_5377_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1582_c7_5377] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1582_c7_5377_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1582_c7_5377_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1582_c7_5377_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1582_c7_5377_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1582_c7_5377_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1582_c7_5377_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1582_c7_5377_return_output := result_u8_value_MUX_uxn_opcodes_h_l1582_c7_5377_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1574_c7_621e] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1574_c7_621e_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1574_c7_621e_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1574_c7_621e_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1574_c7_621e_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1574_c7_621e_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1574_c7_621e_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1574_c7_621e_return_output := result_u16_value_MUX_uxn_opcodes_h_l1574_c7_621e_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1578_c7_394f] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1578_c7_394f_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1578_c7_394f_cond;
     tmp16_MUX_uxn_opcodes_h_l1578_c7_394f_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1578_c7_394f_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1578_c7_394f_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1578_c7_394f_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1578_c7_394f_return_output := tmp16_MUX_uxn_opcodes_h_l1578_c7_394f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1560_c2_e7d5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c2_e7d5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c2_e7d5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c2_e7d5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c2_e7d5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c2_e7d5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c2_e7d5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c2_e7d5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c2_e7d5_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_394f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1582_c7_5377_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c2_e7d5_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1565_c7_1cd7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_394f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1582_c7_5377_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_621e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1578_c7_394f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1568_c7_e96b_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1574_c7_621e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1578_c7_394f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1582_c7_5377_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1560_c2_e7d5_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1574_c7_621e_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1578_c7_394f_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1560_c2_e7d5] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c2_e7d5_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c2_e7d5_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c2_e7d5_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c2_e7d5_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c2_e7d5_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c2_e7d5_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c2_e7d5_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c2_e7d5_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1578_c7_394f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1578_c7_394f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1578_c7_394f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1578_c7_394f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1578_c7_394f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1578_c7_394f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1578_c7_394f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1578_c7_394f_return_output := result_u8_value_MUX_uxn_opcodes_h_l1578_c7_394f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1574_c7_621e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_621e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_621e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_621e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_621e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_621e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_621e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_621e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_621e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1578_c7_394f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_394f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_394f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_394f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_394f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_394f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_394f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_394f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_394f_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1568_c7_e96b] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1568_c7_e96b_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1568_c7_e96b_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1568_c7_e96b_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1568_c7_e96b_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1568_c7_e96b_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1568_c7_e96b_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1568_c7_e96b_return_output := result_u16_value_MUX_uxn_opcodes_h_l1568_c7_e96b_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1574_c7_621e] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1574_c7_621e_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1574_c7_621e_cond;
     tmp16_MUX_uxn_opcodes_h_l1574_c7_621e_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1574_c7_621e_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1574_c7_621e_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1574_c7_621e_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1574_c7_621e_return_output := tmp16_MUX_uxn_opcodes_h_l1574_c7_621e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1578_c7_394f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_394f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_394f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_394f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_394f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_394f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_394f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_394f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_394f_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_621e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1578_c7_394f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_621e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1578_c7_394f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_e96b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1574_c7_621e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1565_c7_1cd7_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1568_c7_e96b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1574_c7_621e_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1578_c7_394f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1568_c7_e96b_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1574_c7_621e_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1574_c7_621e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_621e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_621e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_621e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_621e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_621e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_621e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_621e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_621e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1568_c7_e96b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_e96b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_e96b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_e96b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_e96b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_e96b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_e96b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_e96b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_e96b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1574_c7_621e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_621e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_621e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_621e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_621e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_621e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_621e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_621e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_621e_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1574_c7_621e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1574_c7_621e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1574_c7_621e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1574_c7_621e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1574_c7_621e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1574_c7_621e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1574_c7_621e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1574_c7_621e_return_output := result_u8_value_MUX_uxn_opcodes_h_l1574_c7_621e_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1565_c7_1cd7] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1565_c7_1cd7_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1565_c7_1cd7_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1565_c7_1cd7_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1565_c7_1cd7_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1565_c7_1cd7_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1565_c7_1cd7_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1565_c7_1cd7_return_output := result_u16_value_MUX_uxn_opcodes_h_l1565_c7_1cd7_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1568_c7_e96b] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1568_c7_e96b_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1568_c7_e96b_cond;
     tmp16_MUX_uxn_opcodes_h_l1568_c7_e96b_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1568_c7_e96b_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1568_c7_e96b_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1568_c7_e96b_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1568_c7_e96b_return_output := tmp16_MUX_uxn_opcodes_h_l1568_c7_e96b_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_e96b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1574_c7_621e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_e96b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1574_c7_621e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1565_c7_1cd7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1568_c7_e96b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1560_c2_e7d5_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1565_c7_1cd7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1568_c7_e96b_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1574_c7_621e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1565_c7_1cd7_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1568_c7_e96b_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1565_c7_1cd7] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1565_c7_1cd7_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1565_c7_1cd7_cond;
     tmp16_MUX_uxn_opcodes_h_l1565_c7_1cd7_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1565_c7_1cd7_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1565_c7_1cd7_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1565_c7_1cd7_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1565_c7_1cd7_return_output := tmp16_MUX_uxn_opcodes_h_l1565_c7_1cd7_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1568_c7_e96b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1568_c7_e96b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1568_c7_e96b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1568_c7_e96b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1568_c7_e96b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1568_c7_e96b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1568_c7_e96b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1568_c7_e96b_return_output := result_u8_value_MUX_uxn_opcodes_h_l1568_c7_e96b_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1560_c2_e7d5] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1560_c2_e7d5_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1560_c2_e7d5_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1560_c2_e7d5_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1560_c2_e7d5_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1560_c2_e7d5_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1560_c2_e7d5_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1560_c2_e7d5_return_output := result_u16_value_MUX_uxn_opcodes_h_l1560_c2_e7d5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1568_c7_e96b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_e96b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_e96b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_e96b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_e96b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_e96b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_e96b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_e96b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_e96b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1568_c7_e96b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_e96b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_e96b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_e96b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_e96b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_e96b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_e96b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_e96b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_e96b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1565_c7_1cd7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1565_c7_1cd7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1565_c7_1cd7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1565_c7_1cd7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1565_c7_1cd7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1565_c7_1cd7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1565_c7_1cd7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1565_c7_1cd7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1565_c7_1cd7_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1565_c7_1cd7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_e96b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1565_c7_1cd7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_e96b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c2_e7d5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1565_c7_1cd7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1565_c7_1cd7_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1568_c7_e96b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1560_c2_e7d5_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1565_c7_1cd7_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1560_c2_e7d5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c2_e7d5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c2_e7d5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c2_e7d5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c2_e7d5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c2_e7d5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c2_e7d5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c2_e7d5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c2_e7d5_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1560_c2_e7d5] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1560_c2_e7d5_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1560_c2_e7d5_cond;
     tmp16_MUX_uxn_opcodes_h_l1560_c2_e7d5_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1560_c2_e7d5_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1560_c2_e7d5_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1560_c2_e7d5_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1560_c2_e7d5_return_output := tmp16_MUX_uxn_opcodes_h_l1560_c2_e7d5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1565_c7_1cd7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1565_c7_1cd7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1565_c7_1cd7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1565_c7_1cd7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1565_c7_1cd7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1565_c7_1cd7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1565_c7_1cd7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1565_c7_1cd7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1565_c7_1cd7_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1565_c7_1cd7] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1565_c7_1cd7_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1565_c7_1cd7_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1565_c7_1cd7_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1565_c7_1cd7_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1565_c7_1cd7_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1565_c7_1cd7_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1565_c7_1cd7_return_output := result_u8_value_MUX_uxn_opcodes_h_l1565_c7_1cd7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1565_c7_1cd7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1565_c7_1cd7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1565_c7_1cd7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1565_c7_1cd7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1565_c7_1cd7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1565_c7_1cd7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1565_c7_1cd7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1565_c7_1cd7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1565_c7_1cd7_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1560_c2_e7d5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1565_c7_1cd7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1560_c2_e7d5_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1565_c7_1cd7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1560_c2_e7d5_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1565_c7_1cd7_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l1560_c2_e7d5_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1560_c2_e7d5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1560_c2_e7d5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1560_c2_e7d5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1560_c2_e7d5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1560_c2_e7d5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1560_c2_e7d5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1560_c2_e7d5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1560_c2_e7d5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1560_c2_e7d5_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1560_c2_e7d5] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1560_c2_e7d5_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1560_c2_e7d5_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1560_c2_e7d5_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1560_c2_e7d5_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1560_c2_e7d5_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1560_c2_e7d5_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1560_c2_e7d5_return_output := result_u8_value_MUX_uxn_opcodes_h_l1560_c2_e7d5_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1560_c2_e7d5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1560_c2_e7d5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1560_c2_e7d5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1560_c2_e7d5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1560_c2_e7d5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1560_c2_e7d5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1560_c2_e7d5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1560_c2_e7d5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1560_c2_e7d5_return_output;

     -- Submodule level 9
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_5517_uxn_opcodes_h_l1597_l1555_DUPLICATE_5c42 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5517_uxn_opcodes_h_l1597_l1555_DUPLICATE_5c42_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_5517(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1560_c2_e7d5_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1560_c2_e7d5_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1560_c2_e7d5_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1560_c2_e7d5_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1560_c2_e7d5_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1560_c2_e7d5_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1560_c2_e7d5_return_output);

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5517_uxn_opcodes_h_l1597_l1555_DUPLICATE_5c42_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5517_uxn_opcodes_h_l1597_l1555_DUPLICATE_5c42_return_output;
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
