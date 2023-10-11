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
-- Submodules: 76
entity lda_0CLK_c26dda62 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end lda_0CLK_c26dda62;
architecture arch of lda_0CLK_c26dda62 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal tmp8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_tmp8 : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l1513_c6_3d07]
signal BIN_OP_EQ_uxn_opcodes_h_l1513_c6_3d07_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1513_c6_3d07_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1513_c6_3d07_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1513_c1_bf29]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1513_c1_bf29_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1513_c1_bf29_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1513_c1_bf29_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1513_c1_bf29_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1513_c2_c1f0]
signal tmp8_MUX_uxn_opcodes_h_l1513_c2_c1f0_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1513_c2_c1f0_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1513_c2_c1f0_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1513_c2_c1f0_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1513_c2_c1f0]
signal t16_MUX_uxn_opcodes_h_l1513_c2_c1f0_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1513_c2_c1f0_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1513_c2_c1f0_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1513_c2_c1f0_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1513_c2_c1f0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1513_c2_c1f0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1513_c2_c1f0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1513_c2_c1f0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1513_c2_c1f0_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1513_c2_c1f0]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1513_c2_c1f0_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1513_c2_c1f0_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1513_c2_c1f0_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1513_c2_c1f0_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1513_c2_c1f0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1513_c2_c1f0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1513_c2_c1f0_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1513_c2_c1f0_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1513_c2_c1f0_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1513_c2_c1f0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1513_c2_c1f0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1513_c2_c1f0_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1513_c2_c1f0_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1513_c2_c1f0_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1513_c2_c1f0]
signal result_stack_value_MUX_uxn_opcodes_h_l1513_c2_c1f0_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1513_c2_c1f0_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1513_c2_c1f0_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1513_c2_c1f0_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1513_c2_c1f0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1513_c2_c1f0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1513_c2_c1f0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1513_c2_c1f0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1513_c2_c1f0_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1513_c2_c1f0]
signal result_ram_addr_MUX_uxn_opcodes_h_l1513_c2_c1f0_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1513_c2_c1f0_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1513_c2_c1f0_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1513_c2_c1f0_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l1514_c3_ff1f[uxn_opcodes_h_l1514_c3_ff1f]
signal printf_uxn_opcodes_h_l1514_c3_ff1f_uxn_opcodes_h_l1514_c3_ff1f_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1518_c11_a2d4]
signal BIN_OP_EQ_uxn_opcodes_h_l1518_c11_a2d4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1518_c11_a2d4_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1518_c11_a2d4_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1518_c7_e67b]
signal tmp8_MUX_uxn_opcodes_h_l1518_c7_e67b_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1518_c7_e67b_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1518_c7_e67b_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1518_c7_e67b_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1518_c7_e67b]
signal t16_MUX_uxn_opcodes_h_l1518_c7_e67b_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1518_c7_e67b_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1518_c7_e67b_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1518_c7_e67b_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1518_c7_e67b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1518_c7_e67b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1518_c7_e67b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1518_c7_e67b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1518_c7_e67b_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1518_c7_e67b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1518_c7_e67b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1518_c7_e67b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1518_c7_e67b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1518_c7_e67b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1518_c7_e67b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1518_c7_e67b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1518_c7_e67b_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1518_c7_e67b_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1518_c7_e67b_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1518_c7_e67b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1518_c7_e67b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1518_c7_e67b_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1518_c7_e67b_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1518_c7_e67b_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1518_c7_e67b]
signal result_stack_value_MUX_uxn_opcodes_h_l1518_c7_e67b_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1518_c7_e67b_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1518_c7_e67b_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1518_c7_e67b_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1518_c7_e67b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1518_c7_e67b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1518_c7_e67b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1518_c7_e67b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1518_c7_e67b_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1518_c7_e67b]
signal result_ram_addr_MUX_uxn_opcodes_h_l1518_c7_e67b_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1518_c7_e67b_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1518_c7_e67b_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1518_c7_e67b_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1521_c11_d8e0]
signal BIN_OP_EQ_uxn_opcodes_h_l1521_c11_d8e0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1521_c11_d8e0_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1521_c11_d8e0_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1521_c7_157d]
signal tmp8_MUX_uxn_opcodes_h_l1521_c7_157d_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1521_c7_157d_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1521_c7_157d_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1521_c7_157d_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1521_c7_157d]
signal t16_MUX_uxn_opcodes_h_l1521_c7_157d_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1521_c7_157d_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1521_c7_157d_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1521_c7_157d_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1521_c7_157d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1521_c7_157d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1521_c7_157d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1521_c7_157d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1521_c7_157d_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1521_c7_157d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1521_c7_157d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1521_c7_157d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1521_c7_157d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1521_c7_157d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1521_c7_157d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1521_c7_157d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1521_c7_157d_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1521_c7_157d_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1521_c7_157d_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1521_c7_157d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1521_c7_157d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1521_c7_157d_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1521_c7_157d_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1521_c7_157d_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1521_c7_157d]
signal result_stack_value_MUX_uxn_opcodes_h_l1521_c7_157d_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1521_c7_157d_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1521_c7_157d_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1521_c7_157d_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1521_c7_157d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1521_c7_157d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1521_c7_157d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1521_c7_157d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1521_c7_157d_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1521_c7_157d]
signal result_ram_addr_MUX_uxn_opcodes_h_l1521_c7_157d_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1521_c7_157d_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1521_c7_157d_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1521_c7_157d_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1523_c3_d562]
signal CONST_SL_8_uxn_opcodes_h_l1523_c3_d562_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1523_c3_d562_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1526_c11_a115]
signal BIN_OP_EQ_uxn_opcodes_h_l1526_c11_a115_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1526_c11_a115_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1526_c11_a115_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1526_c7_8ea7]
signal tmp8_MUX_uxn_opcodes_h_l1526_c7_8ea7_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1526_c7_8ea7_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1526_c7_8ea7_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1526_c7_8ea7_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1526_c7_8ea7]
signal t16_MUX_uxn_opcodes_h_l1526_c7_8ea7_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1526_c7_8ea7_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1526_c7_8ea7_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1526_c7_8ea7_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1526_c7_8ea7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1526_c7_8ea7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1526_c7_8ea7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1526_c7_8ea7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1526_c7_8ea7_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1526_c7_8ea7]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1526_c7_8ea7_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1526_c7_8ea7_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1526_c7_8ea7_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1526_c7_8ea7_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1526_c7_8ea7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1526_c7_8ea7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1526_c7_8ea7_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1526_c7_8ea7_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1526_c7_8ea7_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1526_c7_8ea7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1526_c7_8ea7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1526_c7_8ea7_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1526_c7_8ea7_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1526_c7_8ea7_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1526_c7_8ea7]
signal result_stack_value_MUX_uxn_opcodes_h_l1526_c7_8ea7_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1526_c7_8ea7_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1526_c7_8ea7_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1526_c7_8ea7_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1526_c7_8ea7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1526_c7_8ea7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1526_c7_8ea7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1526_c7_8ea7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1526_c7_8ea7_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1526_c7_8ea7]
signal result_ram_addr_MUX_uxn_opcodes_h_l1526_c7_8ea7_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1526_c7_8ea7_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1526_c7_8ea7_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1526_c7_8ea7_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1529_c11_dce2]
signal BIN_OP_EQ_uxn_opcodes_h_l1529_c11_dce2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1529_c11_dce2_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1529_c11_dce2_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1529_c7_9fb6]
signal tmp8_MUX_uxn_opcodes_h_l1529_c7_9fb6_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1529_c7_9fb6_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1529_c7_9fb6_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1529_c7_9fb6_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1529_c7_9fb6]
signal t16_MUX_uxn_opcodes_h_l1529_c7_9fb6_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1529_c7_9fb6_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1529_c7_9fb6_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1529_c7_9fb6_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1529_c7_9fb6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1529_c7_9fb6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1529_c7_9fb6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1529_c7_9fb6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1529_c7_9fb6_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1529_c7_9fb6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1529_c7_9fb6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1529_c7_9fb6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1529_c7_9fb6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1529_c7_9fb6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1529_c7_9fb6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1529_c7_9fb6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1529_c7_9fb6_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1529_c7_9fb6_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1529_c7_9fb6_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1529_c7_9fb6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1529_c7_9fb6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1529_c7_9fb6_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1529_c7_9fb6_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1529_c7_9fb6_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1529_c7_9fb6]
signal result_stack_value_MUX_uxn_opcodes_h_l1529_c7_9fb6_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1529_c7_9fb6_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1529_c7_9fb6_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1529_c7_9fb6_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1529_c7_9fb6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1529_c7_9fb6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1529_c7_9fb6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1529_c7_9fb6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1529_c7_9fb6_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1529_c7_9fb6]
signal result_ram_addr_MUX_uxn_opcodes_h_l1529_c7_9fb6_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1529_c7_9fb6_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1529_c7_9fb6_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1529_c7_9fb6_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1530_c3_4e45]
signal BIN_OP_OR_uxn_opcodes_h_l1530_c3_4e45_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1530_c3_4e45_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1530_c3_4e45_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1532_c32_1ee2]
signal BIN_OP_AND_uxn_opcodes_h_l1532_c32_1ee2_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1532_c32_1ee2_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1532_c32_1ee2_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1532_c32_0ad4]
signal BIN_OP_GT_uxn_opcodes_h_l1532_c32_0ad4_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1532_c32_0ad4_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1532_c32_0ad4_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1532_c32_490f]
signal MUX_uxn_opcodes_h_l1532_c32_490f_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1532_c32_490f_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1532_c32_490f_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1532_c32_490f_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1535_c11_444a]
signal BIN_OP_EQ_uxn_opcodes_h_l1535_c11_444a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1535_c11_444a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1535_c11_444a_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1535_c7_d1f3]
signal tmp8_MUX_uxn_opcodes_h_l1535_c7_d1f3_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1535_c7_d1f3_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1535_c7_d1f3_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1535_c7_d1f3_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1535_c7_d1f3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1535_c7_d1f3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1535_c7_d1f3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1535_c7_d1f3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1535_c7_d1f3_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1535_c7_d1f3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1535_c7_d1f3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1535_c7_d1f3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1535_c7_d1f3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1535_c7_d1f3_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1535_c7_d1f3]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1535_c7_d1f3_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1535_c7_d1f3_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1535_c7_d1f3_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1535_c7_d1f3_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1535_c7_d1f3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1535_c7_d1f3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1535_c7_d1f3_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1535_c7_d1f3_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1535_c7_d1f3_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1535_c7_d1f3]
signal result_stack_value_MUX_uxn_opcodes_h_l1535_c7_d1f3_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1535_c7_d1f3_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1535_c7_d1f3_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1535_c7_d1f3_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1535_c7_d1f3]
signal result_ram_addr_MUX_uxn_opcodes_h_l1535_c7_d1f3_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1535_c7_d1f3_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1535_c7_d1f3_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1535_c7_d1f3_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1539_c11_208b]
signal BIN_OP_EQ_uxn_opcodes_h_l1539_c11_208b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1539_c11_208b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1539_c11_208b_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1539_c7_57e4]
signal tmp8_MUX_uxn_opcodes_h_l1539_c7_57e4_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1539_c7_57e4_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1539_c7_57e4_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1539_c7_57e4_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1539_c7_57e4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1539_c7_57e4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1539_c7_57e4_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1539_c7_57e4_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1539_c7_57e4_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1539_c7_57e4]
signal result_stack_value_MUX_uxn_opcodes_h_l1539_c7_57e4_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1539_c7_57e4_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1539_c7_57e4_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1539_c7_57e4_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1539_c7_57e4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_57e4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_57e4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_57e4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_57e4_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1539_c7_57e4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1539_c7_57e4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1539_c7_57e4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1539_c7_57e4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1539_c7_57e4_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1545_c11_543c]
signal BIN_OP_EQ_uxn_opcodes_h_l1545_c11_543c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1545_c11_543c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1545_c11_543c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1545_c7_f287]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1545_c7_f287_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1545_c7_f287_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1545_c7_f287_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1545_c7_f287_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1545_c7_f287]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1545_c7_f287_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1545_c7_f287_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1545_c7_f287_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1545_c7_f287_return_output : unsigned(0 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_5b20( ref_toks_0 : opcode_result_t;
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
      base.is_stack_write := ref_toks_1;
      base.is_sp_shift := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.sp_relative_shift := ref_toks_4;
      base.stack_value := ref_toks_5;
      base.is_opc_done := ref_toks_6;
      base.ram_addr := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1513_c6_3d07
BIN_OP_EQ_uxn_opcodes_h_l1513_c6_3d07 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1513_c6_3d07_left,
BIN_OP_EQ_uxn_opcodes_h_l1513_c6_3d07_right,
BIN_OP_EQ_uxn_opcodes_h_l1513_c6_3d07_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1513_c1_bf29
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1513_c1_bf29 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1513_c1_bf29_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1513_c1_bf29_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1513_c1_bf29_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1513_c1_bf29_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1513_c2_c1f0
tmp8_MUX_uxn_opcodes_h_l1513_c2_c1f0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1513_c2_c1f0_cond,
tmp8_MUX_uxn_opcodes_h_l1513_c2_c1f0_iftrue,
tmp8_MUX_uxn_opcodes_h_l1513_c2_c1f0_iffalse,
tmp8_MUX_uxn_opcodes_h_l1513_c2_c1f0_return_output);

-- t16_MUX_uxn_opcodes_h_l1513_c2_c1f0
t16_MUX_uxn_opcodes_h_l1513_c2_c1f0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1513_c2_c1f0_cond,
t16_MUX_uxn_opcodes_h_l1513_c2_c1f0_iftrue,
t16_MUX_uxn_opcodes_h_l1513_c2_c1f0_iffalse,
t16_MUX_uxn_opcodes_h_l1513_c2_c1f0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1513_c2_c1f0
result_is_stack_write_MUX_uxn_opcodes_h_l1513_c2_c1f0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1513_c2_c1f0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1513_c2_c1f0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1513_c2_c1f0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1513_c2_c1f0_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1513_c2_c1f0
result_is_sp_shift_MUX_uxn_opcodes_h_l1513_c2_c1f0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1513_c2_c1f0_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1513_c2_c1f0_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1513_c2_c1f0_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1513_c2_c1f0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1513_c2_c1f0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1513_c2_c1f0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1513_c2_c1f0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1513_c2_c1f0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1513_c2_c1f0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1513_c2_c1f0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1513_c2_c1f0
result_sp_relative_shift_MUX_uxn_opcodes_h_l1513_c2_c1f0 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1513_c2_c1f0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1513_c2_c1f0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1513_c2_c1f0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1513_c2_c1f0_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1513_c2_c1f0
result_stack_value_MUX_uxn_opcodes_h_l1513_c2_c1f0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1513_c2_c1f0_cond,
result_stack_value_MUX_uxn_opcodes_h_l1513_c2_c1f0_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1513_c2_c1f0_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1513_c2_c1f0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1513_c2_c1f0
result_is_opc_done_MUX_uxn_opcodes_h_l1513_c2_c1f0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1513_c2_c1f0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1513_c2_c1f0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1513_c2_c1f0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1513_c2_c1f0_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1513_c2_c1f0
result_ram_addr_MUX_uxn_opcodes_h_l1513_c2_c1f0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1513_c2_c1f0_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1513_c2_c1f0_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1513_c2_c1f0_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1513_c2_c1f0_return_output);

