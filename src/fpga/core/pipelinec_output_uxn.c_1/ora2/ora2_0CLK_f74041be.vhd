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
-- Submodules: 79
entity ora2_0CLK_f74041be is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end ora2_0CLK_f74041be;
architecture arch of ora2_0CLK_f74041be is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal n16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal tmp16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_n16 : unsigned(15 downto 0);
signal REG_COMB_tmp16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l988_c6_662e]
signal BIN_OP_EQ_uxn_opcodes_h_l988_c6_662e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l988_c6_662e_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l988_c6_662e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l988_c1_8281]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l988_c1_8281_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l988_c1_8281_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l988_c1_8281_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l988_c1_8281_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l988_c2_d89f]
signal tmp16_MUX_uxn_opcodes_h_l988_c2_d89f_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l988_c2_d89f_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l988_c2_d89f_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l988_c2_d89f_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l988_c2_d89f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l988_c2_d89f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l988_c2_d89f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l988_c2_d89f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l988_c2_d89f_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l988_c2_d89f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l988_c2_d89f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l988_c2_d89f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l988_c2_d89f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l988_c2_d89f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l988_c2_d89f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c2_d89f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c2_d89f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c2_d89f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c2_d89f_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l988_c2_d89f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l988_c2_d89f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l988_c2_d89f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l988_c2_d89f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l988_c2_d89f_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l988_c2_d89f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c2_d89f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c2_d89f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c2_d89f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c2_d89f_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l988_c2_d89f]
signal result_u8_value_MUX_uxn_opcodes_h_l988_c2_d89f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l988_c2_d89f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l988_c2_d89f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l988_c2_d89f_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l988_c2_d89f]
signal t16_MUX_uxn_opcodes_h_l988_c2_d89f_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l988_c2_d89f_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l988_c2_d89f_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l988_c2_d89f_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l988_c2_d89f]
signal n16_MUX_uxn_opcodes_h_l988_c2_d89f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l988_c2_d89f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l988_c2_d89f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l988_c2_d89f_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l989_c3_b20d[uxn_opcodes_h_l989_c3_b20d]
signal printf_uxn_opcodes_h_l989_c3_b20d_uxn_opcodes_h_l989_c3_b20d_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l993_c11_e06b]
signal BIN_OP_EQ_uxn_opcodes_h_l993_c11_e06b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l993_c11_e06b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l993_c11_e06b_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l993_c7_c753]
signal tmp16_MUX_uxn_opcodes_h_l993_c7_c753_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l993_c7_c753_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l993_c7_c753_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l993_c7_c753_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l993_c7_c753]
signal result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_c753_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_c753_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_c753_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_c753_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l993_c7_c753]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l993_c7_c753_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l993_c7_c753_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l993_c7_c753_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l993_c7_c753_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l993_c7_c753]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_c753_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_c753_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_c753_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_c753_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l993_c7_c753]
signal result_is_stack_write_MUX_uxn_opcodes_h_l993_c7_c753_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l993_c7_c753_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l993_c7_c753_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l993_c7_c753_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l993_c7_c753]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_c753_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_c753_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_c753_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_c753_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l993_c7_c753]
signal result_u8_value_MUX_uxn_opcodes_h_l993_c7_c753_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l993_c7_c753_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l993_c7_c753_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l993_c7_c753_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l993_c7_c753]
signal t16_MUX_uxn_opcodes_h_l993_c7_c753_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l993_c7_c753_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l993_c7_c753_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l993_c7_c753_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l993_c7_c753]
signal n16_MUX_uxn_opcodes_h_l993_c7_c753_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l993_c7_c753_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l993_c7_c753_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l993_c7_c753_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l996_c11_a397]
signal BIN_OP_EQ_uxn_opcodes_h_l996_c11_a397_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l996_c11_a397_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l996_c11_a397_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l996_c7_49c0]
signal tmp16_MUX_uxn_opcodes_h_l996_c7_49c0_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l996_c7_49c0_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l996_c7_49c0_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l996_c7_49c0_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l996_c7_49c0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_49c0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_49c0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_49c0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_49c0_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l996_c7_49c0]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_49c0_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_49c0_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_49c0_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_49c0_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l996_c7_49c0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_49c0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_49c0_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_49c0_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_49c0_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l996_c7_49c0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_49c0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_49c0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_49c0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_49c0_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l996_c7_49c0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_49c0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_49c0_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_49c0_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_49c0_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l996_c7_49c0]
signal result_u8_value_MUX_uxn_opcodes_h_l996_c7_49c0_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l996_c7_49c0_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l996_c7_49c0_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l996_c7_49c0_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l996_c7_49c0]
signal t16_MUX_uxn_opcodes_h_l996_c7_49c0_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l996_c7_49c0_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l996_c7_49c0_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l996_c7_49c0_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l996_c7_49c0]
signal n16_MUX_uxn_opcodes_h_l996_c7_49c0_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l996_c7_49c0_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l996_c7_49c0_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l996_c7_49c0_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1001_c11_7853]
signal BIN_OP_EQ_uxn_opcodes_h_l1001_c11_7853_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1001_c11_7853_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1001_c11_7853_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1001_c7_ed92]
signal tmp16_MUX_uxn_opcodes_h_l1001_c7_ed92_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1001_c7_ed92_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1001_c7_ed92_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1001_c7_ed92_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1001_c7_ed92]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_ed92_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_ed92_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_ed92_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_ed92_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1001_c7_ed92]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_ed92_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_ed92_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_ed92_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_ed92_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1001_c7_ed92]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_ed92_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_ed92_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_ed92_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_ed92_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1001_c7_ed92]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_ed92_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_ed92_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_ed92_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_ed92_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1001_c7_ed92]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_ed92_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_ed92_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_ed92_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_ed92_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1001_c7_ed92]
signal result_u8_value_MUX_uxn_opcodes_h_l1001_c7_ed92_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1001_c7_ed92_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1001_c7_ed92_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1001_c7_ed92_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1001_c7_ed92]
signal t16_MUX_uxn_opcodes_h_l1001_c7_ed92_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1001_c7_ed92_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1001_c7_ed92_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1001_c7_ed92_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1001_c7_ed92]
signal n16_MUX_uxn_opcodes_h_l1001_c7_ed92_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1001_c7_ed92_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1001_c7_ed92_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1001_c7_ed92_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1002_c3_6dec]
signal BIN_OP_OR_uxn_opcodes_h_l1002_c3_6dec_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1002_c3_6dec_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1002_c3_6dec_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1005_c11_2218]
signal BIN_OP_EQ_uxn_opcodes_h_l1005_c11_2218_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1005_c11_2218_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1005_c11_2218_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1005_c7_bb11]
signal tmp16_MUX_uxn_opcodes_h_l1005_c7_bb11_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1005_c7_bb11_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1005_c7_bb11_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1005_c7_bb11_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1005_c7_bb11]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1005_c7_bb11_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1005_c7_bb11_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1005_c7_bb11_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1005_c7_bb11_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1005_c7_bb11]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1005_c7_bb11_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1005_c7_bb11_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1005_c7_bb11_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1005_c7_bb11_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1005_c7_bb11]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1005_c7_bb11_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1005_c7_bb11_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1005_c7_bb11_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1005_c7_bb11_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1005_c7_bb11]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1005_c7_bb11_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1005_c7_bb11_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1005_c7_bb11_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1005_c7_bb11_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1005_c7_bb11]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1005_c7_bb11_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1005_c7_bb11_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1005_c7_bb11_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1005_c7_bb11_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1005_c7_bb11]
signal result_u8_value_MUX_uxn_opcodes_h_l1005_c7_bb11_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1005_c7_bb11_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1005_c7_bb11_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1005_c7_bb11_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l1005_c7_bb11]
signal n16_MUX_uxn_opcodes_h_l1005_c7_bb11_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1005_c7_bb11_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1005_c7_bb11_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1005_c7_bb11_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1009_c11_9527]
signal BIN_OP_EQ_uxn_opcodes_h_l1009_c11_9527_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1009_c11_9527_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1009_c11_9527_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1009_c7_a786]
signal tmp16_MUX_uxn_opcodes_h_l1009_c7_a786_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1009_c7_a786_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1009_c7_a786_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1009_c7_a786_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1009_c7_a786]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1009_c7_a786_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1009_c7_a786_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1009_c7_a786_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1009_c7_a786_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1009_c7_a786]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1009_c7_a786_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1009_c7_a786_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1009_c7_a786_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1009_c7_a786_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1009_c7_a786]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1009_c7_a786_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1009_c7_a786_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1009_c7_a786_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1009_c7_a786_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1009_c7_a786]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1009_c7_a786_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1009_c7_a786_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1009_c7_a786_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1009_c7_a786_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1009_c7_a786]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1009_c7_a786_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1009_c7_a786_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1009_c7_a786_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1009_c7_a786_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1009_c7_a786]
signal result_u8_value_MUX_uxn_opcodes_h_l1009_c7_a786_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1009_c7_a786_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1009_c7_a786_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1009_c7_a786_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l1009_c7_a786]
signal n16_MUX_uxn_opcodes_h_l1009_c7_a786_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1009_c7_a786_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1009_c7_a786_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1009_c7_a786_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1010_c3_433b]
signal BIN_OP_OR_uxn_opcodes_h_l1010_c3_433b_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1010_c3_433b_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1010_c3_433b_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1011_c11_2b8b]
signal BIN_OP_OR_uxn_opcodes_h_l1011_c11_2b8b_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1011_c11_2b8b_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1011_c11_2b8b_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1013_c30_77f3]
signal sp_relative_shift_uxn_opcodes_h_l1013_c30_77f3_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1013_c30_77f3_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1013_c30_77f3_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1013_c30_77f3_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1018_c11_d4ce]
signal BIN_OP_EQ_uxn_opcodes_h_l1018_c11_d4ce_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1018_c11_d4ce_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1018_c11_d4ce_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1018_c7_4ac4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1018_c7_4ac4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1018_c7_4ac4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1018_c7_4ac4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1018_c7_4ac4_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1018_c7_4ac4]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1018_c7_4ac4_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1018_c7_4ac4_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1018_c7_4ac4_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1018_c7_4ac4_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1018_c7_4ac4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1018_c7_4ac4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1018_c7_4ac4_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1018_c7_4ac4_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1018_c7_4ac4_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1018_c7_4ac4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1018_c7_4ac4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1018_c7_4ac4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1018_c7_4ac4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1018_c7_4ac4_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1018_c7_4ac4]
signal result_u8_value_MUX_uxn_opcodes_h_l1018_c7_4ac4_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1018_c7_4ac4_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1018_c7_4ac4_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1018_c7_4ac4_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1021_c31_6ee9]
signal CONST_SR_8_uxn_opcodes_h_l1021_c31_6ee9_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1021_c31_6ee9_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1023_c11_bd93]
signal BIN_OP_EQ_uxn_opcodes_h_l1023_c11_bd93_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1023_c11_bd93_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1023_c11_bd93_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1023_c7_a90f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_a90f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_a90f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_a90f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_a90f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1023_c7_a90f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_a90f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_a90f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_a90f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_a90f_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1007_l998_DUPLICATE_84cb
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1007_l998_DUPLICATE_84cb_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1007_l998_DUPLICATE_84cb_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_8c29( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : signed;
 ref_toks_6 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_opc_done := ref_toks_1;
      base.is_sp_shift := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.u8_value := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l988_c6_662e
BIN_OP_EQ_uxn_opcodes_h_l988_c6_662e : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l988_c6_662e_left,
BIN_OP_EQ_uxn_opcodes_h_l988_c6_662e_right,
BIN_OP_EQ_uxn_opcodes_h_l988_c6_662e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l988_c1_8281
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l988_c1_8281 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l988_c1_8281_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l988_c1_8281_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l988_c1_8281_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l988_c1_8281_return_output);

-- tmp16_MUX_uxn_opcodes_h_l988_c2_d89f
tmp16_MUX_uxn_opcodes_h_l988_c2_d89f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l988_c2_d89f_cond,
tmp16_MUX_uxn_opcodes_h_l988_c2_d89f_iftrue,
tmp16_MUX_uxn_opcodes_h_l988_c2_d89f_iffalse,
tmp16_MUX_uxn_opcodes_h_l988_c2_d89f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l988_c2_d89f
result_is_opc_done_MUX_uxn_opcodes_h_l988_c2_d89f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l988_c2_d89f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l988_c2_d89f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l988_c2_d89f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l988_c2_d89f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l988_c2_d89f
result_is_sp_shift_MUX_uxn_opcodes_h_l988_c2_d89f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l988_c2_d89f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l988_c2_d89f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l988_c2_d89f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l988_c2_d89f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c2_d89f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c2_d89f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c2_d89f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c2_d89f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c2_d89f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c2_d89f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l988_c2_d89f
result_is_stack_write_MUX_uxn_opcodes_h_l988_c2_d89f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l988_c2_d89f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l988_c2_d89f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l988_c2_d89f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l988_c2_d89f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c2_d89f
result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c2_d89f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c2_d89f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c2_d89f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c2_d89f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c2_d89f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l988_c2_d89f
result_u8_value_MUX_uxn_opcodes_h_l988_c2_d89f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l988_c2_d89f_cond,
result_u8_value_MUX_uxn_opcodes_h_l988_c2_d89f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l988_c2_d89f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l988_c2_d89f_return_output);

-- t16_MUX_uxn_opcodes_h_l988_c2_d89f
t16_MUX_uxn_opcodes_h_l988_c2_d89f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l988_c2_d89f_cond,
t16_MUX_uxn_opcodes_h_l988_c2_d89f_iftrue,
t16_MUX_uxn_opcodes_h_l988_c2_d89f_iffalse,
t16_MUX_uxn_opcodes_h_l988_c2_d89f_return_output);

-- n16_MUX_uxn_opcodes_h_l988_c2_d89f
n16_MUX_uxn_opcodes_h_l988_c2_d89f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l988_c2_d89f_cond,
n16_MUX_uxn_opcodes_h_l988_c2_d89f_iftrue,
n16_MUX_uxn_opcodes_h_l988_c2_d89f_iffalse,
n16_MUX_uxn_opcodes_h_l988_c2_d89f_return_output);

-- printf_uxn_opcodes_h_l989_c3_b20d_uxn_opcodes_h_l989_c3_b20d
printf_uxn_opcodes_h_l989_c3_b20d_uxn_opcodes_h_l989_c3_b20d : entity work.printf_uxn_opcodes_h_l989_c3_b20d_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l989_c3_b20d_uxn_opcodes_h_l989_c3_b20d_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l993_c11_e06b
BIN_OP_EQ_uxn_opcodes_h_l993_c11_e06b : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l993_c11_e06b_left,
BIN_OP_EQ_uxn_opcodes_h_l993_c11_e06b_right,
BIN_OP_EQ_uxn_opcodes_h_l993_c11_e06b_return_output);

-- tmp16_MUX_uxn_opcodes_h_l993_c7_c753
tmp16_MUX_uxn_opcodes_h_l993_c7_c753 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l993_c7_c753_cond,
tmp16_MUX_uxn_opcodes_h_l993_c7_c753_iftrue,
tmp16_MUX_uxn_opcodes_h_l993_c7_c753_iffalse,
tmp16_MUX_uxn_opcodes_h_l993_c7_c753_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_c753
result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_c753 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_c753_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_c753_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_c753_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_c753_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l993_c7_c753
result_is_sp_shift_MUX_uxn_opcodes_h_l993_c7_c753 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l993_c7_c753_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l993_c7_c753_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l993_c7_c753_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l993_c7_c753_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_c753
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_c753 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_c753_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_c753_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_c753_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_c753_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l993_c7_c753
result_is_stack_write_MUX_uxn_opcodes_h_l993_c7_c753 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l993_c7_c753_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l993_c7_c753_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l993_c7_c753_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l993_c7_c753_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_c753
result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_c753 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_c753_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_c753_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_c753_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_c753_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l993_c7_c753
result_u8_value_MUX_uxn_opcodes_h_l993_c7_c753 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l993_c7_c753_cond,
result_u8_value_MUX_uxn_opcodes_h_l993_c7_c753_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l993_c7_c753_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l993_c7_c753_return_output);

-- t16_MUX_uxn_opcodes_h_l993_c7_c753
t16_MUX_uxn_opcodes_h_l993_c7_c753 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l993_c7_c753_cond,
t16_MUX_uxn_opcodes_h_l993_c7_c753_iftrue,
t16_MUX_uxn_opcodes_h_l993_c7_c753_iffalse,
t16_MUX_uxn_opcodes_h_l993_c7_c753_return_output);

-- n16_MUX_uxn_opcodes_h_l993_c7_c753
n16_MUX_uxn_opcodes_h_l993_c7_c753 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l993_c7_c753_cond,
n16_MUX_uxn_opcodes_h_l993_c7_c753_iftrue,
n16_MUX_uxn_opcodes_h_l993_c7_c753_iffalse,
n16_MUX_uxn_opcodes_h_l993_c7_c753_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l996_c11_a397
BIN_OP_EQ_uxn_opcodes_h_l996_c11_a397 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l996_c11_a397_left,
BIN_OP_EQ_uxn_opcodes_h_l996_c11_a397_right,
BIN_OP_EQ_uxn_opcodes_h_l996_c11_a397_return_output);

-- tmp16_MUX_uxn_opcodes_h_l996_c7_49c0
tmp16_MUX_uxn_opcodes_h_l996_c7_49c0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l996_c7_49c0_cond,
tmp16_MUX_uxn_opcodes_h_l996_c7_49c0_iftrue,
tmp16_MUX_uxn_opcodes_h_l996_c7_49c0_iffalse,
tmp16_MUX_uxn_opcodes_h_l996_c7_49c0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_49c0
result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_49c0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_49c0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_49c0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_49c0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_49c0_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_49c0
result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_49c0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_49c0_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_49c0_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_49c0_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_49c0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_49c0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_49c0 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_49c0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_49c0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_49c0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_49c0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_49c0
result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_49c0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_49c0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_49c0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_49c0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_49c0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_49c0
result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_49c0 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_49c0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_49c0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_49c0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_49c0_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l996_c7_49c0
result_u8_value_MUX_uxn_opcodes_h_l996_c7_49c0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l996_c7_49c0_cond,
result_u8_value_MUX_uxn_opcodes_h_l996_c7_49c0_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l996_c7_49c0_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l996_c7_49c0_return_output);

-- t16_MUX_uxn_opcodes_h_l996_c7_49c0
t16_MUX_uxn_opcodes_h_l996_c7_49c0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l996_c7_49c0_cond,
t16_MUX_uxn_opcodes_h_l996_c7_49c0_iftrue,
t16_MUX_uxn_opcodes_h_l996_c7_49c0_iffalse,
t16_MUX_uxn_opcodes_h_l996_c7_49c0_return_output);