-- printf_uxn_opcodes_h_l1514_c3_ff1f_uxn_opcodes_h_l1514_c3_ff1f
printf_uxn_opcodes_h_l1514_c3_ff1f_uxn_opcodes_h_l1514_c3_ff1f : entity work.printf_uxn_opcodes_h_l1514_c3_ff1f_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1514_c3_ff1f_uxn_opcodes_h_l1514_c3_ff1f_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1518_c11_a2d4
BIN_OP_EQ_uxn_opcodes_h_l1518_c11_a2d4 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1518_c11_a2d4_left,
BIN_OP_EQ_uxn_opcodes_h_l1518_c11_a2d4_right,
BIN_OP_EQ_uxn_opcodes_h_l1518_c11_a2d4_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1518_c7_e67b
tmp8_MUX_uxn_opcodes_h_l1518_c7_e67b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1518_c7_e67b_cond,
tmp8_MUX_uxn_opcodes_h_l1518_c7_e67b_iftrue,
tmp8_MUX_uxn_opcodes_h_l1518_c7_e67b_iffalse,
tmp8_MUX_uxn_opcodes_h_l1518_c7_e67b_return_output);

-- t16_MUX_uxn_opcodes_h_l1518_c7_e67b
t16_MUX_uxn_opcodes_h_l1518_c7_e67b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1518_c7_e67b_cond,
t16_MUX_uxn_opcodes_h_l1518_c7_e67b_iftrue,
t16_MUX_uxn_opcodes_h_l1518_c7_e67b_iffalse,
t16_MUX_uxn_opcodes_h_l1518_c7_e67b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1518_c7_e67b
result_is_stack_write_MUX_uxn_opcodes_h_l1518_c7_e67b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1518_c7_e67b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1518_c7_e67b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1518_c7_e67b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1518_c7_e67b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1518_c7_e67b
result_is_sp_shift_MUX_uxn_opcodes_h_l1518_c7_e67b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1518_c7_e67b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1518_c7_e67b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1518_c7_e67b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1518_c7_e67b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1518_c7_e67b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1518_c7_e67b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1518_c7_e67b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1518_c7_e67b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1518_c7_e67b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1518_c7_e67b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1518_c7_e67b
result_sp_relative_shift_MUX_uxn_opcodes_h_l1518_c7_e67b : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1518_c7_e67b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1518_c7_e67b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1518_c7_e67b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1518_c7_e67b_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1518_c7_e67b
result_stack_value_MUX_uxn_opcodes_h_l1518_c7_e67b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1518_c7_e67b_cond,
result_stack_value_MUX_uxn_opcodes_h_l1518_c7_e67b_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1518_c7_e67b_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1518_c7_e67b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1518_c7_e67b
result_is_opc_done_MUX_uxn_opcodes_h_l1518_c7_e67b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1518_c7_e67b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1518_c7_e67b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1518_c7_e67b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1518_c7_e67b_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1518_c7_e67b
result_ram_addr_MUX_uxn_opcodes_h_l1518_c7_e67b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1518_c7_e67b_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1518_c7_e67b_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1518_c7_e67b_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1518_c7_e67b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1521_c11_d8e0
BIN_OP_EQ_uxn_opcodes_h_l1521_c11_d8e0 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1521_c11_d8e0_left,
BIN_OP_EQ_uxn_opcodes_h_l1521_c11_d8e0_right,
BIN_OP_EQ_uxn_opcodes_h_l1521_c11_d8e0_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1521_c7_157d
tmp8_MUX_uxn_opcodes_h_l1521_c7_157d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1521_c7_157d_cond,
tmp8_MUX_uxn_opcodes_h_l1521_c7_157d_iftrue,
tmp8_MUX_uxn_opcodes_h_l1521_c7_157d_iffalse,
tmp8_MUX_uxn_opcodes_h_l1521_c7_157d_return_output);