-- n16_MUX_uxn_opcodes_h_l996_c7_49c0
n16_MUX_uxn_opcodes_h_l996_c7_49c0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l996_c7_49c0_cond,
n16_MUX_uxn_opcodes_h_l996_c7_49c0_iftrue,
n16_MUX_uxn_opcodes_h_l996_c7_49c0_iffalse,
n16_MUX_uxn_opcodes_h_l996_c7_49c0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1001_c11_7853
BIN_OP_EQ_uxn_opcodes_h_l1001_c11_7853 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1001_c11_7853_left,
BIN_OP_EQ_uxn_opcodes_h_l1001_c11_7853_right,
BIN_OP_EQ_uxn_opcodes_h_l1001_c11_7853_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1001_c7_ed92
tmp16_MUX_uxn_opcodes_h_l1001_c7_ed92 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1001_c7_ed92_cond,
tmp16_MUX_uxn_opcodes_h_l1001_c7_ed92_iftrue,
tmp16_MUX_uxn_opcodes_h_l1001_c7_ed92_iffalse,
tmp16_MUX_uxn_opcodes_h_l1001_c7_ed92_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_ed92
result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_ed92 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_ed92_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_ed92_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_ed92_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_ed92_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_ed92
result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_ed92 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_ed92_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_ed92_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_ed92_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_ed92_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_ed92
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_ed92 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_ed92_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_ed92_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_ed92_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_ed92_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_ed92
result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_ed92 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_ed92_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_ed92_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_ed92_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_ed92_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_ed92
result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_ed92 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_ed92_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_ed92_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_ed92_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_ed92_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1001_c7_ed92
result_u8_value_MUX_uxn_opcodes_h_l1001_c7_ed92 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1001_c7_ed92_cond,
result_u8_value_MUX_uxn_opcodes_h_l1001_c7_ed92_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1001_c7_ed92_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1001_c7_ed92_return_output);

-- t16_MUX_uxn_opcodes_h_l1001_c7_ed92
t16_MUX_uxn_opcodes_h_l1001_c7_ed92 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1001_c7_ed92_cond,
t16_MUX_uxn_opcodes_h_l1001_c7_ed92_iftrue,
t16_MUX_uxn_opcodes_h_l1001_c7_ed92_iffalse,
t16_MUX_uxn_opcodes_h_l1001_c7_ed92_return_output);

-- n16_MUX_uxn_opcodes_h_l1001_c7_ed92
n16_MUX_uxn_opcodes_h_l1001_c7_ed92 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1001_c7_ed92_cond,
n16_MUX_uxn_opcodes_h_l1001_c7_ed92_iftrue,
n16_MUX_uxn_opcodes_h_l1001_c7_ed92_iffalse,
n16_MUX_uxn_opcodes_h_l1001_c7_ed92_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1002_c3_6dec
BIN_OP_OR_uxn_opcodes_h_l1002_c3_6dec : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1002_c3_6dec_left,
BIN_OP_OR_uxn_opcodes_h_l1002_c3_6dec_right,
BIN_OP_OR_uxn_opcodes_h_l1002_c3_6dec_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1005_c11_2218
BIN_OP_EQ_uxn_opcodes_h_l1005_c11_2218 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1005_c11_2218_left,
BIN_OP_EQ_uxn_opcodes_h_l1005_c11_2218_right,
BIN_OP_EQ_uxn_opcodes_h_l1005_c11_2218_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1005_c7_bb11
tmp16_MUX_uxn_opcodes_h_l1005_c7_bb11 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1005_c7_bb11_cond,
tmp16_MUX_uxn_opcodes_h_l1005_c7_bb11_iftrue,
tmp16_MUX_uxn_opcodes_h_l1005_c7_bb11_iffalse,
tmp16_MUX_uxn_opcodes_h_l1005_c7_bb11_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1005_c7_bb11
result_is_opc_done_MUX_uxn_opcodes_h_l1005_c7_bb11 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1005_c7_bb11_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1005_c7_bb11_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1005_c7_bb11_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1005_c7_bb11_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1005_c7_bb11
result_is_sp_shift_MUX_uxn_opcodes_h_l1005_c7_bb11 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1005_c7_bb11_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1005_c7_bb11_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1005_c7_bb11_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1005_c7_bb11_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1005_c7_bb11
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1005_c7_bb11 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1005_c7_bb11_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1005_c7_bb11_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1005_c7_bb11_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1005_c7_bb11_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1005_c7_bb11
result_is_stack_write_MUX_uxn_opcodes_h_l1005_c7_bb11 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1005_c7_bb11_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1005_c7_bb11_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1005_c7_bb11_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1005_c7_bb11_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1005_c7_bb11
result_sp_relative_shift_MUX_uxn_opcodes_h_l1005_c7_bb11 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1005_c7_bb11_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1005_c7_bb11_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1005_c7_bb11_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1005_c7_bb11_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1005_c7_bb11
result_u8_value_MUX_uxn_opcodes_h_l1005_c7_bb11 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1005_c7_bb11_cond,
result_u8_value_MUX_uxn_opcodes_h_l1005_c7_bb11_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1005_c7_bb11_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1005_c7_bb11_return_output);

-- n16_MUX_uxn_opcodes_h_l1005_c7_bb11
n16_MUX_uxn_opcodes_h_l1005_c7_bb11 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1005_c7_bb11_cond,
n16_MUX_uxn_opcodes_h_l1005_c7_bb11_iftrue,
n16_MUX_uxn_opcodes_h_l1005_c7_bb11_iffalse,
n16_MUX_uxn_opcodes_h_l1005_c7_bb11_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1009_c11_9527
BIN_OP_EQ_uxn_opcodes_h_l1009_c11_9527 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1009_c11_9527_left,
BIN_OP_EQ_uxn_opcodes_h_l1009_c11_9527_right,
BIN_OP_EQ_uxn_opcodes_h_l1009_c11_9527_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1009_c7_a786
tmp16_MUX_uxn_opcodes_h_l1009_c7_a786 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1009_c7_a786_cond,
tmp16_MUX_uxn_opcodes_h_l1009_c7_a786_iftrue,
tmp16_MUX_uxn_opcodes_h_l1009_c7_a786_iffalse,
tmp16_MUX_uxn_opcodes_h_l1009_c7_a786_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1009_c7_a786
result_is_opc_done_MUX_uxn_opcodes_h_l1009_c7_a786 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1009_c7_a786_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1009_c7_a786_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1009_c7_a786_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1009_c7_a786_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1009_c7_a786
result_is_sp_shift_MUX_uxn_opcodes_h_l1009_c7_a786 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1009_c7_a786_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1009_c7_a786_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1009_c7_a786_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1009_c7_a786_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1009_c7_a786
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1009_c7_a786 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1009_c7_a786_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1009_c7_a786_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1009_c7_a786_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1009_c7_a786_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1009_c7_a786
result_is_stack_write_MUX_uxn_opcodes_h_l1009_c7_a786 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1009_c7_a786_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1009_c7_a786_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1009_c7_a786_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1009_c7_a786_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1009_c7_a786
result_sp_relative_shift_MUX_uxn_opcodes_h_l1009_c7_a786 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1009_c7_a786_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1009_c7_a786_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1009_c7_a786_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1009_c7_a786_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1009_c7_a786
result_u8_value_MUX_uxn_opcodes_h_l1009_c7_a786 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1009_c7_a786_cond,
result_u8_value_MUX_uxn_opcodes_h_l1009_c7_a786_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1009_c7_a786_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1009_c7_a786_return_output);

-- n16_MUX_uxn_opcodes_h_l1009_c7_a786
n16_MUX_uxn_opcodes_h_l1009_c7_a786 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1009_c7_a786_cond,
n16_MUX_uxn_opcodes_h_l1009_c7_a786_iftrue,
n16_MUX_uxn_opcodes_h_l1009_c7_a786_iffalse,
n16_MUX_uxn_opcodes_h_l1009_c7_a786_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1010_c3_433b
BIN_OP_OR_uxn_opcodes_h_l1010_c3_433b : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1010_c3_433b_left,
BIN_OP_OR_uxn_opcodes_h_l1010_c3_433b_right,
BIN_OP_OR_uxn_opcodes_h_l1010_c3_433b_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1011_c11_2b8b
BIN_OP_OR_uxn_opcodes_h_l1011_c11_2b8b : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1011_c11_2b8b_left,
BIN_OP_OR_uxn_opcodes_h_l1011_c11_2b8b_right,
BIN_OP_OR_uxn_opcodes_h_l1011_c11_2b8b_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1013_c30_77f3
sp_relative_shift_uxn_opcodes_h_l1013_c30_77f3 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1013_c30_77f3_ins,
sp_relative_shift_uxn_opcodes_h_l1013_c30_77f3_x,
sp_relative_shift_uxn_opcodes_h_l1013_c30_77f3_y,
sp_relative_shift_uxn_opcodes_h_l1013_c30_77f3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1018_c11_d4ce
BIN_OP_EQ_uxn_opcodes_h_l1018_c11_d4ce : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1018_c11_d4ce_left,
BIN_OP_EQ_uxn_opcodes_h_l1018_c11_d4ce_right,
BIN_OP_EQ_uxn_opcodes_h_l1018_c11_d4ce_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1018_c7_4ac4
result_is_opc_done_MUX_uxn_opcodes_h_l1018_c7_4ac4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1018_c7_4ac4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1018_c7_4ac4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1018_c7_4ac4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1018_c7_4ac4_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1018_c7_4ac4
result_is_sp_shift_MUX_uxn_opcodes_h_l1018_c7_4ac4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1018_c7_4ac4_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1018_c7_4ac4_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1018_c7_4ac4_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1018_c7_4ac4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1018_c7_4ac4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1018_c7_4ac4 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1018_c7_4ac4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1018_c7_4ac4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1018_c7_4ac4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1018_c7_4ac4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1018_c7_4ac4
result_is_stack_write_MUX_uxn_opcodes_h_l1018_c7_4ac4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1018_c7_4ac4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1018_c7_4ac4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1018_c7_4ac4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1018_c7_4ac4_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1018_c7_4ac4
result_u8_value_MUX_uxn_opcodes_h_l1018_c7_4ac4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1018_c7_4ac4_cond,
result_u8_value_MUX_uxn_opcodes_h_l1018_c7_4ac4_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1018_c7_4ac4_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1018_c7_4ac4_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1021_c31_6ee9
CONST_SR_8_uxn_opcodes_h_l1021_c31_6ee9 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1021_c31_6ee9_x,
CONST_SR_8_uxn_opcodes_h_l1021_c31_6ee9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1023_c11_bd93
BIN_OP_EQ_uxn_opcodes_h_l1023_c11_bd93 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1023_c11_bd93_left,
BIN_OP_EQ_uxn_opcodes_h_l1023_c11_bd93_right,
BIN_OP_EQ_uxn_opcodes_h_l1023_c11_bd93_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_a90f
result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_a90f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_a90f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_a90f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_a90f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_a90f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_a90f
result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_a90f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_a90f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_a90f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_a90f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_a90f_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1007_l998_DUPLICATE_84cb
CONST_SL_8_uint16_t_uxn_opcodes_h_l1007_l998_DUPLICATE_84cb : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1007_l998_DUPLICATE_84cb_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1007_l998_DUPLICATE_84cb_return_output);



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
 tmp16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l988_c6_662e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l988_c1_8281_return_output,
 tmp16_MUX_uxn_opcodes_h_l988_c2_d89f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l988_c2_d89f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l988_c2_d89f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c2_d89f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l988_c2_d89f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c2_d89f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l988_c2_d89f_return_output,
 t16_MUX_uxn_opcodes_h_l988_c2_d89f_return_output,
 n16_MUX_uxn_opcodes_h_l988_c2_d89f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l993_c11_e06b_return_output,
 tmp16_MUX_uxn_opcodes_h_l993_c7_c753_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_c753_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l993_c7_c753_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_c753_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l993_c7_c753_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_c753_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l993_c7_c753_return_output,
 t16_MUX_uxn_opcodes_h_l993_c7_c753_return_output,
 n16_MUX_uxn_opcodes_h_l993_c7_c753_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l996_c11_a397_return_output,
 tmp16_MUX_uxn_opcodes_h_l996_c7_49c0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_49c0_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_49c0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_49c0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_49c0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_49c0_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l996_c7_49c0_return_output,
 t16_MUX_uxn_opcodes_h_l996_c7_49c0_return_output,
 n16_MUX_uxn_opcodes_h_l996_c7_49c0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1001_c11_7853_return_output,
 tmp16_MUX_uxn_opcodes_h_l1001_c7_ed92_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_ed92_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_ed92_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_ed92_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_ed92_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_ed92_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1001_c7_ed92_return_output,
 t16_MUX_uxn_opcodes_h_l1001_c7_ed92_return_output,
 n16_MUX_uxn_opcodes_h_l1001_c7_ed92_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1002_c3_6dec_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1005_c11_2218_return_output,
 tmp16_MUX_uxn_opcodes_h_l1005_c7_bb11_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1005_c7_bb11_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1005_c7_bb11_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1005_c7_bb11_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1005_c7_bb11_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1005_c7_bb11_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1005_c7_bb11_return_output,
 n16_MUX_uxn_opcodes_h_l1005_c7_bb11_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1009_c11_9527_return_output,
 tmp16_MUX_uxn_opcodes_h_l1009_c7_a786_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1009_c7_a786_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1009_c7_a786_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1009_c7_a786_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1009_c7_a786_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1009_c7_a786_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1009_c7_a786_return_output,
 n16_MUX_uxn_opcodes_h_l1009_c7_a786_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1010_c3_433b_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1011_c11_2b8b_return_output,
 sp_relative_shift_uxn_opcodes_h_l1013_c30_77f3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1018_c11_d4ce_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1018_c7_4ac4_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1018_c7_4ac4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1018_c7_4ac4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1018_c7_4ac4_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1018_c7_4ac4_return_output,
 CONST_SR_8_uxn_opcodes_h_l1021_c31_6ee9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1023_c11_bd93_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_a90f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_a90f_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1007_l998_DUPLICATE_84cb_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c6_662e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c6_662e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c6_662e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l988_c1_8281_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l988_c1_8281_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l988_c1_8281_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l988_c1_8281_iffalse : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l988_c2_d89f_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l988_c2_d89f_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l993_c7_c753_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l988_c2_d89f_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l988_c2_d89f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l988_c2_d89f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l988_c2_d89f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_c753_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l988_c2_d89f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l988_c2_d89f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l988_c2_d89f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l988_c2_d89f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l993_c7_c753_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l988_c2_d89f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l988_c2_d89f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c2_d89f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l990_c3_02ca : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c2_d89f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_c753_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c2_d89f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c2_d89f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l988_c2_d89f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l988_c2_d89f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l993_c7_c753_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l988_c2_d89f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l988_c2_d89f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c2_d89f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c2_d89f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_c753_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c2_d89f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c2_d89f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l988_c2_d89f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l988_c2_d89f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l993_c7_c753_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l988_c2_d89f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l988_c2_d89f_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l988_c2_d89f_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l988_c2_d89f_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l993_c7_c753_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l988_c2_d89f_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l988_c2_d89f_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l988_c2_d89f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l988_c2_d89f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l993_c7_c753_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l988_c2_d89f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l988_c2_d89f_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l989_c3_b20d_uxn_opcodes_h_l989_c3_b20d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l993_c11_e06b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l993_c11_e06b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l993_c11_e06b_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l993_c7_c753_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l993_c7_c753_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l996_c7_49c0_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l993_c7_c753_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_c753_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_c753_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_49c0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_c753_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l993_c7_c753_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l993_c7_c753_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_49c0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l993_c7_c753_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_c753_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l994_c3_185d : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_c753_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_49c0_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_c753_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l993_c7_c753_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l993_c7_c753_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_49c0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l993_c7_c753_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_c753_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_c753_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_49c0_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_c753_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l993_c7_c753_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l993_c7_c753_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l996_c7_49c0_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l993_c7_c753_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l993_c7_c753_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l993_c7_c753_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l996_c7_49c0_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l993_c7_c753_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l993_c7_c753_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l993_c7_c753_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l996_c7_49c0_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l993_c7_c753_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l996_c11_a397_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l996_c11_a397_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l996_c11_a397_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l996_c7_49c0_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l996_c7_49c0_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1001_c7_ed92_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l996_c7_49c0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_49c0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_49c0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_ed92_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_49c0_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_49c0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_49c0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_ed92_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_49c0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_49c0_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l999_c3_bdbd : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_49c0_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_ed92_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_49c0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_49c0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_49c0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_ed92_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_49c0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_49c0_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_49c0_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_ed92_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_49c0_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l996_c7_49c0_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l996_c7_49c0_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1001_c7_ed92_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l996_c7_49c0_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l996_c7_49c0_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l996_c7_49c0_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1001_c7_ed92_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l996_c7_49c0_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l996_c7_49c0_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l996_c7_49c0_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1001_c7_ed92_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l996_c7_49c0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_7853_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_7853_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_7853_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1001_c7_ed92_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1001_c7_ed92_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1005_c7_bb11_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1001_c7_ed92_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_ed92_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_ed92_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1005_c7_bb11_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_ed92_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_ed92_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_ed92_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1005_c7_bb11_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_ed92_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_ed92_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1003_c3_ce06 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_ed92_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1005_c7_bb11_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_ed92_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_ed92_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_ed92_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1005_c7_bb11_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_ed92_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_ed92_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_ed92_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1005_c7_bb11_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_ed92_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1001_c7_ed92_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1001_c7_ed92_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1005_c7_bb11_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1001_c7_ed92_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1001_c7_ed92_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1001_c7_ed92_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1001_c7_ed92_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1001_c7_ed92_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1001_c7_ed92_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1005_c7_bb11_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1001_c7_ed92_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1002_c3_6dec_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1002_c3_6dec_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1002_c3_6dec_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_2218_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_2218_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_2218_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1005_c7_bb11_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1005_c7_bb11_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1009_c7_a786_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1005_c7_bb11_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1005_c7_bb11_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1005_c7_bb11_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1009_c7_a786_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1005_c7_bb11_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1005_c7_bb11_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1005_c7_bb11_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1009_c7_a786_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1005_c7_bb11_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1005_c7_bb11_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1005_c7_bb11_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1009_c7_a786_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1005_c7_bb11_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1005_c7_bb11_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1005_c7_bb11_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1009_c7_a786_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1005_c7_bb11_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1005_c7_bb11_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1005_c7_bb11_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1009_c7_a786_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1005_c7_bb11_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1005_c7_bb11_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1005_c7_bb11_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1009_c7_a786_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1005_c7_bb11_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1005_c7_bb11_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1005_c7_bb11_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1009_c7_a786_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1005_c7_bb11_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_9527_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_9527_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_9527_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1009_c7_a786_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1009_c7_a786_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1009_c7_a786_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1009_c7_a786_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1009_c7_a786_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1018_c7_4ac4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1009_c7_a786_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1009_c7_a786_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1009_c7_a786_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1018_c7_4ac4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1009_c7_a786_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1009_c7_a786_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1015_c3_fd48 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1009_c7_a786_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1018_c7_4ac4_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1009_c7_a786_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1009_c7_a786_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1009_c7_a786_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1018_c7_4ac4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1009_c7_a786_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1009_c7_a786_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1009_c7_a786_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1009_c7_a786_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1009_c7_a786_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1009_c7_a786_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1018_c7_4ac4_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1009_c7_a786_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1009_c7_a786_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1009_c7_a786_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1009_c7_a786_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1010_c3_433b_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1010_c3_433b_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1010_c3_433b_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1011_c11_2b8b_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1011_c11_2b8b_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1011_c11_2b8b_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1013_c30_77f3_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1013_c30_77f3_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1013_c30_77f3_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1013_c30_77f3_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1016_c21_8514_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_d4ce_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_d4ce_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_d4ce_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1018_c7_4ac4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1018_c7_4ac4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_a90f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1018_c7_4ac4_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1018_c7_4ac4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1018_c7_4ac4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1018_c7_4ac4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1018_c7_4ac4_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1020_c3_599c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1018_c7_4ac4_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1018_c7_4ac4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1018_c7_4ac4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1018_c7_4ac4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_a90f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1018_c7_4ac4_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1018_c7_4ac4_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1018_c7_4ac4_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1018_c7_4ac4_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1021_c31_6ee9_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1021_c31_6ee9_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1021_c21_9572_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_bd93_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_bd93_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_bd93_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_a90f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_a90f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_a90f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_a90f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_a90f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_a90f_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l996_l993_l988_l1018_l1005_l1001_DUPLICATE_d963_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l996_l993_l1023_l988_l1018_l1005_l1001_DUPLICATE_c3e4_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l996_l993_l988_l1009_l1005_l1001_DUPLICATE_da2d_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l996_l993_l988_l1018_l1005_l1001_DUPLICATE_faac_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l996_l993_l1023_l1018_l1009_l1005_l1001_DUPLICATE_8acd_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l997_l1006_l1010_l1002_DUPLICATE_eea6_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1007_l998_DUPLICATE_84cb_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1007_l998_DUPLICATE_84cb_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1005_l1018_DUPLICATE_8e9e_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8c29_uxn_opcodes_h_l1028_l984_DUPLICATE_022a_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_n16 : unsigned(15 downto 0);