-- t16_MUX_uxn_opcodes_h_l1521_c7_157d
t16_MUX_uxn_opcodes_h_l1521_c7_157d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1521_c7_157d_cond,
t16_MUX_uxn_opcodes_h_l1521_c7_157d_iftrue,
t16_MUX_uxn_opcodes_h_l1521_c7_157d_iffalse,
t16_MUX_uxn_opcodes_h_l1521_c7_157d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1521_c7_157d
result_is_stack_write_MUX_uxn_opcodes_h_l1521_c7_157d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1521_c7_157d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1521_c7_157d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1521_c7_157d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1521_c7_157d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1521_c7_157d
result_is_sp_shift_MUX_uxn_opcodes_h_l1521_c7_157d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1521_c7_157d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1521_c7_157d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1521_c7_157d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1521_c7_157d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1521_c7_157d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1521_c7_157d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1521_c7_157d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1521_c7_157d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1521_c7_157d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1521_c7_157d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1521_c7_157d
result_sp_relative_shift_MUX_uxn_opcodes_h_l1521_c7_157d : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1521_c7_157d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1521_c7_157d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1521_c7_157d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1521_c7_157d_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1521_c7_157d
result_stack_value_MUX_uxn_opcodes_h_l1521_c7_157d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1521_c7_157d_cond,
result_stack_value_MUX_uxn_opcodes_h_l1521_c7_157d_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1521_c7_157d_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1521_c7_157d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1521_c7_157d
result_is_opc_done_MUX_uxn_opcodes_h_l1521_c7_157d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1521_c7_157d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1521_c7_157d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1521_c7_157d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1521_c7_157d_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1521_c7_157d
result_ram_addr_MUX_uxn_opcodes_h_l1521_c7_157d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1521_c7_157d_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1521_c7_157d_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1521_c7_157d_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1521_c7_157d_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1523_c3_d562
CONST_SL_8_uxn_opcodes_h_l1523_c3_d562 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1523_c3_d562_x,
CONST_SL_8_uxn_opcodes_h_l1523_c3_d562_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1526_c11_a115
BIN_OP_EQ_uxn_opcodes_h_l1526_c11_a115 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1526_c11_a115_left,
BIN_OP_EQ_uxn_opcodes_h_l1526_c11_a115_right,
BIN_OP_EQ_uxn_opcodes_h_l1526_c11_a115_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1526_c7_8ea7
tmp8_MUX_uxn_opcodes_h_l1526_c7_8ea7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1526_c7_8ea7_cond,
tmp8_MUX_uxn_opcodes_h_l1526_c7_8ea7_iftrue,
tmp8_MUX_uxn_opcodes_h_l1526_c7_8ea7_iffalse,
tmp8_MUX_uxn_opcodes_h_l1526_c7_8ea7_return_output);

-- t16_MUX_uxn_opcodes_h_l1526_c7_8ea7
t16_MUX_uxn_opcodes_h_l1526_c7_8ea7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1526_c7_8ea7_cond,
t16_MUX_uxn_opcodes_h_l1526_c7_8ea7_iftrue,
t16_MUX_uxn_opcodes_h_l1526_c7_8ea7_iffalse,
t16_MUX_uxn_opcodes_h_l1526_c7_8ea7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1526_c7_8ea7
result_is_stack_write_MUX_uxn_opcodes_h_l1526_c7_8ea7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1526_c7_8ea7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1526_c7_8ea7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1526_c7_8ea7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1526_c7_8ea7_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1526_c7_8ea7
result_is_sp_shift_MUX_uxn_opcodes_h_l1526_c7_8ea7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1526_c7_8ea7_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1526_c7_8ea7_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1526_c7_8ea7_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1526_c7_8ea7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1526_c7_8ea7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1526_c7_8ea7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1526_c7_8ea7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1526_c7_8ea7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1526_c7_8ea7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1526_c7_8ea7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1526_c7_8ea7
result_sp_relative_shift_MUX_uxn_opcodes_h_l1526_c7_8ea7 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1526_c7_8ea7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1526_c7_8ea7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1526_c7_8ea7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1526_c7_8ea7_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1526_c7_8ea7
result_stack_value_MUX_uxn_opcodes_h_l1526_c7_8ea7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1526_c7_8ea7_cond,
result_stack_value_MUX_uxn_opcodes_h_l1526_c7_8ea7_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1526_c7_8ea7_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1526_c7_8ea7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1526_c7_8ea7
result_is_opc_done_MUX_uxn_opcodes_h_l1526_c7_8ea7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1526_c7_8ea7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1526_c7_8ea7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1526_c7_8ea7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1526_c7_8ea7_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1526_c7_8ea7
result_ram_addr_MUX_uxn_opcodes_h_l1526_c7_8ea7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1526_c7_8ea7_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1526_c7_8ea7_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1526_c7_8ea7_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1526_c7_8ea7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1529_c11_dce2
BIN_OP_EQ_uxn_opcodes_h_l1529_c11_dce2 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1529_c11_dce2_left,
BIN_OP_EQ_uxn_opcodes_h_l1529_c11_dce2_right,
BIN_OP_EQ_uxn_opcodes_h_l1529_c11_dce2_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1529_c7_9fb6
tmp8_MUX_uxn_opcodes_h_l1529_c7_9fb6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1529_c7_9fb6_cond,
tmp8_MUX_uxn_opcodes_h_l1529_c7_9fb6_iftrue,
tmp8_MUX_uxn_opcodes_h_l1529_c7_9fb6_iffalse,
tmp8_MUX_uxn_opcodes_h_l1529_c7_9fb6_return_output);

-- t16_MUX_uxn_opcodes_h_l1529_c7_9fb6
t16_MUX_uxn_opcodes_h_l1529_c7_9fb6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1529_c7_9fb6_cond,
t16_MUX_uxn_opcodes_h_l1529_c7_9fb6_iftrue,
t16_MUX_uxn_opcodes_h_l1529_c7_9fb6_iffalse,
t16_MUX_uxn_opcodes_h_l1529_c7_9fb6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1529_c7_9fb6
result_is_stack_write_MUX_uxn_opcodes_h_l1529_c7_9fb6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1529_c7_9fb6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1529_c7_9fb6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1529_c7_9fb6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1529_c7_9fb6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1529_c7_9fb6
result_is_sp_shift_MUX_uxn_opcodes_h_l1529_c7_9fb6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1529_c7_9fb6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1529_c7_9fb6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1529_c7_9fb6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1529_c7_9fb6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1529_c7_9fb6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1529_c7_9fb6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1529_c7_9fb6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1529_c7_9fb6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1529_c7_9fb6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1529_c7_9fb6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1529_c7_9fb6
result_sp_relative_shift_MUX_uxn_opcodes_h_l1529_c7_9fb6 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1529_c7_9fb6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1529_c7_9fb6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1529_c7_9fb6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1529_c7_9fb6_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1529_c7_9fb6
result_stack_value_MUX_uxn_opcodes_h_l1529_c7_9fb6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1529_c7_9fb6_cond,
result_stack_value_MUX_uxn_opcodes_h_l1529_c7_9fb6_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1529_c7_9fb6_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1529_c7_9fb6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1529_c7_9fb6
result_is_opc_done_MUX_uxn_opcodes_h_l1529_c7_9fb6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1529_c7_9fb6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1529_c7_9fb6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1529_c7_9fb6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1529_c7_9fb6_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1529_c7_9fb6
result_ram_addr_MUX_uxn_opcodes_h_l1529_c7_9fb6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1529_c7_9fb6_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1529_c7_9fb6_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1529_c7_9fb6_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1529_c7_9fb6_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1530_c3_4e45
BIN_OP_OR_uxn_opcodes_h_l1530_c3_4e45 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1530_c3_4e45_left,
BIN_OP_OR_uxn_opcodes_h_l1530_c3_4e45_right,
BIN_OP_OR_uxn_opcodes_h_l1530_c3_4e45_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1532_c32_1ee2
BIN_OP_AND_uxn_opcodes_h_l1532_c32_1ee2 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1532_c32_1ee2_left,
BIN_OP_AND_uxn_opcodes_h_l1532_c32_1ee2_right,
BIN_OP_AND_uxn_opcodes_h_l1532_c32_1ee2_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1532_c32_0ad4
BIN_OP_GT_uxn_opcodes_h_l1532_c32_0ad4 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1532_c32_0ad4_left,
BIN_OP_GT_uxn_opcodes_h_l1532_c32_0ad4_right,
BIN_OP_GT_uxn_opcodes_h_l1532_c32_0ad4_return_output);