variable REG_VAR_tmp16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_n16 := n16;
  REG_VAR_tmp16 := tmp16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l994_c3_185d := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_c753_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l994_c3_185d;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_9527_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_7853_right := to_unsigned(3, 2);
     VAR_sp_relative_shift_uxn_opcodes_h_l1013_c30_77f3_y := resize(to_signed(-2, 3), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_d4ce_right := to_unsigned(6, 3);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l988_c1_8281_iffalse := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_a90f_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_bd93_right := to_unsigned(7, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_a90f_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_2218_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l999_c3_bdbd := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_49c0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l999_c3_bdbd;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l996_c11_a397_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l993_c11_e06b_right := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1009_c7_a786_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1003_c3_ce06 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_ed92_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1003_c3_ce06;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1018_c7_4ac4_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l990_c3_02ca := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c2_d89f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l990_c3_02ca;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1020_c3_599c := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1018_c7_4ac4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1020_c3_599c;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1009_c7_a786_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1015_c3_fd48 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1009_c7_a786_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1015_c3_fd48;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l988_c2_d89f_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c6_662e_right := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1013_c30_77f3_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l988_c1_8281_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l1013_c30_77f3_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1010_c3_433b_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1001_c7_ed92_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1009_c7_a786_iffalse := n16;
     VAR_n16_MUX_uxn_opcodes_h_l988_c2_d89f_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l993_c7_c753_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l996_c7_49c0_iftrue := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_7853_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_2218_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_9527_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_d4ce_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_bd93_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c6_662e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l993_c11_e06b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l996_c11_a397_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1002_c3_6dec_left := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1011_c11_2b8b_right := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1001_c7_ed92_iffalse := t16;
     VAR_t16_MUX_uxn_opcodes_h_l988_c2_d89f_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l993_c7_c753_iftrue := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1021_c31_6ee9_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1001_c7_ed92_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1005_c7_bb11_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1009_c7_a786_iffalse := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l988_c2_d89f_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l993_c7_c753_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l996_c7_49c0_iftrue := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l1018_c11_d4ce] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1018_c11_d4ce_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_d4ce_left;
     BIN_OP_EQ_uxn_opcodes_h_l1018_c11_d4ce_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_d4ce_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_d4ce_return_output := BIN_OP_EQ_uxn_opcodes_h_l1018_c11_d4ce_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l996_l993_l988_l1018_l1005_l1001_DUPLICATE_d963 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l996_l993_l988_l1018_l1005_l1001_DUPLICATE_d963_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l996_c11_a397] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l996_c11_a397_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l996_c11_a397_left;
     BIN_OP_EQ_uxn_opcodes_h_l996_c11_a397_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l996_c11_a397_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l996_c11_a397_return_output := BIN_OP_EQ_uxn_opcodes_h_l996_c11_a397_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l997_l1006_l1010_l1002_DUPLICATE_eea6 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l997_l1006_l1010_l1002_DUPLICATE_eea6_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_SR_8[uxn_opcodes_h_l1021_c31_6ee9] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1021_c31_6ee9_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1021_c31_6ee9_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1021_c31_6ee9_return_output := CONST_SR_8_uxn_opcodes_h_l1021_c31_6ee9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1023_c11_bd93] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1023_c11_bd93_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_bd93_left;
     BIN_OP_EQ_uxn_opcodes_h_l1023_c11_bd93_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_bd93_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_bd93_return_output := BIN_OP_EQ_uxn_opcodes_h_l1023_c11_bd93_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1009_c11_9527] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1009_c11_9527_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_9527_left;
     BIN_OP_EQ_uxn_opcodes_h_l1009_c11_9527_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_9527_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_9527_return_output := BIN_OP_EQ_uxn_opcodes_h_l1009_c11_9527_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l996_l993_l988_l1009_l1005_l1001_DUPLICATE_da2d LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l996_l993_l988_l1009_l1005_l1001_DUPLICATE_da2d_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l993_c11_e06b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l993_c11_e06b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l993_c11_e06b_left;
     BIN_OP_EQ_uxn_opcodes_h_l993_c11_e06b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l993_c11_e06b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l993_c11_e06b_return_output := BIN_OP_EQ_uxn_opcodes_h_l993_c11_e06b_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l996_l993_l988_l1018_l1005_l1001_DUPLICATE_faac LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l996_l993_l988_l1018_l1005_l1001_DUPLICATE_faac_return_output := result.u8_value;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1005_l1018_DUPLICATE_8e9e LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1005_l1018_DUPLICATE_8e9e_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1005_c11_2218] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1005_c11_2218_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_2218_left;
     BIN_OP_EQ_uxn_opcodes_h_l1005_c11_2218_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_2218_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_2218_return_output := BIN_OP_EQ_uxn_opcodes_h_l1005_c11_2218_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1001_c11_7853] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1001_c11_7853_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_7853_left;
     BIN_OP_EQ_uxn_opcodes_h_l1001_c11_7853_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_7853_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_7853_return_output := BIN_OP_EQ_uxn_opcodes_h_l1001_c11_7853_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l1013_c30_77f3] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1013_c30_77f3_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1013_c30_77f3_ins;
     sp_relative_shift_uxn_opcodes_h_l1013_c30_77f3_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1013_c30_77f3_x;
     sp_relative_shift_uxn_opcodes_h_l1013_c30_77f3_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1013_c30_77f3_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1013_c30_77f3_return_output := sp_relative_shift_uxn_opcodes_h_l1013_c30_77f3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l988_c6_662e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l988_c6_662e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c6_662e_left;
     BIN_OP_EQ_uxn_opcodes_h_l988_c6_662e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c6_662e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c6_662e_return_output := BIN_OP_EQ_uxn_opcodes_h_l988_c6_662e_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l996_l993_l1023_l988_l1018_l1005_l1001_DUPLICATE_c3e4 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l996_l993_l1023_l988_l1018_l1005_l1001_DUPLICATE_c3e4_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l996_l993_l1023_l1018_l1009_l1005_l1001_DUPLICATE_8acd LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l996_l993_l1023_l1018_l1009_l1005_l1001_DUPLICATE_8acd_return_output := result.is_opc_done;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l1001_c7_ed92_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_7853_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_ed92_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_7853_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_ed92_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_7853_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_ed92_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_7853_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_ed92_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_7853_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_ed92_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_7853_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1001_c7_ed92_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_7853_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1001_c7_ed92_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_7853_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1001_c7_ed92_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1001_c11_7853_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1005_c7_bb11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_2218_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1005_c7_bb11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_2218_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1005_c7_bb11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_2218_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1005_c7_bb11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_2218_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1005_c7_bb11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_2218_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1005_c7_bb11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_2218_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1005_c7_bb11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_2218_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1005_c7_bb11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1005_c11_2218_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1009_c7_a786_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_9527_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1009_c7_a786_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_9527_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1009_c7_a786_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_9527_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1009_c7_a786_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_9527_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1009_c7_a786_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_9527_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1009_c7_a786_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_9527_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1009_c7_a786_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_9527_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1009_c7_a786_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1009_c11_9527_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1018_c7_4ac4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_d4ce_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1018_c7_4ac4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_d4ce_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1018_c7_4ac4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_d4ce_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1018_c7_4ac4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_d4ce_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1018_c7_4ac4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1018_c11_d4ce_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_a90f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_bd93_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_a90f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1023_c11_bd93_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l988_c1_8281_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c6_662e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l988_c2_d89f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c6_662e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l988_c2_d89f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c6_662e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l988_c2_d89f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c6_662e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l988_c2_d89f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c6_662e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c2_d89f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c6_662e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c2_d89f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c6_662e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l988_c2_d89f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c6_662e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l988_c2_d89f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c6_662e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l988_c2_d89f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c6_662e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l993_c7_c753_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l993_c11_e06b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_c753_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l993_c11_e06b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l993_c7_c753_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l993_c11_e06b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l993_c7_c753_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l993_c11_e06b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_c753_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l993_c11_e06b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_c753_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l993_c11_e06b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l993_c7_c753_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l993_c11_e06b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l993_c7_c753_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l993_c11_e06b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l993_c7_c753_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l993_c11_e06b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l996_c7_49c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l996_c11_a397_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_49c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l996_c11_a397_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_49c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l996_c11_a397_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_49c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l996_c11_a397_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_49c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l996_c11_a397_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_49c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l996_c11_a397_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l996_c7_49c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l996_c11_a397_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l996_c7_49c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l996_c11_a397_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l996_c7_49c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l996_c11_a397_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1002_c3_6dec_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l997_l1006_l1010_l1002_DUPLICATE_eea6_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1010_c3_433b_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l997_l1006_l1010_l1002_DUPLICATE_eea6_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1007_l998_DUPLICATE_84cb_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l997_l1006_l1010_l1002_DUPLICATE_eea6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_ed92_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l996_l993_l988_l1009_l1005_l1001_DUPLICATE_da2d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1005_c7_bb11_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l996_l993_l988_l1009_l1005_l1001_DUPLICATE_da2d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1009_c7_a786_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l996_l993_l988_l1009_l1005_l1001_DUPLICATE_da2d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c2_d89f_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l996_l993_l988_l1009_l1005_l1001_DUPLICATE_da2d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_c753_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l996_l993_l988_l1009_l1005_l1001_DUPLICATE_da2d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_49c0_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l996_l993_l988_l1009_l1005_l1001_DUPLICATE_da2d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_ed92_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l996_l993_l1023_l1018_l1009_l1005_l1001_DUPLICATE_8acd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1005_c7_bb11_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l996_l993_l1023_l1018_l1009_l1005_l1001_DUPLICATE_8acd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1009_c7_a786_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l996_l993_l1023_l1018_l1009_l1005_l1001_DUPLICATE_8acd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1018_c7_4ac4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l996_l993_l1023_l1018_l1009_l1005_l1001_DUPLICATE_8acd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_a90f_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l996_l993_l1023_l1018_l1009_l1005_l1001_DUPLICATE_8acd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_c753_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l996_l993_l1023_l1018_l1009_l1005_l1001_DUPLICATE_8acd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_49c0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l996_l993_l1023_l1018_l1009_l1005_l1001_DUPLICATE_8acd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_ed92_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l996_l993_l988_l1018_l1005_l1001_DUPLICATE_d963_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1005_c7_bb11_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l996_l993_l988_l1018_l1005_l1001_DUPLICATE_d963_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1018_c7_4ac4_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l996_l993_l988_l1018_l1005_l1001_DUPLICATE_d963_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l988_c2_d89f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l996_l993_l988_l1018_l1005_l1001_DUPLICATE_d963_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l993_c7_c753_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l996_l993_l988_l1018_l1005_l1001_DUPLICATE_d963_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_49c0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l996_l993_l988_l1018_l1005_l1001_DUPLICATE_d963_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_ed92_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l996_l993_l1023_l988_l1018_l1005_l1001_DUPLICATE_c3e4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1005_c7_bb11_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l996_l993_l1023_l988_l1018_l1005_l1001_DUPLICATE_c3e4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1018_c7_4ac4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l996_l993_l1023_l988_l1018_l1005_l1001_DUPLICATE_c3e4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_a90f_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l996_l993_l1023_l988_l1018_l1005_l1001_DUPLICATE_c3e4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l988_c2_d89f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l996_l993_l1023_l988_l1018_l1005_l1001_DUPLICATE_c3e4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l993_c7_c753_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l996_l993_l1023_l988_l1018_l1005_l1001_DUPLICATE_c3e4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_49c0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l996_l993_l1023_l988_l1018_l1005_l1001_DUPLICATE_c3e4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1005_c7_bb11_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1005_l1018_DUPLICATE_8e9e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1018_c7_4ac4_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1005_l1018_DUPLICATE_8e9e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1001_c7_ed92_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l996_l993_l988_l1018_l1005_l1001_DUPLICATE_faac_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1005_c7_bb11_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l996_l993_l988_l1018_l1005_l1001_DUPLICATE_faac_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1018_c7_4ac4_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l996_l993_l988_l1018_l1005_l1001_DUPLICATE_faac_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l988_c2_d89f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l996_l993_l988_l1018_l1005_l1001_DUPLICATE_faac_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l993_c7_c753_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l996_l993_l988_l1018_l1005_l1001_DUPLICATE_faac_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l996_c7_49c0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l996_l993_l988_l1018_l1005_l1001_DUPLICATE_faac_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1009_c7_a786_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1013_c30_77f3_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1023_c7_a90f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_a90f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_a90f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_a90f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_a90f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_a90f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_a90f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_a90f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_a90f_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1021_c21_9572] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1021_c21_9572_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1021_c31_6ee9_return_output);

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1018_c7_4ac4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1018_c7_4ac4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1018_c7_4ac4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1018_c7_4ac4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1018_c7_4ac4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1018_c7_4ac4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1018_c7_4ac4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1018_c7_4ac4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1018_c7_4ac4_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l988_c1_8281] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l988_c1_8281_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l988_c1_8281_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l988_c1_8281_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l988_c1_8281_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l988_c1_8281_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l988_c1_8281_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l988_c1_8281_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l988_c1_8281_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1007_l998_DUPLICATE_84cb LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1007_l998_DUPLICATE_84cb_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1007_l998_DUPLICATE_84cb_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1007_l998_DUPLICATE_84cb_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1007_l998_DUPLICATE_84cb_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1009_c7_a786] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1009_c7_a786_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1009_c7_a786_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1009_c7_a786_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1009_c7_a786_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1009_c7_a786_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1009_c7_a786_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1009_c7_a786_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1009_c7_a786_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1002_c3_6dec] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1002_c3_6dec_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1002_c3_6dec_left;
     BIN_OP_OR_uxn_opcodes_h_l1002_c3_6dec_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1002_c3_6dec_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1002_c3_6dec_return_output := BIN_OP_OR_uxn_opcodes_h_l1002_c3_6dec_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1023_c7_a90f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_a90f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_a90f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_a90f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_a90f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_a90f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_a90f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_a90f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_a90f_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1010_c3_433b] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1010_c3_433b_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1010_c3_433b_left;
     BIN_OP_OR_uxn_opcodes_h_l1010_c3_433b_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1010_c3_433b_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1010_c3_433b_return_output := BIN_OP_OR_uxn_opcodes_h_l1010_c3_433b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1018_c7_4ac4] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1018_c7_4ac4_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1018_c7_4ac4_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1018_c7_4ac4_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1018_c7_4ac4_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1018_c7_4ac4_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1018_c7_4ac4_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1018_c7_4ac4_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1018_c7_4ac4_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l1001_c7_ed92_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1002_c3_6dec_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1011_c11_2b8b_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1010_c3_433b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1009_c7_a786_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1010_c3_433b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1018_c7_4ac4_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1021_c21_9572_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1005_c7_bb11_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1007_l998_DUPLICATE_84cb_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l996_c7_49c0_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1007_l998_DUPLICATE_84cb_return_output;
     VAR_printf_uxn_opcodes_h_l989_c3_b20d_uxn_opcodes_h_l989_c3_b20d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l988_c1_8281_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1018_c7_4ac4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1023_c7_a90f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1009_c7_a786_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1018_c7_4ac4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1018_c7_4ac4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1023_c7_a90f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1005_c7_bb11_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1009_c7_a786_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1009_c7_a786_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1018_c7_4ac4_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1005_c7_bb11] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1005_c7_bb11_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1005_c7_bb11_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1005_c7_bb11_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1005_c7_bb11_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1005_c7_bb11_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1005_c7_bb11_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1005_c7_bb11_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1005_c7_bb11_return_output;

     -- printf_uxn_opcodes_h_l989_c3_b20d[uxn_opcodes_h_l989_c3_b20d] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l989_c3_b20d_uxn_opcodes_h_l989_c3_b20d_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l989_c3_b20d_uxn_opcodes_h_l989_c3_b20d_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_u8_value_MUX[uxn_opcodes_h_l1018_c7_4ac4] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1018_c7_4ac4_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1018_c7_4ac4_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1018_c7_4ac4_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1018_c7_4ac4_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1018_c7_4ac4_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1018_c7_4ac4_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1018_c7_4ac4_return_output := result_u8_value_MUX_uxn_opcodes_h_l1018_c7_4ac4_return_output;

     -- t16_MUX[uxn_opcodes_h_l1001_c7_ed92] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1001_c7_ed92_cond <= VAR_t16_MUX_uxn_opcodes_h_l1001_c7_ed92_cond;
     t16_MUX_uxn_opcodes_h_l1001_c7_ed92_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1001_c7_ed92_iftrue;
     t16_MUX_uxn_opcodes_h_l1001_c7_ed92_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1001_c7_ed92_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1001_c7_ed92_return_output := t16_MUX_uxn_opcodes_h_l1001_c7_ed92_return_output;

     -- n16_MUX[uxn_opcodes_h_l1009_c7_a786] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1009_c7_a786_cond <= VAR_n16_MUX_uxn_opcodes_h_l1009_c7_a786_cond;
     n16_MUX_uxn_opcodes_h_l1009_c7_a786_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1009_c7_a786_iftrue;
     n16_MUX_uxn_opcodes_h_l1009_c7_a786_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1009_c7_a786_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1009_c7_a786_return_output := n16_MUX_uxn_opcodes_h_l1009_c7_a786_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1011_c11_2b8b] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1011_c11_2b8b_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1011_c11_2b8b_left;
     BIN_OP_OR_uxn_opcodes_h_l1011_c11_2b8b_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1011_c11_2b8b_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1011_c11_2b8b_return_output := BIN_OP_OR_uxn_opcodes_h_l1011_c11_2b8b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1009_c7_a786] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1009_c7_a786_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1009_c7_a786_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1009_c7_a786_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1009_c7_a786_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1009_c7_a786_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1009_c7_a786_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1009_c7_a786_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1009_c7_a786_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1009_c7_a786] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1009_c7_a786_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1009_c7_a786_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1009_c7_a786_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1009_c7_a786_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1009_c7_a786_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1009_c7_a786_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1009_c7_a786_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1009_c7_a786_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1018_c7_4ac4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1018_c7_4ac4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1018_c7_4ac4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1018_c7_4ac4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1018_c7_4ac4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1018_c7_4ac4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1018_c7_4ac4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1018_c7_4ac4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1018_c7_4ac4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1018_c7_4ac4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1018_c7_4ac4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1018_c7_4ac4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1018_c7_4ac4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1018_c7_4ac4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1018_c7_4ac4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1018_c7_4ac4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1018_c7_4ac4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1018_c7_4ac4_return_output;

     -- Submodule level 3
     VAR_tmp16_MUX_uxn_opcodes_h_l1009_c7_a786_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1011_c11_2b8b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1005_c7_bb11_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1009_c7_a786_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1009_c7_a786_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1018_c7_4ac4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1005_c7_bb11_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1009_c7_a786_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1009_c7_a786_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1018_c7_4ac4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_ed92_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1005_c7_bb11_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1005_c7_bb11_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1009_c7_a786_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1009_c7_a786_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1018_c7_4ac4_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l996_c7_49c0_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1001_c7_ed92_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1009_c7_a786] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1009_c7_a786_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1009_c7_a786_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1009_c7_a786_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1009_c7_a786_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1009_c7_a786_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1009_c7_a786_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1009_c7_a786_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1009_c7_a786_return_output;

     -- n16_MUX[uxn_opcodes_h_l1005_c7_bb11] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1005_c7_bb11_cond <= VAR_n16_MUX_uxn_opcodes_h_l1005_c7_bb11_cond;
     n16_MUX_uxn_opcodes_h_l1005_c7_bb11_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1005_c7_bb11_iftrue;
     n16_MUX_uxn_opcodes_h_l1005_c7_bb11_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1005_c7_bb11_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1005_c7_bb11_return_output := n16_MUX_uxn_opcodes_h_l1005_c7_bb11_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1005_c7_bb11] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1005_c7_bb11_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1005_c7_bb11_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1005_c7_bb11_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1005_c7_bb11_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1005_c7_bb11_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1005_c7_bb11_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1005_c7_bb11_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1005_c7_bb11_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1005_c7_bb11] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1005_c7_bb11_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1005_c7_bb11_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1005_c7_bb11_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1005_c7_bb11_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1005_c7_bb11_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1005_c7_bb11_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1005_c7_bb11_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1005_c7_bb11_return_output;

     -- t16_MUX[uxn_opcodes_h_l996_c7_49c0] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l996_c7_49c0_cond <= VAR_t16_MUX_uxn_opcodes_h_l996_c7_49c0_cond;
     t16_MUX_uxn_opcodes_h_l996_c7_49c0_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l996_c7_49c0_iftrue;
     t16_MUX_uxn_opcodes_h_l996_c7_49c0_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l996_c7_49c0_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l996_c7_49c0_return_output := t16_MUX_uxn_opcodes_h_l996_c7_49c0_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1016_c21_8514] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1016_c21_8514_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_OR_uxn_opcodes_h_l1011_c11_2b8b_return_output);

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1001_c7_ed92] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_ed92_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_ed92_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_ed92_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_ed92_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_ed92_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_ed92_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_ed92_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_ed92_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1009_c7_a786] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1009_c7_a786_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1009_c7_a786_cond;
     tmp16_MUX_uxn_opcodes_h_l1009_c7_a786_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1009_c7_a786_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1009_c7_a786_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1009_c7_a786_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1009_c7_a786_return_output := tmp16_MUX_uxn_opcodes_h_l1009_c7_a786_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1009_c7_a786] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1009_c7_a786_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1009_c7_a786_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1009_c7_a786_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1009_c7_a786_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1009_c7_a786_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1009_c7_a786_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1009_c7_a786_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1009_c7_a786_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1009_c7_a786_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1016_c21_8514_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1001_c7_ed92_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1005_c7_bb11_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1005_c7_bb11_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1009_c7_a786_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_ed92_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1005_c7_bb11_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1005_c7_bb11_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1009_c7_a786_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_49c0_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1001_c7_ed92_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_ed92_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1005_c7_bb11_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l993_c7_c753_iffalse := VAR_t16_MUX_uxn_opcodes_h_l996_c7_49c0_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1005_c7_bb11_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1009_c7_a786_return_output;
     -- t16_MUX[uxn_opcodes_h_l993_c7_c753] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l993_c7_c753_cond <= VAR_t16_MUX_uxn_opcodes_h_l993_c7_c753_cond;
     t16_MUX_uxn_opcodes_h_l993_c7_c753_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l993_c7_c753_iftrue;
     t16_MUX_uxn_opcodes_h_l993_c7_c753_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l993_c7_c753_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l993_c7_c753_return_output := t16_MUX_uxn_opcodes_h_l993_c7_c753_return_output;

     -- n16_MUX[uxn_opcodes_h_l1001_c7_ed92] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1001_c7_ed92_cond <= VAR_n16_MUX_uxn_opcodes_h_l1001_c7_ed92_cond;
     n16_MUX_uxn_opcodes_h_l1001_c7_ed92_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1001_c7_ed92_iftrue;
     n16_MUX_uxn_opcodes_h_l1001_c7_ed92_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1001_c7_ed92_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1001_c7_ed92_return_output := n16_MUX_uxn_opcodes_h_l1001_c7_ed92_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1005_c7_bb11] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1005_c7_bb11_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1005_c7_bb11_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1005_c7_bb11_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1005_c7_bb11_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1005_c7_bb11_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1005_c7_bb11_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1005_c7_bb11_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1005_c7_bb11_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1001_c7_ed92] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_ed92_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_ed92_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_ed92_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_ed92_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_ed92_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_ed92_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_ed92_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_ed92_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1001_c7_ed92] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_ed92_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_ed92_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_ed92_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_ed92_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_ed92_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_ed92_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_ed92_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_ed92_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1009_c7_a786] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1009_c7_a786_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1009_c7_a786_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1009_c7_a786_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1009_c7_a786_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1009_c7_a786_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1009_c7_a786_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1009_c7_a786_return_output := result_u8_value_MUX_uxn_opcodes_h_l1009_c7_a786_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1005_c7_bb11] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1005_c7_bb11_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1005_c7_bb11_cond;
     tmp16_MUX_uxn_opcodes_h_l1005_c7_bb11_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1005_c7_bb11_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1005_c7_bb11_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1005_c7_bb11_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1005_c7_bb11_return_output := tmp16_MUX_uxn_opcodes_h_l1005_c7_bb11_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l996_c7_49c0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_49c0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_49c0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_49c0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_49c0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_49c0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_49c0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_49c0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_49c0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1005_c7_bb11] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1005_c7_bb11_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1005_c7_bb11_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1005_c7_bb11_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1005_c7_bb11_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1005_c7_bb11_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1005_c7_bb11_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1005_c7_bb11_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1005_c7_bb11_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l996_c7_49c0_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1001_c7_ed92_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_ed92_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1005_c7_bb11_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_49c0_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1001_c7_ed92_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_ed92_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1005_c7_bb11_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_c753_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l996_c7_49c0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_49c0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1001_c7_ed92_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1005_c7_bb11_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1009_c7_a786_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l988_c2_d89f_iffalse := VAR_t16_MUX_uxn_opcodes_h_l993_c7_c753_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1001_c7_ed92_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1005_c7_bb11_return_output;
     -- n16_MUX[uxn_opcodes_h_l996_c7_49c0] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l996_c7_49c0_cond <= VAR_n16_MUX_uxn_opcodes_h_l996_c7_49c0_cond;
     n16_MUX_uxn_opcodes_h_l996_c7_49c0_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l996_c7_49c0_iftrue;
     n16_MUX_uxn_opcodes_h_l996_c7_49c0_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l996_c7_49c0_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l996_c7_49c0_return_output := n16_MUX_uxn_opcodes_h_l996_c7_49c0_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1001_c7_ed92] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1001_c7_ed92_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1001_c7_ed92_cond;
     tmp16_MUX_uxn_opcodes_h_l1001_c7_ed92_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1001_c7_ed92_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1001_c7_ed92_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1001_c7_ed92_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1001_c7_ed92_return_output := tmp16_MUX_uxn_opcodes_h_l1001_c7_ed92_return_output;

     -- t16_MUX[uxn_opcodes_h_l988_c2_d89f] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l988_c2_d89f_cond <= VAR_t16_MUX_uxn_opcodes_h_l988_c2_d89f_cond;
     t16_MUX_uxn_opcodes_h_l988_c2_d89f_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l988_c2_d89f_iftrue;
     t16_MUX_uxn_opcodes_h_l988_c2_d89f_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l988_c2_d89f_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l988_c2_d89f_return_output := t16_MUX_uxn_opcodes_h_l988_c2_d89f_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1005_c7_bb11] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1005_c7_bb11_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1005_c7_bb11_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1005_c7_bb11_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1005_c7_bb11_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1005_c7_bb11_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1005_c7_bb11_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1005_c7_bb11_return_output := result_u8_value_MUX_uxn_opcodes_h_l1005_c7_bb11_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1001_c7_ed92] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_ed92_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_ed92_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_ed92_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_ed92_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_ed92_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_ed92_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_ed92_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_ed92_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l996_c7_49c0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_49c0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_49c0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_49c0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_49c0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_49c0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_49c0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_49c0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_49c0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l993_c7_c753] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_c753_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_c753_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_c753_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_c753_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_c753_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_c753_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_c753_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_c753_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1001_c7_ed92] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_ed92_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_ed92_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_ed92_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_ed92_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_ed92_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_ed92_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_ed92_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_ed92_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l996_c7_49c0] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_49c0_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_49c0_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_49c0_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_49c0_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_49c0_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_49c0_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_49c0_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_49c0_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l993_c7_c753_iffalse := VAR_n16_MUX_uxn_opcodes_h_l996_c7_49c0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_49c0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1001_c7_ed92_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l993_c7_c753_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l996_c7_49c0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_49c0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1001_c7_ed92_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c2_d89f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l993_c7_c753_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_c753_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l996_c7_49c0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1001_c7_ed92_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1005_c7_bb11_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l988_c2_d89f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l996_c7_49c0_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1001_c7_ed92_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l996_c7_49c0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_49c0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_49c0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_49c0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_49c0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_49c0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_49c0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_49c0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_49c0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l996_c7_49c0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_49c0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_49c0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_49c0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_49c0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_49c0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_49c0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_49c0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_49c0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l988_c2_d89f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c2_d89f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c2_d89f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c2_d89f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c2_d89f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c2_d89f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c2_d89f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c2_d89f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c2_d89f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l993_c7_c753] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l993_c7_c753_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l993_c7_c753_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l993_c7_c753_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l993_c7_c753_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l993_c7_c753_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l993_c7_c753_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l993_c7_c753_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l993_c7_c753_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l996_c7_49c0] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l996_c7_49c0_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l996_c7_49c0_cond;
     tmp16_MUX_uxn_opcodes_h_l996_c7_49c0_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l996_c7_49c0_iftrue;
     tmp16_MUX_uxn_opcodes_h_l996_c7_49c0_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l996_c7_49c0_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l996_c7_49c0_return_output := tmp16_MUX_uxn_opcodes_h_l996_c7_49c0_return_output;

     -- n16_MUX[uxn_opcodes_h_l993_c7_c753] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l993_c7_c753_cond <= VAR_n16_MUX_uxn_opcodes_h_l993_c7_c753_cond;
     n16_MUX_uxn_opcodes_h_l993_c7_c753_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l993_c7_c753_iftrue;
     n16_MUX_uxn_opcodes_h_l993_c7_c753_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l993_c7_c753_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l993_c7_c753_return_output := n16_MUX_uxn_opcodes_h_l993_c7_c753_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l993_c7_c753] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_c753_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_c753_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_c753_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_c753_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_c753_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_c753_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_c753_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_c753_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1001_c7_ed92] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1001_c7_ed92_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1001_c7_ed92_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1001_c7_ed92_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1001_c7_ed92_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1001_c7_ed92_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1001_c7_ed92_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1001_c7_ed92_return_output := result_u8_value_MUX_uxn_opcodes_h_l1001_c7_ed92_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l988_c2_d89f_iffalse := VAR_n16_MUX_uxn_opcodes_h_l993_c7_c753_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_c753_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l996_c7_49c0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l988_c2_d89f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l993_c7_c753_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l993_c7_c753_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l996_c7_49c0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c2_d89f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l993_c7_c753_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l996_c7_49c0_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1001_c7_ed92_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l993_c7_c753_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l996_c7_49c0_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l993_c7_c753] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l993_c7_c753_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l993_c7_c753_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l993_c7_c753_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l993_c7_c753_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l993_c7_c753_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l993_c7_c753_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l993_c7_c753_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l993_c7_c753_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l996_c7_49c0] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l996_c7_49c0_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l996_c7_49c0_cond;
     result_u8_value_MUX_uxn_opcodes_h_l996_c7_49c0_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l996_c7_49c0_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l996_c7_49c0_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l996_c7_49c0_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l996_c7_49c0_return_output := result_u8_value_MUX_uxn_opcodes_h_l996_c7_49c0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l988_c2_d89f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c2_d89f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c2_d89f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c2_d89f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c2_d89f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c2_d89f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c2_d89f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c2_d89f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c2_d89f_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l993_c7_c753] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l993_c7_c753_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l993_c7_c753_cond;
     tmp16_MUX_uxn_opcodes_h_l993_c7_c753_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l993_c7_c753_iftrue;
     tmp16_MUX_uxn_opcodes_h_l993_c7_c753_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l993_c7_c753_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l993_c7_c753_return_output := tmp16_MUX_uxn_opcodes_h_l993_c7_c753_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l993_c7_c753] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_c753_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_c753_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_c753_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_c753_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_c753_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_c753_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_c753_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_c753_return_output;

     -- n16_MUX[uxn_opcodes_h_l988_c2_d89f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l988_c2_d89f_cond <= VAR_n16_MUX_uxn_opcodes_h_l988_c2_d89f_cond;
     n16_MUX_uxn_opcodes_h_l988_c2_d89f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l988_c2_d89f_iftrue;
     n16_MUX_uxn_opcodes_h_l988_c2_d89f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l988_c2_d89f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l988_c2_d89f_return_output := n16_MUX_uxn_opcodes_h_l988_c2_d89f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l988_c2_d89f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l988_c2_d89f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l988_c2_d89f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l988_c2_d89f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l988_c2_d89f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l988_c2_d89f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l988_c2_d89f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l988_c2_d89f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l988_c2_d89f_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l988_c2_d89f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l988_c2_d89f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l993_c7_c753_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l988_c2_d89f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l993_c7_c753_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l993_c7_c753_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l996_c7_49c0_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l988_c2_d89f_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l993_c7_c753_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l988_c2_d89f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l988_c2_d89f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l988_c2_d89f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l988_c2_d89f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l988_c2_d89f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l988_c2_d89f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l988_c2_d89f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l988_c2_d89f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l988_c2_d89f_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l993_c7_c753] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l993_c7_c753_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l993_c7_c753_cond;
     result_u8_value_MUX_uxn_opcodes_h_l993_c7_c753_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l993_c7_c753_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l993_c7_c753_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l993_c7_c753_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l993_c7_c753_return_output := result_u8_value_MUX_uxn_opcodes_h_l993_c7_c753_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l988_c2_d89f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l988_c2_d89f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l988_c2_d89f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l988_c2_d89f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l988_c2_d89f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l988_c2_d89f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l988_c2_d89f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l988_c2_d89f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l988_c2_d89f_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l988_c2_d89f] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l988_c2_d89f_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l988_c2_d89f_cond;
     tmp16_MUX_uxn_opcodes_h_l988_c2_d89f_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l988_c2_d89f_iftrue;
     tmp16_MUX_uxn_opcodes_h_l988_c2_d89f_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l988_c2_d89f_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l988_c2_d89f_return_output := tmp16_MUX_uxn_opcodes_h_l988_c2_d89f_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l988_c2_d89f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l993_c7_c753_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l988_c2_d89f_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l988_c2_d89f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l988_c2_d89f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l988_c2_d89f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l988_c2_d89f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l988_c2_d89f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l988_c2_d89f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l988_c2_d89f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l988_c2_d89f_return_output := result_u8_value_MUX_uxn_opcodes_h_l988_c2_d89f_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_8c29_uxn_opcodes_h_l1028_l984_DUPLICATE_022a LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8c29_uxn_opcodes_h_l1028_l984_DUPLICATE_022a_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_8c29(
     result,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l988_c2_d89f_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l988_c2_d89f_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l988_c2_d89f_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l988_c2_d89f_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l988_c2_d89f_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l988_c2_d89f_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8c29_uxn_opcodes_h_l1028_l984_DUPLICATE_022a_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8c29_uxn_opcodes_h_l1028_l984_DUPLICATE_022a_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_n16 <= REG_VAR_n16;
REG_COMB_tmp16 <= REG_VAR_tmp16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     n16 <= REG_COMB_n16;
     tmp16 <= REG_COMB_tmp16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