-- MUX_uxn_opcodes_h_l1532_c32_490f
MUX_uxn_opcodes_h_l1532_c32_490f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1532_c32_490f_cond,
MUX_uxn_opcodes_h_l1532_c32_490f_iftrue,
MUX_uxn_opcodes_h_l1532_c32_490f_iffalse,
MUX_uxn_opcodes_h_l1532_c32_490f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1535_c11_444a
BIN_OP_EQ_uxn_opcodes_h_l1535_c11_444a : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1535_c11_444a_left,
BIN_OP_EQ_uxn_opcodes_h_l1535_c11_444a_right,
BIN_OP_EQ_uxn_opcodes_h_l1535_c11_444a_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1535_c7_d1f3
tmp8_MUX_uxn_opcodes_h_l1535_c7_d1f3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1535_c7_d1f3_cond,
tmp8_MUX_uxn_opcodes_h_l1535_c7_d1f3_iftrue,
tmp8_MUX_uxn_opcodes_h_l1535_c7_d1f3_iffalse,
tmp8_MUX_uxn_opcodes_h_l1535_c7_d1f3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1535_c7_d1f3
result_is_opc_done_MUX_uxn_opcodes_h_l1535_c7_d1f3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1535_c7_d1f3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1535_c7_d1f3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1535_c7_d1f3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1535_c7_d1f3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1535_c7_d1f3
result_is_stack_write_MUX_uxn_opcodes_h_l1535_c7_d1f3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1535_c7_d1f3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1535_c7_d1f3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1535_c7_d1f3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1535_c7_d1f3_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1535_c7_d1f3
result_is_sp_shift_MUX_uxn_opcodes_h_l1535_c7_d1f3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1535_c7_d1f3_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1535_c7_d1f3_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1535_c7_d1f3_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1535_c7_d1f3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1535_c7_d1f3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1535_c7_d1f3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1535_c7_d1f3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1535_c7_d1f3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1535_c7_d1f3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1535_c7_d1f3_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1535_c7_d1f3
result_stack_value_MUX_uxn_opcodes_h_l1535_c7_d1f3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1535_c7_d1f3_cond,
result_stack_value_MUX_uxn_opcodes_h_l1535_c7_d1f3_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1535_c7_d1f3_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1535_c7_d1f3_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1535_c7_d1f3
result_ram_addr_MUX_uxn_opcodes_h_l1535_c7_d1f3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1535_c7_d1f3_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1535_c7_d1f3_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1535_c7_d1f3_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1535_c7_d1f3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1539_c11_208b
BIN_OP_EQ_uxn_opcodes_h_l1539_c11_208b : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1539_c11_208b_left,
BIN_OP_EQ_uxn_opcodes_h_l1539_c11_208b_right,
BIN_OP_EQ_uxn_opcodes_h_l1539_c11_208b_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1539_c7_57e4
tmp8_MUX_uxn_opcodes_h_l1539_c7_57e4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1539_c7_57e4_cond,
tmp8_MUX_uxn_opcodes_h_l1539_c7_57e4_iftrue,
tmp8_MUX_uxn_opcodes_h_l1539_c7_57e4_iffalse,
tmp8_MUX_uxn_opcodes_h_l1539_c7_57e4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1539_c7_57e4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1539_c7_57e4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1539_c7_57e4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1539_c7_57e4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1539_c7_57e4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1539_c7_57e4_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1539_c7_57e4
result_stack_value_MUX_uxn_opcodes_h_l1539_c7_57e4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1539_c7_57e4_cond,
result_stack_value_MUX_uxn_opcodes_h_l1539_c7_57e4_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1539_c7_57e4_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1539_c7_57e4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_57e4
result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_57e4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_57e4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_57e4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_57e4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_57e4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1539_c7_57e4
result_is_stack_write_MUX_uxn_opcodes_h_l1539_c7_57e4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1539_c7_57e4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1539_c7_57e4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1539_c7_57e4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1539_c7_57e4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1545_c11_543c
BIN_OP_EQ_uxn_opcodes_h_l1545_c11_543c : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1545_c11_543c_left,
BIN_OP_EQ_uxn_opcodes_h_l1545_c11_543c_right,
BIN_OP_EQ_uxn_opcodes_h_l1545_c11_543c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1545_c7_f287
result_is_stack_write_MUX_uxn_opcodes_h_l1545_c7_f287 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1545_c7_f287_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1545_c7_f287_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1545_c7_f287_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1545_c7_f287_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1545_c7_f287
result_is_opc_done_MUX_uxn_opcodes_h_l1545_c7_f287 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1545_c7_f287_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1545_c7_f287_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1545_c7_f287_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1545_c7_f287_return_output);



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
 tmp8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1513_c6_3d07_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1513_c1_bf29_return_output,
 tmp8_MUX_uxn_opcodes_h_l1513_c2_c1f0_return_output,
 t16_MUX_uxn_opcodes_h_l1513_c2_c1f0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1513_c2_c1f0_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1513_c2_c1f0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1513_c2_c1f0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1513_c2_c1f0_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1513_c2_c1f0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1513_c2_c1f0_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1513_c2_c1f0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1518_c11_a2d4_return_output,
 tmp8_MUX_uxn_opcodes_h_l1518_c7_e67b_return_output,
 t16_MUX_uxn_opcodes_h_l1518_c7_e67b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1518_c7_e67b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1518_c7_e67b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1518_c7_e67b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1518_c7_e67b_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1518_c7_e67b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1518_c7_e67b_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1518_c7_e67b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1521_c11_d8e0_return_output,
 tmp8_MUX_uxn_opcodes_h_l1521_c7_157d_return_output,
 t16_MUX_uxn_opcodes_h_l1521_c7_157d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1521_c7_157d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1521_c7_157d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1521_c7_157d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1521_c7_157d_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1521_c7_157d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1521_c7_157d_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1521_c7_157d_return_output,
 CONST_SL_8_uxn_opcodes_h_l1523_c3_d562_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1526_c11_a115_return_output,
 tmp8_MUX_uxn_opcodes_h_l1526_c7_8ea7_return_output,
 t16_MUX_uxn_opcodes_h_l1526_c7_8ea7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1526_c7_8ea7_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1526_c7_8ea7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1526_c7_8ea7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1526_c7_8ea7_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1526_c7_8ea7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1526_c7_8ea7_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1526_c7_8ea7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1529_c11_dce2_return_output,
 tmp8_MUX_uxn_opcodes_h_l1529_c7_9fb6_return_output,
 t16_MUX_uxn_opcodes_h_l1529_c7_9fb6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1529_c7_9fb6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1529_c7_9fb6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1529_c7_9fb6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1529_c7_9fb6_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1529_c7_9fb6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1529_c7_9fb6_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1529_c7_9fb6_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1530_c3_4e45_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1532_c32_1ee2_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1532_c32_0ad4_return_output,
 MUX_uxn_opcodes_h_l1532_c32_490f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1535_c11_444a_return_output,
 tmp8_MUX_uxn_opcodes_h_l1535_c7_d1f3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1535_c7_d1f3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1535_c7_d1f3_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1535_c7_d1f3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1535_c7_d1f3_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1535_c7_d1f3_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1535_c7_d1f3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1539_c11_208b_return_output,
 tmp8_MUX_uxn_opcodes_h_l1539_c7_57e4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1539_c7_57e4_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1539_c7_57e4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_57e4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1539_c7_57e4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1545_c11_543c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1545_c7_f287_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1545_c7_f287_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1513_c6_3d07_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1513_c6_3d07_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1513_c6_3d07_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1513_c1_bf29_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1513_c1_bf29_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1513_c1_bf29_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1513_c1_bf29_iffalse : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1513_c2_c1f0_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1513_c2_c1f0_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1518_c7_e67b_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1513_c2_c1f0_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1513_c2_c1f0_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1513_c2_c1f0_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1513_c2_c1f0_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1518_c7_e67b_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1513_c2_c1f0_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1513_c2_c1f0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1513_c2_c1f0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1513_c2_c1f0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1518_c7_e67b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1513_c2_c1f0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1513_c2_c1f0_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1513_c2_c1f0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1513_c2_c1f0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1518_c7_e67b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1513_c2_c1f0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1513_c2_c1f0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1513_c2_c1f0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1515_c3_01ec : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1513_c2_c1f0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1518_c7_e67b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1513_c2_c1f0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1513_c2_c1f0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1513_c2_c1f0_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1513_c2_c1f0_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1518_c7_e67b_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1513_c2_c1f0_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1513_c2_c1f0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1513_c2_c1f0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1513_c2_c1f0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1518_c7_e67b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1513_c2_c1f0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1513_c2_c1f0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1513_c2_c1f0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1513_c2_c1f0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1518_c7_e67b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1513_c2_c1f0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1513_c2_c1f0_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1513_c2_c1f0_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1513_c2_c1f0_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1518_c7_e67b_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1513_c2_c1f0_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1513_c2_c1f0_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1514_c3_ff1f_uxn_opcodes_h_l1514_c3_ff1f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1518_c11_a2d4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1518_c11_a2d4_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1518_c11_a2d4_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1518_c7_e67b_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1518_c7_e67b_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1521_c7_157d_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1518_c7_e67b_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1518_c7_e67b_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1518_c7_e67b_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1521_c7_157d_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1518_c7_e67b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1518_c7_e67b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1518_c7_e67b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1521_c7_157d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1518_c7_e67b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1518_c7_e67b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1518_c7_e67b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1521_c7_157d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1518_c7_e67b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1518_c7_e67b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1519_c3_4e2c : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1518_c7_e67b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1521_c7_157d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1518_c7_e67b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1518_c7_e67b_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1518_c7_e67b_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1521_c7_157d_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1518_c7_e67b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1518_c7_e67b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1518_c7_e67b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1521_c7_157d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1518_c7_e67b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1518_c7_e67b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1518_c7_e67b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1521_c7_157d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1518_c7_e67b_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1518_c7_e67b_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1518_c7_e67b_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1521_c7_157d_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1518_c7_e67b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1521_c11_d8e0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1521_c11_d8e0_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1521_c11_d8e0_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1521_c7_157d_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1521_c7_157d_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1526_c7_8ea7_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1521_c7_157d_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1521_c7_157d_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1521_c7_157d_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1526_c7_8ea7_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1521_c7_157d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1521_c7_157d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1521_c7_157d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1526_c7_8ea7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1521_c7_157d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1521_c7_157d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1521_c7_157d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1526_c7_8ea7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1521_c7_157d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1521_c7_157d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1524_c3_9775 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1521_c7_157d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1526_c7_8ea7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1521_c7_157d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1521_c7_157d_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1521_c7_157d_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1526_c7_8ea7_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1521_c7_157d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1521_c7_157d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1521_c7_157d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1526_c7_8ea7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1521_c7_157d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1521_c7_157d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1521_c7_157d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1526_c7_8ea7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1521_c7_157d_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1521_c7_157d_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1521_c7_157d_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1526_c7_8ea7_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1521_c7_157d_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1523_c3_d562_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1523_c3_d562_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1526_c11_a115_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1526_c11_a115_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1526_c11_a115_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1526_c7_8ea7_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1526_c7_8ea7_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1529_c7_9fb6_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1526_c7_8ea7_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1526_c7_8ea7_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1526_c7_8ea7_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1529_c7_9fb6_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1526_c7_8ea7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1526_c7_8ea7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1526_c7_8ea7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1529_c7_9fb6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1526_c7_8ea7_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1526_c7_8ea7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1526_c7_8ea7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1529_c7_9fb6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1526_c7_8ea7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1526_c7_8ea7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1527_c3_a221 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1526_c7_8ea7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1529_c7_9fb6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1526_c7_8ea7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1526_c7_8ea7_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1526_c7_8ea7_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1529_c7_9fb6_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1526_c7_8ea7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1526_c7_8ea7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1526_c7_8ea7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1529_c7_9fb6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1526_c7_8ea7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1526_c7_8ea7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1526_c7_8ea7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1529_c7_9fb6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1526_c7_8ea7_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1526_c7_8ea7_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1526_c7_8ea7_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1529_c7_9fb6_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1526_c7_8ea7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1529_c11_dce2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1529_c11_dce2_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1529_c11_dce2_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1529_c7_9fb6_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1529_c7_9fb6_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1535_c7_d1f3_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1529_c7_9fb6_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1529_c7_9fb6_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1529_c7_9fb6_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1529_c7_9fb6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1529_c7_9fb6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1529_c7_9fb6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1535_c7_d1f3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1529_c7_9fb6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1529_c7_9fb6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1529_c7_9fb6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1535_c7_d1f3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1529_c7_9fb6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1529_c7_9fb6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1529_c7_9fb6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1535_c7_d1f3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1529_c7_9fb6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1529_c7_9fb6_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1529_c7_9fb6_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1529_c7_9fb6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1529_c7_9fb6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1529_c7_9fb6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1535_c7_d1f3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1529_c7_9fb6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1529_c7_9fb6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1529_c7_9fb6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1535_c7_d1f3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1529_c7_9fb6_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1529_c7_9fb6_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1529_c7_9fb6_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1535_c7_d1f3_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1529_c7_9fb6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1530_c3_4e45_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1530_c3_4e45_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1530_c3_4e45_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1532_c32_490f_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1532_c32_490f_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1532_c32_490f_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1532_c32_1ee2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1532_c32_1ee2_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1532_c32_1ee2_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1532_c32_0ad4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1532_c32_0ad4_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1532_c32_0ad4_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1532_c32_490f_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1535_c11_444a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1535_c11_444a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1535_c11_444a_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1535_c7_d1f3_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1535_c7_d1f3_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1539_c7_57e4_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1535_c7_d1f3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1535_c7_d1f3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1535_c7_d1f3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_57e4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1535_c7_d1f3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1535_c7_d1f3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1535_c7_d1f3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1539_c7_57e4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1535_c7_d1f3_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1535_c7_d1f3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1535_c7_d1f3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1535_c7_d1f3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1535_c7_d1f3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1535_c7_d1f3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1539_c7_57e4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1535_c7_d1f3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1535_c7_d1f3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1535_c7_d1f3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1539_c7_57e4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1535_c7_d1f3_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1535_c7_d1f3_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1535_c7_d1f3_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1535_c7_d1f3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1539_c11_208b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1539_c11_208b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1539_c11_208b_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1539_c7_57e4_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1539_c7_57e4_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1539_c7_57e4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1539_c7_57e4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1542_c3_40ed : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1539_c7_57e4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1539_c7_57e4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1539_c7_57e4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1539_c7_57e4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1539_c7_57e4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_57e4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_57e4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1545_c7_f287_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_57e4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1539_c7_57e4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1539_c7_57e4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1545_c7_f287_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1539_c7_57e4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1545_c11_543c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1545_c11_543c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1545_c11_543c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1545_c7_f287_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1545_c7_f287_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1545_c7_f287_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1545_c7_f287_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1545_c7_f287_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1545_c7_f287_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1526_l1518_l1513_l1545_l1535_l1529_l1521_DUPLICATE_b01e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1526_l1518_l1513_l1535_l1521_DUPLICATE_06b5_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1526_l1518_l1513_l1529_l1521_DUPLICATE_1008_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1526_l1518_l1513_l1539_l1535_l1529_l1521_DUPLICATE_d642_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1526_l1518_l1513_l1535_l1521_DUPLICATE_39c6_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1526_l1518_l1539_l1545_l1535_l1529_l1521_DUPLICATE_db9d_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1530_l1522_DUPLICATE_3f66_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1535_l1539_l1529_DUPLICATE_a5ca_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5b20_uxn_opcodes_h_l1550_l1508_DUPLICATE_5d66_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_tmp8 : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_tmp8 := tmp8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_GT_uxn_opcodes_h_l1532_c32_0ad4_right := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1513_c2_c1f0_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1535_c11_444a_right := to_unsigned(5, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1539_c7_57e4_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1526_c11_a115_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1529_c11_dce2_right := to_unsigned(4, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1529_c7_9fb6_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1542_c3_40ed := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1539_c7_57e4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1542_c3_40ed;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1513_c6_3d07_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1524_c3_9775 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1521_c7_157d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1524_c3_9775;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1518_c11_a2d4_right := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l1532_c32_490f_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1535_c7_d1f3_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1515_c3_01ec := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1513_c2_c1f0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1515_c3_01ec;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1545_c7_f287_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1539_c11_208b_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1521_c11_d8e0_right := to_unsigned(2, 2);
     VAR_MUX_uxn_opcodes_h_l1532_c32_490f_iffalse := resize(to_signed(-1, 2), 8);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1545_c7_f287_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1545_c11_543c_right := to_unsigned(7, 3);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1513_c1_bf29_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1527_c3_a221 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1526_c7_8ea7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1527_c3_a221;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1519_c3_4e2c := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1518_c7_e67b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1519_c3_4e2c;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1532_c32_1ee2_right := to_unsigned(128, 8);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1513_c1_bf29_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1532_c32_1ee2_left := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1513_c6_3d07_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1518_c11_a2d4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1521_c11_d8e0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1526_c11_a115_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1529_c11_dce2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1535_c11_444a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1539_c11_208b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1545_c11_543c_left := VAR_phase;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1539_c7_57e4_iftrue := VAR_previous_ram_read;
     VAR_tmp8_MUX_uxn_opcodes_h_l1539_c7_57e4_iftrue := VAR_previous_ram_read;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1530_c3_4e45_left := t16;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1535_c7_d1f3_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1513_c2_c1f0_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1518_c7_e67b_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1526_c7_8ea7_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1529_c7_9fb6_iffalse := t16;
     VAR_tmp8_MUX_uxn_opcodes_h_l1513_c2_c1f0_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1518_c7_e67b_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1521_c7_157d_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1526_c7_8ea7_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1529_c7_9fb6_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1535_c7_d1f3_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1539_c7_57e4_iffalse := tmp8;
     -- BIN_OP_EQ[uxn_opcodes_h_l1521_c11_d8e0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1521_c11_d8e0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1521_c11_d8e0_left;
     BIN_OP_EQ_uxn_opcodes_h_l1521_c11_d8e0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1521_c11_d8e0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1521_c11_d8e0_return_output := BIN_OP_EQ_uxn_opcodes_h_l1521_c11_d8e0_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1526_l1518_l1513_l1529_l1521_DUPLICATE_1008 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1526_l1518_l1513_l1529_l1521_DUPLICATE_1008_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1526_l1518_l1513_l1539_l1535_l1529_l1521_DUPLICATE_d642 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1526_l1518_l1513_l1539_l1535_l1529_l1521_DUPLICATE_d642_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1529_c11_dce2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1529_c11_dce2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1529_c11_dce2_left;
     BIN_OP_EQ_uxn_opcodes_h_l1529_c11_dce2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1529_c11_dce2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1529_c11_dce2_return_output := BIN_OP_EQ_uxn_opcodes_h_l1529_c11_dce2_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1526_l1518_l1513_l1545_l1535_l1529_l1521_DUPLICATE_b01e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1526_l1518_l1513_l1545_l1535_l1529_l1521_DUPLICATE_b01e_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1526_l1518_l1539_l1545_l1535_l1529_l1521_DUPLICATE_db9d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1526_l1518_l1539_l1545_l1535_l1529_l1521_DUPLICATE_db9d_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1518_c11_a2d4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1518_c11_a2d4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1518_c11_a2d4_left;
     BIN_OP_EQ_uxn_opcodes_h_l1518_c11_a2d4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1518_c11_a2d4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1518_c11_a2d4_return_output := BIN_OP_EQ_uxn_opcodes_h_l1518_c11_a2d4_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l1532_c32_1ee2] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1532_c32_1ee2_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1532_c32_1ee2_left;
     BIN_OP_AND_uxn_opcodes_h_l1532_c32_1ee2_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1532_c32_1ee2_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1532_c32_1ee2_return_output := BIN_OP_AND_uxn_opcodes_h_l1532_c32_1ee2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1526_c11_a115] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1526_c11_a115_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1526_c11_a115_left;
     BIN_OP_EQ_uxn_opcodes_h_l1526_c11_a115_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1526_c11_a115_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1526_c11_a115_return_output := BIN_OP_EQ_uxn_opcodes_h_l1526_c11_a115_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1526_l1518_l1513_l1535_l1521_DUPLICATE_39c6 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1526_l1518_l1513_l1535_l1521_DUPLICATE_39c6_return_output := result.ram_addr;

     -- BIN_OP_EQ[uxn_opcodes_h_l1513_c6_3d07] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1513_c6_3d07_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1513_c6_3d07_left;
     BIN_OP_EQ_uxn_opcodes_h_l1513_c6_3d07_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1513_c6_3d07_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1513_c6_3d07_return_output := BIN_OP_EQ_uxn_opcodes_h_l1513_c6_3d07_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1545_c11_543c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1545_c11_543c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1545_c11_543c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1545_c11_543c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1545_c11_543c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1545_c11_543c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1545_c11_543c_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1530_l1522_DUPLICATE_3f66 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1530_l1522_DUPLICATE_3f66_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1526_l1518_l1513_l1535_l1521_DUPLICATE_06b5 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1526_l1518_l1513_l1535_l1521_DUPLICATE_06b5_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1535_c11_444a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1535_c11_444a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1535_c11_444a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1535_c11_444a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1535_c11_444a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1535_c11_444a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1535_c11_444a_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1535_l1539_l1529_DUPLICATE_a5ca LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1535_l1539_l1529_DUPLICATE_a5ca_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1539_c11_208b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1539_c11_208b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1539_c11_208b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1539_c11_208b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1539_c11_208b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1539_c11_208b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1539_c11_208b_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1532_c32_0ad4_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1532_c32_1ee2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1513_c1_bf29_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1513_c6_3d07_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1513_c2_c1f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1513_c6_3d07_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1513_c2_c1f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1513_c6_3d07_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1513_c2_c1f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1513_c6_3d07_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1513_c2_c1f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1513_c6_3d07_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1513_c2_c1f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1513_c6_3d07_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1513_c2_c1f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1513_c6_3d07_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1513_c2_c1f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1513_c6_3d07_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1513_c2_c1f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1513_c6_3d07_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1513_c2_c1f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1513_c6_3d07_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1518_c7_e67b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1518_c11_a2d4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1518_c7_e67b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1518_c11_a2d4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1518_c7_e67b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1518_c11_a2d4_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1518_c7_e67b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1518_c11_a2d4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1518_c7_e67b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1518_c11_a2d4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1518_c7_e67b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1518_c11_a2d4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1518_c7_e67b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1518_c11_a2d4_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1518_c7_e67b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1518_c11_a2d4_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1518_c7_e67b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1518_c11_a2d4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1521_c7_157d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1521_c11_d8e0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1521_c7_157d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1521_c11_d8e0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1521_c7_157d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1521_c11_d8e0_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1521_c7_157d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1521_c11_d8e0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1521_c7_157d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1521_c11_d8e0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1521_c7_157d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1521_c11_d8e0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1521_c7_157d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1521_c11_d8e0_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1521_c7_157d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1521_c11_d8e0_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1521_c7_157d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1521_c11_d8e0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1526_c7_8ea7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1526_c11_a115_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1526_c7_8ea7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1526_c11_a115_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1526_c7_8ea7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1526_c11_a115_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1526_c7_8ea7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1526_c11_a115_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1526_c7_8ea7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1526_c11_a115_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1526_c7_8ea7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1526_c11_a115_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1526_c7_8ea7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1526_c11_a115_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1526_c7_8ea7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1526_c11_a115_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1526_c7_8ea7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1526_c11_a115_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1529_c7_9fb6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1529_c11_dce2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1529_c7_9fb6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1529_c11_dce2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1529_c7_9fb6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1529_c11_dce2_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1529_c7_9fb6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1529_c11_dce2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1529_c7_9fb6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1529_c11_dce2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1529_c7_9fb6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1529_c11_dce2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1529_c7_9fb6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1529_c11_dce2_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1529_c7_9fb6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1529_c11_dce2_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1529_c7_9fb6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1529_c11_dce2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1535_c7_d1f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1535_c11_444a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1535_c7_d1f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1535_c11_444a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1535_c7_d1f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1535_c11_444a_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1535_c7_d1f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1535_c11_444a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1535_c7_d1f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1535_c11_444a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1535_c7_d1f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1535_c11_444a_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1535_c7_d1f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1535_c11_444a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_57e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1539_c11_208b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1539_c7_57e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1539_c11_208b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1539_c7_57e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1539_c11_208b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1539_c7_57e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1539_c11_208b_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1539_c7_57e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1539_c11_208b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1545_c7_f287_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1545_c11_543c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1545_c7_f287_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1545_c11_543c_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1530_c3_4e45_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1530_l1522_DUPLICATE_3f66_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1523_c3_d562_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1530_l1522_DUPLICATE_3f66_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1513_c2_c1f0_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1526_l1518_l1513_l1529_l1521_DUPLICATE_1008_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1518_c7_e67b_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1526_l1518_l1513_l1529_l1521_DUPLICATE_1008_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1521_c7_157d_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1526_l1518_l1513_l1529_l1521_DUPLICATE_1008_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1526_c7_8ea7_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1526_l1518_l1513_l1529_l1521_DUPLICATE_1008_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1529_c7_9fb6_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1526_l1518_l1513_l1529_l1521_DUPLICATE_1008_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1513_c2_c1f0_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1526_l1518_l1513_l1535_l1521_DUPLICATE_39c6_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1518_c7_e67b_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1526_l1518_l1513_l1535_l1521_DUPLICATE_39c6_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1521_c7_157d_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1526_l1518_l1513_l1535_l1521_DUPLICATE_39c6_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1526_c7_8ea7_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1526_l1518_l1513_l1535_l1521_DUPLICATE_39c6_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1535_c7_d1f3_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1526_l1518_l1513_l1535_l1521_DUPLICATE_39c6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1518_c7_e67b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1526_l1518_l1539_l1545_l1535_l1529_l1521_DUPLICATE_db9d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1521_c7_157d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1526_l1518_l1539_l1545_l1535_l1529_l1521_DUPLICATE_db9d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1526_c7_8ea7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1526_l1518_l1539_l1545_l1535_l1529_l1521_DUPLICATE_db9d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1529_c7_9fb6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1526_l1518_l1539_l1545_l1535_l1529_l1521_DUPLICATE_db9d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1535_c7_d1f3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1526_l1518_l1539_l1545_l1535_l1529_l1521_DUPLICATE_db9d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_57e4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1526_l1518_l1539_l1545_l1535_l1529_l1521_DUPLICATE_db9d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1545_c7_f287_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1526_l1518_l1539_l1545_l1535_l1529_l1521_DUPLICATE_db9d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1513_c2_c1f0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1526_l1518_l1513_l1535_l1521_DUPLICATE_06b5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1518_c7_e67b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1526_l1518_l1513_l1535_l1521_DUPLICATE_06b5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1521_c7_157d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1526_l1518_l1513_l1535_l1521_DUPLICATE_06b5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1526_c7_8ea7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1526_l1518_l1513_l1535_l1521_DUPLICATE_06b5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1535_c7_d1f3_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1526_l1518_l1513_l1535_l1521_DUPLICATE_06b5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1513_c2_c1f0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1526_l1518_l1513_l1545_l1535_l1529_l1521_DUPLICATE_b01e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1518_c7_e67b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1526_l1518_l1513_l1545_l1535_l1529_l1521_DUPLICATE_b01e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1521_c7_157d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1526_l1518_l1513_l1545_l1535_l1529_l1521_DUPLICATE_b01e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1526_c7_8ea7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1526_l1518_l1513_l1545_l1535_l1529_l1521_DUPLICATE_b01e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1529_c7_9fb6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1526_l1518_l1513_l1545_l1535_l1529_l1521_DUPLICATE_b01e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1535_c7_d1f3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1526_l1518_l1513_l1545_l1535_l1529_l1521_DUPLICATE_b01e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1545_c7_f287_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1526_l1518_l1513_l1545_l1535_l1529_l1521_DUPLICATE_b01e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1529_c7_9fb6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1535_l1539_l1529_DUPLICATE_a5ca_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1535_c7_d1f3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1535_l1539_l1529_DUPLICATE_a5ca_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1539_c7_57e4_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1535_l1539_l1529_DUPLICATE_a5ca_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1513_c2_c1f0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1526_l1518_l1513_l1539_l1535_l1529_l1521_DUPLICATE_d642_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1518_c7_e67b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1526_l1518_l1513_l1539_l1535_l1529_l1521_DUPLICATE_d642_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1521_c7_157d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1526_l1518_l1513_l1539_l1535_l1529_l1521_DUPLICATE_d642_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1526_c7_8ea7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1526_l1518_l1513_l1539_l1535_l1529_l1521_DUPLICATE_d642_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1529_c7_9fb6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1526_l1518_l1513_l1539_l1535_l1529_l1521_DUPLICATE_d642_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1535_c7_d1f3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1526_l1518_l1513_l1539_l1535_l1529_l1521_DUPLICATE_d642_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1539_c7_57e4_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1526_l1518_l1513_l1539_l1535_l1529_l1521_DUPLICATE_d642_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1545_c7_f287] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1545_c7_f287_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1545_c7_f287_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1545_c7_f287_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1545_c7_f287_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1545_c7_f287_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1545_c7_f287_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1545_c7_f287_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1545_c7_f287_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1530_c3_4e45] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1530_c3_4e45_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1530_c3_4e45_left;
     BIN_OP_OR_uxn_opcodes_h_l1530_c3_4e45_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1530_c3_4e45_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1530_c3_4e45_return_output := BIN_OP_OR_uxn_opcodes_h_l1530_c3_4e45_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1535_c7_d1f3] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1535_c7_d1f3_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1535_c7_d1f3_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1535_c7_d1f3_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1535_c7_d1f3_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1535_c7_d1f3_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1535_c7_d1f3_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1535_c7_d1f3_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1535_c7_d1f3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1539_c7_57e4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1539_c7_57e4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1539_c7_57e4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1539_c7_57e4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1539_c7_57e4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1539_c7_57e4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1539_c7_57e4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1539_c7_57e4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1539_c7_57e4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1545_c7_f287] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1545_c7_f287_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1545_c7_f287_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1545_c7_f287_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1545_c7_f287_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1545_c7_f287_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1545_c7_f287_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1545_c7_f287_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1545_c7_f287_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1535_c7_d1f3] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1535_c7_d1f3_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1535_c7_d1f3_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1535_c7_d1f3_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1535_c7_d1f3_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1535_c7_d1f3_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1535_c7_d1f3_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1535_c7_d1f3_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1535_c7_d1f3_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l1523_c3_d562] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1523_c3_d562_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1523_c3_d562_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1523_c3_d562_return_output := CONST_SL_8_uxn_opcodes_h_l1523_c3_d562_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1513_c1_bf29] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1513_c1_bf29_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1513_c1_bf29_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1513_c1_bf29_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1513_c1_bf29_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1513_c1_bf29_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1513_c1_bf29_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1513_c1_bf29_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1513_c1_bf29_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1532_c32_0ad4] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1532_c32_0ad4_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1532_c32_0ad4_left;
     BIN_OP_GT_uxn_opcodes_h_l1532_c32_0ad4_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1532_c32_0ad4_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1532_c32_0ad4_return_output := BIN_OP_GT_uxn_opcodes_h_l1532_c32_0ad4_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1539_c7_57e4] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1539_c7_57e4_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1539_c7_57e4_cond;
     tmp8_MUX_uxn_opcodes_h_l1539_c7_57e4_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1539_c7_57e4_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1539_c7_57e4_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1539_c7_57e4_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1539_c7_57e4_return_output := tmp8_MUX_uxn_opcodes_h_l1539_c7_57e4_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1539_c7_57e4] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1539_c7_57e4_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1539_c7_57e4_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1539_c7_57e4_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1539_c7_57e4_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1539_c7_57e4_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1539_c7_57e4_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1539_c7_57e4_return_output := result_stack_value_MUX_uxn_opcodes_h_l1539_c7_57e4_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1532_c32_490f_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1532_c32_0ad4_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1529_c7_9fb6_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1530_c3_4e45_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1529_c7_9fb6_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1530_c3_4e45_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1521_c7_157d_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1523_c3_d562_return_output;
     VAR_printf_uxn_opcodes_h_l1514_c3_ff1f_uxn_opcodes_h_l1514_c3_ff1f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1513_c1_bf29_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_57e4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1545_c7_f287_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1529_c7_9fb6_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1535_c7_d1f3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1539_c7_57e4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1545_c7_f287_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1529_c7_9fb6_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1535_c7_d1f3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1535_c7_d1f3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1539_c7_57e4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1535_c7_d1f3_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1539_c7_57e4_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1535_c7_d1f3_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1539_c7_57e4_return_output;
     -- printf_uxn_opcodes_h_l1514_c3_ff1f[uxn_opcodes_h_l1514_c3_ff1f] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1514_c3_ff1f_uxn_opcodes_h_l1514_c3_ff1f_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1514_c3_ff1f_uxn_opcodes_h_l1514_c3_ff1f_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_ram_addr_MUX[uxn_opcodes_h_l1529_c7_9fb6] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1529_c7_9fb6_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1529_c7_9fb6_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1529_c7_9fb6_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1529_c7_9fb6_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1529_c7_9fb6_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1529_c7_9fb6_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1529_c7_9fb6_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1529_c7_9fb6_return_output;

     -- t16_MUX[uxn_opcodes_h_l1529_c7_9fb6] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1529_c7_9fb6_cond <= VAR_t16_MUX_uxn_opcodes_h_l1529_c7_9fb6_cond;
     t16_MUX_uxn_opcodes_h_l1529_c7_9fb6_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1529_c7_9fb6_iftrue;
     t16_MUX_uxn_opcodes_h_l1529_c7_9fb6_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1529_c7_9fb6_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1529_c7_9fb6_return_output := t16_MUX_uxn_opcodes_h_l1529_c7_9fb6_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1529_c7_9fb6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1529_c7_9fb6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1529_c7_9fb6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1529_c7_9fb6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1529_c7_9fb6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1529_c7_9fb6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1529_c7_9fb6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1529_c7_9fb6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1529_c7_9fb6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1535_c7_d1f3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1535_c7_d1f3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1535_c7_d1f3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1535_c7_d1f3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1535_c7_d1f3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1535_c7_d1f3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1535_c7_d1f3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1535_c7_d1f3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1535_c7_d1f3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1539_c7_57e4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1539_c7_57e4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1539_c7_57e4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1539_c7_57e4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1539_c7_57e4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1539_c7_57e4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1539_c7_57e4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1539_c7_57e4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1539_c7_57e4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1539_c7_57e4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_57e4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_57e4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_57e4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_57e4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_57e4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_57e4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_57e4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_57e4_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1535_c7_d1f3] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1535_c7_d1f3_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1535_c7_d1f3_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1535_c7_d1f3_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1535_c7_d1f3_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1535_c7_d1f3_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1535_c7_d1f3_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1535_c7_d1f3_return_output := result_stack_value_MUX_uxn_opcodes_h_l1535_c7_d1f3_return_output;

     -- MUX[uxn_opcodes_h_l1532_c32_490f] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1532_c32_490f_cond <= VAR_MUX_uxn_opcodes_h_l1532_c32_490f_cond;
     MUX_uxn_opcodes_h_l1532_c32_490f_iftrue <= VAR_MUX_uxn_opcodes_h_l1532_c32_490f_iftrue;
     MUX_uxn_opcodes_h_l1532_c32_490f_iffalse <= VAR_MUX_uxn_opcodes_h_l1532_c32_490f_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1532_c32_490f_return_output := MUX_uxn_opcodes_h_l1532_c32_490f_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1535_c7_d1f3] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1535_c7_d1f3_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1535_c7_d1f3_cond;
     tmp8_MUX_uxn_opcodes_h_l1535_c7_d1f3_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1535_c7_d1f3_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1535_c7_d1f3_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1535_c7_d1f3_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1535_c7_d1f3_return_output := tmp8_MUX_uxn_opcodes_h_l1535_c7_d1f3_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1529_c7_9fb6_iftrue := VAR_MUX_uxn_opcodes_h_l1532_c32_490f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1535_c7_d1f3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1539_c7_57e4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1526_c7_8ea7_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1529_c7_9fb6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1535_c7_d1f3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1539_c7_57e4_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1526_c7_8ea7_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1529_c7_9fb6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1529_c7_9fb6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1535_c7_d1f3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1529_c7_9fb6_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1535_c7_d1f3_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1526_c7_8ea7_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1529_c7_9fb6_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1529_c7_9fb6_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1535_c7_d1f3_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1529_c7_9fb6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1529_c7_9fb6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1529_c7_9fb6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1529_c7_9fb6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1529_c7_9fb6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1529_c7_9fb6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1529_c7_9fb6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1529_c7_9fb6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1529_c7_9fb6_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1529_c7_9fb6] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1529_c7_9fb6_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1529_c7_9fb6_cond;
     tmp8_MUX_uxn_opcodes_h_l1529_c7_9fb6_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1529_c7_9fb6_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1529_c7_9fb6_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1529_c7_9fb6_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1529_c7_9fb6_return_output := tmp8_MUX_uxn_opcodes_h_l1529_c7_9fb6_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1526_c7_8ea7] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1526_c7_8ea7_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1526_c7_8ea7_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1526_c7_8ea7_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1526_c7_8ea7_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1526_c7_8ea7_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1526_c7_8ea7_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1526_c7_8ea7_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1526_c7_8ea7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1535_c7_d1f3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1535_c7_d1f3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1535_c7_d1f3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1535_c7_d1f3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1535_c7_d1f3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1535_c7_d1f3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1535_c7_d1f3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1535_c7_d1f3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1535_c7_d1f3_return_output;

     -- t16_MUX[uxn_opcodes_h_l1526_c7_8ea7] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1526_c7_8ea7_cond <= VAR_t16_MUX_uxn_opcodes_h_l1526_c7_8ea7_cond;
     t16_MUX_uxn_opcodes_h_l1526_c7_8ea7_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1526_c7_8ea7_iftrue;
     t16_MUX_uxn_opcodes_h_l1526_c7_8ea7_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1526_c7_8ea7_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1526_c7_8ea7_return_output := t16_MUX_uxn_opcodes_h_l1526_c7_8ea7_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1526_c7_8ea7] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1526_c7_8ea7_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1526_c7_8ea7_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1526_c7_8ea7_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1526_c7_8ea7_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1526_c7_8ea7_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1526_c7_8ea7_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1526_c7_8ea7_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1526_c7_8ea7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1535_c7_d1f3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1535_c7_d1f3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1535_c7_d1f3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1535_c7_d1f3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1535_c7_d1f3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1535_c7_d1f3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1535_c7_d1f3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1535_c7_d1f3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1535_c7_d1f3_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1529_c7_9fb6] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1529_c7_9fb6_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1529_c7_9fb6_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1529_c7_9fb6_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1529_c7_9fb6_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1529_c7_9fb6_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1529_c7_9fb6_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1529_c7_9fb6_return_output := result_stack_value_MUX_uxn_opcodes_h_l1529_c7_9fb6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1529_c7_9fb6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1529_c7_9fb6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1529_c7_9fb6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1529_c7_9fb6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1529_c7_9fb6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1529_c7_9fb6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1529_c7_9fb6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1529_c7_9fb6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1529_c7_9fb6_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1529_c7_9fb6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1535_c7_d1f3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1521_c7_157d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1526_c7_8ea7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1529_c7_9fb6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1535_c7_d1f3_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1521_c7_157d_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1526_c7_8ea7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1526_c7_8ea7_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1529_c7_9fb6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1526_c7_8ea7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1529_c7_9fb6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1526_c7_8ea7_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1529_c7_9fb6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1521_c7_157d_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1526_c7_8ea7_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1526_c7_8ea7_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1529_c7_9fb6_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1529_c7_9fb6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1529_c7_9fb6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1529_c7_9fb6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1529_c7_9fb6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1529_c7_9fb6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1529_c7_9fb6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1529_c7_9fb6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1529_c7_9fb6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1529_c7_9fb6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1526_c7_8ea7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1526_c7_8ea7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1526_c7_8ea7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1526_c7_8ea7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1526_c7_8ea7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1526_c7_8ea7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1526_c7_8ea7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1526_c7_8ea7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1526_c7_8ea7_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1521_c7_157d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1521_c7_157d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1521_c7_157d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1521_c7_157d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1521_c7_157d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1521_c7_157d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1521_c7_157d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1521_c7_157d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1521_c7_157d_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1526_c7_8ea7] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1526_c7_8ea7_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1526_c7_8ea7_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1526_c7_8ea7_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1526_c7_8ea7_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1526_c7_8ea7_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1526_c7_8ea7_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1526_c7_8ea7_return_output := result_stack_value_MUX_uxn_opcodes_h_l1526_c7_8ea7_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1521_c7_157d] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1521_c7_157d_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1521_c7_157d_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1521_c7_157d_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1521_c7_157d_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1521_c7_157d_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1521_c7_157d_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1521_c7_157d_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1521_c7_157d_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1526_c7_8ea7] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1526_c7_8ea7_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1526_c7_8ea7_cond;
     tmp8_MUX_uxn_opcodes_h_l1526_c7_8ea7_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1526_c7_8ea7_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1526_c7_8ea7_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1526_c7_8ea7_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1526_c7_8ea7_return_output := tmp8_MUX_uxn_opcodes_h_l1526_c7_8ea7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1529_c7_9fb6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1529_c7_9fb6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1529_c7_9fb6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1529_c7_9fb6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1529_c7_9fb6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1529_c7_9fb6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1529_c7_9fb6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1529_c7_9fb6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1529_c7_9fb6_return_output;

     -- t16_MUX[uxn_opcodes_h_l1521_c7_157d] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1521_c7_157d_cond <= VAR_t16_MUX_uxn_opcodes_h_l1521_c7_157d_cond;
     t16_MUX_uxn_opcodes_h_l1521_c7_157d_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1521_c7_157d_iftrue;
     t16_MUX_uxn_opcodes_h_l1521_c7_157d_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1521_c7_157d_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1521_c7_157d_return_output := t16_MUX_uxn_opcodes_h_l1521_c7_157d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1526_c7_8ea7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1526_c7_8ea7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1526_c7_8ea7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1526_c7_8ea7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1526_c7_8ea7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1526_c7_8ea7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1526_c7_8ea7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1526_c7_8ea7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1526_c7_8ea7_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1526_c7_8ea7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1529_c7_9fb6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1518_c7_e67b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1521_c7_157d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1526_c7_8ea7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1529_c7_9fb6_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1518_c7_e67b_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1521_c7_157d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1521_c7_157d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1526_c7_8ea7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1521_c7_157d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1526_c7_8ea7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1521_c7_157d_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1526_c7_8ea7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1518_c7_e67b_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1521_c7_157d_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1521_c7_157d_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1526_c7_8ea7_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1518_c7_e67b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1518_c7_e67b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1518_c7_e67b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1518_c7_e67b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1518_c7_e67b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1518_c7_e67b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1518_c7_e67b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1518_c7_e67b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1518_c7_e67b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1526_c7_8ea7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1526_c7_8ea7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1526_c7_8ea7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1526_c7_8ea7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1526_c7_8ea7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1526_c7_8ea7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1526_c7_8ea7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1526_c7_8ea7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1526_c7_8ea7_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1518_c7_e67b] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1518_c7_e67b_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1518_c7_e67b_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1518_c7_e67b_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1518_c7_e67b_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1518_c7_e67b_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1518_c7_e67b_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1518_c7_e67b_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1518_c7_e67b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1521_c7_157d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1521_c7_157d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1521_c7_157d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1521_c7_157d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1521_c7_157d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1521_c7_157d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1521_c7_157d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1521_c7_157d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1521_c7_157d_return_output;

     -- t16_MUX[uxn_opcodes_h_l1518_c7_e67b] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1518_c7_e67b_cond <= VAR_t16_MUX_uxn_opcodes_h_l1518_c7_e67b_cond;
     t16_MUX_uxn_opcodes_h_l1518_c7_e67b_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1518_c7_e67b_iftrue;
     t16_MUX_uxn_opcodes_h_l1518_c7_e67b_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1518_c7_e67b_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1518_c7_e67b_return_output := t16_MUX_uxn_opcodes_h_l1518_c7_e67b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1521_c7_157d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1521_c7_157d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1521_c7_157d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1521_c7_157d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1521_c7_157d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1521_c7_157d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1521_c7_157d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1521_c7_157d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1521_c7_157d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1526_c7_8ea7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1526_c7_8ea7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1526_c7_8ea7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1526_c7_8ea7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1526_c7_8ea7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1526_c7_8ea7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1526_c7_8ea7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1526_c7_8ea7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1526_c7_8ea7_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1521_c7_157d] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1521_c7_157d_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1521_c7_157d_cond;
     tmp8_MUX_uxn_opcodes_h_l1521_c7_157d_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1521_c7_157d_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1521_c7_157d_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1521_c7_157d_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1521_c7_157d_return_output := tmp8_MUX_uxn_opcodes_h_l1521_c7_157d_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1521_c7_157d] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1521_c7_157d_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1521_c7_157d_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1521_c7_157d_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1521_c7_157d_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1521_c7_157d_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1521_c7_157d_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1521_c7_157d_return_output := result_stack_value_MUX_uxn_opcodes_h_l1521_c7_157d_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1521_c7_157d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1526_c7_8ea7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1513_c2_c1f0_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1518_c7_e67b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1521_c7_157d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1526_c7_8ea7_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1513_c2_c1f0_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1518_c7_e67b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1518_c7_e67b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1521_c7_157d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1518_c7_e67b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1521_c7_157d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1518_c7_e67b_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1521_c7_157d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1513_c2_c1f0_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1518_c7_e67b_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1518_c7_e67b_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1521_c7_157d_return_output;
     -- result_ram_addr_MUX[uxn_opcodes_h_l1513_c2_c1f0] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1513_c2_c1f0_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1513_c2_c1f0_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1513_c2_c1f0_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1513_c2_c1f0_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1513_c2_c1f0_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1513_c2_c1f0_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1513_c2_c1f0_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1513_c2_c1f0_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1513_c2_c1f0] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1513_c2_c1f0_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1513_c2_c1f0_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1513_c2_c1f0_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1513_c2_c1f0_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1513_c2_c1f0_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1513_c2_c1f0_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1513_c2_c1f0_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1513_c2_c1f0_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1518_c7_e67b] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1518_c7_e67b_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1518_c7_e67b_cond;
     tmp8_MUX_uxn_opcodes_h_l1518_c7_e67b_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1518_c7_e67b_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1518_c7_e67b_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1518_c7_e67b_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1518_c7_e67b_return_output := tmp8_MUX_uxn_opcodes_h_l1518_c7_e67b_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1518_c7_e67b] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1518_c7_e67b_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1518_c7_e67b_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1518_c7_e67b_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1518_c7_e67b_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1518_c7_e67b_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1518_c7_e67b_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1518_c7_e67b_return_output := result_stack_value_MUX_uxn_opcodes_h_l1518_c7_e67b_return_output;

     -- t16_MUX[uxn_opcodes_h_l1513_c2_c1f0] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1513_c2_c1f0_cond <= VAR_t16_MUX_uxn_opcodes_h_l1513_c2_c1f0_cond;
     t16_MUX_uxn_opcodes_h_l1513_c2_c1f0_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1513_c2_c1f0_iftrue;
     t16_MUX_uxn_opcodes_h_l1513_c2_c1f0_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1513_c2_c1f0_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1513_c2_c1f0_return_output := t16_MUX_uxn_opcodes_h_l1513_c2_c1f0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1521_c7_157d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1521_c7_157d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1521_c7_157d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1521_c7_157d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1521_c7_157d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1521_c7_157d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1521_c7_157d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1521_c7_157d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1521_c7_157d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1518_c7_e67b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1518_c7_e67b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1518_c7_e67b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1518_c7_e67b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1518_c7_e67b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1518_c7_e67b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1518_c7_e67b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1518_c7_e67b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1518_c7_e67b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1521_c7_157d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1521_c7_157d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1521_c7_157d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1521_c7_157d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1521_c7_157d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1521_c7_157d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1521_c7_157d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1521_c7_157d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1521_c7_157d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1518_c7_e67b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1518_c7_e67b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1518_c7_e67b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1518_c7_e67b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1518_c7_e67b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1518_c7_e67b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1518_c7_e67b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1518_c7_e67b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1518_c7_e67b_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1518_c7_e67b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1521_c7_157d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1518_c7_e67b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1521_c7_157d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1513_c2_c1f0_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1518_c7_e67b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1513_c2_c1f0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1518_c7_e67b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1513_c2_c1f0_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1518_c7_e67b_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1513_c2_c1f0_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1513_c2_c1f0_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1518_c7_e67b_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1518_c7_e67b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1518_c7_e67b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1518_c7_e67b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1518_c7_e67b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1518_c7_e67b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1518_c7_e67b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1518_c7_e67b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1518_c7_e67b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1518_c7_e67b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1518_c7_e67b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1518_c7_e67b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1518_c7_e67b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1518_c7_e67b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1518_c7_e67b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1518_c7_e67b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1518_c7_e67b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1518_c7_e67b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1518_c7_e67b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1513_c2_c1f0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1513_c2_c1f0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1513_c2_c1f0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1513_c2_c1f0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1513_c2_c1f0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1513_c2_c1f0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1513_c2_c1f0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1513_c2_c1f0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1513_c2_c1f0_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1513_c2_c1f0] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1513_c2_c1f0_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1513_c2_c1f0_cond;
     tmp8_MUX_uxn_opcodes_h_l1513_c2_c1f0_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1513_c2_c1f0_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1513_c2_c1f0_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1513_c2_c1f0_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1513_c2_c1f0_return_output := tmp8_MUX_uxn_opcodes_h_l1513_c2_c1f0_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1513_c2_c1f0] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1513_c2_c1f0_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1513_c2_c1f0_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1513_c2_c1f0_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1513_c2_c1f0_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1513_c2_c1f0_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1513_c2_c1f0_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1513_c2_c1f0_return_output := result_stack_value_MUX_uxn_opcodes_h_l1513_c2_c1f0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1513_c2_c1f0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1513_c2_c1f0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1513_c2_c1f0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1513_c2_c1f0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1513_c2_c1f0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1513_c2_c1f0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1513_c2_c1f0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1513_c2_c1f0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1513_c2_c1f0_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1513_c2_c1f0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1518_c7_e67b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1513_c2_c1f0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1518_c7_e67b_return_output;
     REG_VAR_tmp8 := VAR_tmp8_MUX_uxn_opcodes_h_l1513_c2_c1f0_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1513_c2_c1f0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1513_c2_c1f0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1513_c2_c1f0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1513_c2_c1f0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1513_c2_c1f0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1513_c2_c1f0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1513_c2_c1f0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1513_c2_c1f0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1513_c2_c1f0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1513_c2_c1f0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1513_c2_c1f0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1513_c2_c1f0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1513_c2_c1f0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1513_c2_c1f0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1513_c2_c1f0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1513_c2_c1f0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1513_c2_c1f0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1513_c2_c1f0_return_output;

     -- Submodule level 9
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_5b20_uxn_opcodes_h_l1550_l1508_DUPLICATE_5d66 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5b20_uxn_opcodes_h_l1550_l1508_DUPLICATE_5d66_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_5b20(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1513_c2_c1f0_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1513_c2_c1f0_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1513_c2_c1f0_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1513_c2_c1f0_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1513_c2_c1f0_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1513_c2_c1f0_return_output,
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1513_c2_c1f0_return_output);

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5b20_uxn_opcodes_h_l1550_l1508_DUPLICATE_5d66_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5b20_uxn_opcodes_h_l1550_l1508_DUPLICATE_5d66_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_tmp8 <= REG_VAR_tmp8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     tmp8 <= REG_COMB_tmp8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
